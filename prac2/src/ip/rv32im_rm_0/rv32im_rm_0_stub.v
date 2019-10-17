// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Tue Oct  1 21:13:05 2019
// Host        : bilbo running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/nigel/Documents/svn_roots/computerdesign/CARD_Practicals_2019/Practical_2/prac2/proj/RV32IM_PYNQ_Z2.srcs/sources_1/ip/rv32im_rm_0/rv32im_rm_0_stub.v
// Design      : rv32im_rm_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "rv32im_rm,Vivado 2018.3" *)
module rv32im_rm_0(clk, commit_evt, cpu_commit, cpu_running, 
  dbg_halt_core, dbg_run_core, ref_rd_wenb, reset, step_ack, step_cycle, step_instr, xreg_write, 
  dbu_addr, dbu_rdata, dbu_wdata, dbu_write, ibu_addr, ibu_inst, ref_rd, ref_rd_wdata, 
  run_cmd_mode, xreg_rd, xreg_wdata, zybo_buttons, zybo_leds, zybo_ssd, zybo_switches)
/* synthesis syn_black_box black_box_pad_pin="clk,commit_evt,cpu_commit,cpu_running,dbg_halt_core,dbg_run_core,ref_rd_wenb,reset,step_ack,step_cycle,step_instr,xreg_write,dbu_addr[31:0],dbu_rdata[31:0],dbu_wdata[31:0],dbu_write[3:0],ibu_addr[31:0],ibu_inst[31:0],ref_rd[4:0],ref_rd_wdata[31:0],run_cmd_mode[1:0],xreg_rd[4:0],xreg_wdata[31:0],zybo_buttons[3:1],zybo_leds[3:0],zybo_ssd[7:0],zybo_switches[3:0]" */;
  input clk;
  input commit_evt;
  output cpu_commit;
  output cpu_running;
  input dbg_halt_core;
  input dbg_run_core;
  output ref_rd_wenb;
  input reset;
  output step_ack;
  input step_cycle;
  input step_instr;
  input xreg_write;
  output [31:0]dbu_addr;
  input [31:0]dbu_rdata;
  output [31:0]dbu_wdata;
  output [3:0]dbu_write;
  output [31:0]ibu_addr;
  input [31:0]ibu_inst;
  output [4:0]ref_rd;
  output [31:0]ref_rd_wdata;
  output [1:0]run_cmd_mode;
  input [4:0]xreg_rd;
  input [31:0]xreg_wdata;
  input [3:1]zybo_buttons;
  output [3:0]zybo_leds;
  output [7:0]zybo_ssd;
  input [3:0]zybo_switches;
endmodule
