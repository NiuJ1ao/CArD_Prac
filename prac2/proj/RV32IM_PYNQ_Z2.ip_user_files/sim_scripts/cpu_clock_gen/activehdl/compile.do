vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/xpm

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../ipstatic" \
"/disk/scratch/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93 \
"/afs/inf.ed.ac.uk/group/teaching/cd/VivadoData/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../ipstatic" \
"../../../../../src/ip/cpu_clock_gen/cpu_clock_gen_clk_wiz.v" \
"../../../../../src/ip/cpu_clock_gen/cpu_clock_gen.v" \

vlog -work xil_defaultlib \
"glbl.v"

