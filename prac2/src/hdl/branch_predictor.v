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
// Description:    Branch Cache module for RISC-V branch prediction unit
// 
////////////////////////////////////////////////////////////////////////////////

module branch_predictor #(
  parameter       BC_SIZE  = 8,     // log2 (number of BC entries)
  parameter       BC_ASSOC = 1,     // 1 => direct-mapped, 2 => 2-way set-assoc
  parameter       PS_SIZE  = 8,     // log2 (number of PT entries)
  parameter       RAS_SIZE = 3      // log2(num_ras_entries)
)(
  input           clk,              // external clock source
  input           reset,            // async reset input
  input           bpu_flush,        // clear the branch predictor

  //==== Next fetch interface ==================================================
  //
  input  [31:0]   fch_pc_nxt,       // next PC used to fetch and make prediction
  input           fch_predict,      // 1 => make a prediction next cycle
  
  //==== Current fetch interface ===============================================
  //
  input  [31:0]   fch_pc_r,         // current fetch PC
  input           fch_valid_r,      // 1 => valid fetch this cycle

  //==== Branch Resolution interface ===========================================
  //
  // ... control interface
  input           wrb_restart,      // 1 => pipeline restart
  input           wrb_update_bpu,   // 1 => report branch or prediction outcome
  input           wrb_was_pred,     // 1 => update; 0 => create new prediction
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
  input  [31:0]   wrb_target,       // actual target of branch/jump

  //==== Branch Prediction Issue interface =====================================
  //
  output          bpu_predicted,    // BPU found a prediction for issued instr
  output          bpu_pred_taken,   // predicted direction, if bpu_predicted = 1
  output [2:0]    bpu_pred_type,    // type of branch
  output [1:0]    bpu_pred_state,   // {Not-taken, Taken} x {Weak, Strong}
  output [31:0]   bpu_pred_target   // predicted PC of next instruction to issue
);

