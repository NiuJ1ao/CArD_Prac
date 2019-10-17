-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Tue Oct  1 19:54:02 2019
-- Host        : bilbo running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/nigel/Documents/svn_roots/computerdesign/CARD_Practicals_2019/Practical_1/prac1/proj/CARD_P1.srcs/sources_1/ip/rv32im_alu_0/rv32im_alu_0_stub.vhdl
-- Design      : rv32im_alu_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rv32im_alu_0 is
  Port ( 
    exe_sel_pc_r : in STD_LOGIC;
    alu_result : out STD_LOGIC_VECTOR ( 31 downto 0 );
    exe_alu_opc_r : in STD_LOGIC_VECTOR ( 3 downto 0 );
    exe_pc_r : in STD_LOGIC_VECTOR ( 31 downto 0 );
    exe_reg1_r : in STD_LOGIC_VECTOR ( 31 downto 0 );
    exe_src2_r : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end rv32im_alu_0;

architecture stub of rv32im_alu_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "exe_sel_pc_r,alu_result[31:0],exe_alu_opc_r[3:0],exe_pc_r[31:0],exe_reg1_r[31:0],exe_src2_r[31:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "rv32im_alu,Vivado 2018.3";
begin
end;
