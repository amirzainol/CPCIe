////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: matrixmul_accel_core_ap_fmul_1_max_dsp.v
// /___/   /\     Timestamp: Wed Feb 24 09:35:24 2016
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog C:/mohd/cpcie_project/cpcie_project.srcs/sources_1/edk/module_1/pcores/matrixmul_accel_core_top_v1_00_a/data/__coregen_tmp__/tmp/_cg/matrixmul_accel_core_ap_fmul_1_max_dsp.ngc C:/mohd/cpcie_project/cpcie_project.srcs/sources_1/edk/module_1/pcores/matrixmul_accel_core_top_v1_00_a/data/__coregen_tmp__/tmp/_cg/matrixmul_accel_core_ap_fmul_1_max_dsp.v 
// Device	: 7vx485tffg1761-2
// Input file	: C:/mohd/cpcie_project/cpcie_project.srcs/sources_1/edk/module_1/pcores/matrixmul_accel_core_top_v1_00_a/data/__coregen_tmp__/tmp/_cg/matrixmul_accel_core_ap_fmul_1_max_dsp.ngc
// Output file	: C:/mohd/cpcie_project/cpcie_project.srcs/sources_1/edk/module_1/pcores/matrixmul_accel_core_top_v1_00_a/data/__coregen_tmp__/tmp/_cg/matrixmul_accel_core_ap_fmul_1_max_dsp.v
// # of Modules	: 1
// Design Name	: matrixmul_accel_core_ap_fmul_1_max_dsp
// Xilinx        : C:\Xilinx\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module matrixmul_accel_core_ap_fmul_1_max_dsp (
  aclk, aclken, s_axis_a_tvalid, s_axis_b_tvalid, m_axis_result_tvalid, s_axis_a_tdata, s_axis_b_tdata, m_axis_result_tdata
)/* synthesis syn_black_box syn_noprune=1 */;
  input aclk;
  input aclken;
  input s_axis_a_tvalid;
  input s_axis_b_tvalid;
  output m_axis_result_tvalid;
  input [31 : 0] s_axis_a_tdata;
  input [31 : 0] s_axis_b_tdata;
  output [31 : 0] m_axis_result_tdata;
  
  // synthesis translate_off
  
  wire \blk00000001/sig000001ae ;
  wire \blk00000001/sig000001ad ;
  wire \blk00000001/sig000001ac ;
  wire \blk00000001/sig000001ab ;
  wire \blk00000001/sig000001aa ;
  wire \blk00000001/sig000001a9 ;
  wire \blk00000001/sig000001a8 ;
  wire \blk00000001/sig000001a7 ;
  wire \blk00000001/sig000001a6 ;
  wire \blk00000001/sig000001a5 ;
  wire \blk00000001/sig000001a4 ;
  wire \blk00000001/sig000001a3 ;
  wire \blk00000001/sig000001a2 ;
  wire \blk00000001/sig000001a1 ;
  wire \blk00000001/sig000001a0 ;
  wire \blk00000001/sig0000019f ;
  wire \blk00000001/sig0000019e ;
  wire \blk00000001/sig0000019d ;
  wire \blk00000001/sig0000019c ;
  wire \blk00000001/sig0000019b ;
  wire \blk00000001/sig0000019a ;
  wire \blk00000001/sig00000199 ;
  wire \blk00000001/sig00000198 ;
  wire \blk00000001/sig00000197 ;
  wire \blk00000001/sig00000196 ;
  wire \blk00000001/sig00000195 ;
  wire \blk00000001/sig00000194 ;
  wire \blk00000001/sig00000193 ;
  wire \blk00000001/sig00000192 ;
  wire \blk00000001/sig00000191 ;
  wire \blk00000001/sig00000190 ;
  wire \blk00000001/sig0000018f ;
  wire \blk00000001/sig0000018e ;
  wire \blk00000001/sig0000018d ;
  wire \blk00000001/sig0000018c ;
  wire \blk00000001/sig0000018b ;
  wire \blk00000001/sig0000018a ;
  wire \blk00000001/sig00000189 ;
  wire \blk00000001/sig00000188 ;
  wire \blk00000001/sig00000187 ;
  wire \blk00000001/sig00000186 ;
  wire \blk00000001/sig00000185 ;
  wire \blk00000001/sig00000184 ;
  wire \blk00000001/sig00000183 ;
  wire \blk00000001/sig00000182 ;
  wire \blk00000001/sig00000181 ;
  wire \blk00000001/sig00000180 ;
  wire \blk00000001/sig0000017f ;
  wire \blk00000001/sig0000017e ;
  wire \blk00000001/sig0000017d ;
  wire \blk00000001/sig0000017c ;
  wire \blk00000001/sig0000017b ;
  wire \blk00000001/sig0000017a ;
  wire \blk00000001/sig00000179 ;
  wire \blk00000001/sig00000178 ;
  wire \blk00000001/sig00000177 ;
  wire \blk00000001/sig00000176 ;
  wire \blk00000001/sig00000175 ;
  wire \blk00000001/sig00000174 ;
  wire \blk00000001/sig00000173 ;
  wire \blk00000001/sig00000172 ;
  wire \blk00000001/sig00000171 ;
  wire \blk00000001/sig00000170 ;
  wire \blk00000001/sig0000016f ;
  wire \blk00000001/sig0000016e ;
  wire \blk00000001/sig0000016d ;
  wire \blk00000001/sig0000016c ;
  wire \blk00000001/sig0000016b ;
  wire \blk00000001/sig0000016a ;
  wire \blk00000001/sig00000169 ;
  wire \blk00000001/sig00000168 ;
  wire \blk00000001/sig00000167 ;
  wire \blk00000001/sig00000166 ;
  wire \blk00000001/sig00000165 ;
  wire \blk00000001/sig00000164 ;
  wire \blk00000001/sig00000163 ;
  wire \blk00000001/sig00000162 ;
  wire \blk00000001/sig00000161 ;
  wire \blk00000001/sig00000160 ;
  wire \blk00000001/sig0000015f ;
  wire \blk00000001/sig0000015e ;
  wire \blk00000001/sig0000015d ;
  wire \blk00000001/sig0000015c ;
  wire \blk00000001/sig0000015b ;
  wire \blk00000001/sig0000015a ;
  wire \blk00000001/sig00000159 ;
  wire \blk00000001/sig00000158 ;
  wire \blk00000001/sig00000157 ;
  wire \blk00000001/sig00000156 ;
  wire \blk00000001/sig00000155 ;
  wire \blk00000001/sig00000154 ;
  wire \blk00000001/sig00000153 ;
  wire \blk00000001/sig00000152 ;
  wire \blk00000001/sig00000151 ;
  wire \blk00000001/sig00000150 ;
  wire \blk00000001/sig0000014f ;
  wire \blk00000001/sig0000014e ;
  wire \blk00000001/sig0000014d ;
  wire \blk00000001/sig0000014c ;
  wire \blk00000001/sig0000014b ;
  wire \blk00000001/sig0000014a ;
  wire \blk00000001/sig00000149 ;
  wire \blk00000001/sig00000148 ;
  wire \blk00000001/sig00000147 ;
  wire \blk00000001/sig00000146 ;
  wire \blk00000001/sig00000145 ;
  wire \blk00000001/sig00000144 ;
  wire \blk00000001/sig00000143 ;
  wire \blk00000001/sig00000142 ;
  wire \blk00000001/sig00000141 ;
  wire \blk00000001/sig00000140 ;
  wire \blk00000001/sig0000013f ;
  wire \blk00000001/sig0000013e ;
  wire \blk00000001/sig0000013d ;
  wire \blk00000001/sig0000013c ;
  wire \blk00000001/sig00000113 ;
  wire \blk00000001/sig00000112 ;
  wire \blk00000001/sig00000111 ;
  wire \blk00000001/sig00000110 ;
  wire \blk00000001/sig0000010f ;
  wire \blk00000001/sig0000010e ;
  wire \blk00000001/sig0000010d ;
  wire \blk00000001/sig0000010c ;
  wire \blk00000001/sig0000010b ;
  wire \blk00000001/sig0000010a ;
  wire \blk00000001/sig00000109 ;
  wire \blk00000001/sig00000108 ;
  wire \blk00000001/sig00000107 ;
  wire \blk00000001/sig00000106 ;
  wire \blk00000001/sig00000105 ;
  wire \blk00000001/sig00000104 ;
  wire \blk00000001/sig00000103 ;
  wire \blk00000001/sig00000102 ;
  wire \blk00000001/sig00000101 ;
  wire \blk00000001/sig00000100 ;
  wire \blk00000001/sig000000ff ;
  wire \blk00000001/sig000000fe ;
  wire \blk00000001/sig000000fd ;
  wire \blk00000001/sig000000fc ;
  wire \blk00000001/sig000000fb ;
  wire \blk00000001/sig000000fa ;
  wire \blk00000001/sig000000f9 ;
  wire \blk00000001/sig000000f8 ;
  wire \blk00000001/sig000000f7 ;
  wire \blk00000001/sig000000f6 ;
  wire \blk00000001/sig000000f5 ;
  wire \blk00000001/sig000000f4 ;
  wire \blk00000001/sig000000f3 ;
  wire \blk00000001/sig000000f2 ;
  wire \blk00000001/sig000000f1 ;
  wire \blk00000001/sig000000f0 ;
  wire \blk00000001/sig000000ef ;
  wire \blk00000001/sig000000ee ;
  wire \blk00000001/sig000000ed ;
  wire \blk00000001/sig000000ec ;
  wire \blk00000001/sig000000eb ;
  wire \blk00000001/sig000000ea ;
  wire \blk00000001/sig000000e9 ;
  wire \blk00000001/sig000000e8 ;
  wire \blk00000001/sig000000e7 ;
  wire \blk00000001/sig000000e6 ;
  wire \blk00000001/sig000000e5 ;
  wire \blk00000001/sig000000e4 ;
  wire \blk00000001/sig000000e3 ;
  wire \blk00000001/sig000000e2 ;
  wire \blk00000001/sig000000e1 ;
  wire \blk00000001/sig000000e0 ;
  wire \blk00000001/sig000000df ;
  wire \blk00000001/sig000000de ;
  wire \blk00000001/sig000000dd ;
  wire \blk00000001/sig000000dc ;
  wire \blk00000001/sig000000db ;
  wire \blk00000001/sig000000da ;
  wire \blk00000001/sig000000d9 ;
  wire \blk00000001/sig000000d8 ;
  wire \blk00000001/sig000000d7 ;
  wire \blk00000001/sig000000d6 ;
  wire \blk00000001/sig000000d5 ;
  wire \blk00000001/sig000000d4 ;
  wire \blk00000001/sig000000d3 ;
  wire \blk00000001/sig000000d2 ;
  wire \blk00000001/sig000000d1 ;
  wire \blk00000001/sig000000d0 ;
  wire \blk00000001/sig000000cf ;
  wire \blk00000001/sig000000ce ;
  wire \blk00000001/sig000000cd ;
  wire \blk00000001/sig000000cc ;
  wire \blk00000001/sig000000cb ;
  wire \blk00000001/sig000000ca ;
  wire \blk00000001/sig000000c9 ;
  wire \blk00000001/sig000000c8 ;
  wire \blk00000001/sig000000c7 ;
  wire \blk00000001/sig000000c6 ;
  wire \blk00000001/sig000000c5 ;
  wire \blk00000001/sig000000c4 ;
  wire \blk00000001/sig000000c3 ;
  wire \blk00000001/sig000000c2 ;
  wire \blk00000001/sig000000c1 ;
  wire \blk00000001/sig000000c0 ;
  wire \blk00000001/sig000000bf ;
  wire \blk00000001/sig000000be ;
  wire \blk00000001/sig000000bd ;
  wire \blk00000001/sig000000bc ;
  wire \blk00000001/sig000000bb ;
  wire \blk00000001/sig000000ba ;
  wire \blk00000001/sig000000b9 ;
  wire \blk00000001/sig000000b8 ;
  wire \blk00000001/sig000000b7 ;
  wire \blk00000001/sig000000b6 ;
  wire \blk00000001/sig000000b5 ;
  wire \blk00000001/sig000000b4 ;
  wire \blk00000001/sig000000b3 ;
  wire \blk00000001/sig000000b2 ;
  wire \blk00000001/sig000000b1 ;
  wire \blk00000001/sig000000b0 ;
  wire \blk00000001/sig000000af ;
  wire \blk00000001/sig000000ae ;
  wire \blk00000001/sig000000ad ;
  wire \blk00000001/sig000000ac ;
  wire \blk00000001/sig000000ab ;
  wire \blk00000001/sig000000aa ;
  wire \blk00000001/sig000000a9 ;
  wire \blk00000001/sig000000a8 ;
  wire \blk00000001/sig000000a7 ;
  wire \blk00000001/sig000000a6 ;
  wire \blk00000001/sig000000a5 ;
  wire \blk00000001/sig000000a4 ;
  wire \blk00000001/sig0000008b ;
  wire \blk00000001/sig0000008a ;
  wire \blk00000001/sig00000089 ;
  wire \blk00000001/sig00000088 ;
  wire \blk00000001/sig00000087 ;
  wire \blk00000001/sig00000086 ;
  wire \blk00000001/sig00000085 ;
  wire \blk00000001/sig00000084 ;
  wire \blk00000001/sig00000083 ;
  wire \blk00000001/sig00000082 ;
  wire \blk00000001/sig00000081 ;
  wire \blk00000001/sig00000080 ;
  wire \blk00000001/sig0000007f ;
  wire \blk00000001/sig0000007e ;
  wire \blk00000001/sig0000007d ;
  wire \blk00000001/sig0000007c ;
  wire \blk00000001/sig0000007b ;
  wire \blk00000001/sig0000007a ;
  wire \blk00000001/sig00000079 ;
  wire \blk00000001/sig00000078 ;
  wire \blk00000001/sig00000077 ;
  wire \blk00000001/sig00000076 ;
  wire \blk00000001/sig00000075 ;
  wire \blk00000001/sig00000074 ;
  wire \blk00000001/sig00000073 ;
  wire \blk00000001/sig00000072 ;
  wire \blk00000001/sig00000071 ;
  wire \blk00000001/sig00000070 ;
  wire \blk00000001/sig0000006f ;
  wire \blk00000001/sig0000006e ;
  wire \blk00000001/sig0000006d ;
  wire \blk00000001/sig0000006c ;
  wire \blk00000001/sig0000006b ;
  wire \blk00000001/sig0000006a ;
  wire \blk00000001/sig00000069 ;
  wire \blk00000001/sig00000068 ;
  wire \blk00000001/sig00000067 ;
  wire \blk00000001/sig00000066 ;
  wire \blk00000001/sig00000065 ;
  wire \blk00000001/sig00000064 ;
  wire \blk00000001/sig00000063 ;
  wire \blk00000001/sig00000062 ;
  wire \blk00000001/sig00000061 ;
  wire \blk00000001/sig00000060 ;
  wire \blk00000001/sig0000005f ;
  wire \blk00000001/sig0000005e ;
  wire \blk00000001/sig0000005d ;
  wire \blk00000001/sig0000005c ;
  wire \blk00000001/sig0000005b ;
  wire \blk00000001/sig0000005a ;
  wire \blk00000001/sig00000059 ;
  wire \blk00000001/sig00000058 ;
  wire \blk00000001/sig00000057 ;
  wire \blk00000001/sig00000056 ;
  wire \blk00000001/sig00000055 ;
  wire \blk00000001/sig00000054 ;
  wire \blk00000001/sig00000053 ;
  wire \blk00000001/sig00000052 ;
  wire \blk00000001/sig00000051 ;
  wire \blk00000001/sig00000050 ;
  wire \blk00000001/sig0000004f ;
  wire \blk00000001/sig0000004e ;
  wire \blk00000001/sig0000004d ;
  wire \blk00000001/sig0000004c ;
  wire \blk00000001/sig0000004b ;
  wire \blk00000001/sig0000004a ;
  wire \blk00000001/sig00000049 ;
  wire \blk00000001/sig00000048 ;
  wire \blk00000001/sig00000047 ;
  wire \blk00000001/sig00000046 ;
  wire \blk00000001/sig00000045 ;
  wire \blk00000001/sig00000044 ;
  wire \blk00000001/sig00000043 ;
  wire \blk00000001/sig00000042 ;
  wire \blk00000001/sig00000041 ;
  wire \blk00000001/sig00000040 ;
  wire \blk00000001/sig0000003f ;
  wire \blk00000001/sig0000003e ;
  wire \blk00000001/sig0000003d ;
  wire \blk00000001/sig0000003c ;
  wire \blk00000001/sig0000003b ;
  wire \blk00000001/sig0000003a ;
  wire \blk00000001/sig00000039 ;
  wire \blk00000001/sig00000038 ;
  wire \blk00000001/sig00000037 ;
  wire \blk00000001/sig00000036 ;
  wire \blk00000001/sig00000035 ;
  wire \blk00000001/sig00000034 ;
  wire \blk00000001/sig00000033 ;
  wire \blk00000001/sig00000032 ;
  wire \blk00000001/sig00000031 ;
  wire \blk00000001/sig00000030 ;
  wire \blk00000001/sig0000002f ;
  wire \blk00000001/sig0000002e ;
  wire \blk00000001/sig0000002d ;
  wire \blk00000001/sig0000002c ;
  wire \blk00000001/sig0000002b ;
  wire \blk00000001/sig0000002a ;
  wire \blk00000001/sig00000029 ;
  wire \blk00000001/sig00000028 ;
  wire \blk00000001/sig00000027 ;
  wire \blk00000001/sig00000026 ;
  wire \NLW_blk00000001/blk0000001e_PATTERNBDETECT_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_MULTSIGNOUT_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_CARRYCASCOUT_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_UNDERFLOW_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PATTERNDETECT_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_OVERFLOW_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_ACOUT<29>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_ACOUT<28>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_ACOUT<27>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_ACOUT<26>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_ACOUT<25>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_ACOUT<24>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_ACOUT<23>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_ACOUT<22>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_ACOUT<21>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_ACOUT<20>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_ACOUT<19>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_ACOUT<18>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_ACOUT<17>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_ACOUT<16>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_ACOUT<15>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_ACOUT<14>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_ACOUT<13>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_ACOUT<12>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_ACOUT<11>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_ACOUT<10>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_ACOUT<9>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_ACOUT<8>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_ACOUT<7>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_ACOUT<6>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_ACOUT<5>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_ACOUT<4>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_ACOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_ACOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_ACOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_ACOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_CARRYOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_CARRYOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_CARRYOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_BCOUT<17>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_BCOUT<16>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_BCOUT<15>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_BCOUT<14>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_BCOUT<13>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_BCOUT<12>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_BCOUT<11>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_BCOUT<10>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_BCOUT<9>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_BCOUT<8>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_BCOUT<7>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_BCOUT<6>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_BCOUT<5>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_BCOUT<4>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_BCOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_BCOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_BCOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_BCOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_P<40>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_P<31>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_P<6>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_P<5>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_P<4>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_P<3>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_P<2>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_P<1>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_P<0>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<47>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<46>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<45>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<44>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<43>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<42>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<41>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<40>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<39>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<38>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<37>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<36>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<35>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<34>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<33>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<32>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<31>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<30>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<29>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<28>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<27>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<26>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<25>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<24>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<23>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<22>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<21>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<20>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<19>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<18>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<17>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<16>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<15>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<14>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<13>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<12>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<11>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<10>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<9>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<8>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<7>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<6>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<5>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<4>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001e_PCOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_PATTERNBDETECT_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_MULTSIGNOUT_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_CARRYCASCOUT_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_UNDERFLOW_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_OVERFLOW_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_ACOUT<29>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_ACOUT<28>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_ACOUT<27>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_ACOUT<26>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_ACOUT<25>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_ACOUT<24>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_ACOUT<23>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_ACOUT<22>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_ACOUT<21>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_ACOUT<20>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_ACOUT<19>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_ACOUT<18>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_ACOUT<17>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_ACOUT<16>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_ACOUT<15>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_ACOUT<14>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_ACOUT<13>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_ACOUT<12>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_ACOUT<11>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_ACOUT<10>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_ACOUT<9>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_ACOUT<8>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_ACOUT<7>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_ACOUT<6>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_ACOUT<5>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_ACOUT<4>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_ACOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_ACOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_ACOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_ACOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_CARRYOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_CARRYOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_CARRYOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_CARRYOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_BCOUT<17>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_BCOUT<16>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_BCOUT<15>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_BCOUT<14>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_BCOUT<13>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_BCOUT<12>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_BCOUT<11>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_BCOUT<10>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_BCOUT<9>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_BCOUT<8>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_BCOUT<7>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_BCOUT<6>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_BCOUT<5>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_BCOUT<4>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_BCOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_BCOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_BCOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_BCOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_P<47>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_P<46>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_P<45>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_P<44>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_P<43>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_P<42>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_P<41>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_P<40>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_P<39>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_P<38>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_P<37>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_P<36>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_P<35>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_P<34>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_P<33>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_P<32>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_P<31>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_P<4>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_P<3>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_P<2>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_P<1>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001d_P<0>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_PATTERNBDETECT_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_MULTSIGNOUT_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_CARRYCASCOUT_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_UNDERFLOW_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_OVERFLOW_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_CARRYOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_CARRYOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_CARRYOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_CARRYOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_BCOUT<17>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_BCOUT<16>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_BCOUT<15>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_BCOUT<14>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_BCOUT<13>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_BCOUT<12>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_BCOUT<11>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_BCOUT<10>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_BCOUT<9>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_BCOUT<8>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_BCOUT<7>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_BCOUT<6>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_BCOUT<5>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_BCOUT<4>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_BCOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_BCOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_BCOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_BCOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<47>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<46>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<45>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<44>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<43>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<42>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<41>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<40>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<39>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<38>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<37>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<36>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<35>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<34>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<33>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<32>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<31>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<30>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<29>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<28>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<27>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<26>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<25>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<24>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<23>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<22>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<21>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<20>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<19>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<18>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<17>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<16>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<15>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<14>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<13>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<12>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<11>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<10>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<9>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<8>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<7>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<6>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<5>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<4>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<3>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<2>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<1>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000001c_P<0>_UNCONNECTED ;
  wire [30 : 0] NlwRenamedSig_OI_m_axis_result_tdata;
  assign
    m_axis_result_tdata[30] = NlwRenamedSig_OI_m_axis_result_tdata[30],
    m_axis_result_tdata[29] = NlwRenamedSig_OI_m_axis_result_tdata[29],
    m_axis_result_tdata[28] = NlwRenamedSig_OI_m_axis_result_tdata[28],
    m_axis_result_tdata[27] = NlwRenamedSig_OI_m_axis_result_tdata[27],
    m_axis_result_tdata[26] = NlwRenamedSig_OI_m_axis_result_tdata[26],
    m_axis_result_tdata[25] = NlwRenamedSig_OI_m_axis_result_tdata[25],
    m_axis_result_tdata[24] = NlwRenamedSig_OI_m_axis_result_tdata[24],
    m_axis_result_tdata[23] = NlwRenamedSig_OI_m_axis_result_tdata[23],
    m_axis_result_tdata[22] = NlwRenamedSig_OI_m_axis_result_tdata[22],
    m_axis_result_tdata[21] = NlwRenamedSig_OI_m_axis_result_tdata[21],
    m_axis_result_tdata[20] = NlwRenamedSig_OI_m_axis_result_tdata[20],
    m_axis_result_tdata[19] = NlwRenamedSig_OI_m_axis_result_tdata[19],
    m_axis_result_tdata[18] = NlwRenamedSig_OI_m_axis_result_tdata[18],
    m_axis_result_tdata[17] = NlwRenamedSig_OI_m_axis_result_tdata[17],
    m_axis_result_tdata[16] = NlwRenamedSig_OI_m_axis_result_tdata[16],
    m_axis_result_tdata[15] = NlwRenamedSig_OI_m_axis_result_tdata[15],
    m_axis_result_tdata[14] = NlwRenamedSig_OI_m_axis_result_tdata[14],
    m_axis_result_tdata[13] = NlwRenamedSig_OI_m_axis_result_tdata[13],
    m_axis_result_tdata[12] = NlwRenamedSig_OI_m_axis_result_tdata[12],
    m_axis_result_tdata[11] = NlwRenamedSig_OI_m_axis_result_tdata[11],
    m_axis_result_tdata[10] = NlwRenamedSig_OI_m_axis_result_tdata[10],
    m_axis_result_tdata[9] = NlwRenamedSig_OI_m_axis_result_tdata[9],
    m_axis_result_tdata[8] = NlwRenamedSig_OI_m_axis_result_tdata[8],
    m_axis_result_tdata[7] = NlwRenamedSig_OI_m_axis_result_tdata[7],
    m_axis_result_tdata[6] = NlwRenamedSig_OI_m_axis_result_tdata[6],
    m_axis_result_tdata[5] = NlwRenamedSig_OI_m_axis_result_tdata[5],
    m_axis_result_tdata[4] = NlwRenamedSig_OI_m_axis_result_tdata[4],
    m_axis_result_tdata[3] = NlwRenamedSig_OI_m_axis_result_tdata[3],
    m_axis_result_tdata[2] = NlwRenamedSig_OI_m_axis_result_tdata[2],
    m_axis_result_tdata[1] = NlwRenamedSig_OI_m_axis_result_tdata[1],
    m_axis_result_tdata[0] = NlwRenamedSig_OI_m_axis_result_tdata[0];
  LUT4 #(
    .INIT ( 16'hFEFF ))
  \blk00000001/blk000000ac  (
    .I0(\blk00000001/sig00000082 ),
    .I1(\blk00000001/sig000000b4 ),
    .I2(\blk00000001/sig000000b6 ),
    .I3(\blk00000001/sig00000080 ),
    .O(\blk00000001/sig00000188 )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \blk00000001/blk000000ab  (
    .I0(\blk00000001/sig000000b6 ),
    .I1(\blk00000001/sig000000b4 ),
    .O(\blk00000001/sig00000081 )
  );
  LUT6 #(
    .INIT ( 64'hB999999999999999 ))
  \blk00000001/blk000000aa  (
    .I0(\blk00000001/sig0000008a ),
    .I1(\blk00000001/sig000000a4 ),
    .I2(\blk00000001/sig000000a7 ),
    .I3(\blk00000001/sig000000a9 ),
    .I4(\blk00000001/sig00000185 ),
    .I5(\blk00000001/sig000000a5 ),
    .O(\blk00000001/sig00000187 )
  );
  LUT6 #(
    .INIT ( 64'h01111111FBBBBBBB ))
  \blk00000001/blk000000a9  (
    .I0(\blk00000001/sig0000008b ),
    .I1(\blk00000001/sig0000015f ),
    .I2(\blk00000001/sig0000005a ),
    .I3(\blk00000001/sig0000015e ),
    .I4(\blk00000001/sig0000005b ),
    .I5(\blk00000001/sig00000156 ),
    .O(\blk00000001/sig000001ad )
  );
  LUT6 #(
    .INIT ( 64'h01111111FBBBBBBB ))
  \blk00000001/blk000000a8  (
    .I0(\blk00000001/sig0000008b ),
    .I1(\blk00000001/sig00000164 ),
    .I2(\blk00000001/sig0000005a ),
    .I3(\blk00000001/sig0000015e ),
    .I4(\blk00000001/sig0000005b ),
    .I5(\blk00000001/sig0000015b ),
    .O(\blk00000001/sig000001ac )
  );
  LUT6 #(
    .INIT ( 64'h01111111FBBBBBBB ))
  \blk00000001/blk000000a7  (
    .I0(\blk00000001/sig0000008b ),
    .I1(\blk00000001/sig00000163 ),
    .I2(\blk00000001/sig0000005a ),
    .I3(\blk00000001/sig0000015e ),
    .I4(\blk00000001/sig0000005b ),
    .I5(\blk00000001/sig0000015a ),
    .O(\blk00000001/sig000001ab )
  );
  LUT6 #(
    .INIT ( 64'h01111111FBBBBBBB ))
  \blk00000001/blk000000a6  (
    .I0(\blk00000001/sig0000008b ),
    .I1(\blk00000001/sig00000165 ),
    .I2(\blk00000001/sig0000005a ),
    .I3(\blk00000001/sig0000015e ),
    .I4(\blk00000001/sig0000005b ),
    .I5(\blk00000001/sig0000015c ),
    .O(\blk00000001/sig000001aa )
  );
  LUT6 #(
    .INIT ( 64'h01111111FBBBBBBB ))
  \blk00000001/blk000000a5  (
    .I0(\blk00000001/sig0000008b ),
    .I1(\blk00000001/sig00000161 ),
    .I2(\blk00000001/sig0000005a ),
    .I3(\blk00000001/sig0000015e ),
    .I4(\blk00000001/sig0000005b ),
    .I5(\blk00000001/sig00000158 ),
    .O(\blk00000001/sig000001a9 )
  );
  LUT6 #(
    .INIT ( 64'h01111111FBBBBBBB ))
  \blk00000001/blk000000a4  (
    .I0(\blk00000001/sig0000008b ),
    .I1(\blk00000001/sig00000162 ),
    .I2(\blk00000001/sig0000005a ),
    .I3(\blk00000001/sig0000015e ),
    .I4(\blk00000001/sig0000005b ),
    .I5(\blk00000001/sig00000159 ),
    .O(\blk00000001/sig000001a8 )
  );
  LUT6 #(
    .INIT ( 64'h01111111FBBBBBBB ))
  \blk00000001/blk000000a3  (
    .I0(\blk00000001/sig0000008b ),
    .I1(\blk00000001/sig00000160 ),
    .I2(\blk00000001/sig0000005a ),
    .I3(\blk00000001/sig0000015e ),
    .I4(\blk00000001/sig0000005b ),
    .I5(\blk00000001/sig00000157 ),
    .O(\blk00000001/sig000001a7 )
  );
  LUT5 #(
    .INIT ( 32'h55550444 ))
  \blk00000001/blk000000a2  (
    .I0(\blk00000001/sig0000008b ),
    .I1(\blk00000001/sig0000005a ),
    .I2(\blk00000001/sig00000028 ),
    .I3(\blk00000001/sig00000029 ),
    .I4(\blk00000001/sig0000005b ),
    .O(\blk00000001/sig0000018e )
  );
  LUT6 #(
    .INIT ( 64'hAAAAAAAA88880888 ))
  \blk00000001/blk000000a1  (
    .I0(\blk00000001/sig0000005b ),
    .I1(\blk00000001/sig0000008b ),
    .I2(\blk00000001/sig00000028 ),
    .I3(\blk00000001/sig00000029 ),
    .I4(\blk00000001/sig0000005c ),
    .I5(\blk00000001/sig0000005a ),
    .O(\blk00000001/sig0000013d )
  );
  LUT4 #(
    .INIT ( 16'hEB41 ))
  \blk00000001/blk000000a0  (
    .I0(\blk00000001/sig00000027 ),
    .I1(\blk00000001/sig0000013e ),
    .I2(\blk00000001/sig000000a4 ),
    .I3(\blk00000001/sig0000015d ),
    .O(\blk00000001/sig000001ae )
  );
  LUT5 #(
    .INIT ( 32'h10FF1000 ))
  \blk00000001/blk0000009f  (
    .I0(\blk00000001/sig00000075 ),
    .I1(\blk00000001/sig00000074 ),
    .I2(\blk00000001/sig000001a4 ),
    .I3(aclken),
    .I4(NlwRenamedSig_OI_m_axis_result_tdata[20]),
    .O(\blk00000001/sig0000017a )
  );
  LUT5 #(
    .INIT ( 32'h10FF1000 ))
  \blk00000001/blk0000009e  (
    .I0(\blk00000001/sig00000075 ),
    .I1(\blk00000001/sig00000074 ),
    .I2(\blk00000001/sig000001a3 ),
    .I3(aclken),
    .I4(NlwRenamedSig_OI_m_axis_result_tdata[19]),
    .O(\blk00000001/sig00000179 )
  );
  LUT5 #(
    .INIT ( 32'h10FF1000 ))
  \blk00000001/blk0000009d  (
    .I0(\blk00000001/sig00000075 ),
    .I1(\blk00000001/sig00000074 ),
    .I2(\blk00000001/sig000001a2 ),
    .I3(aclken),
    .I4(NlwRenamedSig_OI_m_axis_result_tdata[21]),
    .O(\blk00000001/sig0000017b )
  );
  LUT5 #(
    .INIT ( 32'h10FF1000 ))
  \blk00000001/blk0000009c  (
    .I0(\blk00000001/sig00000075 ),
    .I1(\blk00000001/sig00000074 ),
    .I2(\blk00000001/sig000001a1 ),
    .I3(aclken),
    .I4(NlwRenamedSig_OI_m_axis_result_tdata[16]),
    .O(\blk00000001/sig00000176 )
  );
  LUT5 #(
    .INIT ( 32'h10FF1000 ))
  \blk00000001/blk0000009b  (
    .I0(\blk00000001/sig00000075 ),
    .I1(\blk00000001/sig00000074 ),
    .I2(\blk00000001/sig000001a0 ),
    .I3(aclken),
    .I4(NlwRenamedSig_OI_m_axis_result_tdata[18]),
    .O(\blk00000001/sig00000178 )
  );
  LUT5 #(
    .INIT ( 32'h10FF1000 ))
  \blk00000001/blk0000009a  (
    .I0(\blk00000001/sig00000075 ),
    .I1(\blk00000001/sig00000074 ),
    .I2(\blk00000001/sig0000019f ),
    .I3(aclken),
    .I4(NlwRenamedSig_OI_m_axis_result_tdata[15]),
    .O(\blk00000001/sig00000175 )
  );
  LUT5 #(
    .INIT ( 32'h10FF1000 ))
  \blk00000001/blk00000099  (
    .I0(\blk00000001/sig00000075 ),
    .I1(\blk00000001/sig00000074 ),
    .I2(\blk00000001/sig0000019e ),
    .I3(aclken),
    .I4(NlwRenamedSig_OI_m_axis_result_tdata[17]),
    .O(\blk00000001/sig00000177 )
  );
  LUT5 #(
    .INIT ( 32'h10FF1000 ))
  \blk00000001/blk00000098  (
    .I0(\blk00000001/sig00000075 ),
    .I1(\blk00000001/sig00000074 ),
    .I2(\blk00000001/sig0000019d ),
    .I3(aclken),
    .I4(NlwRenamedSig_OI_m_axis_result_tdata[13]),
    .O(\blk00000001/sig00000173 )
  );
  LUT5 #(
    .INIT ( 32'h10FF1000 ))
  \blk00000001/blk00000097  (
    .I0(\blk00000001/sig00000075 ),
    .I1(\blk00000001/sig00000074 ),
    .I2(\blk00000001/sig0000019c ),
    .I3(aclken),
    .I4(NlwRenamedSig_OI_m_axis_result_tdata[14]),
    .O(\blk00000001/sig00000174 )
  );
  LUT5 #(
    .INIT ( 32'h10FF1000 ))
  \blk00000001/blk00000096  (
    .I0(\blk00000001/sig00000075 ),
    .I1(\blk00000001/sig00000074 ),
    .I2(\blk00000001/sig0000019b ),
    .I3(aclken),
    .I4(NlwRenamedSig_OI_m_axis_result_tdata[10]),
    .O(\blk00000001/sig00000170 )
  );
  LUT5 #(
    .INIT ( 32'h10FF1000 ))
  \blk00000001/blk00000095  (
    .I0(\blk00000001/sig00000075 ),
    .I1(\blk00000001/sig00000074 ),
    .I2(\blk00000001/sig0000019a ),
    .I3(aclken),
    .I4(NlwRenamedSig_OI_m_axis_result_tdata[7]),
    .O(\blk00000001/sig0000016d )
  );
  LUT5 #(
    .INIT ( 32'h10FF1000 ))
  \blk00000001/blk00000094  (
    .I0(\blk00000001/sig00000075 ),
    .I1(\blk00000001/sig00000074 ),
    .I2(\blk00000001/sig00000199 ),
    .I3(aclken),
    .I4(NlwRenamedSig_OI_m_axis_result_tdata[12]),
    .O(\blk00000001/sig00000172 )
  );
  LUT5 #(
    .INIT ( 32'h10FF1000 ))
  \blk00000001/blk00000093  (
    .I0(\blk00000001/sig00000075 ),
    .I1(\blk00000001/sig00000074 ),
    .I2(\blk00000001/sig00000198 ),
    .I3(aclken),
    .I4(NlwRenamedSig_OI_m_axis_result_tdata[11]),
    .O(\blk00000001/sig00000171 )
  );
  LUT5 #(
    .INIT ( 32'h10FF1000 ))
  \blk00000001/blk00000092  (
    .I0(\blk00000001/sig00000075 ),
    .I1(\blk00000001/sig00000074 ),
    .I2(\blk00000001/sig00000197 ),
    .I3(aclken),
    .I4(NlwRenamedSig_OI_m_axis_result_tdata[9]),
    .O(\blk00000001/sig0000016f )
  );
  LUT5 #(
    .INIT ( 32'h10FF1000 ))
  \blk00000001/blk00000091  (
    .I0(\blk00000001/sig00000075 ),
    .I1(\blk00000001/sig00000074 ),
    .I2(\blk00000001/sig00000196 ),
    .I3(aclken),
    .I4(NlwRenamedSig_OI_m_axis_result_tdata[8]),
    .O(\blk00000001/sig0000016e )
  );
  LUT5 #(
    .INIT ( 32'h10FF1000 ))
  \blk00000001/blk00000090  (
    .I0(\blk00000001/sig00000075 ),
    .I1(\blk00000001/sig00000074 ),
    .I2(\blk00000001/sig00000195 ),
    .I3(aclken),
    .I4(NlwRenamedSig_OI_m_axis_result_tdata[5]),
    .O(\blk00000001/sig0000016b )
  );
  LUT5 #(
    .INIT ( 32'h10FF1000 ))
  \blk00000001/blk0000008f  (
    .I0(\blk00000001/sig00000075 ),
    .I1(\blk00000001/sig00000074 ),
    .I2(\blk00000001/sig00000194 ),
    .I3(aclken),
    .I4(NlwRenamedSig_OI_m_axis_result_tdata[4]),
    .O(\blk00000001/sig0000016a )
  );
  LUT5 #(
    .INIT ( 32'h10FF1000 ))
  \blk00000001/blk0000008e  (
    .I0(\blk00000001/sig00000075 ),
    .I1(\blk00000001/sig00000074 ),
    .I2(\blk00000001/sig00000193 ),
    .I3(aclken),
    .I4(NlwRenamedSig_OI_m_axis_result_tdata[6]),
    .O(\blk00000001/sig0000016c )
  );
  LUT5 #(
    .INIT ( 32'h10FF1000 ))
  \blk00000001/blk0000008d  (
    .I0(\blk00000001/sig00000075 ),
    .I1(\blk00000001/sig00000074 ),
    .I2(\blk00000001/sig00000192 ),
    .I3(aclken),
    .I4(NlwRenamedSig_OI_m_axis_result_tdata[1]),
    .O(\blk00000001/sig00000167 )
  );
  LUT5 #(
    .INIT ( 32'h10FF1000 ))
  \blk00000001/blk0000008c  (
    .I0(\blk00000001/sig00000075 ),
    .I1(\blk00000001/sig00000074 ),
    .I2(\blk00000001/sig00000191 ),
    .I3(aclken),
    .I4(NlwRenamedSig_OI_m_axis_result_tdata[3]),
    .O(\blk00000001/sig00000169 )
  );
  LUT5 #(
    .INIT ( 32'h10FF1000 ))
  \blk00000001/blk0000008b  (
    .I0(\blk00000001/sig00000075 ),
    .I1(\blk00000001/sig00000074 ),
    .I2(\blk00000001/sig00000190 ),
    .I3(aclken),
    .I4(NlwRenamedSig_OI_m_axis_result_tdata[2]),
    .O(\blk00000001/sig00000168 )
  );
  LUT5 #(
    .INIT ( 32'h10FF1000 ))
  \blk00000001/blk0000008a  (
    .I0(\blk00000001/sig00000075 ),
    .I1(\blk00000001/sig00000074 ),
    .I2(\blk00000001/sig0000018f ),
    .I3(aclken),
    .I4(NlwRenamedSig_OI_m_axis_result_tdata[0]),
    .O(\blk00000001/sig00000166 )
  );
  LUT5 #(
    .INIT ( 32'h77752220 ))
  \blk00000001/blk00000089  (
    .I0(aclken),
    .I1(\blk00000001/sig00000073 ),
    .I2(\blk00000001/sig000001ae ),
    .I3(\blk00000001/sig00000074 ),
    .I4(NlwRenamedSig_OI_m_axis_result_tdata[30]),
    .O(\blk00000001/sig00000184 )
  );
  LUT5 #(
    .INIT ( 32'h77572202 ))
  \blk00000001/blk00000088  (
    .I0(aclken),
    .I1(\blk00000001/sig00000073 ),
    .I2(\blk00000001/sig000001ad ),
    .I3(\blk00000001/sig00000074 ),
    .I4(NlwRenamedSig_OI_m_axis_result_tdata[23]),
    .O(\blk00000001/sig0000017d )
  );
  LUT5 #(
    .INIT ( 32'h77572202 ))
  \blk00000001/blk00000087  (
    .I0(aclken),
    .I1(\blk00000001/sig00000073 ),
    .I2(\blk00000001/sig000001ac ),
    .I3(\blk00000001/sig00000074 ),
    .I4(NlwRenamedSig_OI_m_axis_result_tdata[28]),
    .O(\blk00000001/sig00000182 )
  );
  LUT5 #(
    .INIT ( 32'h77572202 ))
  \blk00000001/blk00000086  (
    .I0(aclken),
    .I1(\blk00000001/sig00000073 ),
    .I2(\blk00000001/sig000001ab ),
    .I3(\blk00000001/sig00000074 ),
    .I4(NlwRenamedSig_OI_m_axis_result_tdata[27]),
    .O(\blk00000001/sig00000181 )
  );
  LUT5 #(
    .INIT ( 32'h77572202 ))
  \blk00000001/blk00000085  (
    .I0(aclken),
    .I1(\blk00000001/sig00000073 ),
    .I2(\blk00000001/sig000001aa ),
    .I3(\blk00000001/sig00000074 ),
    .I4(NlwRenamedSig_OI_m_axis_result_tdata[29]),
    .O(\blk00000001/sig00000183 )
  );
  LUT5 #(
    .INIT ( 32'h77572202 ))
  \blk00000001/blk00000084  (
    .I0(aclken),
    .I1(\blk00000001/sig00000073 ),
    .I2(\blk00000001/sig000001a9 ),
    .I3(\blk00000001/sig00000074 ),
    .I4(NlwRenamedSig_OI_m_axis_result_tdata[25]),
    .O(\blk00000001/sig0000017f )
  );
  LUT5 #(
    .INIT ( 32'h77572202 ))
  \blk00000001/blk00000083  (
    .I0(aclken),
    .I1(\blk00000001/sig00000073 ),
    .I2(\blk00000001/sig000001a8 ),
    .I3(\blk00000001/sig00000074 ),
    .I4(NlwRenamedSig_OI_m_axis_result_tdata[26]),
    .O(\blk00000001/sig00000180 )
  );
  LUT5 #(
    .INIT ( 32'h77572202 ))
  \blk00000001/blk00000082  (
    .I0(aclken),
    .I1(\blk00000001/sig00000073 ),
    .I2(\blk00000001/sig000001a7 ),
    .I3(\blk00000001/sig00000074 ),
    .I4(NlwRenamedSig_OI_m_axis_result_tdata[24]),
    .O(\blk00000001/sig0000017e )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000081  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig00000083 ),
    .Q(m_axis_result_tdata[31])
  );
  LUT5 #(
    .INIT ( 32'h77752220 ))
  \blk00000001/blk00000080  (
    .I0(aclken),
    .I1(\blk00000001/sig00000075 ),
    .I2(\blk00000001/sig000001a6 ),
    .I3(\blk00000001/sig000001a5 ),
    .I4(NlwRenamedSig_OI_m_axis_result_tdata[22]),
    .O(\blk00000001/sig0000017c )
  );
  LUT4 #(
    .INIT ( 16'hA820 ))
  \blk00000001/blk0000007f  (
    .I0(\blk00000001/sig0000008b ),
    .I1(\blk00000001/sig0000013d ),
    .I2(\blk00000001/sig00000072 ),
    .I3(\blk00000001/sig0000013f ),
    .O(\blk00000001/sig000001a6 )
  );
  LUT6 #(
    .INIT ( 64'h45404540FFFF4540 ))
  \blk00000001/blk0000007e  (
    .I0(\blk00000001/sig0000008b ),
    .I1(\blk00000001/sig00000155 ),
    .I2(\blk00000001/sig0000013d ),
    .I3(\blk00000001/sig00000071 ),
    .I4(\blk00000001/sig00000074 ),
    .I5(\blk00000001/sig00000075 ),
    .O(\blk00000001/sig000001a5 )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \blk00000001/blk0000007d  (
    .I0(\blk00000001/sig0000008b ),
    .I1(\blk00000001/sig0000013d ),
    .I2(\blk00000001/sig00000070 ),
    .I3(\blk00000001/sig00000154 ),
    .I4(\blk00000001/sig00000153 ),
    .I5(\blk00000001/sig0000006f ),
    .O(\blk00000001/sig000001a4 )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \blk00000001/blk0000007c  (
    .I0(\blk00000001/sig0000008b ),
    .I1(\blk00000001/sig0000013d ),
    .I2(\blk00000001/sig0000006f ),
    .I3(\blk00000001/sig00000153 ),
    .I4(\blk00000001/sig00000152 ),
    .I5(\blk00000001/sig0000006e ),
    .O(\blk00000001/sig000001a3 )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \blk00000001/blk0000007b  (
    .I0(\blk00000001/sig0000008b ),
    .I1(\blk00000001/sig0000013d ),
    .I2(\blk00000001/sig00000071 ),
    .I3(\blk00000001/sig00000155 ),
    .I4(\blk00000001/sig00000154 ),
    .I5(\blk00000001/sig00000070 ),
    .O(\blk00000001/sig000001a2 )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \blk00000001/blk0000007a  (
    .I0(\blk00000001/sig0000008b ),
    .I1(\blk00000001/sig0000013d ),
    .I2(\blk00000001/sig0000006c ),
    .I3(\blk00000001/sig00000150 ),
    .I4(\blk00000001/sig0000014f ),
    .I5(\blk00000001/sig0000006b ),
    .O(\blk00000001/sig000001a1 )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \blk00000001/blk00000079  (
    .I0(\blk00000001/sig0000008b ),
    .I1(\blk00000001/sig0000013d ),
    .I2(\blk00000001/sig0000006e ),
    .I3(\blk00000001/sig00000152 ),
    .I4(\blk00000001/sig00000151 ),
    .I5(\blk00000001/sig0000006d ),
    .O(\blk00000001/sig000001a0 )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \blk00000001/blk00000078  (
    .I0(\blk00000001/sig0000008b ),
    .I1(\blk00000001/sig0000013d ),
    .I2(\blk00000001/sig0000006b ),
    .I3(\blk00000001/sig0000014f ),
    .I4(\blk00000001/sig0000014e ),
    .I5(\blk00000001/sig0000006a ),
    .O(\blk00000001/sig0000019f )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \blk00000001/blk00000077  (
    .I0(\blk00000001/sig0000008b ),
    .I1(\blk00000001/sig0000013d ),
    .I2(\blk00000001/sig0000006d ),
    .I3(\blk00000001/sig00000151 ),
    .I4(\blk00000001/sig00000150 ),
    .I5(\blk00000001/sig0000006c ),
    .O(\blk00000001/sig0000019e )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \blk00000001/blk00000076  (
    .I0(\blk00000001/sig0000008b ),
    .I1(\blk00000001/sig0000013d ),
    .I2(\blk00000001/sig00000069 ),
    .I3(\blk00000001/sig0000014d ),
    .I4(\blk00000001/sig0000014c ),
    .I5(\blk00000001/sig00000068 ),
    .O(\blk00000001/sig0000019d )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \blk00000001/blk00000075  (
    .I0(\blk00000001/sig0000008b ),
    .I1(\blk00000001/sig0000013d ),
    .I2(\blk00000001/sig0000006a ),
    .I3(\blk00000001/sig0000014e ),
    .I4(\blk00000001/sig0000014d ),
    .I5(\blk00000001/sig00000069 ),
    .O(\blk00000001/sig0000019c )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \blk00000001/blk00000074  (
    .I0(\blk00000001/sig0000008b ),
    .I1(\blk00000001/sig0000013d ),
    .I2(\blk00000001/sig00000066 ),
    .I3(\blk00000001/sig0000014a ),
    .I4(\blk00000001/sig00000149 ),
    .I5(\blk00000001/sig00000065 ),
    .O(\blk00000001/sig0000019b )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \blk00000001/blk00000073  (
    .I0(\blk00000001/sig0000008b ),
    .I1(\blk00000001/sig0000013d ),
    .I2(\blk00000001/sig00000063 ),
    .I3(\blk00000001/sig00000147 ),
    .I4(\blk00000001/sig00000146 ),
    .I5(\blk00000001/sig00000062 ),
    .O(\blk00000001/sig0000019a )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \blk00000001/blk00000072  (
    .I0(\blk00000001/sig0000008b ),
    .I1(\blk00000001/sig0000013d ),
    .I2(\blk00000001/sig00000068 ),
    .I3(\blk00000001/sig0000014c ),
    .I4(\blk00000001/sig0000014b ),
    .I5(\blk00000001/sig00000067 ),
    .O(\blk00000001/sig00000199 )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \blk00000001/blk00000071  (
    .I0(\blk00000001/sig0000008b ),
    .I1(\blk00000001/sig0000013d ),
    .I2(\blk00000001/sig00000067 ),
    .I3(\blk00000001/sig0000014b ),
    .I4(\blk00000001/sig0000014a ),
    .I5(\blk00000001/sig00000066 ),
    .O(\blk00000001/sig00000198 )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \blk00000001/blk00000070  (
    .I0(\blk00000001/sig0000008b ),
    .I1(\blk00000001/sig0000013d ),
    .I2(\blk00000001/sig00000065 ),
    .I3(\blk00000001/sig00000149 ),
    .I4(\blk00000001/sig00000148 ),
    .I5(\blk00000001/sig00000064 ),
    .O(\blk00000001/sig00000197 )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \blk00000001/blk0000006f  (
    .I0(\blk00000001/sig0000008b ),
    .I1(\blk00000001/sig0000013d ),
    .I2(\blk00000001/sig00000064 ),
    .I3(\blk00000001/sig00000148 ),
    .I4(\blk00000001/sig00000147 ),
    .I5(\blk00000001/sig00000063 ),
    .O(\blk00000001/sig00000196 )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \blk00000001/blk0000006e  (
    .I0(\blk00000001/sig0000008b ),
    .I1(\blk00000001/sig0000013d ),
    .I2(\blk00000001/sig00000061 ),
    .I3(\blk00000001/sig00000145 ),
    .I4(\blk00000001/sig00000144 ),
    .I5(\blk00000001/sig00000060 ),
    .O(\blk00000001/sig00000195 )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \blk00000001/blk0000006d  (
    .I0(\blk00000001/sig0000008b ),
    .I1(\blk00000001/sig0000013d ),
    .I2(\blk00000001/sig00000060 ),
    .I3(\blk00000001/sig00000144 ),
    .I4(\blk00000001/sig00000143 ),
    .I5(\blk00000001/sig0000005f ),
    .O(\blk00000001/sig00000194 )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \blk00000001/blk0000006c  (
    .I0(\blk00000001/sig0000008b ),
    .I1(\blk00000001/sig0000013d ),
    .I2(\blk00000001/sig00000062 ),
    .I3(\blk00000001/sig00000146 ),
    .I4(\blk00000001/sig00000145 ),
    .I5(\blk00000001/sig00000061 ),
    .O(\blk00000001/sig00000193 )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \blk00000001/blk0000006b  (
    .I0(\blk00000001/sig0000008b ),
    .I1(\blk00000001/sig0000013d ),
    .I2(\blk00000001/sig0000005d ),
    .I3(\blk00000001/sig00000141 ),
    .I4(\blk00000001/sig00000140 ),
    .I5(\blk00000001/sig0000005c ),
    .O(\blk00000001/sig00000192 )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \blk00000001/blk0000006a  (
    .I0(\blk00000001/sig0000008b ),
    .I1(\blk00000001/sig0000013d ),
    .I2(\blk00000001/sig0000005f ),
    .I3(\blk00000001/sig00000143 ),
    .I4(\blk00000001/sig00000142 ),
    .I5(\blk00000001/sig0000005e ),
    .O(\blk00000001/sig00000191 )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \blk00000001/blk00000069  (
    .I0(\blk00000001/sig0000008b ),
    .I1(\blk00000001/sig0000013d ),
    .I2(\blk00000001/sig0000005e ),
    .I3(\blk00000001/sig00000142 ),
    .I4(\blk00000001/sig00000141 ),
    .I5(\blk00000001/sig0000005d ),
    .O(\blk00000001/sig00000190 )
  );
  LUT5 #(
    .INIT ( 32'hBB33A820 ))
  \blk00000001/blk00000068  (
    .I0(\blk00000001/sig0000008b ),
    .I1(\blk00000001/sig0000013d ),
    .I2(\blk00000001/sig0000005c ),
    .I3(\blk00000001/sig00000140 ),
    .I4(\blk00000001/sig0000018e ),
    .O(\blk00000001/sig0000018f )
  );
  LUT6 #(
    .INIT ( 64'h8000000000000000 ))
  \blk00000001/blk00000067  (
    .I0(s_axis_a_tdata[30]),
    .I1(s_axis_a_tdata[29]),
    .I2(s_axis_a_tdata[28]),
    .I3(s_axis_a_tdata[27]),
    .I4(s_axis_a_tdata[26]),
    .I5(\blk00000001/sig0000018d ),
    .O(\blk00000001/sig000000b6 )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \blk00000001/blk00000066  (
    .I0(s_axis_a_tdata[25]),
    .I1(s_axis_a_tdata[24]),
    .I2(s_axis_a_tdata[23]),
    .O(\blk00000001/sig0000018d )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \blk00000001/blk00000065  (
    .I0(s_axis_a_tdata[30]),
    .I1(s_axis_a_tdata[29]),
    .I2(s_axis_a_tdata[28]),
    .I3(s_axis_a_tdata[27]),
    .I4(s_axis_a_tdata[26]),
    .I5(\blk00000001/sig0000018c ),
    .O(\blk00000001/sig000000b5 )
  );
  LUT3 #(
    .INIT ( 8'hFE ))
  \blk00000001/blk00000064  (
    .I0(s_axis_a_tdata[25]),
    .I1(s_axis_a_tdata[24]),
    .I2(s_axis_a_tdata[23]),
    .O(\blk00000001/sig0000018c )
  );
  LUT6 #(
    .INIT ( 64'h8000000000000000 ))
  \blk00000001/blk00000063  (
    .I0(s_axis_b_tdata[30]),
    .I1(s_axis_b_tdata[29]),
    .I2(s_axis_b_tdata[28]),
    .I3(s_axis_b_tdata[27]),
    .I4(s_axis_b_tdata[26]),
    .I5(\blk00000001/sig0000018b ),
    .O(\blk00000001/sig000000b4 )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \blk00000001/blk00000062  (
    .I0(s_axis_b_tdata[25]),
    .I1(s_axis_b_tdata[24]),
    .I2(s_axis_b_tdata[23]),
    .O(\blk00000001/sig0000018b )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \blk00000001/blk00000061  (
    .I0(s_axis_b_tdata[30]),
    .I1(s_axis_b_tdata[29]),
    .I2(s_axis_b_tdata[28]),
    .I3(s_axis_b_tdata[27]),
    .I4(s_axis_b_tdata[26]),
    .I5(\blk00000001/sig0000018a ),
    .O(\blk00000001/sig000000b3 )
  );
  LUT3 #(
    .INIT ( 8'hFE ))
  \blk00000001/blk00000060  (
    .I0(s_axis_b_tdata[25]),
    .I1(s_axis_b_tdata[24]),
    .I2(s_axis_b_tdata[23]),
    .O(\blk00000001/sig0000018a )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000004 ))
  \blk00000001/blk0000005f  (
    .I0(\blk00000001/sig0000008a ),
    .I1(\blk00000001/sig000000a4 ),
    .I2(\blk00000001/sig000000a5 ),
    .I3(\blk00000001/sig000000a7 ),
    .I4(\blk00000001/sig000000a9 ),
    .I5(\blk00000001/sig00000189 ),
    .O(\blk00000001/sig00000080 )
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  \blk00000001/blk0000005e  (
    .I0(\blk00000001/sig000000ab ),
    .I1(\blk00000001/sig000000ad ),
    .I2(\blk00000001/sig000000af ),
    .I3(\blk00000001/sig000000b1 ),
    .O(\blk00000001/sig00000189 )
  );
  LUT6 #(
    .INIT ( 64'h4040404040404440 ))
  \blk00000001/blk0000005d  (
    .I0(\blk00000001/sig00000074 ),
    .I1(\blk00000001/sig00000075 ),
    .I2(\blk00000001/sig00000188 ),
    .I3(\blk00000001/sig0000008b ),
    .I4(\blk00000001/sig0000007e ),
    .I5(\blk00000001/sig0000007f ),
    .O(\blk00000001/sig00000073 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF55515540 ))
  \blk00000001/blk0000005c  (
    .I0(\blk00000001/sig00000081 ),
    .I1(\blk00000001/sig0000008b ),
    .I2(\blk00000001/sig00000084 ),
    .I3(\blk00000001/sig00000187 ),
    .I4(\blk00000001/sig00000080 ),
    .I5(\blk00000001/sig00000082 ),
    .O(\blk00000001/sig00000075 )
  );
  LUT6 #(
    .INIT ( 64'h0000000020000000 ))
  \blk00000001/blk0000005b  (
    .I0(\blk00000001/sig0000008a ),
    .I1(\blk00000001/sig000000a4 ),
    .I2(\blk00000001/sig000000a5 ),
    .I3(\blk00000001/sig000000a7 ),
    .I4(\blk00000001/sig000000a9 ),
    .I5(\blk00000001/sig00000186 ),
    .O(\blk00000001/sig00000084 )
  );
  LUT4 #(
    .INIT ( 16'hF7FF ))
  \blk00000001/blk0000005a  (
    .I0(\blk00000001/sig000000ab ),
    .I1(\blk00000001/sig000000ad ),
    .I2(\blk00000001/sig000000b1 ),
    .I3(\blk00000001/sig000000af ),
    .O(\blk00000001/sig00000186 )
  );
  LUT6 #(
    .INIT ( 64'hAAAAAAAA80000000 ))
  \blk00000001/blk00000059  (
    .I0(\blk00000001/sig0000008a ),
    .I1(\blk00000001/sig000000a5 ),
    .I2(\blk00000001/sig000000a7 ),
    .I3(\blk00000001/sig000000a9 ),
    .I4(\blk00000001/sig00000185 ),
    .I5(\blk00000001/sig000000a4 ),
    .O(\blk00000001/sig0000007f )
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \blk00000001/blk00000058  (
    .I0(\blk00000001/sig000000ab ),
    .I1(\blk00000001/sig000000ad ),
    .I2(\blk00000001/sig000000af ),
    .I3(\blk00000001/sig000000b1 ),
    .O(\blk00000001/sig00000185 )
  );
  LUT4 #(
    .INIT ( 16'hFF80 ))
  \blk00000001/blk00000057  (
    .I0(\blk00000001/sig0000015e ),
    .I1(\blk00000001/sig0000005b ),
    .I2(\blk00000001/sig0000005a ),
    .I3(\blk00000001/sig0000008b ),
    .O(\blk00000001/sig00000027 )
  );
  LUT5 #(
    .INIT ( 32'h00000001 ))
  \blk00000001/blk00000056  (
    .I0(s_axis_b_tdata[18]),
    .I1(s_axis_b_tdata[19]),
    .I2(s_axis_b_tdata[20]),
    .I3(s_axis_b_tdata[21]),
    .I4(s_axis_b_tdata[22]),
    .O(\blk00000001/sig000000be )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \blk00000001/blk00000055  (
    .I0(s_axis_b_tdata[0]),
    .I1(s_axis_b_tdata[1]),
    .I2(s_axis_b_tdata[2]),
    .I3(s_axis_b_tdata[3]),
    .I4(s_axis_b_tdata[4]),
    .I5(s_axis_b_tdata[5]),
    .O(\blk00000001/sig000000bd )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \blk00000001/blk00000054  (
    .I0(s_axis_b_tdata[6]),
    .I1(s_axis_b_tdata[7]),
    .I2(s_axis_b_tdata[8]),
    .I3(s_axis_b_tdata[9]),
    .I4(s_axis_b_tdata[10]),
    .I5(s_axis_b_tdata[11]),
    .O(\blk00000001/sig000000bc )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \blk00000001/blk00000053  (
    .I0(s_axis_b_tdata[12]),
    .I1(s_axis_b_tdata[13]),
    .I2(s_axis_b_tdata[14]),
    .I3(s_axis_b_tdata[15]),
    .I4(s_axis_b_tdata[16]),
    .I5(s_axis_b_tdata[17]),
    .O(\blk00000001/sig000000bb )
  );
  LUT5 #(
    .INIT ( 32'h00000001 ))
  \blk00000001/blk00000052  (
    .I0(s_axis_a_tdata[18]),
    .I1(s_axis_a_tdata[19]),
    .I2(s_axis_a_tdata[20]),
    .I3(s_axis_a_tdata[21]),
    .I4(s_axis_a_tdata[22]),
    .O(\blk00000001/sig000000ba )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \blk00000001/blk00000051  (
    .I0(s_axis_a_tdata[0]),
    .I1(s_axis_a_tdata[1]),
    .I2(s_axis_a_tdata[2]),
    .I3(s_axis_a_tdata[3]),
    .I4(s_axis_a_tdata[4]),
    .I5(s_axis_a_tdata[5]),
    .O(\blk00000001/sig000000b9 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \blk00000001/blk00000050  (
    .I0(s_axis_a_tdata[6]),
    .I1(s_axis_a_tdata[7]),
    .I2(s_axis_a_tdata[8]),
    .I3(s_axis_a_tdata[9]),
    .I4(s_axis_a_tdata[10]),
    .I5(s_axis_a_tdata[11]),
    .O(\blk00000001/sig000000b8 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \blk00000001/blk0000004f  (
    .I0(s_axis_a_tdata[12]),
    .I1(s_axis_a_tdata[13]),
    .I2(s_axis_a_tdata[14]),
    .I3(s_axis_a_tdata[15]),
    .I4(s_axis_a_tdata[16]),
    .I5(s_axis_a_tdata[17]),
    .O(\blk00000001/sig000000b7 )
  );
  LUT2 #(
    .INIT ( 4'h1 ))
  \blk00000001/blk0000004e  (
    .I0(\blk00000001/sig0000008a ),
    .I1(\blk00000001/sig000000a4 ),
    .O(\blk00000001/sig0000007e )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \blk00000001/blk0000004d  (
    .I0(\blk00000001/sig000000b6 ),
    .I1(\blk00000001/sig00000089 ),
    .I2(\blk00000001/sig000000b4 ),
    .I3(\blk00000001/sig00000088 ),
    .O(\blk00000001/sig00000085 )
  );
  LUT4 #(
    .INIT ( 16'h22F2 ))
  \blk00000001/blk0000004c  (
    .I0(\blk00000001/sig000000b6 ),
    .I1(\blk00000001/sig00000089 ),
    .I2(\blk00000001/sig000000b4 ),
    .I3(\blk00000001/sig00000088 ),
    .O(\blk00000001/sig00000087 )
  );
  LUT6 #(
    .INIT ( 64'hFF80808080808080 ))
  \blk00000001/blk0000004b  (
    .I0(\blk00000001/sig000000b3 ),
    .I1(\blk00000001/sig000000b6 ),
    .I2(\blk00000001/sig00000089 ),
    .I3(\blk00000001/sig000000b5 ),
    .I4(\blk00000001/sig000000b4 ),
    .I5(\blk00000001/sig00000088 ),
    .O(\blk00000001/sig00000086 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000004a  (
    .I0(s_axis_a_tdata[30]),
    .I1(s_axis_b_tdata[30]),
    .O(\blk00000001/sig0000007d )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000049  (
    .I0(s_axis_a_tdata[29]),
    .I1(s_axis_b_tdata[29]),
    .O(\blk00000001/sig0000007c )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000048  (
    .I0(s_axis_a_tdata[28]),
    .I1(s_axis_b_tdata[28]),
    .O(\blk00000001/sig0000007b )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000047  (
    .I0(s_axis_a_tdata[27]),
    .I1(s_axis_b_tdata[27]),
    .O(\blk00000001/sig0000007a )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000046  (
    .I0(s_axis_a_tdata[26]),
    .I1(s_axis_b_tdata[26]),
    .O(\blk00000001/sig00000079 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000045  (
    .I0(s_axis_a_tdata[25]),
    .I1(s_axis_b_tdata[25]),
    .O(\blk00000001/sig00000078 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000044  (
    .I0(s_axis_a_tdata[24]),
    .I1(s_axis_b_tdata[24]),
    .O(\blk00000001/sig00000077 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000043  (
    .I0(s_axis_a_tdata[23]),
    .I1(s_axis_b_tdata[23]),
    .O(\blk00000001/sig00000076 )
  );
  LUT4 #(
    .INIT ( 16'h0110 ))
  \blk00000001/blk00000042  (
    .I0(\blk00000001/sig00000087 ),
    .I1(\blk00000001/sig00000086 ),
    .I2(s_axis_a_tdata[31]),
    .I3(s_axis_b_tdata[31]),
    .O(\blk00000001/sig00000083 )
  );
  LUT5 #(
    .INIT ( 32'h11111110 ))
  \blk00000001/blk00000041  (
    .I0(\blk00000001/sig00000087 ),
    .I1(\blk00000001/sig00000086 ),
    .I2(\blk00000001/sig00000085 ),
    .I3(\blk00000001/sig000000b5 ),
    .I4(\blk00000001/sig000000b3 ),
    .O(\blk00000001/sig00000082 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF11101010 ))
  \blk00000001/blk00000040  (
    .I0(\blk00000001/sig0000007e ),
    .I1(\blk00000001/sig00000082 ),
    .I2(\blk00000001/sig0000007f ),
    .I3(\blk00000001/sig00000084 ),
    .I4(\blk00000001/sig0000008b ),
    .I5(\blk00000001/sig00000081 ),
    .O(\blk00000001/sig00000074 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \blk00000001/blk0000003f  (
    .I0(s_axis_a_tvalid),
    .I1(s_axis_b_tvalid),
    .O(\blk00000001/sig00000026 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000003e  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig00000026 ),
    .Q(m_axis_result_tvalid)
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000003d  (
    .C(aclk),
    .D(\blk00000001/sig0000017d ),
    .Q(NlwRenamedSig_OI_m_axis_result_tdata[23])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000003c  (
    .C(aclk),
    .D(\blk00000001/sig0000017e ),
    .Q(NlwRenamedSig_OI_m_axis_result_tdata[24])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000003b  (
    .C(aclk),
    .D(\blk00000001/sig0000017f ),
    .Q(NlwRenamedSig_OI_m_axis_result_tdata[25])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000003a  (
    .C(aclk),
    .D(\blk00000001/sig00000180 ),
    .Q(NlwRenamedSig_OI_m_axis_result_tdata[26])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000039  (
    .C(aclk),
    .D(\blk00000001/sig00000181 ),
    .Q(NlwRenamedSig_OI_m_axis_result_tdata[27])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000038  (
    .C(aclk),
    .D(\blk00000001/sig00000182 ),
    .Q(NlwRenamedSig_OI_m_axis_result_tdata[28])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000037  (
    .C(aclk),
    .D(\blk00000001/sig00000183 ),
    .Q(NlwRenamedSig_OI_m_axis_result_tdata[29])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000036  (
    .C(aclk),
    .D(\blk00000001/sig00000184 ),
    .Q(NlwRenamedSig_OI_m_axis_result_tdata[30])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000035  (
    .C(aclk),
    .D(\blk00000001/sig00000166 ),
    .Q(NlwRenamedSig_OI_m_axis_result_tdata[0])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000034  (
    .C(aclk),
    .D(\blk00000001/sig00000167 ),
    .Q(NlwRenamedSig_OI_m_axis_result_tdata[1])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000033  (
    .C(aclk),
    .D(\blk00000001/sig00000168 ),
    .Q(NlwRenamedSig_OI_m_axis_result_tdata[2])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000032  (
    .C(aclk),
    .D(\blk00000001/sig00000169 ),
    .Q(NlwRenamedSig_OI_m_axis_result_tdata[3])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000031  (
    .C(aclk),
    .D(\blk00000001/sig0000016a ),
    .Q(NlwRenamedSig_OI_m_axis_result_tdata[4])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000030  (
    .C(aclk),
    .D(\blk00000001/sig0000016b ),
    .Q(NlwRenamedSig_OI_m_axis_result_tdata[5])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000002f  (
    .C(aclk),
    .D(\blk00000001/sig0000016c ),
    .Q(NlwRenamedSig_OI_m_axis_result_tdata[6])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000002e  (
    .C(aclk),
    .D(\blk00000001/sig0000016d ),
    .Q(NlwRenamedSig_OI_m_axis_result_tdata[7])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000002d  (
    .C(aclk),
    .D(\blk00000001/sig0000016e ),
    .Q(NlwRenamedSig_OI_m_axis_result_tdata[8])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000002c  (
    .C(aclk),
    .D(\blk00000001/sig0000016f ),
    .Q(NlwRenamedSig_OI_m_axis_result_tdata[9])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000002b  (
    .C(aclk),
    .D(\blk00000001/sig00000170 ),
    .Q(NlwRenamedSig_OI_m_axis_result_tdata[10])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000002a  (
    .C(aclk),
    .D(\blk00000001/sig00000171 ),
    .Q(NlwRenamedSig_OI_m_axis_result_tdata[11])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000029  (
    .C(aclk),
    .D(\blk00000001/sig00000172 ),
    .Q(NlwRenamedSig_OI_m_axis_result_tdata[12])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000028  (
    .C(aclk),
    .D(\blk00000001/sig00000173 ),
    .Q(NlwRenamedSig_OI_m_axis_result_tdata[13])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000027  (
    .C(aclk),
    .D(\blk00000001/sig00000174 ),
    .Q(NlwRenamedSig_OI_m_axis_result_tdata[14])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000026  (
    .C(aclk),
    .D(\blk00000001/sig00000175 ),
    .Q(NlwRenamedSig_OI_m_axis_result_tdata[15])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000025  (
    .C(aclk),
    .D(\blk00000001/sig00000176 ),
    .Q(NlwRenamedSig_OI_m_axis_result_tdata[16])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000024  (
    .C(aclk),
    .D(\blk00000001/sig00000177 ),
    .Q(NlwRenamedSig_OI_m_axis_result_tdata[17])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000023  (
    .C(aclk),
    .D(\blk00000001/sig00000178 ),
    .Q(NlwRenamedSig_OI_m_axis_result_tdata[18])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000022  (
    .C(aclk),
    .D(\blk00000001/sig00000179 ),
    .Q(NlwRenamedSig_OI_m_axis_result_tdata[19])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000021  (
    .C(aclk),
    .D(\blk00000001/sig0000017a ),
    .Q(NlwRenamedSig_OI_m_axis_result_tdata[20])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000020  (
    .C(aclk),
    .D(\blk00000001/sig0000017b ),
    .Q(NlwRenamedSig_OI_m_axis_result_tdata[21])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000001f  (
    .C(aclk),
    .D(\blk00000001/sig0000017c ),
    .Q(NlwRenamedSig_OI_m_axis_result_tdata[22])
  );
  DSP48E1 #(
    .ACASCREG ( 0 ),
    .ADREG ( 0 ),
    .ALUMODEREG ( 0 ),
    .AREG ( 0 ),
    .AUTORESET_PATDET ( "NO_RESET" ),
    .A_INPUT ( "DIRECT" ),
    .BCASCREG ( 0 ),
    .BREG ( 0 ),
    .B_INPUT ( "DIRECT" ),
    .CARRYINREG ( 0 ),
    .CARRYINSELREG ( 0 ),
    .CREG ( 0 ),
    .DREG ( 0 ),
    .INMODEREG ( 0 ),
    .MASK ( 48'h3FFFFFFFFFFF ),
    .MREG ( 0 ),
    .OPMODEREG ( 0 ),
    .PATTERN ( 48'h000000000000 ),
    .PREG ( 0 ),
    .SEL_MASK ( "MASK" ),
    .SEL_PATTERN ( "PATTERN" ),
    .USE_DPORT ( "FALSE" ),
    .USE_MULT ( "NONE" ),
    .USE_PATTERN_DETECT ( "NO_PATDET" ),
    .USE_SIMD ( "ONE48" ))
  \blk00000001/blk0000001e  (
    .PATTERNBDETECT(\NLW_blk00000001/blk0000001e_PATTERNBDETECT_UNCONNECTED ),
    .RSTC(\blk00000001/sig0000013c ),
    .CEB1(\blk00000001/sig0000013c ),
    .CEAD(\blk00000001/sig0000013c ),
    .MULTSIGNOUT(\NLW_blk00000001/blk0000001e_MULTSIGNOUT_UNCONNECTED ),
    .CEC(\blk00000001/sig0000013c ),
    .RSTM(\blk00000001/sig0000013c ),
    .MULTSIGNIN(\blk00000001/sig0000013c ),
    .CEB2(\blk00000001/sig0000013c ),
    .RSTCTRL(\blk00000001/sig0000013c ),
    .CEP(\blk00000001/sig0000013c ),
    .CARRYCASCOUT(\NLW_blk00000001/blk0000001e_CARRYCASCOUT_UNCONNECTED ),
    .RSTA(\blk00000001/sig0000013c ),
    .CECARRYIN(\blk00000001/sig0000013c ),
    .UNDERFLOW(\NLW_blk00000001/blk0000001e_UNDERFLOW_UNCONNECTED ),
    .PATTERNDETECT(\NLW_blk00000001/blk0000001e_PATTERNDETECT_UNCONNECTED ),
    .RSTALUMODE(\blk00000001/sig0000013c ),
    .RSTALLCARRYIN(\blk00000001/sig0000013c ),
    .CED(\blk00000001/sig0000013c ),
    .RSTD(\blk00000001/sig0000013c ),
    .CEALUMODE(\blk00000001/sig0000013c ),
    .CEA2(\blk00000001/sig0000013c ),
    .CLK(aclk),
    .CEA1(\blk00000001/sig0000013c ),
    .RSTB(\blk00000001/sig0000013c ),
    .OVERFLOW(\NLW_blk00000001/blk0000001e_OVERFLOW_UNCONNECTED ),
    .CECTRL(\blk00000001/sig0000013c ),
    .CEM(\blk00000001/sig0000013c ),
    .CARRYIN(\blk00000001/sig0000013c ),
    .CARRYCASCIN(\blk00000001/sig0000013c ),
    .RSTINMODE(\blk00000001/sig0000013c ),
    .CEINMODE(\blk00000001/sig0000013c ),
    .RSTP(\blk00000001/sig0000013c ),
    .ACOUT({\NLW_blk00000001/blk0000001e_ACOUT<29>_UNCONNECTED , \NLW_blk00000001/blk0000001e_ACOUT<28>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_ACOUT<27>_UNCONNECTED , \NLW_blk00000001/blk0000001e_ACOUT<26>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_ACOUT<25>_UNCONNECTED , \NLW_blk00000001/blk0000001e_ACOUT<24>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_ACOUT<23>_UNCONNECTED , \NLW_blk00000001/blk0000001e_ACOUT<22>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_ACOUT<21>_UNCONNECTED , \NLW_blk00000001/blk0000001e_ACOUT<20>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_ACOUT<19>_UNCONNECTED , \NLW_blk00000001/blk0000001e_ACOUT<18>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_ACOUT<17>_UNCONNECTED , \NLW_blk00000001/blk0000001e_ACOUT<16>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_ACOUT<15>_UNCONNECTED , \NLW_blk00000001/blk0000001e_ACOUT<14>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_ACOUT<13>_UNCONNECTED , \NLW_blk00000001/blk0000001e_ACOUT<12>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_ACOUT<11>_UNCONNECTED , \NLW_blk00000001/blk0000001e_ACOUT<10>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_ACOUT<9>_UNCONNECTED , \NLW_blk00000001/blk0000001e_ACOUT<8>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_ACOUT<7>_UNCONNECTED , \NLW_blk00000001/blk0000001e_ACOUT<6>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_ACOUT<5>_UNCONNECTED , \NLW_blk00000001/blk0000001e_ACOUT<4>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_ACOUT<3>_UNCONNECTED , \NLW_blk00000001/blk0000001e_ACOUT<2>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_ACOUT<1>_UNCONNECTED , \NLW_blk00000001/blk0000001e_ACOUT<0>_UNCONNECTED }),
    .OPMODE({\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig00000113 , \blk00000001/sig00000113 , \blk00000001/sig00000113 , 
\blk00000001/sig00000113 , \blk00000001/sig00000113 }),
    .PCIN({\blk00000001/sig00000059 , \blk00000001/sig00000058 , \blk00000001/sig00000057 , \blk00000001/sig00000056 , \blk00000001/sig00000055 , 
\blk00000001/sig00000054 , \blk00000001/sig00000053 , \blk00000001/sig00000052 , \blk00000001/sig00000051 , \blk00000001/sig00000050 , 
\blk00000001/sig0000004f , \blk00000001/sig0000004e , \blk00000001/sig0000004d , \blk00000001/sig0000004c , \blk00000001/sig0000004b , 
\blk00000001/sig0000004a , \blk00000001/sig00000049 , \blk00000001/sig00000048 , \blk00000001/sig00000047 , \blk00000001/sig00000046 , 
\blk00000001/sig00000045 , \blk00000001/sig00000044 , \blk00000001/sig00000043 , \blk00000001/sig00000042 , \blk00000001/sig00000041 , 
\blk00000001/sig00000040 , \blk00000001/sig0000003f , \blk00000001/sig0000003e , \blk00000001/sig0000003d , \blk00000001/sig0000003c , 
\blk00000001/sig0000003b , \blk00000001/sig0000003a , \blk00000001/sig00000039 , \blk00000001/sig00000038 , \blk00000001/sig00000037 , 
\blk00000001/sig00000036 , \blk00000001/sig00000035 , \blk00000001/sig00000034 , \blk00000001/sig00000033 , \blk00000001/sig00000032 , 
\blk00000001/sig00000031 , \blk00000001/sig00000030 , \blk00000001/sig0000002f , \blk00000001/sig0000002e , \blk00000001/sig0000002d , 
\blk00000001/sig0000002c , \blk00000001/sig0000002b , \blk00000001/sig0000002a }),
    .ALUMODE({\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c }),
    .C({\blk00000001/sig000000a5 , \blk00000001/sig000000a7 , \blk00000001/sig000000a9 , \blk00000001/sig000000ab , \blk00000001/sig000000ad , 
\blk00000001/sig000000af , \blk00000001/sig000000b1 , \blk00000001/sig0000013c , \blk00000001/sig000000a4 , \blk00000001/sig000000a5 , 
\blk00000001/sig000000a7 , \blk00000001/sig000000a9 , \blk00000001/sig000000ab , \blk00000001/sig000000ad , \blk00000001/sig000000af , 
\blk00000001/sig000000b1 , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig00000113 , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c }),
    .CARRYOUT({\blk00000001/sig0000013e , \NLW_blk00000001/blk0000001e_CARRYOUT<2>_UNCONNECTED , \NLW_blk00000001/blk0000001e_CARRYOUT<1>_UNCONNECTED 
, \NLW_blk00000001/blk0000001e_CARRYOUT<0>_UNCONNECTED }),
    .INMODE({\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c }),
    .BCIN({\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c }),
    .B({\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c }),
    .BCOUT({\NLW_blk00000001/blk0000001e_BCOUT<17>_UNCONNECTED , \NLW_blk00000001/blk0000001e_BCOUT<16>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_BCOUT<15>_UNCONNECTED , \NLW_blk00000001/blk0000001e_BCOUT<14>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_BCOUT<13>_UNCONNECTED , \NLW_blk00000001/blk0000001e_BCOUT<12>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_BCOUT<11>_UNCONNECTED , \NLW_blk00000001/blk0000001e_BCOUT<10>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_BCOUT<9>_UNCONNECTED , \NLW_blk00000001/blk0000001e_BCOUT<8>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_BCOUT<7>_UNCONNECTED , \NLW_blk00000001/blk0000001e_BCOUT<6>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_BCOUT<5>_UNCONNECTED , \NLW_blk00000001/blk0000001e_BCOUT<4>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_BCOUT<3>_UNCONNECTED , \NLW_blk00000001/blk0000001e_BCOUT<2>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_BCOUT<1>_UNCONNECTED , \NLW_blk00000001/blk0000001e_BCOUT<0>_UNCONNECTED }),
    .D({\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c }),
    .P({\blk00000001/sig00000165 , \blk00000001/sig00000164 , \blk00000001/sig00000163 , \blk00000001/sig00000162 , \blk00000001/sig00000161 , 
\blk00000001/sig00000160 , \blk00000001/sig0000015f , \NLW_blk00000001/blk0000001e_P<40>_UNCONNECTED , \blk00000001/sig0000015d , 
\blk00000001/sig0000015c , \blk00000001/sig0000015b , \blk00000001/sig0000015a , \blk00000001/sig00000159 , \blk00000001/sig00000158 , 
\blk00000001/sig00000157 , \blk00000001/sig00000156 , \NLW_blk00000001/blk0000001e_P<31>_UNCONNECTED , \blk00000001/sig0000015e , 
\blk00000001/sig0000013f , \blk00000001/sig00000155 , \blk00000001/sig00000154 , \blk00000001/sig00000153 , \blk00000001/sig00000152 , 
\blk00000001/sig00000151 , \blk00000001/sig00000150 , \blk00000001/sig0000014f , \blk00000001/sig0000014e , \blk00000001/sig0000014d , 
\blk00000001/sig0000014c , \blk00000001/sig0000014b , \blk00000001/sig0000014a , \blk00000001/sig00000149 , \blk00000001/sig00000148 , 
\blk00000001/sig00000147 , \blk00000001/sig00000146 , \blk00000001/sig00000145 , \blk00000001/sig00000144 , \blk00000001/sig00000143 , 
\blk00000001/sig00000142 , \blk00000001/sig00000141 , \blk00000001/sig00000140 , \NLW_blk00000001/blk0000001e_P<6>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_P<5>_UNCONNECTED , \NLW_blk00000001/blk0000001e_P<4>_UNCONNECTED , \NLW_blk00000001/blk0000001e_P<3>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_P<2>_UNCONNECTED , \NLW_blk00000001/blk0000001e_P<1>_UNCONNECTED , \NLW_blk00000001/blk0000001e_P<0>_UNCONNECTED }),
    .A({\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig00000113 , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig00000113 , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c }),
    .PCOUT({\NLW_blk00000001/blk0000001e_PCOUT<47>_UNCONNECTED , \NLW_blk00000001/blk0000001e_PCOUT<46>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_PCOUT<45>_UNCONNECTED , \NLW_blk00000001/blk0000001e_PCOUT<44>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_PCOUT<43>_UNCONNECTED , \NLW_blk00000001/blk0000001e_PCOUT<42>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_PCOUT<41>_UNCONNECTED , \NLW_blk00000001/blk0000001e_PCOUT<40>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_PCOUT<39>_UNCONNECTED , \NLW_blk00000001/blk0000001e_PCOUT<38>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_PCOUT<37>_UNCONNECTED , \NLW_blk00000001/blk0000001e_PCOUT<36>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_PCOUT<35>_UNCONNECTED , \NLW_blk00000001/blk0000001e_PCOUT<34>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_PCOUT<33>_UNCONNECTED , \NLW_blk00000001/blk0000001e_PCOUT<32>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_PCOUT<31>_UNCONNECTED , \NLW_blk00000001/blk0000001e_PCOUT<30>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_PCOUT<29>_UNCONNECTED , \NLW_blk00000001/blk0000001e_PCOUT<28>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_PCOUT<27>_UNCONNECTED , \NLW_blk00000001/blk0000001e_PCOUT<26>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_PCOUT<25>_UNCONNECTED , \NLW_blk00000001/blk0000001e_PCOUT<24>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_PCOUT<23>_UNCONNECTED , \NLW_blk00000001/blk0000001e_PCOUT<22>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_PCOUT<21>_UNCONNECTED , \NLW_blk00000001/blk0000001e_PCOUT<20>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_PCOUT<19>_UNCONNECTED , \NLW_blk00000001/blk0000001e_PCOUT<18>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_PCOUT<17>_UNCONNECTED , \NLW_blk00000001/blk0000001e_PCOUT<16>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_PCOUT<15>_UNCONNECTED , \NLW_blk00000001/blk0000001e_PCOUT<14>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_PCOUT<13>_UNCONNECTED , \NLW_blk00000001/blk0000001e_PCOUT<12>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_PCOUT<11>_UNCONNECTED , \NLW_blk00000001/blk0000001e_PCOUT<10>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_PCOUT<9>_UNCONNECTED , \NLW_blk00000001/blk0000001e_PCOUT<8>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_PCOUT<7>_UNCONNECTED , \NLW_blk00000001/blk0000001e_PCOUT<6>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_PCOUT<5>_UNCONNECTED , \NLW_blk00000001/blk0000001e_PCOUT<4>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_PCOUT<3>_UNCONNECTED , \NLW_blk00000001/blk0000001e_PCOUT<2>_UNCONNECTED , 
\NLW_blk00000001/blk0000001e_PCOUT<1>_UNCONNECTED , \NLW_blk00000001/blk0000001e_PCOUT<0>_UNCONNECTED }),
    .ACIN({\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c }),
    .CARRYINSEL({\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c })
  );
  DSP48E1 #(
    .ACASCREG ( 0 ),
    .ADREG ( 0 ),
    .ALUMODEREG ( 0 ),
    .AREG ( 0 ),
    .AUTORESET_PATDET ( "NO_RESET" ),
    .A_INPUT ( "CASCADE" ),
    .BCASCREG ( 0 ),
    .BREG ( 0 ),
    .B_INPUT ( "DIRECT" ),
    .CARRYINREG ( 0 ),
    .CARRYINSELREG ( 0 ),
    .CREG ( 0 ),
    .DREG ( 0 ),
    .INMODEREG ( 0 ),
    .MASK ( 48'hFFFFFFFFFFE0 ),
    .MREG ( 0 ),
    .OPMODEREG ( 0 ),
    .PATTERN ( 48'h000000000000 ),
    .PREG ( 0 ),
    .SEL_MASK ( "MASK" ),
    .SEL_PATTERN ( "PATTERN" ),
    .USE_DPORT ( "FALSE" ),
    .USE_MULT ( "MULTIPLY" ),
    .USE_PATTERN_DETECT ( "PATDET" ),
    .USE_SIMD ( "ONE48" ))
  \blk00000001/blk0000001d  (
    .PATTERNBDETECT(\NLW_blk00000001/blk0000001d_PATTERNBDETECT_UNCONNECTED ),
    .RSTC(\blk00000001/sig0000013c ),
    .CEB1(\blk00000001/sig0000013c ),
    .CEAD(\blk00000001/sig0000013c ),
    .MULTSIGNOUT(\NLW_blk00000001/blk0000001d_MULTSIGNOUT_UNCONNECTED ),
    .CEC(\blk00000001/sig0000013c ),
    .RSTM(\blk00000001/sig0000013c ),
    .MULTSIGNIN(\blk00000001/sig0000013c ),
    .CEB2(\blk00000001/sig0000013c ),
    .RSTCTRL(\blk00000001/sig0000013c ),
    .CEP(\blk00000001/sig0000013c ),
    .CARRYCASCOUT(\NLW_blk00000001/blk0000001d_CARRYCASCOUT_UNCONNECTED ),
    .RSTA(\blk00000001/sig0000013c ),
    .CECARRYIN(\blk00000001/sig0000013c ),
    .UNDERFLOW(\NLW_blk00000001/blk0000001d_UNDERFLOW_UNCONNECTED ),
    .PATTERNDETECT(\blk00000001/sig00000029 ),
    .RSTALUMODE(\blk00000001/sig0000013c ),
    .RSTALLCARRYIN(\blk00000001/sig0000013c ),
    .CED(\blk00000001/sig0000013c ),
    .RSTD(\blk00000001/sig0000013c ),
    .CEALUMODE(\blk00000001/sig0000013c ),
    .CEA2(\blk00000001/sig0000013c ),
    .CLK(aclk),
    .CEA1(\blk00000001/sig0000013c ),
    .RSTB(\blk00000001/sig0000013c ),
    .OVERFLOW(\NLW_blk00000001/blk0000001d_OVERFLOW_UNCONNECTED ),
    .CECTRL(\blk00000001/sig0000013c ),
    .CEM(\blk00000001/sig0000013c ),
    .CARRYIN(\blk00000001/sig0000013c ),
    .CARRYCASCIN(\blk00000001/sig0000013c ),
    .RSTINMODE(\blk00000001/sig0000013c ),
    .CEINMODE(\blk00000001/sig0000013c ),
    .RSTP(\blk00000001/sig0000013c ),
    .ACOUT({\NLW_blk00000001/blk0000001d_ACOUT<29>_UNCONNECTED , \NLW_blk00000001/blk0000001d_ACOUT<28>_UNCONNECTED , 
\NLW_blk00000001/blk0000001d_ACOUT<27>_UNCONNECTED , \NLW_blk00000001/blk0000001d_ACOUT<26>_UNCONNECTED , 
\NLW_blk00000001/blk0000001d_ACOUT<25>_UNCONNECTED , \NLW_blk00000001/blk0000001d_ACOUT<24>_UNCONNECTED , 
\NLW_blk00000001/blk0000001d_ACOUT<23>_UNCONNECTED , \NLW_blk00000001/blk0000001d_ACOUT<22>_UNCONNECTED , 
\NLW_blk00000001/blk0000001d_ACOUT<21>_UNCONNECTED , \NLW_blk00000001/blk0000001d_ACOUT<20>_UNCONNECTED , 
\NLW_blk00000001/blk0000001d_ACOUT<19>_UNCONNECTED , \NLW_blk00000001/blk0000001d_ACOUT<18>_UNCONNECTED , 
\NLW_blk00000001/blk0000001d_ACOUT<17>_UNCONNECTED , \NLW_blk00000001/blk0000001d_ACOUT<16>_UNCONNECTED , 
\NLW_blk00000001/blk0000001d_ACOUT<15>_UNCONNECTED , \NLW_blk00000001/blk0000001d_ACOUT<14>_UNCONNECTED , 
\NLW_blk00000001/blk0000001d_ACOUT<13>_UNCONNECTED , \NLW_blk00000001/blk0000001d_ACOUT<12>_UNCONNECTED , 
\NLW_blk00000001/blk0000001d_ACOUT<11>_UNCONNECTED , \NLW_blk00000001/blk0000001d_ACOUT<10>_UNCONNECTED , 
\NLW_blk00000001/blk0000001d_ACOUT<9>_UNCONNECTED , \NLW_blk00000001/blk0000001d_ACOUT<8>_UNCONNECTED , 
\NLW_blk00000001/blk0000001d_ACOUT<7>_UNCONNECTED , \NLW_blk00000001/blk0000001d_ACOUT<6>_UNCONNECTED , 
\NLW_blk00000001/blk0000001d_ACOUT<5>_UNCONNECTED , \NLW_blk00000001/blk0000001d_ACOUT<4>_UNCONNECTED , 
\NLW_blk00000001/blk0000001d_ACOUT<3>_UNCONNECTED , \NLW_blk00000001/blk0000001d_ACOUT<2>_UNCONNECTED , 
\NLW_blk00000001/blk0000001d_ACOUT<1>_UNCONNECTED , \NLW_blk00000001/blk0000001d_ACOUT<0>_UNCONNECTED }),
    .OPMODE({\blk00000001/sig00000113 , \blk00000001/sig0000013c , \blk00000001/sig00000113 , \blk00000001/sig0000013c , \blk00000001/sig00000113 , 
\blk00000001/sig0000013c , \blk00000001/sig00000113 }),
    .PCIN({\blk00000001/sig000000f4 , \blk00000001/sig000000f3 , \blk00000001/sig000000f2 , \blk00000001/sig000000f1 , \blk00000001/sig000000f0 , 
\blk00000001/sig000000ef , \blk00000001/sig000000ee , \blk00000001/sig000000ed , \blk00000001/sig000000ec , \blk00000001/sig000000eb , 
\blk00000001/sig000000ea , \blk00000001/sig000000e9 , \blk00000001/sig000000e8 , \blk00000001/sig000000e7 , \blk00000001/sig000000e6 , 
\blk00000001/sig000000e5 , \blk00000001/sig000000e4 , \blk00000001/sig000000e3 , \blk00000001/sig000000e2 , \blk00000001/sig000000e1 , 
\blk00000001/sig000000e0 , \blk00000001/sig000000df , \blk00000001/sig000000de , \blk00000001/sig000000dd , \blk00000001/sig000000dc , 
\blk00000001/sig000000db , \blk00000001/sig000000da , \blk00000001/sig000000d9 , \blk00000001/sig000000d8 , \blk00000001/sig000000d7 , 
\blk00000001/sig000000d6 , \blk00000001/sig000000d5 , \blk00000001/sig000000d4 , \blk00000001/sig000000d3 , \blk00000001/sig000000d2 , 
\blk00000001/sig000000d1 , \blk00000001/sig000000d0 , \blk00000001/sig000000cf , \blk00000001/sig000000ce , \blk00000001/sig000000cd , 
\blk00000001/sig000000cc , \blk00000001/sig000000cb , \blk00000001/sig000000ca , \blk00000001/sig000000c9 , \blk00000001/sig000000c8 , 
\blk00000001/sig000000c7 , \blk00000001/sig000000c6 , \blk00000001/sig000000c5 }),
    .ALUMODE({\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c }),
    .C({\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c }),
    .CARRYOUT({\NLW_blk00000001/blk0000001d_CARRYOUT<3>_UNCONNECTED , \NLW_blk00000001/blk0000001d_CARRYOUT<2>_UNCONNECTED , 
\NLW_blk00000001/blk0000001d_CARRYOUT<1>_UNCONNECTED , \NLW_blk00000001/blk0000001d_CARRYOUT<0>_UNCONNECTED }),
    .INMODE({\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c }),
    .BCIN({\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c }),
    .B({\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig00000113 , s_axis_b_tdata[22], s_axis_b_tdata[21], s_axis_b_tdata[20], s_axis_b_tdata[19], 
s_axis_b_tdata[18], s_axis_b_tdata[17]}),
    .BCOUT({\NLW_blk00000001/blk0000001d_BCOUT<17>_UNCONNECTED , \NLW_blk00000001/blk0000001d_BCOUT<16>_UNCONNECTED , 
\NLW_blk00000001/blk0000001d_BCOUT<15>_UNCONNECTED , \NLW_blk00000001/blk0000001d_BCOUT<14>_UNCONNECTED , 
\NLW_blk00000001/blk0000001d_BCOUT<13>_UNCONNECTED , \NLW_blk00000001/blk0000001d_BCOUT<12>_UNCONNECTED , 
\NLW_blk00000001/blk0000001d_BCOUT<11>_UNCONNECTED , \NLW_blk00000001/blk0000001d_BCOUT<10>_UNCONNECTED , 
\NLW_blk00000001/blk0000001d_BCOUT<9>_UNCONNECTED , \NLW_blk00000001/blk0000001d_BCOUT<8>_UNCONNECTED , 
\NLW_blk00000001/blk0000001d_BCOUT<7>_UNCONNECTED , \NLW_blk00000001/blk0000001d_BCOUT<6>_UNCONNECTED , 
\NLW_blk00000001/blk0000001d_BCOUT<5>_UNCONNECTED , \NLW_blk00000001/blk0000001d_BCOUT<4>_UNCONNECTED , 
\NLW_blk00000001/blk0000001d_BCOUT<3>_UNCONNECTED , \NLW_blk00000001/blk0000001d_BCOUT<2>_UNCONNECTED , 
\NLW_blk00000001/blk0000001d_BCOUT<1>_UNCONNECTED , \NLW_blk00000001/blk0000001d_BCOUT<0>_UNCONNECTED }),
    .D({\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c }),
    .P({\NLW_blk00000001/blk0000001d_P<47>_UNCONNECTED , \NLW_blk00000001/blk0000001d_P<46>_UNCONNECTED , 
\NLW_blk00000001/blk0000001d_P<45>_UNCONNECTED , \NLW_blk00000001/blk0000001d_P<44>_UNCONNECTED , \NLW_blk00000001/blk0000001d_P<43>_UNCONNECTED , 
\NLW_blk00000001/blk0000001d_P<42>_UNCONNECTED , \NLW_blk00000001/blk0000001d_P<41>_UNCONNECTED , \NLW_blk00000001/blk0000001d_P<40>_UNCONNECTED , 
\NLW_blk00000001/blk0000001d_P<39>_UNCONNECTED , \NLW_blk00000001/blk0000001d_P<38>_UNCONNECTED , \NLW_blk00000001/blk0000001d_P<37>_UNCONNECTED , 
\NLW_blk00000001/blk0000001d_P<36>_UNCONNECTED , \NLW_blk00000001/blk0000001d_P<35>_UNCONNECTED , \NLW_blk00000001/blk0000001d_P<34>_UNCONNECTED , 
\NLW_blk00000001/blk0000001d_P<33>_UNCONNECTED , \NLW_blk00000001/blk0000001d_P<32>_UNCONNECTED , \NLW_blk00000001/blk0000001d_P<31>_UNCONNECTED , 
\blk00000001/sig0000008b , \blk00000001/sig00000072 , \blk00000001/sig00000071 , \blk00000001/sig00000070 , \blk00000001/sig0000006f , 
\blk00000001/sig0000006e , \blk00000001/sig0000006d , \blk00000001/sig0000006c , \blk00000001/sig0000006b , \blk00000001/sig0000006a , 
\blk00000001/sig00000069 , \blk00000001/sig00000068 , \blk00000001/sig00000067 , \blk00000001/sig00000066 , \blk00000001/sig00000065 , 
\blk00000001/sig00000064 , \blk00000001/sig00000063 , \blk00000001/sig00000062 , \blk00000001/sig00000061 , \blk00000001/sig00000060 , 
\blk00000001/sig0000005f , \blk00000001/sig0000005e , \blk00000001/sig0000005d , \blk00000001/sig0000005c , \blk00000001/sig0000005b , 
\blk00000001/sig0000005a , \NLW_blk00000001/blk0000001d_P<4>_UNCONNECTED , \NLW_blk00000001/blk0000001d_P<3>_UNCONNECTED , 
\NLW_blk00000001/blk0000001d_P<2>_UNCONNECTED , \NLW_blk00000001/blk0000001d_P<1>_UNCONNECTED , \NLW_blk00000001/blk0000001d_P<0>_UNCONNECTED }),
    .A({\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c }),
    .PCOUT({\blk00000001/sig00000059 , \blk00000001/sig00000058 , \blk00000001/sig00000057 , \blk00000001/sig00000056 , \blk00000001/sig00000055 , 
\blk00000001/sig00000054 , \blk00000001/sig00000053 , \blk00000001/sig00000052 , \blk00000001/sig00000051 , \blk00000001/sig00000050 , 
\blk00000001/sig0000004f , \blk00000001/sig0000004e , \blk00000001/sig0000004d , \blk00000001/sig0000004c , \blk00000001/sig0000004b , 
\blk00000001/sig0000004a , \blk00000001/sig00000049 , \blk00000001/sig00000048 , \blk00000001/sig00000047 , \blk00000001/sig00000046 , 
\blk00000001/sig00000045 , \blk00000001/sig00000044 , \blk00000001/sig00000043 , \blk00000001/sig00000042 , \blk00000001/sig00000041 , 
\blk00000001/sig00000040 , \blk00000001/sig0000003f , \blk00000001/sig0000003e , \blk00000001/sig0000003d , \blk00000001/sig0000003c , 
\blk00000001/sig0000003b , \blk00000001/sig0000003a , \blk00000001/sig00000039 , \blk00000001/sig00000038 , \blk00000001/sig00000037 , 
\blk00000001/sig00000036 , \blk00000001/sig00000035 , \blk00000001/sig00000034 , \blk00000001/sig00000033 , \blk00000001/sig00000032 , 
\blk00000001/sig00000031 , \blk00000001/sig00000030 , \blk00000001/sig0000002f , \blk00000001/sig0000002e , \blk00000001/sig0000002d , 
\blk00000001/sig0000002c , \blk00000001/sig0000002b , \blk00000001/sig0000002a }),
    .ACIN({\blk00000001/sig00000112 , \blk00000001/sig00000111 , \blk00000001/sig00000110 , \blk00000001/sig0000010f , \blk00000001/sig0000010e , 
\blk00000001/sig0000010d , \blk00000001/sig0000010c , \blk00000001/sig0000010b , \blk00000001/sig0000010a , \blk00000001/sig00000109 , 
\blk00000001/sig00000108 , \blk00000001/sig00000107 , \blk00000001/sig00000106 , \blk00000001/sig00000105 , \blk00000001/sig00000104 , 
\blk00000001/sig00000103 , \blk00000001/sig00000102 , \blk00000001/sig00000101 , \blk00000001/sig00000100 , \blk00000001/sig000000ff , 
\blk00000001/sig000000fe , \blk00000001/sig000000fd , \blk00000001/sig000000fc , \blk00000001/sig000000fb , \blk00000001/sig000000fa , 
\blk00000001/sig000000f9 , \blk00000001/sig000000f8 , \blk00000001/sig000000f7 , \blk00000001/sig000000f6 , \blk00000001/sig000000f5 }),
    .CARRYINSEL({\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c })
  );
  DSP48E1 #(
    .ACASCREG ( 0 ),
    .ADREG ( 0 ),
    .ALUMODEREG ( 0 ),
    .AREG ( 0 ),
    .AUTORESET_PATDET ( "NO_RESET" ),
    .A_INPUT ( "DIRECT" ),
    .BCASCREG ( 0 ),
    .BREG ( 0 ),
    .B_INPUT ( "DIRECT" ),
    .CARRYINREG ( 0 ),
    .CARRYINSELREG ( 0 ),
    .CREG ( 0 ),
    .DREG ( 0 ),
    .INMODEREG ( 0 ),
    .MASK ( 48'hFFFFFFFE0000 ),
    .MREG ( 0 ),
    .OPMODEREG ( 0 ),
    .PATTERN ( 48'h000000000000 ),
    .PREG ( 0 ),
    .SEL_MASK ( "MASK" ),
    .SEL_PATTERN ( "PATTERN" ),
    .USE_DPORT ( "FALSE" ),
    .USE_MULT ( "MULTIPLY" ),
    .USE_PATTERN_DETECT ( "PATDET" ),
    .USE_SIMD ( "ONE48" ))
  \blk00000001/blk0000001c  (
    .PATTERNBDETECT(\NLW_blk00000001/blk0000001c_PATTERNBDETECT_UNCONNECTED ),
    .RSTC(\blk00000001/sig0000013c ),
    .CEB1(\blk00000001/sig0000013c ),
    .CEAD(\blk00000001/sig0000013c ),
    .MULTSIGNOUT(\NLW_blk00000001/blk0000001c_MULTSIGNOUT_UNCONNECTED ),
    .CEC(\blk00000001/sig0000013c ),
    .RSTM(\blk00000001/sig0000013c ),
    .MULTSIGNIN(\blk00000001/sig0000013c ),
    .CEB2(\blk00000001/sig0000013c ),
    .RSTCTRL(\blk00000001/sig0000013c ),
    .CEP(\blk00000001/sig0000013c ),
    .CARRYCASCOUT(\NLW_blk00000001/blk0000001c_CARRYCASCOUT_UNCONNECTED ),
    .RSTA(\blk00000001/sig0000013c ),
    .CECARRYIN(\blk00000001/sig0000013c ),
    .UNDERFLOW(\NLW_blk00000001/blk0000001c_UNDERFLOW_UNCONNECTED ),
    .PATTERNDETECT(\blk00000001/sig00000028 ),
    .RSTALUMODE(\blk00000001/sig0000013c ),
    .RSTALLCARRYIN(\blk00000001/sig0000013c ),
    .CED(\blk00000001/sig0000013c ),
    .RSTD(\blk00000001/sig0000013c ),
    .CEALUMODE(\blk00000001/sig0000013c ),
    .CEA2(\blk00000001/sig0000013c ),
    .CLK(aclk),
    .CEA1(\blk00000001/sig0000013c ),
    .RSTB(\blk00000001/sig0000013c ),
    .OVERFLOW(\NLW_blk00000001/blk0000001c_OVERFLOW_UNCONNECTED ),
    .CECTRL(\blk00000001/sig0000013c ),
    .CEM(\blk00000001/sig0000013c ),
    .CARRYIN(\blk00000001/sig0000013c ),
    .CARRYCASCIN(\blk00000001/sig0000013c ),
    .RSTINMODE(\blk00000001/sig0000013c ),
    .CEINMODE(\blk00000001/sig0000013c ),
    .RSTP(\blk00000001/sig0000013c ),
    .ACOUT({\blk00000001/sig00000112 , \blk00000001/sig00000111 , \blk00000001/sig00000110 , \blk00000001/sig0000010f , \blk00000001/sig0000010e , 
\blk00000001/sig0000010d , \blk00000001/sig0000010c , \blk00000001/sig0000010b , \blk00000001/sig0000010a , \blk00000001/sig00000109 , 
\blk00000001/sig00000108 , \blk00000001/sig00000107 , \blk00000001/sig00000106 , \blk00000001/sig00000105 , \blk00000001/sig00000104 , 
\blk00000001/sig00000103 , \blk00000001/sig00000102 , \blk00000001/sig00000101 , \blk00000001/sig00000100 , \blk00000001/sig000000ff , 
\blk00000001/sig000000fe , \blk00000001/sig000000fd , \blk00000001/sig000000fc , \blk00000001/sig000000fb , \blk00000001/sig000000fa , 
\blk00000001/sig000000f9 , \blk00000001/sig000000f8 , \blk00000001/sig000000f7 , \blk00000001/sig000000f6 , \blk00000001/sig000000f5 }),
    .OPMODE({\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig00000113 , 
\blk00000001/sig0000013c , \blk00000001/sig00000113 }),
    .PCIN({\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c }),
    .ALUMODE({\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c }),
    .C({\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c }),
    .CARRYOUT({\NLW_blk00000001/blk0000001c_CARRYOUT<3>_UNCONNECTED , \NLW_blk00000001/blk0000001c_CARRYOUT<2>_UNCONNECTED , 
\NLW_blk00000001/blk0000001c_CARRYOUT<1>_UNCONNECTED , \NLW_blk00000001/blk0000001c_CARRYOUT<0>_UNCONNECTED }),
    .INMODE({\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c }),
    .BCIN({\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c }),
    .B({\blk00000001/sig0000013c , s_axis_b_tdata[16], s_axis_b_tdata[15], s_axis_b_tdata[14], s_axis_b_tdata[13], s_axis_b_tdata[12], 
s_axis_b_tdata[11], s_axis_b_tdata[10], s_axis_b_tdata[9], s_axis_b_tdata[8], s_axis_b_tdata[7], s_axis_b_tdata[6], s_axis_b_tdata[5], 
s_axis_b_tdata[4], s_axis_b_tdata[3], s_axis_b_tdata[2], s_axis_b_tdata[1], s_axis_b_tdata[0]}),
    .BCOUT({\NLW_blk00000001/blk0000001c_BCOUT<17>_UNCONNECTED , \NLW_blk00000001/blk0000001c_BCOUT<16>_UNCONNECTED , 
\NLW_blk00000001/blk0000001c_BCOUT<15>_UNCONNECTED , \NLW_blk00000001/blk0000001c_BCOUT<14>_UNCONNECTED , 
\NLW_blk00000001/blk0000001c_BCOUT<13>_UNCONNECTED , \NLW_blk00000001/blk0000001c_BCOUT<12>_UNCONNECTED , 
\NLW_blk00000001/blk0000001c_BCOUT<11>_UNCONNECTED , \NLW_blk00000001/blk0000001c_BCOUT<10>_UNCONNECTED , 
\NLW_blk00000001/blk0000001c_BCOUT<9>_UNCONNECTED , \NLW_blk00000001/blk0000001c_BCOUT<8>_UNCONNECTED , 
\NLW_blk00000001/blk0000001c_BCOUT<7>_UNCONNECTED , \NLW_blk00000001/blk0000001c_BCOUT<6>_UNCONNECTED , 
\NLW_blk00000001/blk0000001c_BCOUT<5>_UNCONNECTED , \NLW_blk00000001/blk0000001c_BCOUT<4>_UNCONNECTED , 
\NLW_blk00000001/blk0000001c_BCOUT<3>_UNCONNECTED , \NLW_blk00000001/blk0000001c_BCOUT<2>_UNCONNECTED , 
\NLW_blk00000001/blk0000001c_BCOUT<1>_UNCONNECTED , \NLW_blk00000001/blk0000001c_BCOUT<0>_UNCONNECTED }),
    .D({\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c }),
    .P({\NLW_blk00000001/blk0000001c_P<47>_UNCONNECTED , \NLW_blk00000001/blk0000001c_P<46>_UNCONNECTED , 
\NLW_blk00000001/blk0000001c_P<45>_UNCONNECTED , \NLW_blk00000001/blk0000001c_P<44>_UNCONNECTED , \NLW_blk00000001/blk0000001c_P<43>_UNCONNECTED , 
\NLW_blk00000001/blk0000001c_P<42>_UNCONNECTED , \NLW_blk00000001/blk0000001c_P<41>_UNCONNECTED , \NLW_blk00000001/blk0000001c_P<40>_UNCONNECTED , 
\NLW_blk00000001/blk0000001c_P<39>_UNCONNECTED , \NLW_blk00000001/blk0000001c_P<38>_UNCONNECTED , \NLW_blk00000001/blk0000001c_P<37>_UNCONNECTED , 
\NLW_blk00000001/blk0000001c_P<36>_UNCONNECTED , \NLW_blk00000001/blk0000001c_P<35>_UNCONNECTED , \NLW_blk00000001/blk0000001c_P<34>_UNCONNECTED , 
\NLW_blk00000001/blk0000001c_P<33>_UNCONNECTED , \NLW_blk00000001/blk0000001c_P<32>_UNCONNECTED , \NLW_blk00000001/blk0000001c_P<31>_UNCONNECTED , 
\NLW_blk00000001/blk0000001c_P<30>_UNCONNECTED , \NLW_blk00000001/blk0000001c_P<29>_UNCONNECTED , \NLW_blk00000001/blk0000001c_P<28>_UNCONNECTED , 
\NLW_blk00000001/blk0000001c_P<27>_UNCONNECTED , \NLW_blk00000001/blk0000001c_P<26>_UNCONNECTED , \NLW_blk00000001/blk0000001c_P<25>_UNCONNECTED , 
\NLW_blk00000001/blk0000001c_P<24>_UNCONNECTED , \NLW_blk00000001/blk0000001c_P<23>_UNCONNECTED , \NLW_blk00000001/blk0000001c_P<22>_UNCONNECTED , 
\NLW_blk00000001/blk0000001c_P<21>_UNCONNECTED , \NLW_blk00000001/blk0000001c_P<20>_UNCONNECTED , \NLW_blk00000001/blk0000001c_P<19>_UNCONNECTED , 
\NLW_blk00000001/blk0000001c_P<18>_UNCONNECTED , \NLW_blk00000001/blk0000001c_P<17>_UNCONNECTED , \NLW_blk00000001/blk0000001c_P<16>_UNCONNECTED , 
\NLW_blk00000001/blk0000001c_P<15>_UNCONNECTED , \NLW_blk00000001/blk0000001c_P<14>_UNCONNECTED , \NLW_blk00000001/blk0000001c_P<13>_UNCONNECTED , 
\NLW_blk00000001/blk0000001c_P<12>_UNCONNECTED , \NLW_blk00000001/blk0000001c_P<11>_UNCONNECTED , \NLW_blk00000001/blk0000001c_P<10>_UNCONNECTED , 
\NLW_blk00000001/blk0000001c_P<9>_UNCONNECTED , \NLW_blk00000001/blk0000001c_P<8>_UNCONNECTED , \NLW_blk00000001/blk0000001c_P<7>_UNCONNECTED , 
\NLW_blk00000001/blk0000001c_P<6>_UNCONNECTED , \NLW_blk00000001/blk0000001c_P<5>_UNCONNECTED , \NLW_blk00000001/blk0000001c_P<4>_UNCONNECTED , 
\NLW_blk00000001/blk0000001c_P<3>_UNCONNECTED , \NLW_blk00000001/blk0000001c_P<2>_UNCONNECTED , \NLW_blk00000001/blk0000001c_P<1>_UNCONNECTED , 
\NLW_blk00000001/blk0000001c_P<0>_UNCONNECTED }),
    .A({\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig00000113 , s_axis_a_tdata[22], s_axis_a_tdata[21], s_axis_a_tdata[20], s_axis_a_tdata[19], 
s_axis_a_tdata[18], s_axis_a_tdata[17], s_axis_a_tdata[16], s_axis_a_tdata[15], s_axis_a_tdata[14], s_axis_a_tdata[13], s_axis_a_tdata[12], 
s_axis_a_tdata[11], s_axis_a_tdata[10], s_axis_a_tdata[9], s_axis_a_tdata[8], s_axis_a_tdata[7], s_axis_a_tdata[6], s_axis_a_tdata[5], 
s_axis_a_tdata[4], s_axis_a_tdata[3], s_axis_a_tdata[2], s_axis_a_tdata[1], s_axis_a_tdata[0]}),
    .PCOUT({\blk00000001/sig000000f4 , \blk00000001/sig000000f3 , \blk00000001/sig000000f2 , \blk00000001/sig000000f1 , \blk00000001/sig000000f0 , 
\blk00000001/sig000000ef , \blk00000001/sig000000ee , \blk00000001/sig000000ed , \blk00000001/sig000000ec , \blk00000001/sig000000eb , 
\blk00000001/sig000000ea , \blk00000001/sig000000e9 , \blk00000001/sig000000e8 , \blk00000001/sig000000e7 , \blk00000001/sig000000e6 , 
\blk00000001/sig000000e5 , \blk00000001/sig000000e4 , \blk00000001/sig000000e3 , \blk00000001/sig000000e2 , \blk00000001/sig000000e1 , 
\blk00000001/sig000000e0 , \blk00000001/sig000000df , \blk00000001/sig000000de , \blk00000001/sig000000dd , \blk00000001/sig000000dc , 
\blk00000001/sig000000db , \blk00000001/sig000000da , \blk00000001/sig000000d9 , \blk00000001/sig000000d8 , \blk00000001/sig000000d7 , 
\blk00000001/sig000000d6 , \blk00000001/sig000000d5 , \blk00000001/sig000000d4 , \blk00000001/sig000000d3 , \blk00000001/sig000000d2 , 
\blk00000001/sig000000d1 , \blk00000001/sig000000d0 , \blk00000001/sig000000cf , \blk00000001/sig000000ce , \blk00000001/sig000000cd , 
\blk00000001/sig000000cc , \blk00000001/sig000000cb , \blk00000001/sig000000ca , \blk00000001/sig000000c9 , \blk00000001/sig000000c8 , 
\blk00000001/sig000000c7 , \blk00000001/sig000000c6 , \blk00000001/sig000000c5 }),
    .ACIN({\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , 
\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c }),
    .CARRYINSEL({\blk00000001/sig0000013c , \blk00000001/sig0000013c , \blk00000001/sig0000013c })
  );
  MUXCY   \blk00000001/blk0000001b  (
    .CI(\blk00000001/sig00000113 ),
    .DI(\blk00000001/sig0000013c ),
    .S(\blk00000001/sig000000b9 ),
    .O(\blk00000001/sig000000c4 )
  );
  MUXCY   \blk00000001/blk0000001a  (
    .CI(\blk00000001/sig000000c4 ),
    .DI(\blk00000001/sig0000013c ),
    .S(\blk00000001/sig000000b8 ),
    .O(\blk00000001/sig000000c3 )
  );
  MUXCY   \blk00000001/blk00000019  (
    .CI(\blk00000001/sig000000c3 ),
    .DI(\blk00000001/sig0000013c ),
    .S(\blk00000001/sig000000b7 ),
    .O(\blk00000001/sig000000c2 )
  );
  MUXCY   \blk00000001/blk00000018  (
    .CI(\blk00000001/sig000000c2 ),
    .DI(\blk00000001/sig0000013c ),
    .S(\blk00000001/sig000000ba ),
    .O(\blk00000001/sig00000089 )
  );
  MUXCY   \blk00000001/blk00000017  (
    .CI(\blk00000001/sig00000113 ),
    .DI(\blk00000001/sig0000013c ),
    .S(\blk00000001/sig000000bd ),
    .O(\blk00000001/sig000000c1 )
  );
  MUXCY   \blk00000001/blk00000016  (
    .CI(\blk00000001/sig000000c1 ),
    .DI(\blk00000001/sig0000013c ),
    .S(\blk00000001/sig000000bc ),
    .O(\blk00000001/sig000000c0 )
  );
  MUXCY   \blk00000001/blk00000015  (
    .CI(\blk00000001/sig000000c0 ),
    .DI(\blk00000001/sig0000013c ),
    .S(\blk00000001/sig000000bb ),
    .O(\blk00000001/sig000000bf )
  );
  MUXCY   \blk00000001/blk00000014  (
    .CI(\blk00000001/sig000000bf ),
    .DI(\blk00000001/sig0000013c ),
    .S(\blk00000001/sig000000be ),
    .O(\blk00000001/sig00000088 )
  );
  MUXCY   \blk00000001/blk00000013  (
    .CI(\blk00000001/sig00000113 ),
    .DI(s_axis_b_tdata[23]),
    .S(\blk00000001/sig00000076 ),
    .O(\blk00000001/sig000000b2 )
  );
  XORCY   \blk00000001/blk00000012  (
    .CI(\blk00000001/sig00000113 ),
    .LI(\blk00000001/sig00000076 ),
    .O(\blk00000001/sig000000b1 )
  );
  MUXCY   \blk00000001/blk00000011  (
    .CI(\blk00000001/sig000000b2 ),
    .DI(s_axis_b_tdata[24]),
    .S(\blk00000001/sig00000077 ),
    .O(\blk00000001/sig000000b0 )
  );
  XORCY   \blk00000001/blk00000010  (
    .CI(\blk00000001/sig000000b2 ),
    .LI(\blk00000001/sig00000077 ),
    .O(\blk00000001/sig000000af )
  );
  MUXCY   \blk00000001/blk0000000f  (
    .CI(\blk00000001/sig000000b0 ),
    .DI(s_axis_b_tdata[25]),
    .S(\blk00000001/sig00000078 ),
    .O(\blk00000001/sig000000ae )
  );
  XORCY   \blk00000001/blk0000000e  (
    .CI(\blk00000001/sig000000b0 ),
    .LI(\blk00000001/sig00000078 ),
    .O(\blk00000001/sig000000ad )
  );
  MUXCY   \blk00000001/blk0000000d  (
    .CI(\blk00000001/sig000000ae ),
    .DI(s_axis_b_tdata[26]),
    .S(\blk00000001/sig00000079 ),
    .O(\blk00000001/sig000000ac )
  );
  XORCY   \blk00000001/blk0000000c  (
    .CI(\blk00000001/sig000000ae ),
    .LI(\blk00000001/sig00000079 ),
    .O(\blk00000001/sig000000ab )
  );
  MUXCY   \blk00000001/blk0000000b  (
    .CI(\blk00000001/sig000000ac ),
    .DI(s_axis_b_tdata[27]),
    .S(\blk00000001/sig0000007a ),
    .O(\blk00000001/sig000000aa )
  );
  XORCY   \blk00000001/blk0000000a  (
    .CI(\blk00000001/sig000000ac ),
    .LI(\blk00000001/sig0000007a ),
    .O(\blk00000001/sig000000a9 )
  );
  MUXCY   \blk00000001/blk00000009  (
    .CI(\blk00000001/sig000000aa ),
    .DI(s_axis_b_tdata[28]),
    .S(\blk00000001/sig0000007b ),
    .O(\blk00000001/sig000000a8 )
  );
  XORCY   \blk00000001/blk00000008  (
    .CI(\blk00000001/sig000000aa ),
    .LI(\blk00000001/sig0000007b ),
    .O(\blk00000001/sig000000a7 )
  );
  MUXCY   \blk00000001/blk00000007  (
    .CI(\blk00000001/sig000000a8 ),
    .DI(s_axis_b_tdata[29]),
    .S(\blk00000001/sig0000007c ),
    .O(\blk00000001/sig000000a6 )
  );
  XORCY   \blk00000001/blk00000006  (
    .CI(\blk00000001/sig000000a8 ),
    .LI(\blk00000001/sig0000007c ),
    .O(\blk00000001/sig000000a5 )
  );
  MUXCY   \blk00000001/blk00000005  (
    .CI(\blk00000001/sig000000a6 ),
    .DI(s_axis_b_tdata[30]),
    .S(\blk00000001/sig0000007d ),
    .O(\blk00000001/sig0000008a )
  );
  XORCY   \blk00000001/blk00000004  (
    .CI(\blk00000001/sig000000a6 ),
    .LI(\blk00000001/sig0000007d ),
    .O(\blk00000001/sig000000a4 )
  );
  GND   \blk00000001/blk00000003  (
    .G(\blk00000001/sig0000013c )
  );
  VCC   \blk00000001/blk00000002  (
    .P(\blk00000001/sig00000113 )
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

// synthesis translate_on
