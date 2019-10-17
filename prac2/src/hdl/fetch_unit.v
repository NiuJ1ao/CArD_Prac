`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Copyright (C) 2019, Nigel Topham, All rights reserved.
//
// This is an unpublished, proprietary work of Nigel Topham and is fully
// protected under copyright law. You may not disclose or distribute this file
// or any information contained herein except persuant to a valid written
// license from Nigel Topham.
//
// The entire notice above must be reproduced on all authorized copies.
//
////////////////////////////////////////////////////////////////////////////////
//
// Description:    Fetch unit for RISC-V core
// 
// Dependencies:   params.v
// 
////////////////////////////////////////////////////////////////////////////////

module fetch_unit(
  input           clk,              // external clock source
  input           reset,            // async reset input
  input  [1:0]    run_cmd_mode,     // new run mode, when wrb_restart asserted
  input           bpu_flush,        // clear branch predictor contents

  //==== Instruction Issue interface ===========================================
  //
  output          fch_valid,        // valid incoming instruction
  output [2:0]    fch_index,        // unique ID of issued instruction
  output [31:0]   fch_inst,         // instruction from fetch_unit
  output [31:0]   fch_pc,           // speculative PC of issued instruction
  input           exu_accept,       // willing to accept an incoming instruction

  //==== Fetch Restart interface ===============================================
  input           wrb_restart,      // flush pipeline and restart fetching
  input  [31:0]   wrb_restart_pc,   // ... from wrb_restart_pc

  //==== Memory interface to ICCM (read only) ==================================
  //
  input  [12:2]   exe_iccm_addr,    // load address targeting ICCM
  input           exe_iccm_load,    // valid load to ICCM at EXE stage
  output reg [31:0] fch_iccm_dout,  // read data for loads accessing ICCM

  //==== Branch Prediction Issue interface =====================================
  //
  output          bpu_predicted,    // BPU found a prediction for issued instr
  output          bpu_pred_taken,   // 1 => prediction is to take a branch
  output [2:0]    bpu_pred_type,    // type of branch
  output [1:0]    bpu_pred_state,   // {Not-taken, Taken} x {Weak, Strong}
  output [31:0]   bpu_pred_target,  // predicted PC of next instruction to issue
  
  //==== Branch Resolution interface ===========================================
  //
  // ... control interface
  input           wrb_update_bpu,   // 1 => report branch or prediction outcome
  input           wrb_was_pred,     // 1 => update pred; 0 => initialize pred
  input  [1:0]    wrb_pred_state,   // prediction state of updating branch
  input  [2:0]    wrb_index,        // instruction ID for prediction update
  input  [31:0]   wrb_pc,           // PC of instruction updating the BPU
  //
  // ... misprediction indicators
  input           wrb_mispred_dir,  // 1 => branch outcome was mispredicted
  input           wrb_mispred_typ,  // 1 => prediction had incorrect branch type
  input           wrb_mispred_tgt,  // 1 => branch/jump target was mispredicted
  //
  // ... actual outcome indicators
  input           wrb_direction,    // actual outcome of branch condition
  input  [2:0]    wrb_branch_type,  // actual type of branch
  input  [31:0]   wrb_target        // actual target of branch/jump
);

`include "params.v"

reg             fch_valid_r;        // valid fetch in current cycle
reg   [31:2]    fch_pc_r;           // Current fetch PC at FCH stage
reg   [2:0]     fch_index_r;        // ID of current issue
reg             fch_stage_cg0;      // update enable for fetch stage
reg             fch_valid_nxt;      // next value for fch_valid_r
reg   [31:2]    fch_pc_nxt;         // next value for fch_pc_r
reg   [2:0]     fch_index_nxt;      // ID of next issue
reg             fch_pred_taken;     // predicted taken branch
reg             fch_iccm_cen;       // chip-enable for ICCM ROM

////////////////////////////////////////////////////////////////////////////////
// Instruction Closely Coupled Memory - ICCM  - within the fetch_unit         //
////////////////////////////////////////////////////////////////////////////////

reg [ROM_WIDTH-1:0] iccm [(2**ROM_WORD_BITS)-1:0];
reg [ROM_WIDTH-1:0] iccm_dout;          // data-out from ICCM RAM

initial begin
  $readmemh(HEX_FILE, iccm);
end
//  $readmemh(HEX_FILE, iccm, 0, (2**ROM_WORD_BITS)-1);

wire [(ROM_WORD_BITS-1):0] iccm_addr_nxt;

assign iccm_addr_nxt = (exe_iccm_load & !wrb_restart)
                     ? exe_iccm_addr
                     : fch_pc_nxt[(ROM_ADDR_BITS-1):2]
                     ;

