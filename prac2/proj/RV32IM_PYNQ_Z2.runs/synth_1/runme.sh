#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/disk/scratch/Xilinx/SDK/2018.3/bin:/disk/scratch/Xilinx/Vivado/2018.3/ids_lite/ISE/bin/lin64:/disk/scratch/Xilinx/Vivado/2018.3/bin
else
  PATH=/disk/scratch/Xilinx/SDK/2018.3/bin:/disk/scratch/Xilinx/Vivado/2018.3/ids_lite/ISE/bin/lin64:/disk/scratch/Xilinx/Vivado/2018.3/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=/disk/scratch/Xilinx/Vivado/2018.3/ids_lite/ISE/lib/lin64
else
  LD_LIBRARY_PATH=/disk/scratch/Xilinx/Vivado/2018.3/ids_lite/ISE/lib/lin64:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/afs/inf.ed.ac.uk/user/s17/s1740055/CArD/prac2/proj/RV32IM_PYNQ_Z2.runs/synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log top.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source top.tcl
