// (c) Copyright 1995-2019 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: inf.ed.ac.uk:rv32im_lib:rv32im_rm:1.0
// IP Revision: 3

// Forward declaration of the netlist blackbox
(* black_box = "1" *)
module rv32im_rm (
  clk,
  commit_evt,
  cpu_commit,
  cpu_running,
  dbg_halt_core,
  dbg_run_core,
  ref_rd_wenb,
  reset,
  step_ack,
  step_cycle,
  step_instr,
  xreg_write,
  dbu_addr,
  dbu_rdata,
  dbu_wdata,
  dbu_write,
  ibu_addr,
  ibu_inst,
  ref_rd,
  ref_rd_wdata,
  run_cmd_mode,
  xreg_rd,
  xreg_wdata,
  zybo_buttons,
  zybo_leds,
  zybo_ssd,
  zybo_switches
);
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET reset, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
input wire commit_evt;
output wire cpu_commit;
output wire cpu_running;
input wire dbg_halt_core;
input wire dbg_run_core;
output wire ref_rd_wenb;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME reset, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset RST" *)
input wire reset;
output wire step_ack;
input wire step_cycle;
input wire step_instr;
input wire xreg_write;
output wire [31 : 0] dbu_addr;
input wire [31 : 0] dbu_rdata;
output wire [31 : 0] dbu_wdata;
output wire [3 : 0] dbu_write;
output wire [31 : 0] ibu_addr;
input wire [31 : 0] ibu_inst;
output wire [4 : 0] ref_rd;
output wire [31 : 0] ref_rd_wdata;
output wire [1 : 0] run_cmd_mode;
input wire [4 : 0] xreg_rd;
input wire [31 : 0] xreg_wdata;
input wire [3 : 1] zybo_buttons;
output wire [3 : 0] zybo_leds;
output wire [7 : 0] zybo_ssd;
input wire [3 : 0] zybo_switches;
endmodule
// End of netlist blackbox

(* X_CORE_INFO = "rv32im_rm,Vivado 2018.3" *)
(* CHECK_LICENSE_TYPE = "rv32im_rm_0,rv32im_rm,{}" *)
(* IP_DEFINITION_SOURCE = "package_project" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module rv32im_rm_0 (
  clk,
  commit_evt,
  cpu_commit,
  cpu_running,
  dbg_halt_core,
  dbg_run_core,
  ref_rd_wenb,
  reset,
  step_ack,
  step_cycle,
  step_instr,
  xreg_write,
  dbu_addr,
  dbu_rdata,
  dbu_wdata,
  dbu_write,
  ibu_addr,
  ibu_inst,
  ref_rd,
  ref_rd_wdata,
  run_cmd_mode,
  xreg_rd,
  xreg_wdata,
  zybo_buttons,
  zybo_leds,
  zybo_ssd,
  zybo_switches
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET reset, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
input wire commit_evt;
output wire cpu_commit;
output wire cpu_running;
input wire dbg_halt_core;
input wire dbg_run_core;
output wire ref_rd_wenb;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME reset, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset RST" *)
input wire reset;
output wire step_ack;
input wire step_cycle;
input wire step_instr;
input wire xreg_write;
output wire [31 : 0] dbu_addr;
input wire [31 : 0] dbu_rdata;
output wire [31 : 0] dbu_wdata;
output wire [3 : 0] dbu_write;
output wire [31 : 0] ibu_addr;
input wire [31 : 0] ibu_inst;
output wire [4 : 0] ref_rd;
output wire [31 : 0] ref_rd_wdata;
output wire [1 : 0] run_cmd_mode;
input wire [4 : 0] xreg_rd;
input wire [31 : 0] xreg_wdata;
input wire [3 : 1] zybo_buttons;
output wire [3 : 0] zybo_leds;
output wire [7 : 0] zybo_ssd;
input wire [3 : 0] zybo_switches;

  rv32im_rm inst (
    .clk(clk),
    .commit_evt(commit_evt),
    .cpu_commit(cpu_commit),
    .cpu_running(cpu_running),
    .dbg_halt_core(dbg_halt_core),
    .dbg_run_core(dbg_run_core),
    .ref_rd_wenb(ref_rd_wenb),
    .reset(reset),
    .step_ack(step_ack),
    .step_cycle(step_cycle),
    .step_instr(step_instr),
    .xreg_write(xreg_write),
    .dbu_addr(dbu_addr),
    .dbu_rdata(dbu_rdata),
    .dbu_wdata(dbu_wdata),
    .dbu_write(dbu_write),
    .ibu_addr(ibu_addr),
    .ibu_inst(ibu_inst),
    .ref_rd(ref_rd),
    .ref_rd_wdata(ref_rd_wdata),
    .run_cmd_mode(run_cmd_mode),
    .xreg_rd(xreg_rd),
    .xreg_wdata(xreg_wdata),
    .zybo_buttons(zybo_buttons),
    .zybo_leds(zybo_leds),
    .zybo_ssd(zybo_ssd),
    .zybo_switches(zybo_switches)
  );
endmodule
