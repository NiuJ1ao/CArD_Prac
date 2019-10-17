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
// Description:    Closely-coupled Data RAM module for RISC-V core (dccm_ram)
// 
// Dependencies:   None
// 
////////////////////////////////////////////////////////////////////////////////

module dccm_ram #(
  parameter           WD = 1024,      // number of 32-bit words
  parameter           AM = 11,        // most-significant address bit
  parameter           AL = 2          // least-significant address bit
  )(
  input               clk,            // external clock source
  input               dccm_cen,       // RAM enable signal
  input      [AM:AL]  dccm_addr,      // read/write address
  input      [3:0]    dccm_wenb,      // write enables
  input      [31:0]   dccm_din,       // write data input
  output reg [31:0]   dccm_dout       // read data output
);

(* ram_style="block" *)
reg   [7:0]     dccm_b0[0:1023];    // byte 0 of DCCM memory
reg   [7:0]     dccm_b1[0:1023];    // byte 1 of DCCM memory
reg   [7:0]     dccm_b2[0:1023];    // byte 2 of DCCM memory
reg   [7:0]     dccm_b3[0:1023];    // byte 3 of DCCM memory

always @(posedge clk)
  begin : dccm_write_PROC
  if (dccm_cen & dccm_wenb[0])
    dccm_b0[dccm_addr] <= dccm_din[7:0];
  if (dccm_cen & dccm_wenb[1])
    dccm_b1[dccm_addr] <= dccm_din[15:8];
  if (dccm_cen & dccm_wenb[2])
    dccm_b2[dccm_addr] <= dccm_din[23:16];
  if (dccm_cen & dccm_wenb[3])
    dccm_b3[dccm_addr] <= dccm_din[31:24];
  end // dccm_write_PROC

always @(posedge clk)
  begin : dccm_read_PROC
  if (dccm_cen == 1'b1)
    dccm_dout <= { dccm_b3[dccm_addr],
                   dccm_b2[dccm_addr],
                   dccm_b1[dccm_addr],
                   dccm_b0[dccm_addr] };
  end // dccm_read_PROC

endmodule
