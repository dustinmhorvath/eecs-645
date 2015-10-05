@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xelab  -wto aa8c93a20f7d48e9a434888e898b9085 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot regfile_tb_behav xil_defaultlib.regfile_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
