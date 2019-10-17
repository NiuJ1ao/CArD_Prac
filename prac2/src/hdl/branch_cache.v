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
// Dependencies:   params.v
// 
////////////////////////////////////////////////////////////////////////////////

module branch_cache #(
  parameter       BC_SIZE  = 8,     // log2 (number of BC entries)
  parameter       BC_ASSOC = 1      // 1 => direct-mapped, 2 => 2-way set-assoc
  )(
  input             clk,            // external clock source
  input             reset,          // async reset input
  input             bpu_flush,      // invalidate all branch cache entries

  //==== Next fetch interface ==================================================
  //
  input      [31:0] fch_pc_nxt,     // next PC used to fetch and make prediction
  input             fch_predict,    // 1 => make a prediction next cycle
  
  //==== Current fetch interface ===============================================
  //
  input      [31:0] fch_pc_r,       // current fetch PC
  input             fch_valid_r,    // 1 => valid fetch this cycle

  //==== Branch Resolution interface ===========================================
  //
  // ... control interface
  input             wrb_update_bpu, // 1 => report branch or prediction outcome
  input      [31:0] wrb_pc,         // PC of instruction updating the BPU
  //
  // ... misprediction indicators
  input             wrb_mispred_typ,// 1 => prediction had incorrect branch type
  input             wrb_mispred_tgt,// 1 => branch/jump target was mispredicted
  //
  // ... actual outcome indicators
  input      [2:0]  wrb_branch_type,// actual type of branch
  input      [31:0] wrb_target,     // actual target of branch/jump

  //==== Branch Cache output interface =========================================
  //
  output reg        bc_hit,         // Branch Cache has valid entry at fch_pc_r
  output reg [2:0]  bc_pred_type,   // type of branch prediction
  output reg [31:0] bc_pred_target  // predicted target
);

