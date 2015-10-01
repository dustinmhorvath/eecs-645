# 
# Synthesis run script generated by Vivado
# 

debug::add_scope template.lib 1
set_msg_config -id {Common-41} -limit 4294967295
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7k70tfbv676-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/dhorvath/git/eecs/eecs645/hw2/arbiter_structural_3cons/arbiter_structural_3cons.cache/wt [current_project]
set_property parent.project_path C:/Users/dhorvath/git/eecs/eecs645/hw2/arbiter_structural_3cons/arbiter_structural_3cons.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
read_vhdl -library xil_defaultlib C:/Users/dhorvath/git/eecs/eecs645/hw2/arbiter_structural_3cons/arbiter_structural_3cons.vhd
synth_design -top arbiter_structural_3cons -part xc7k70tfbv676-1
write_checkpoint -noxdef arbiter_structural_3cons.dcp
catch { report_utilization -file arbiter_structural_3cons_utilization_synth.rpt -pb arbiter_structural_3cons_utilization_synth.pb }
