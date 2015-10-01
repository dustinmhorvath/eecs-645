@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xelab  -wto 846fd70988de4d8cac586cd4a9f30606 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot arbiter_structural_2cons_lowPri_tb_behav xil_defaultlib.arbiter_structural_2cons_lowPri_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
