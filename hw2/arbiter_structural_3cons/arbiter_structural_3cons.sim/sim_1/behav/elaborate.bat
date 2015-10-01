@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xelab  -wto 5227859314424525a5b7e7ab50dfa468 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot arbiter_structural_3cons_tb_behav xil_defaultlib.arbiter_structural_3cons_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
