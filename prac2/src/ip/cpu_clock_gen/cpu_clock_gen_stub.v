// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Sat Nov  2 15:25:53 2019
// Host        : casals.inf.ed.ac.uk running 64-bit Scientific Linux release 7.6 (Nitrogen)
// Command     : write_verilog -force -mode synth_stub
//               /afs/inf.ed.ac.uk/user/s17/s1740055/CArD/prac2/src/ip/cpu_clock_gen/cpu_clock_gen_stub.v
// Design      : cpu_clock_gen
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module cpu_clock_gen(clk_60MHz, clk_75MHz, reset, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_60MHz,clk_75MHz,reset,locked,clk_in1" */;
  output clk_60MHz;
  output clk_75MHz;
  input reset;
  output locked;
  input clk_in1;
endmodule
