@echo off
set xv_path=C:\\Xilinx\\Vivado\\2014.4\\bin
call %xv_path%/xelab  -wto a342edba5fce4721bb5de2e66a06e724 -m64 --debug typical --relax -L xil_defaultlib -L secureip --snapshot scheduler_cpcie_behav xil_defaultlib.scheduler_cpcie -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
