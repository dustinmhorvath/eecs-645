# 
# Synthesis run script generated by Vivado
# 

debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7z020clg484-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/dhorvath/git/eecs/eecs645/HW03_source_files/02_MIPS_Data_Memory/HW03_El-Araby_datamemory/HW03_El-Araby_datamemory.cache/wt [current_project]
set_property parent.project_path C:/Users/dhorvath/git/eecs/eecs645/HW03_source_files/02_MIPS_Data_Memory/HW03_El-Araby_datamemory/HW03_El-Araby_datamemory.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part em.avnet.com:zed:part0:1.3 [current_project]
read_vhdl -library xil_defaultlib C:/Users/dhorvath/git/eecs/eecs645/HW03_source_files/02_MIPS_Data_Memory/DM_struct.vhd
synth_design -top DataMem -part xc7z020clg484-1
write_checkpoint -noxdef DataMem.dcp
catch { report_utilization -file DataMem_utilization_synth.rpt -pb DataMem_utilization_synth.pb }