always @(posedge clk)
  begin
  if (fch_iccm_cen == 1'b1)
    iccm_dout     <= iccm[iccm_addr_nxt];
  else if (exe_iccm_load == 1'b1)
    fch_iccm_dout <= iccm[iccm_addr_nxt];
  end

////////////////////////////////////////////////////////////////////////////////
// FCH pipeline stage of the core pipeline                                    //
////////////////////////////////////////////////////////////////////////////////

always @(posedge clk or posedge reset)
  begin : fch_plr_reg_PROC
  if (reset)
    begin
    fch_valid_r   <= 1'b0;
    fch_pc_r      <= 30'd0;
    fch_index_r   <= 3'd0;
    end
  else begin
    fch_valid_r   <= fch_valid_nxt;
    if (fch_stage_cg0)
      begin
      fch_pc_r    <= fch_pc_nxt;
      fch_index_r <= fch_index_nxt;
      end
    end
  end // fch_plr_reg_PROC

always @*
  begin : fch_stage_logic_PROC
  
  fch_index_nxt   = wrb_restart ? 3'd0 : fch_index_r + 3'd1;

  fch_valid_nxt   = ((run_cmd_mode != HALT_MODE) & !exe_iccm_load)
                  & !(exu_accept & exe_iccm_load)
                  ;

  fch_pred_taken  = bpu_predicted & (bpu_pred_state[1]);

  fch_pc_nxt      = wrb_restart
                  ? wrb_restart_pc[31:2]
                  : (   fch_pred_taken
                      ? bpu_pred_target[31:2]
                      : (   fch_valid_r
                          ? (fch_pc_r + 30'd1)
                          : fch_pc_r
                        )
                    )
                  ;

  // Update the fetch-stage PC and pipeline registers whenever
  // there is either:
  //  (a) a pipeline restart, or
  //  (b) the current valid FCH instruction is passed to DEC
  //      and the CPU is not halted
  //
  fch_stage_cg0   = wrb_restart
                  | (   (run_cmd_mode != HALT_MODE)
                      & fch_valid_r
                      & exu_accept
                    )
                  ;

  // Initiate an ICCM instruction fetch cycle whenever
  // there is either:
  //  (a) a pipeline restart, or
  //  (b):   (1) the CPU is not halted
  //     and (2) there is no exe_iccm_load asserted
  //     and (3) either  (i) there is no valid fch-stage instruction
  //               or   (ii) the EXU is ready to accept an instruction
  //
  fch_iccm_cen    = wrb_restart
                  | (   (run_cmd_mode != HALT_MODE)
                      & !exe_iccm_load
                      & (exu_accept | !fch_valid_r)
                    )
                  ;
  end

////////////////////////////////////////////////////////////////////////////////
// instantiate the Branch Prediction Unit                                     //
////////////////////////////////////////////////////////////////////////////////

branch_predictor #(  .BC_SIZE(8),   // log2 (number of BC entries)
                     .BC_ASSOC(1),  // 1 => direct-mapped, 2 => 2-way set-assoc
                     .PS_SIZE(8),   // log2 (number of PT entries)
                     .RAS_SIZE(3)   // log2 (number of RAS entries)
                  ) u_branch_predictor
(
  .clk              (clk            ), // external clock source
  .reset            (reset          ), // async reset input
  .bpu_flush        (bpu_flush      ), // clear branch predictor contents

  //==== Next fetch interface ==================================================
  //
  .fch_pc_nxt       ({fch_pc_nxt,2'b00}), // next PC used to fetch and make prediction
  .fch_predict      (fch_stage_cg0  ), // 1 => make a prediction next cycle
  
  //==== Current fetch interface ===============================================
  //
  .fch_pc_r         ({fch_pc_r,2'b00}), // current fetch PC
  .fch_valid_r      (fch_valid_r    ), // 1 => valid fetch this cycle

  //==== Branch Resolution interface ===========================================
  //
  // ... control interface
  .wrb_restart      (wrb_restart    ), // flush pipeline and roll back BPU 
  .wrb_update_bpu   (wrb_update_bpu ), // 1 => report branch or prediction outcome
  .wrb_was_pred     (wrb_was_pred   ), // 1 => update; 0 => create new prediction
  .wrb_pred_state   (wrb_pred_state ), // prediction state of updating branch
  .wrb_index        (wrb_index      ), // instruction ID for prediction update
  .wrb_pc           (wrb_pc         ), // PC of instruction updating the BPU
  //
  // ... misprediction indicators
  .wrb_mispred_dir  (wrb_mispred_dir), // 1 => branch outcome was mispredicted
  .wrb_mispred_typ  (wrb_mispred_typ), // 1 => prediction had incorrect branch type
  .wrb_mispred_tgt  (wrb_mispred_tgt), // 1 => branch/jump target was mispredicted
  //
  // ... actual outcome indicators
  .wrb_direction    (wrb_direction  ), // actual outcome of branch condition
  .wrb_branch_type  (wrb_branch_type), // actual type of branch
  .wrb_target       (wrb_target     ), // actual target of branch/jump

  //==== Branch Prediction Issue interface =====================================
  //
  .bpu_predicted    (bpu_predicted  ), // BPU found a prediction for issued instr
  .bpu_pred_taken   (bpu_pred_taken ), // predicted taken, if bpu_predicted = 1
  .bpu_pred_type    (bpu_pred_type  ), // type of branch
  .bpu_pred_state   (bpu_pred_state ), // {Not-taken, Taken} x {Weak, Strong}
  .bpu_pred_target  (bpu_pred_target)  // predicted PC of next instruction to issue
);

////////////////////////////////////////////////////////////////////////////////
// Output assignments                                                         //
////////////////////////////////////////////////////////////////////////////////

assign fch_valid        = fch_valid_r;
assign fch_index        = fch_index_r;
assign fch_inst         = iccm_dout;
assign fch_pc           = {fch_pc_r, 2'b00};

endmodule
