@echo off
set xv_path=C:\\Xilinx\\Vivado\\2014.4\\bin
call %xv_path%/xsim scheduler_cpcie_behav -key {Behavioral:sim_1:Functional:scheduler_cpcie} -tclbatch scheduler_cpcie.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