`include "params.v"

localparam  PC_PS_ADDR_LB = 2;
localparam  PC_PS_ADDR_UB = PC_PS_ADDR_LB + PS_SIZE - 1;

wire                bc_hit;           // Branch Cache has valid entry at fch_pc_r
wire  [2:0]         bc_pred_type;     // type of branch prediction
wire  [31:0]        bc_pred_target;   // predicted target

wire  [1:0]         fch_pred_state;   // prediction state at fch stage
reg   [PS_SIZE-1:0] fch_addr_nxt;     // predictor state array index (next FCH)
reg   [PS_SIZE-1:0] wrb_ps_addr;      // predictor state array index (WRB)

always @*
  begin : prediction_logic_PROC
  
  fch_addr_nxt      = fch_pc_nxt[PC_PS_ADDR_UB:PC_PS_ADDR_LB];
  wrb_ps_addr       = wrb_pc    [PC_PS_ADDR_UB:PC_PS_ADDR_LB];
  
  end // prediction_logic_PROC

////////////////////////////////////////////////////////////////////////////////
// Instantiate the Branch Cache module                                        //
////////////////////////////////////////////////////////////////////////////////

branch_cache #(.BC_SIZE(BC_SIZE), .BC_ASSOC(BC_ASSOC)) u_branch_cache
(
  .clk              (clk            ), // external clock source
  .reset            (reset          ), // async reset input
  .bpu_flush        (bpu_flush      ), // invalidate all branch cache entries

  //==== Next fetch interface ==================================================
  //
  .fch_pc_nxt       (fch_pc_nxt     ), // next PC used make predictions
  .fch_predict      (fch_predict    ), // 1 => make a prediction next cycle
  
  //==== Current fetch interface ===============================================
  //
  .fch_pc_r         (fch_pc_r       ), // current fetch PC
  .fch_valid_r      (fch_valid_r    ), // 1 => valid fetch this cycle

  //==== Branch Resolution interface ===========================================
  //
  // ... control interface
  .wrb_update_bpu   (wrb_update_bpu ), // 1 => report branch or prediction outcome
  .wrb_pc           (wrb_pc         ), // PC of instruction updating the BPU
  //
  // ... misprediction indicators
  .wrb_mispred_typ  (wrb_mispred_typ), // 1 => prediction had incorrect branch type
  .wrb_mispred_tgt  (wrb_mispred_tgt), // 1 => branch/jump target was mispredicted
  //
  // ... actual outcome indicators
  .wrb_branch_type  (wrb_branch_type), // actual type of branch
  .wrb_target       (wrb_target     ), // actual target of branch/jump

  //==== Branch Cache output interface =========================================
  //
  .bc_hit           (bc_hit         ), // Branch Cache has valid entry at fch_pc_r
  .bc_pred_type     (bc_pred_type   ), // type of branch prediction
  .bc_pred_target   (bc_pred_target )  // predicted target
);

////////////////////////////////////////////////////////////////////////////////
// Instantiate the Predictor State module                                     //
////////////////////////////////////////////////////////////////////////////////

 predictor_state #(.PS_SIZE(PS_SIZE)) u_predictor_state
(
  .clk              (clk            ), // external clock source
  .reset            (reset          ), // async reset input
  
  //==== Next fetch interface ==================================================
  //
  .fch_addr_nxt     (fch_addr_nxt   ), // next PS read address
  .fch_predict      (fch_predict    ), // 1 => read a new prediction next cycle
  
  //==== Branch Resolution interface ===========================================
  //
  // ... control interface
  .wrb_update_bpu   (wrb_update_bpu ), // 1 => update; 0 => no update
  .wrb_was_pred     (wrb_was_pred   ), // 1 => wrb_ps_state is valid
  .wrb_ps_state     (wrb_pred_state ), // prediction state used by prediction
  .wrb_ps_addr      (wrb_ps_addr    ), // PS address to write
  .wrb_direction    (wrb_direction  ), // actual outcome of predicted branch
  //
  //==== Prediction State output interface =====================================
  //
  .fch_pred_state   (fch_pred_state ) // prediction state for fch_pc_r
);

////////////////////////////////////////////////////////////////////////////////
// Instantiate the Return Address Stack (RAS) module                          //
////////////////////////////////////////////////////////////////////////////////

reg                 fch_predict_call; // 1 => branch_type at FCH is BPU_CALL
reg   [31:0]        fch_link_addr;    // return address computed at FCH
reg                 fch_predict_ret;  // 1 => branch_type at FCH is BPU_RETURN
wire                fch_ras_empty;    // RAS.empty() (i.e. make no prediction)
wire  [31:0]        fch_ret_addr;     // predicted return address from RAS.tos
reg                 wrb_commit_call;  // 1 => branch type at WRB is BPU_CALL
reg   [31:0]        wrb_link_addr;    // return address of called function
reg                 wrb_commit_ret;   // 1 => branch_type at WRB is BPU_RETURN

always @*
  begin : bp_ras_ctrl_PROC

  fch_predict_call  = bc_hit & (bc_pred_type == BPU_CALL);
  fch_predict_ret   = bc_hit & (bc_pred_type == BPU_RETURN);
  fch_link_addr     = fch_pc_r + 'd4;

  wrb_commit_call   = wrb_update_bpu & (wrb_branch_type == BPU_CALL);
  wrb_commit_ret    = wrb_update_bpu & (wrb_branch_type == BPU_RETURN);
  wrb_link_addr     = wrb_pc + 'd4;

  end

ras #(.RAS_SIZE(RAS_SIZE)) u_ras  // log2(num_ras_entries)
(
  .clk              (clk            ), // external clock source
  .reset            (reset          ), // async reset input

  //==== Branch Resolution interface ===========================================
  //
  // ... RAS rollback interface
  .wrb_restart      (wrb_restart    ), // 1 => rollback speculative RAS state
  //
  // ... commit a CALL operation with associated link address 
  .wrb_commit_call  (wrb_commit_call), // 1 => branch type at WRB is BPU_CALL
  .wrb_link_addr    (wrb_link_addr  ), // return address of called function
  //
  // ... commit a RETURN operation
  .wrb_commit_ret   (wrb_commit_ret ), // 1 => branch_type at WRB is BPU_RETURN

  //==== Branch Prediction interface ===========================================
  //
  // ... predict a CALL operation, with speculatively-computed return address
  .fch_predict_call (fch_predict_call), // 1 => branch_type at FCH is BPU_CALL
  .fch_link_addr    (fch_link_addr  ), // return address computed at FCH
  //
  // ... predict a RETURN operation, yielding predicted return address
  .fch_predict_ret  (fch_predict_ret), // 1 => branch_type at FCH is BPU_RETURN
  .fch_ras_empty    (fch_ras_empty  ), // RAS.empty() (i.e. make no prediction)
  .fch_ret_addr     (fch_ret_addr   )  // predicted return address from RAS.tos
);

assign bpu_predicted    = bc_hit;
assign bpu_pred_taken   = bc_hit & fch_pred_state[1];
assign bpu_pred_type    = bc_pred_type;
assign bpu_pred_state   = fch_pred_state;
assign bpu_pred_target  = fch_predict_ret ? fch_ret_addr : bc_pred_target;

endmodule
