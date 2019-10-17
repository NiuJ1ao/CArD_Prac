-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Tue Oct  1 21:13:05 2019
-- Host        : bilbo running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/nigel/Documents/svn_roots/computerdesign/CARD_Practicals_2019/Practical_2/prac2/proj/RV32IM_PYNQ_Z2.srcs/sources_1/ip/rv32im_rm_0/rv32im_rm_0_stub.vhdl
-- Design      : rv32im_rm_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rv32im_rm_0 is
  Port ( 
    clk : in STD_LOGIC;
    commit_evt : in STD_LOGIC;
    cpu_commit : out STD_LOGIC;
    cpu_running : out STD_LOGIC;
    dbg_halt_core : in STD_LOGIC;
    dbg_run_core : in STD_LOGIC;
    ref_rd_wenb : out STD_LOGIC;
    reset : in STD_LOGIC;
    step_ack : out STD_LOGIC;
    step_cycle : in STD_LOGIC;
    step_instr : in STD_LOGIC;
    xreg_write : in STD_LOGIC;
    dbu_addr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dbu_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    dbu_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dbu_write : out STD_LOGIC_VECTOR ( 3 downto 0 );
    ibu_addr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ibu_inst : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ref_rd : out STD_LOGIC_VECTOR ( 4 downto 0 );
    ref_rd_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    run_cmd_mode : out STD_LOGIC_VECTOR ( 1 downto 0 );
    xreg_rd : in STD_LOGIC_VECTOR ( 4 downto 0 );
    xreg_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    zybo_buttons : in STD_LOGIC_VECTOR ( 3 downto 1 );
    zybo_leds : out STD_LOGIC_VECTOR ( 3 downto 0 );
    zybo_ssd : out STD_LOGIC_VECTOR ( 7 downto 0 );
    zybo_switches : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );

end rv32im_rm_0;

architecture stub of rv32im_rm_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,commit_evt,cpu_commit,cpu_running,dbg_halt_core,dbg_run_core,ref_rd_wenb,reset,step_ack,step_cycle,step_instr,xreg_write,dbu_addr[31:0],dbu_rdata[31:0],dbu_wdata[31:0],dbu_write[3:0],ibu_addr[31:0],ibu_inst[31:0],ref_rd[4:0],ref_rd_wdata[31:0],run_cmd_mode[1:0],xreg_rd[4:0],xreg_wdata[31:0],zybo_buttons[3:1],zybo_leds[3:0],zybo_ssd[7:0],zybo_switches[3:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "rv32im_rm,Vivado 2018.3";
begin
end;