`include "params.v"

localparam BC_ENTRIES     = (1 << BC_SIZE);
localparam BC_MAX_ENTRY   = BC_ENTRIES - 1;
localparam BC_IDX_UB      = BC_SIZE - 1;
localparam BC_IDX_LB      = 0;
localparam BC_TAG_BITS    = (XLEN - BC_SIZE - 1);
localparam PC_BC_TAG_UB   = XLEN - 1;
localparam PC_BC_TAG_LB   = BC_SIZE + 1;
localparam PC_BC_IDX_LB   = 1;
localparam PC_BC_IDX_UB   = PC_BC_IDX_LB + BC_SIZE - 1;
localparam BC_TGT_BITS    = XLEN - 1;
localparam BC_TYPE_BITS   = 3;
localparam BC_ENTRY_BITS  = BC_TGT_BITS + BC_TAG_BITS + BC_TYPE_BITS;
localparam BC_ENTRY_UB    = BC_ENTRY_BITS - 1;
//
localparam BC_TYP_LB      = 0;
localparam BC_TYP_UB      = BC_TYP_LB + BC_TYPE_BITS - 1;
localparam BC_TAG_LB      = BC_TYP_UB + 1;
localparam BC_TAG_UB      = BC_TAG_LB + BC_TAG_BITS - 1;
localparam BC_TGT_LB      = BC_TAG_UB + 1;
localparam BC_TGT_UB      = BC_TGT_LB + BC_TGT_BITS - 1;
//
localparam PC_IDX_LB      = 1;
localparam PC_IDX_UB      = PC_IDX_LB + BC_SIZE - 1;
//
localparam PC_TGT_LB      = 1;
localparam PC_TGT_UB      = XLEN - 1;

(* ram_style="block" *)
reg   [BC_ENTRY_UB:0]             bc_ram [0:BC_MAX_ENTRY];
reg   [BC_MAX_ENTRY:0]            bc_entry_v_r;

reg                               bc_wr_en;
reg   [BC_IDX_UB:0]               bc_wr_idx;
reg   [BC_ENTRY_UB:0]             bc_wr_data;

reg   [BC_IDX_UB:0]               bc_rd_idx_r;
reg                               bc_rd_en;
reg   [BC_IDX_UB:0]               bc_rd_idx_nxt;
reg   [BC_ENTRY_UB:0]             bc_rd_data;

reg   [BC_TAG_UB:BC_TAG_LB]       bc_rd_tag;
reg   [BC_TYP_UB:BC_TYP_LB]       bc_rd_typ;
reg   [BC_TGT_UB:BC_TGT_LB]       bc_rd_tgt;
reg   [PC_BC_TAG_UB:PC_BC_TAG_LB] fch_pc_tag;

////////////////////////////////////////////////////////////////////////////////
// Branch Cache array of valid bits, one per Branch Cache entry               //
////////////////////////////////////////////////////////////////////////////////

always @(posedge clk or posedge reset)
  begin : bc_valid_reg_PROC
  if (reset)
    bc_entry_v_r                <= {BC_ENTRIES{1'b0}};
  else if (bpu_flush)
    bc_entry_v_r                <= {BC_ENTRIES{1'b0}};
  else if (bc_wr_en)
    bc_entry_v_r[bc_wr_idx]  <= 1'b1;
  end // bc_valid_reg_PROC

////////////////////////////////////////////////////////////////////////////////
// Branch Cache RAM implementation                                            //
////////////////////////////////////////////////////////////////////////////////

always @(posedge clk)
  begin : bc_plr_reg_PROC
  if (bc_rd_en)
    bc_rd_idx_r <= bc_rd_idx_nxt;
  end // bc_plr_reg_PROC

always @*
  begin : bc_ram_read_PROC
  bc_rd_idx_nxt = fch_pc_nxt[PC_BC_IDX_UB:PC_BC_IDX_LB];
  bc_rd_data    = bc_ram[bc_rd_idx_r];
  end // bc_ram_read_PROC

always @(posedge clk)
  begin : bc_ram_write_PROC
  if (bc_wr_en)
    bc_ram[bc_wr_idx] <= bc_wr_data;
  end // bc_ram_write_PROC

////////////////////////////////////////////////////////////////////////////////
// Branch Cache combinational logic                                           //
////////////////////////////////////////////////////////////////////////////////

always @*
  begin : bc_ram_ctrl_PROC

  // Read from the Branch Cache when there is a valid fetch request
  // for the following cycle.
  //
  bc_rd_en        = fch_predict;

  // Write to the relevant Branch Cache entry if there is a request to
  // update a branch prediction and there was a mispredicted target
  // or the branch type was incorrect.
  //
  bc_wr_idx       = wrb_pc[PC_BC_IDX_UB:PC_BC_IDX_LB];

  bc_wr_en        = wrb_update_bpu & (wrb_mispred_typ | wrb_mispred_tgt);

  bc_wr_data      = { wrb_target     [PC_TGT_UB:PC_TGT_LB],       // e.target
                      wrb_pc         [PC_BC_TAG_UB:PC_BC_TAG_LB], // e.tag
                      wrb_branch_type                             // e.type
                    }
                  ;

  // Extract the fields of the entry read from the Branch Cache
  //
  bc_rd_tag       = bc_rd_data[BC_TAG_UB:BC_TAG_LB];
  bc_rd_typ       = bc_rd_data[BC_TYP_UB:BC_TYP_LB];
  bc_rd_tgt       = bc_rd_data[BC_TGT_UB:BC_TGT_LB];

  // Extract the tag from the current fetch PC
  //
  fch_pc_tag      = fch_pc_r[PC_BC_TAG_UB:PC_BC_TAG_LB];
  
  // Detect a Branch Cache hit for the current fetch cycle
  //
  bc_hit          = fch_valid_r                 // valid fetch
                  & bc_entry_v_r[bc_rd_idx_r]   // BC entry is valid
                  & (fch_pc_tag == bc_rd_tag)   // tag-match with fch_pc_r
                  ;

  // Assign the predicted type and target. These values may be undefined
  // when a fetch occurs at an address that has never had a prediction
  // attached. The Execution Unit is expected to never rely on these
  // values unless bc_hit == 1.
  //
  bc_pred_type    = bc_rd_typ;
  bc_pred_target  = {bc_rd_tgt, 1'b0};

  end

endmodule
