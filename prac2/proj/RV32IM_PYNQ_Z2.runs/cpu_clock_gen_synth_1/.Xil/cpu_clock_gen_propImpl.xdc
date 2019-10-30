set_property SRC_FILE_INFO {cfile:/afs/inf.ed.ac.uk/user/s17/s1740055/CArD/prac2/src/ip/cpu_clock_gen/cpu_clock_gen.xdc rfile:../../../../src/ip/cpu_clock_gen/cpu_clock_gen.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
current_instance inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.08
