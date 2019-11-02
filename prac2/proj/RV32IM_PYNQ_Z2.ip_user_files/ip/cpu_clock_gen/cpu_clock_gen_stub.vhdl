-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
-- Date        : Sat Nov  2 20:36:06 2019
-- Host        : evilemo.inf.ed.ac.uk running 64-bit Scientific Linux release 7.6 (Nitrogen)
-- Command     : write_vhdl -force -mode synth_stub
--               /afs/inf.ed.ac.uk/user/s17/s1740055/CArD/prac2/src/ip/cpu_clock_gen/cpu_clock_gen_stub.vhdl
-- Design      : cpu_clock_gen
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cpu_clock_gen is
  Port ( 
    clk_60MHz : out STD_LOGIC;
    clk_75MHz : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end cpu_clock_gen;

architecture stub of cpu_clock_gen is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_60MHz,clk_75MHz,reset,locked,clk_in1";
begin
end;
