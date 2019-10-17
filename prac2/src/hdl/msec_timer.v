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
// Description:    Millisecond timer for RISC-V core, based on 40 MHz clock
//
////////////////////////////////////////////////////////////////////////////////

module msec_timer(
  input           clk,              // clock source (at 40 MHz frequency)
  input           reset,            // reset input
  output [31:0]   msec_elapsed      // milliseconds since reset
);

localparam  [15:0]  MSEC_LIMIT = 16'd39999;

reg         [15:0]  msec_cntr_r;    // count for 1 millisecond
reg         [31:0]  msec_elapsed_r; // count number of milliseconds

always @(posedge clk or posedge reset)
  begin
  if (reset == 1'b1)
    begin
    msec_cntr_r     <= 16'd0;
    msec_elapsed_r  <= 32'd0;
    end
  else
    if (msec_cntr_r == MSEC_LIMIT)
      begin
      msec_cntr_r     <= 16'd0;
      msec_elapsed_r  <= msec_elapsed_r + 1;
      end
    else
      begin
      msec_cntr_r     <= msec_cntr_r + 1;
      end
  end

assign msec_elapsed = msec_elapsed_r;

endmodule
