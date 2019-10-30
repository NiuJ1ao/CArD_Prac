vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/xpm

vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap xpm questa_lib/msim/xpm

vlog -work xil_defaultlib -64 -sv "+incdir+../../../ipstatic" \
"/disk/scratch/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -64 -93 \
"/afs/inf.ed.ac.uk/group/teaching/cd/VivadoData/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 "+incdir+../../../ipstatic" \
"../../../../../src/ip/cpu_clock_gen/cpu_clock_gen_clk_wiz.v" \
"../../../../../src/ip/cpu_clock_gen/cpu_clock_gen.v" \

vlog -work xil_defaultlib \
"glbl.v"

