@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xelab  -wto d5c75acc4f1b48bdb269971f19803fae -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot arbiter_structural_2cons_highPri_tb_behav xil_defaultlib.arbiter_structural_2cons_highPri_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0