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

module predictor_state #(
  parameter             PS_SIZE = 8     // log2(num_predictor_state_entries)
  )(
  input                 clk,            // external clock source
  input                 reset,          // async reset input
  
  //==== Next fetch interface ==================================================
  //
  input [PS_SIZE-1:0]   fch_addr_nxt,   // next PS read address
  input                 fch_predict,    // 1 => read a prediction next cycle
  
  //==== Branch Resolution interface ===========================================
  //
  // ... control interface
  input                 wrb_update_bpu, // 1 => update; 0 => no update
  input                 wrb_was_pred,   // 1 => wrb_ps_state is valid
  input  [1:0]          wrb_ps_state,   // prediction state used by prediction
  input  [PS_SIZE-1:0]  wrb_ps_addr,    // PS address to write
  input                 wrb_direction,  // actual outcome of predicted branch
  //
  //==== Prediction State output interface =====================================
  //
  output reg [1:0]      fch_pred_state  // prediction state for fch_pc_r
);

localparam PS_ENTRIES     = (1 << PS_SIZE);
localparam PS_MAX_ENTRY   = PS_ENTRIES - 1;
localparam PS_IDX_UB      = PS_SIZE - 1;

localparam [1:0] PRED_STRONG_NT  = 2'b00;
localparam [1:0] PRED_WEAK_NT    = 2'b01;
localparam [1:0] PRED_WEAK_T     = 2'b10;
localparam [1:0] PRED_STRONG_T   = 2'b11;

(* ram_style="block" *)
reg   [1:0]               ps_ram [0:PS_MAX_ENTRY];
reg   [1:0]               ps_wr_data;
reg   [PS_IDX_UB:0]       fch_addr_r;

////////////////////////////////////////////////////////////////////////////////
// Predictor State RAM implementation                                         //
////////////////////////////////////////////////////////////////////////////////

always @(posedge clk)
  begin : ps_plr_reg_PROC
  if (fch_predict)
    fch_addr_r <= fch_addr_nxt;
  end // ps_plr_reg_PROC

always @*
  begin : ps_ram_read_PROC
  fch_pred_state  = ps_ram[fch_addr_r];
  end // ps_ram_read_PROC

always @*
  begin : ps_prediction_PROC

  if (wrb_was_pred)
    // get next state from bimodal predictor state transition table
    case ({wrb_direction, wrb_ps_state})
      //
      // Update predictor for a branch that was not-taken
      {1'b0, PRED_STRONG_NT}: ps_wr_data = PRED_STRONG_NT;
      {1'b0, PRED_WEAK_NT}:   ps_wr_data = PRED_STRONG_NT;
      {1'b0, PRED_WEAK_T}:    ps_wr_data = PRED_WEAK_NT;
      {1'b0, PRED_STRONG_T}:  ps_wr_data = PRED_WEAK_T;
      //
      // Update predictor for a branch that was taken
      {1'b1, PRED_STRONG_NT}: ps_wr_data = PRED_WEAK_NT;
      {1'b1, PRED_WEAK_NT}:   ps_wr_data = PRED_WEAK_T;
      {1'b1, PRED_WEAK_T}:    ps_wr_data = PRED_STRONG_T;
      {1'b1, PRED_STRONG_T}:  ps_wr_data = PRED_STRONG_T;
    endcase
  else
    // initialize predictor to weakly taken or not-taken
    ps_wr_data  = {wrb_direction, !wrb_direction};

  end // ps_prediction_PROC

always @(posedge clk)
  begin : ps_ram_write_PROC
  if (wrb_update_bpu)
    ps_ram[wrb_ps_addr] <= ps_wr_data;
  end // ps_ram_write_PROC

endmodule
