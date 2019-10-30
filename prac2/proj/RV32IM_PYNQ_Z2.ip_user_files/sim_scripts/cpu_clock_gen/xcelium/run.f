-makelib xcelium_lib/xil_defaultlib -sv \
  "/disk/scratch/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "/afs/inf.ed.ac.uk/group/teaching/cd/VivadoData/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../../src/ip/cpu_clock_gen/cpu_clock_gen_clk_wiz.v" \
  "../../../../../src/ip/cpu_clock_gen/cpu_clock_gen.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

