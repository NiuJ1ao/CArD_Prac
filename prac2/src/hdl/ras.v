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
// Description:    Predictor State module for RISC-V branch prediction unit
// 
////////////////////////////////////////////////////////////////////////////////

module ras #(parameter RAS_SIZE = 3)  // log2(num_ras_entries)
(
  //==== Generic input signals =================================================
  //
  input             clk,              // external clock source
  input             reset,            // async reset input

  //==== Branch Resolution interface ===========================================
  //
  // ... RAS rollback interface
  input             wrb_restart,      // 1 => rollback speculative RAS state
  //
  // ... commit a CALL operation with associated link address 
  input             wrb_commit_call,  // 1 => branch type at WRB is BPU_CALL
  input      [31:0] wrb_link_addr,    // return address of called function
  //
  // ... commit a RETURN operation
  input             wrb_commit_ret,   // 1 => branch_type at WRB is BPU_RETURN
  //
  //==== Branch Prediction interface ===========================================
  //
  // ... predict a CALL operation, with speculatively-computed return address
  input             fch_predict_call, // 1 => branch_type at FCH is BPU_CALL
  input      [31:0] fch_link_addr,    // return address computed at FCH
  //
  // ... predict a RETURN operation, yielding predicted return address
  input             fch_predict_ret,  // 1 => branch_type at FCH is BPU_RETURN
  output reg        fch_ras_empty,    // RAS.empty() (i.e. make no prediction)
  output reg [31:0] fch_ret_addr      // predicted return address from RAS.tos()
);

