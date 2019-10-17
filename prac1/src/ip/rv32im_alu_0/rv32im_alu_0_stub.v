// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Tue Oct  1 19:54:02 2019
// Host        : bilbo running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/nigel/Documents/svn_roots/computerdesign/CARD_Practicals_2019/Practical_1/prac1/proj/CARD_P1.srcs/sources_1/ip/rv32im_alu_0/rv32im_alu_0_stub.v
// Design      : rv32im_alu_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "rv32im_alu,Vivado 2018.3" *)
module rv32im_alu_0(exe_sel_pc_r, alu_result, exe_alu_opc_r, 
  exe_pc_r, exe_reg1_r, exe_src2_r)
/* synthesis syn_black_box black_box_pad_pin="exe_sel_pc_r,alu_result[31:0],exe_alu_opc_r[3:0],exe_pc_r[31:0],exe_reg1_r[31:0],exe_src2_r[31:0]" */;
  input exe_sel_pc_r;
  output [31:0]alu_result;
  input [3:0]exe_alu_opc_r;
  input [31:0]exe_pc_r;
  input [31:0]exe_reg1_r;
  input [31:0]exe_src2_r;
endmodule
