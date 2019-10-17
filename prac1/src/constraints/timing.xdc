set MAX_ALU_DELAY 9

create_clock -name clk -period $MAX_ALU_DELAY
set_input_jitter [all_clocks] 0.0
set_clock_uncertainty 0.0 [all_clocks]

set_input_delay  -clock clk -max 0 [all_inputs]
set_input_delay  -clock clk -min 0 [all_inputs]
set_output_delay -clock clk -max 0 [all_outputs]
set_output_delay -clock clk -min 0 [all_outputs]

# set_max_delay 9.000 -from [get_ports exe_alu_opc_r[*]] -to [get_ports alu_result[*]]
# set_max_delay 9.000 -from [get_ports exe_sel_pc_r]     -to [get_ports alu_result[*]]
# set_max_delay 9.000 -from [get_ports exe_pc_r[*]]      -to [get_ports alu_result[*]]
# set_max_delay 9.000 -from [get_ports exe_reg1_r[*]]    -to [get_ports alu_result[*]]
# set_max_delay 9.000 -from [get_ports exe_src2_r[*]]    -to [get_ports alu_result[*]]
