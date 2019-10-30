set_property SRC_FILE_INFO {cfile:/afs/inf.ed.ac.uk/user/s17/s1740055/CArD/prac2/src/ip/video_clock_gen/video_clock_gen.xdc rfile:../../src/ip/video_clock_gen/video_clock_gen.xdc id:1 order:EARLY scoped_inst:u_video_clock_gen/inst} [current_design]
set_property SRC_FILE_INFO {cfile:/afs/inf.ed.ac.uk/user/s17/s1740055/CArD/prac2/src/ip/cpu_clock_gen/cpu_clock_gen.xdc rfile:../../src/ip/cpu_clock_gen/cpu_clock_gen.xdc id:2 order:EARLY scoped_inst:u_cpu_clock_gen/inst} [current_design]
set_property SRC_FILE_INFO {cfile:/afs/inf.ed.ac.uk/user/s17/s1740055/CArD/prac2/src/constraints/timing.xdc rfile:../../src/constraints/timing.xdc id:3} [current_design]
current_instance u_video_clock_gen/inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.13333
current_instance
current_instance u_cpu_clock_gen/inst
set_property src_info {type:SCOPED_XDC file:2 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.08
current_instance
set_property src_info {type:XDC file:3 line:47 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay 20 -datapath_only -from [get_cells u_cpu/u_control_unit/px_command_r_reg[0]] -to [get_cells u_dvi_display/u_frame_buffer/*_reg*]
set_property src_info {type:XDC file:3 line:48 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay 20 -datapath_only -from [get_cells u_cpu/u_control_unit/px_command_r_reg[0]] -to [get_cells u_dvi_display/u_frame_buffer/*_reg[*]]
set_property src_info {type:XDC file:3 line:49 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay 20 -datapath_only -from [get_cells u_cpu/u_control_unit/px_address_r_reg[*]] -to [get_cells u_dvi_display/u_frame_buffer/fb_memory_reg*]
set_property src_info {type:XDC file:3 line:50 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay 20 -datapath_only -from [get_cells u_cpu/u_control_unit/px_write_data_r_reg[*]] -to [get_cells u_dvi_display/u_frame_buffer/fb_memory_reg*]
set_property src_info {type:XDC file:3 line:54 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay 20 -datapath_only -from [get_cells u_dvi_display/u_frame_buffer/fb_memory_reg*] -to [get_cells u_cpu/u_control_unit/px_read_data_r_reg[*]]
