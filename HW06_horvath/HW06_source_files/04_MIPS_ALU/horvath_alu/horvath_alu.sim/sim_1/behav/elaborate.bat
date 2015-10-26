@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xelab  -wto 4e084fabf5c94046a880985e71574b40 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot alu_tb_behav xil_defaultlib.alu_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
