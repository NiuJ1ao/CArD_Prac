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
// Description:    Register file for RISC-V core
// 
// Dependencies:   none
// 
////////////////////////////////////////////////////////////////////////////////


module regfile(
  input                 clk,        // external clock source
  input                 reset,      // async reset input

  input       [4:0]     rs1,        // first source register address
  input       [4:0]     rs2,        // second source register address
  input       [4:0]     rd,         // destination register address
  input                 renb1,      // read enable for rs1
  input                 renb2,      // read enable for rs2
  input                 wenb,       // write enable
  input       [31:0]    wdata,      // write data
  
  output reg  [31:0]    rdata1,     // first source read data
  output reg  [31:0]    rdata2      // second source read data
);

reg   [31:0]    xreg[1:31];         // register storage declaration
integer   i;                        // iterator

always @(posedge clk or posedge reset)
  begin : regfile_write_PROC
  if (reset == 1'b1)
    for (i = 1; i < 32; i = i + 1)
      xreg[i] <= 32'd0;
  else
    for (i = 1; i < 32; i = i + 1)
      if (wenb & (rd == i))
        xreg[i] <= wdata;    
  end // regfile_write_PROC

always @*
  begin : regfile_read_PROC
  rdata1 = ((|rs1) & renb1) ? xreg[rs1] : 32'd0;
  rdata2 = ((|rs2) & renb2) ? xreg[rs2] : 32'd0;
  end // regfile_read_PROC

endmodule
