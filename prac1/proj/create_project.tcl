# Run this script to create the Vivado project files NEXT TO THIS script
# If ::create_path global variable is set, the project is created under that path instead of the working dir

# Project specific settings.
set proj_name "CARD_P1"

if {[info exists ::create_path]} {
	set dest_dir $::create_path
} else {
	set dest_dir [file normalize [file dirname [info script]]]
}
puts "INFO: Creating new project in $dest_dir"
cd $dest_dir

set part "xc7z020clg400-1"
set brd_part "tul.com.tw:pynq-z2:part0:1.0"

# Set the reference directory for source file relative paths (by default the value is script directory path)
set origin_dir ".."

# Set the directory path for the original project from where this script was exported
set orig_proj_dir "[file normalize "$origin_dir/proj"]"

set src_dir $origin_dir/src
set repo_dir $origin_dir/repo

# # Set the board repo
# # Uncomment if distributing board files with project in the "repo/board_files" folder.
# # This is currently untested. It intends to also keep any existing board repo paths, since this is a global Vivado setting (not project specific.
# # Ideally, if the project is closed, and then a new project is created (without closing Vivado), this should still be able to see a board repo specified in init.tcl.
set_param board.repoPaths "[file normalize "$repo_dir/board_files"]"

# Create project
create_project -force $proj_name $dest_dir

# Set the directory path for the new project
set proj_dir [get_property directory [current_project]]

# Set project properties
set obj [get_projects $proj_name]
set_property "default_lib" "xil_defaultlib" $obj
set_property "part" $part $obj
set_property "board_part" "tul.com.tw:pynq-z2:part0:1.0" $obj
set_property "simulator_language" "Mixed" $obj
set_property "target_language" "Verilog" $obj

# Uncomment the following 3 lines to greatly increase build speed while working with IP cores (and/or block diagrams)
#  set_property "corecontainer.enable" "0" $obj
#  set_property "ip_cache_permissions" "read write" $obj
#  set_property "ip_output_repo" "[file normalize "$origin_dir/repo/cache"]" $obj

# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets -quiet sources_1] ""]} {
  create_fileset -srcset sources_1
}

# Create 'constrs_1' fileset (if not found)
if {[string equal [get_filesets -quiet constrs_1] ""]} {
  create_fileset -constrset constrs_1
}

# Create 'sim_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_1] ""]} {
  create_fileset -srcset sim_1
}

# Add Verilog header files in srcset sources_1
#
set obj [get_filesets sources_1]
add_files -quiet $src_dir/inc
set_property "FILE_TYPE" "Verilog Header" [get_files -of_objects $obj]

# Refresh IP Repositories
update_ip_catalog -rebuild

# Add conventional sources in srcset sources_2
add_files -quiet $src_dir/hdl

# Add IPs
# TODO: handle IP containers files
add_files -quiet [glob -nocomplain ../src/ip/*.xci]
add_files -quiet [glob -nocomplain ../src/ip/*.xcix]
add_files -quiet [glob -nocomplain ../src/ip/*/*.xci]
add_files -quiet [glob -nocomplain ../src/ip/*/*.xcix]

# Add constraints
add_files -fileset constrs_1 -quiet $src_dir/constraints

# Add simulation sources
add_files -fileset sim_1 -quiet $src_dir/sim
 
# Create 'synth_1' run (if not found)
if {[string equal [get_runs -quiet synth_1] ""]} {
  create_run -name synth_1 -part $part -flow {Vivado Synthesis 2018} -strategy "Vivado Synthesis Defaults" -constrset constrs_1
} else {
  set_property strategy "Vivado Synthesis Defaults" [get_runs synth_1]
  set_property flow "Vivado Synthesis 2018" [get_runs synth_1]
}
set obj [get_runs synth_1]
set_property "part" $part $obj
set_property "steps.synth_design.args.flatten_hierarchy" "none" $obj
set_property "steps.synth_design.args.directive" "RuntimeOptimized" $obj
set_property "steps.synth_design.args.fsm_extraction" "off" $obj

# set the current synth run
current_run -synthesis [get_runs synth_1]

# Create 'impl_1' run (if not found)
if {[string equal [get_runs -quiet impl_1] ""]} {
  create_run -name impl_1 -part $part -flow {Vivado Implementation 2018} -strategy "Vivado Implementation Defaults" -constrset constrs_1 -parent_run synth_1
} else {
  set_property strategy "Vivado Implementation Defaults" [get_runs impl_1]
  set_property flow "Vivado Implementation 2018" [get_runs impl_1]
}
set obj [get_runs impl_1]
set_property "part" $part $obj
set_property "steps.opt_design.args.directive"   "RuntimeOptimized" $obj
set_property "steps.place_design.args.directive" "RuntimeOptimized" $obj
set_property "steps.route_design.args.directive" "RuntimeOptimized" $obj

# set the current impl run
current_run -implementation [get_runs impl_1]

set_property -name {xsim.simulate.runtime} -value {100us} -objects [get_filesets sim_1]

puts "INFO: Project created:$proj_name"

