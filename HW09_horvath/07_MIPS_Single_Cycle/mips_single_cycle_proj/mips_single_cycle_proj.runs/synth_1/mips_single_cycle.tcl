# 
# Synthesis run script generated by Vivado
# 

debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a50ticsg325-1L

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/dhorvath/git/eecs/eecs645/HW09_source_files/07_MIPS_Single_Cycle/mips_single_cycle_proj/mips_single_cycle_proj.cache/wt [current_project]
set_property parent.project_path C:/Users/dhorvath/git/eecs/eecs645/HW09_source_files/07_MIPS_Single_Cycle/mips_single_cycle_proj/mips_single_cycle_proj.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_vhdl -library xil_defaultlib {
  C:/Users/dhorvath/git/eecs/eecs645/HW09_source_files/07_MIPS_Single_Cycle/design_files/dm_4byte_wide.vhd
  C:/Users/dhorvath/git/eecs/eecs645/HW09_source_files/07_MIPS_Single_Cycle/design_files/alu_controller.vhd
  C:/Users/dhorvath/git/eecs/eecs645/HW09_source_files/07_MIPS_Single_Cycle/design_files/alu.vhd
  C:/Users/dhorvath/git/eecs/eecs645/HW09_source_files/07_MIPS_Single_Cycle/design_files/adder_second.vhd
  C:/Users/dhorvath/git/eecs/eecs645/HW09_source_files/07_MIPS_Single_Cycle/design_files/adder_first.vhd
  C:/Users/dhorvath/git/eecs/eecs645/HW09_source_files/07_MIPS_Single_Cycle/design_files/sign_extend.vhd
  C:/Users/dhorvath/git/eecs/eecs645/HW09_source_files/07_MIPS_Single_Cycle/design_files/second_shift_left_2.vhd
  C:/Users/dhorvath/git/eecs/eecs645/HW09_source_files/07_MIPS_Single_Cycle/design_files/regfile.vhd
  C:/Users/dhorvath/git/eecs/eecs645/HW09_source_files/07_MIPS_Single_Cycle/design_files/pc_register.vhd
  C:/Users/dhorvath/git/eecs/eecs645/HW09_source_files/07_MIPS_Single_Cycle/design_files/mux_second.vhd
  C:/Users/dhorvath/git/eecs/eecs645/HW09_source_files/07_MIPS_Single_Cycle/design_files/mux_first.vhd
  C:/Users/dhorvath/git/eecs/eecs645/HW09_source_files/07_MIPS_Single_Cycle/design_files/mips_cu_behav.vhd
  C:/Users/dhorvath/git/eecs/eecs645/HW09_source_files/07_MIPS_Single_Cycle/design_files/im_4byte_wide.vhd
  C:/Users/dhorvath/git/eecs/eecs645/HW09_source_files/07_MIPS_Single_Cycle/design_files/first_shift_left_2.vhd
  C:/Users/dhorvath/git/eecs/eecs645/HW09_source_files/07_MIPS_Single_Cycle/design_files/mips_single_cycle_struct.vhd
}
synth_design -top mips_single_cycle -part xc7a50ticsg325-1L
write_checkpoint -noxdef mips_single_cycle.dcp
catch { report_utilization -file mips_single_cycle_utilization_synth.rpt -pb mips_single_cycle_utilization_synth.pb }
