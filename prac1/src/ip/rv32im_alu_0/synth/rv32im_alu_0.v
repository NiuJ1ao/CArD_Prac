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


// IP VLNV: inf.ed.ac.uk:user:rv32im_alu:1.0
// IP Revision: 2

// Forward declaration of the netlist blackbox
(* black_box = "1" *)
module rv32im_alu (
  exe_sel_pc_r,
  alu_result,
  exe_alu_opc_r,
  exe_pc_r,
  exe_reg1_r,
  exe_src2_r
);
input wire exe_sel_pc_r;
output wire [31 : 0] alu_result;
input wire [3 : 0] exe_alu_opc_r;
input wire [31 : 0] exe_pc_r;
input wire [31 : 0] exe_reg1_r;
input wire [31 : 0] exe_src2_r;
endmodule
// End of netlist blackbox

(* X_CORE_INFO = "rv32im_alu,Vivado 2018.3" *)
(* CHECK_LICENSE_TYPE = "rv32im_alu_0,rv32im_alu,{}" *)
(* IP_DEFINITION_SOURCE = "package_project" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module rv32im_alu_0 (
  exe_sel_pc_r,
  alu_result,
  exe_alu_opc_r,
  exe_pc_r,
  exe_reg1_r,
  exe_src2_r
);

input wire exe_sel_pc_r;
output wire [31 : 0] alu_result;
input wire [3 : 0] exe_alu_opc_r;
input wire [31 : 0] exe_pc_r;
input wire [31 : 0] exe_reg1_r;
input wire [31 : 0] exe_src2_r;

  rv32im_alu inst (
    .exe_sel_pc_r(exe_sel_pc_r),
    .alu_result(alu_result),
    .exe_alu_opc_r(exe_alu_opc_r),
    .exe_pc_r(exe_pc_r),
    .exe_reg1_r(exe_reg1_r),
    .exe_src2_r(exe_src2_r)
  );
endmodule
