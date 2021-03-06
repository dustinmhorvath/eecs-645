# 
# Synthesis run script generated by Vivado
# 

debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a200tfbg676-2

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/dhorvath/git/eecs/eecs645/HW07_source_files/HW07_source_files/05_MIPS_CU/project_1/project_1.cache/wt [current_project]
set_property parent.project_path C:/Users/dhorvath/git/eecs/eecs645/HW07_source_files/HW07_source_files/05_MIPS_CU/project_1/project_1.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part xilinx.com:ac701:part0:1.2 [current_project]
read_vhdl -library xil_defaultlib C:/Users/dhorvath/git/eecs/eecs645/HW07_source_files/HW07_source_files/05_MIPS_CU/mips_cu.vhd
synth_design -top Main_Control_Unit -part xc7a200tfbg676-2
write_checkpoint -noxdef Main_Control_Unit.dcp
catch { report_utilization -file Main_Control_Unit_utilization_synth.rpt -pb Main_Control_Unit_utilization_synth.pb }