`include "params.v"

localparam RAS_ENTRIES    = (1 << RAS_SIZE);
localparam RAS_MAX        = RAS_ENTRIES - 1;
localparam RAS_E_BITS     = XLEN - 1;
localparam RAS_E_UB       = XLEN - 1;
localparam RAS_E_LB       = 1;
localparam RAS_IX_UB      = RAS_SIZE - 1;

reg   [RAS_E_UB:RAS_E_LB]     fch_ras_r[0:RAS_MAX];
reg   [RAS_E_UB:RAS_E_LB]     wrb_ras_r[0:RAS_MAX];

reg   [RAS_IX_UB:0]           fch_tos_r;
reg   [RAS_IX_UB:0]           fch_depth_r;
reg   [RAS_IX_UB:0]           wrb_tos_r;
reg   [RAS_IX_UB:0]           wrb_depth_r;

reg   [RAS_IX_UB:0]           fch_tos_nxt;
reg   [RAS_IX_UB:0]           fch_depth_nxt;
reg   [RAS_IX_UB:0]           wrb_tos_nxt;
reg   [RAS_IX_UB:0]           wrb_depth_nxt;

reg                           fch_tos_cg0;
reg                           fch_depth_cg0;
reg                           wrb_tos_cg0;
reg                           wrb_depth_cg0;

reg                           fch_ras_full;
reg                           wrb_ras_full;
reg                           wrb_ras_empty;

reg                           fch_push;
reg                           wrb_push;

always @*
  begin : ras_ctrl_logic_PROC
  
  fch_ras_empty     = fch_depth_r == {RAS_SIZE{1'b0}};
  fch_ras_full      = fch_depth_r == {RAS_SIZE{1'b1}};
  wrb_ras_empty     = wrb_depth_r == {RAS_SIZE{1'b0}};
  wrb_ras_full      = wrb_depth_r == {RAS_SIZE{1'b1}};
  
  fch_tos_nxt       = {RAS_SIZE{1'bx}};
  fch_depth_nxt     = {RAS_SIZE{1'bx}};
  wrb_tos_nxt       = {RAS_SIZE{1'bx}};
  wrb_depth_nxt     = {RAS_SIZE{1'bx}};
    
  fch_tos_cg0       = 1'b0;
  fch_depth_cg0     = 1'b0;
  wrb_tos_cg0       = 1'b0;
  wrb_depth_cg0     = 1'b0;
    
  fch_push          = 1'b0;
  wrb_push          = 1'b0;

  // Control logic for the speculative RAS at the FCH stage
  //
  casez ({ wrb_restart, fch_predict_call, fch_predict_ret })
    3'b1??:
      begin
      fch_tos_nxt   = wrb_tos_r;
      fch_depth_nxt = wrb_depth_r;
      fch_tos_cg0   = 1'b1;
      fch_depth_cg0 = 1'b1;
      end
    3'b01?:
      begin
      fch_push      = 1'b1;
      fch_tos_nxt   = fch_ras_empty ? fch_tos_r : fch_tos_r + 'd1;
      fch_tos_cg0   = !fch_ras_empty;
      fch_depth_nxt = fch_ras_full  ? {RAS_SIZE{1'bx}} : fch_depth_r + 'd1;
      fch_depth_cg0 = !fch_ras_full;
      end
    3'b001:
      begin
      fch_tos_nxt   = fch_ras_empty ? {RAS_SIZE{1'bx}} : fch_tos_r - 'd1;
      fch_tos_cg0   = !fch_ras_empty;
      fch_depth_nxt = fch_ras_empty ? {RAS_SIZE{1'bx}} : fch_depth_r - 'd1;
      fch_depth_cg0 = !fch_ras_empty;
      end
    default: ; // nothing to do, all default values are set before the case stmt
  endcase

  // Control logic for the non-speculative RAS at the WRB stage
  //
  wrb_push      = 1'b0;
  wrb_tos_nxt   = {RAS_SIZE{1'bx}};
  wrb_depth_nxt = {RAS_SIZE{1'bx}};
  wrb_tos_cg0   = 1'b0;
  wrb_depth_cg0 = 1'b0;

  if (wrb_commit_call)
    begin
    wrb_push      = 1'b1;
    wrb_tos_nxt   = wrb_ras_empty ? wrb_tos_r : wrb_tos_r + 'd1;
    wrb_tos_cg0   = !wrb_ras_empty;
    wrb_depth_nxt = wrb_ras_full  ? {RAS_SIZE{1'bx}} : wrb_depth_r + 'd1;
    wrb_depth_cg0 = !wrb_ras_full;
    end
  else if (wrb_commit_ret)
    begin
    wrb_tos_nxt   = wrb_ras_empty ? {RAS_SIZE{1'bx}} : wrb_tos_r - 'd1;
    wrb_tos_cg0   = !wrb_ras_empty;
    wrb_depth_nxt = wrb_ras_empty ? {RAS_SIZE{1'bx}} : wrb_depth_r - 'd1;
    wrb_depth_cg0 = !wrb_ras_empty;
    end

  // Provide the top-of-stack address as the predicted return address at FCH
  //
  fch_ret_addr    = fch_ras_r[fch_tos_r];

  end // ras_ctrl_logic_PROC

integer entry;
always @(posedge clk or posedge reset)
  begin : ras_reg_PROC
  if (reset)
    begin
    fch_tos_r   <= {RAS_SIZE{1'b0}};
    fch_depth_r <= {RAS_SIZE{1'b0}};
    wrb_tos_r   <= {RAS_SIZE{1'b0}};
    wrb_depth_r <= {RAS_SIZE{1'b0}};
    for (entry = 0; entry < RAS_ENTRIES; entry = entry + 1)
      begin
      fch_ras_r[entry] <= {RAS_E_BITS{1'b0}};
      wrb_ras_r[entry] <= {RAS_E_BITS{1'b0}};      
      end
    end
  else
    begin
    if (fch_tos_cg0)
      fch_tos_r <= fch_tos_nxt;
    if (fch_depth_cg0)
      fch_depth_r <= fch_depth_nxt;
    if (wrb_tos_cg0)
      wrb_tos_r <= wrb_tos_nxt;
    if (wrb_depth_cg0)
      wrb_depth_r <= wrb_depth_nxt;
    if (wrb_restart)
      for (entry = 0; entry < RAS_ENTRIES; entry = entry + 1)
        fch_ras_r[entry] <= wrb_ras_r[entry];
    else if (fch_push)
      fch_ras_r[fch_tos_nxt] <= fch_link_addr;
    if (wrb_push)
      wrb_ras_r[wrb_tos_nxt] <= wrb_link_addr;
    end
  end // ras_reg_PROC

endmodule
