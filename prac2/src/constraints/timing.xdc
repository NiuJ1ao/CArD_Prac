# Define the input source clock clk_in, which runs at 125 MHz (8ns clock period)
#
# create_clock -period 8.000 -name sys_clk_pin -waveform {0.000 4.000} -add [get_ports clk_in]

# Define the generated clock signal that is used to clock the core logic.
# There are several clock outputs on the u_clock_generator module, any of which can be used.
# However, if the clock frequency is set to high, then the design will not meet timing after
# synthesis and implementation (place-and-route).
#
create_generated_clock -name cpu_clk -master_clock [get_clocks clk_in] [get_pins u_cpu_clock_gen/inst/mmcm_adv_inst/CLKOUT0]

# Define the generated clock signala that is used to clock the pixel display logic.
# 800x600 display, at 60Hz refresh rate, requires a 40 MHz pixel clock and a
# 200MHz HDMI serial output clock.
#
create_generated_clock -name pixel_clk [get_pins u_video_clock_gen/inst/mmcm_adv_inst/CLKOUT1]
create_generated_clock -name serial_clk [get_pins u_video_clock_gen/inst/mmcm_adv_inst/CLKOUT0]

### Asynchronous clock domain crossings for rgb2dvi IP ###
#
set_false_path -through [get_pins -filter {NAME =~ */SyncAsync*/oSyncStages*/PRE || NAME =~ */SyncAsync*/oSyncStages*/CLR} -hier]
set_false_path -through [get_pins -filter {NAME =~ *SyncAsync*/oSyncStages_reg[*]/D} -hier]
set_false_path -through [get_pins -filter {NAME =~ *SyncAsync*/oSyncStages_reg[*]/C} -hier]

set_false_path -from [get_clocks pixel_clk]  -to [get_clocks cpu_clk]
set_false_path -from [get_clocks serial_clk] -to [get_clocks cpu_clk]
set_false_path -from [get_clocks cpu_clk]    -to [get_clocks pixel_clk]
set_false_path -from [get_clocks cpu_clk]    -to [get_clocks serial_clk]

# Set delays for untimed input and output ports. These can tolerate essentially
# unlimited delays, but it is good practice to give those delays a defined value.
#
set_false_path -from [get_ports rst_a]
set_false_path -from [get_ports btn_a[*]]
set_false_path -from [get_ports switch_a[*]]
set_false_path -to   [get_ports leds[*]]
set_false_path -to   [get_ports ssd_a[*]]
set_false_path -to   [get_ports ssd_c]

# Set output delays for HDMI output port signals
set_false_path -to    [get_ports TMDS_*]
set_max_delay  50 -to [get_ports TMDS_*]

# Set maximum delays on CDC crossings that are already noted as false paths
#
#  -from cpu_clk -to pixel_clk domains
set_max_delay 20 -datapath_only -from [get_cells u_cpu/u_control_unit/px_command_r_reg[0]] -to [get_cells u_dvi_display/u_frame_buffer/*_reg*]
set_max_delay 20 -datapath_only -from [get_cells u_cpu/u_control_unit/px_command_r_reg[0]] -to [get_cells u_dvi_display/u_frame_buffer/*_reg[*]]
set_max_delay 20 -datapath_only -from [get_cells u_cpu/u_control_unit/px_address_r_reg[*]] -to [get_cells u_dvi_display/u_frame_buffer/fb_memory_reg*]
set_max_delay 20 -datapath_only -from [get_cells u_cpu/u_control_unit/px_write_data_r_reg[*]] -to [get_cells u_dvi_display/u_frame_buffer/fb_memory_reg*]
set_bus_skew -from [get_cells u_cpu/u_control_unit/px_*_reg[*]] -to [get_cells u_dvi_display/u_frame_buffer/*] 20
#
#  -from pixel_clk to cpu_clk domains
set_max_delay 20 -datapath_only -from [get_cells u_dvi_display/u_frame_buffer/fb_memory_reg*] -to [get_cells u_cpu/u_control_unit/px_read_data_r_reg[*]]
set_bus_skew -from [get_cells u_dvi_display/u_frame_buffer/fb_memory_reg*] -to [get_cells u_cpu/u_control_unit/px_read_data_r_reg[*]] 8
