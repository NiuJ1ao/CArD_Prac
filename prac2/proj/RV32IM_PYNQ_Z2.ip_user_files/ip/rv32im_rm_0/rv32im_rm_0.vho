-- (c) Copyright 1995-2019 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: inf.ed.ac.uk:rv32im_lib:rv32im_rm:1.0
-- IP Revision: 3

-- The following code must appear in the VHDL architecture header.

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT rv32im_rm_0
  PORT (
    clk : IN STD_LOGIC;
    commit_evt : IN STD_LOGIC;
    cpu_commit : OUT STD_LOGIC;
    cpu_running : OUT STD_LOGIC;
    dbg_halt_core : IN STD_LOGIC;
    dbg_run_core : IN STD_LOGIC;
    ref_rd_wenb : OUT STD_LOGIC;
    reset : IN STD_LOGIC;
    step_ack : OUT STD_LOGIC;
    step_cycle : IN STD_LOGIC;
    step_instr : IN STD_LOGIC;
    xreg_write : IN STD_LOGIC;
    dbu_addr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    dbu_rdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    dbu_wdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    dbu_write : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    ibu_addr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    ibu_inst : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    ref_rd : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    ref_rd_wdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    run_cmd_mode : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    xreg_rd : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    xreg_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    zybo_buttons : IN STD_LOGIC_VECTOR(3 DOWNTO 1);
    zybo_leds : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    zybo_ssd : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    zybo_switches : IN STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : rv32im_rm_0
  PORT MAP (
    clk => clk,
    commit_evt => commit_evt,
    cpu_commit => cpu_commit,
    cpu_running => cpu_running,
    dbg_halt_core => dbg_halt_core,
    dbg_run_core => dbg_run_core,
    ref_rd_wenb => ref_rd_wenb,
    reset => reset,
    step_ack => step_ack,
    step_cycle => step_cycle,
    step_instr => step_instr,
    xreg_write => xreg_write,
    dbu_addr => dbu_addr,
    dbu_rdata => dbu_rdata,
    dbu_wdata => dbu_wdata,
    dbu_write => dbu_write,
    ibu_addr => ibu_addr,
    ibu_inst => ibu_inst,
    ref_rd => ref_rd,
    ref_rd_wdata => ref_rd_wdata,
    run_cmd_mode => run_cmd_mode,
    xreg_rd => xreg_rd,
    xreg_wdata => xreg_wdata,
    zybo_buttons => zybo_buttons,
    zybo_leds => zybo_leds,
    zybo_ssd => zybo_ssd,
    zybo_switches => zybo_switches
  );
-- INST_TAG_END ------ End INSTANTIATION Template ---------

