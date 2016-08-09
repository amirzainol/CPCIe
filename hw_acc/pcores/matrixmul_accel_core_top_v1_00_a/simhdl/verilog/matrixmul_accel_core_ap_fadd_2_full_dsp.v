////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: matrixmul_accel_core_ap_fadd_2_full_dsp.v
// /___/   /\     Timestamp: Wed Feb 24 09:32:44 2016
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog C:/mohd/cpcie_project/cpcie_project.srcs/sources_1/edk/module_1/pcores/matrixmul_accel_core_top_v1_00_a/data/__coregen_tmp__/tmp/_cg/matrixmul_accel_core_ap_fadd_2_full_dsp.ngc C:/mohd/cpcie_project/cpcie_project.srcs/sources_1/edk/module_1/pcores/matrixmul_accel_core_top_v1_00_a/data/__coregen_tmp__/tmp/_cg/matrixmul_accel_core_ap_fadd_2_full_dsp.v 
// Device	: 7vx485tffg1761-2
// Input file	: C:/mohd/cpcie_project/cpcie_project.srcs/sources_1/edk/module_1/pcores/matrixmul_accel_core_top_v1_00_a/data/__coregen_tmp__/tmp/_cg/matrixmul_accel_core_ap_fadd_2_full_dsp.ngc
// Output file	: C:/mohd/cpcie_project/cpcie_project.srcs/sources_1/edk/module_1/pcores/matrixmul_accel_core_top_v1_00_a/data/__coregen_tmp__/tmp/_cg/matrixmul_accel_core_ap_fadd_2_full_dsp.v
// # of Modules	: 1
// Design Name	: matrixmul_accel_core_ap_fadd_2_full_dsp
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

module matrixmul_accel_core_ap_fadd_2_full_dsp (
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
  
  wire \blk00000001/sig0000027b ;
  wire \blk00000001/sig0000027a ;
  wire \blk00000001/sig00000279 ;
  wire \blk00000001/sig00000278 ;
  wire \blk00000001/sig00000277 ;
  wire \blk00000001/sig00000276 ;
  wire \blk00000001/sig00000275 ;
  wire \blk00000001/sig00000274 ;
  wire \blk00000001/sig00000273 ;
  wire \blk00000001/sig00000272 ;
  wire \blk00000001/sig00000271 ;
  wire \blk00000001/sig00000270 ;
  wire \blk00000001/sig0000026f ;
  wire \blk00000001/sig0000026e ;
  wire \blk00000001/sig0000026d ;
  wire \blk00000001/sig0000026c ;
  wire \blk00000001/sig0000026b ;
  wire \blk00000001/sig0000026a ;
  wire \blk00000001/sig00000269 ;
  wire \blk00000001/sig00000268 ;
  wire \blk00000001/sig00000267 ;
  wire \blk00000001/sig00000266 ;
  wire \blk00000001/sig00000265 ;
  wire \blk00000001/sig00000264 ;
  wire \blk00000001/sig00000263 ;
  wire \blk00000001/sig00000262 ;
  wire \blk00000001/sig00000261 ;
  wire \blk00000001/sig00000260 ;
  wire \blk00000001/sig0000025f ;
  wire \blk00000001/sig0000025e ;
  wire \blk00000001/sig0000025d ;
  wire \blk00000001/sig0000025c ;
  wire \blk00000001/sig0000025b ;
  wire \blk00000001/sig0000025a ;
  wire \blk00000001/sig00000259 ;
  wire \blk00000001/sig00000258 ;
  wire \blk00000001/sig00000257 ;
  wire \blk00000001/sig00000256 ;
  wire \blk00000001/sig00000255 ;
  wire \blk00000001/sig00000254 ;
  wire \blk00000001/sig00000253 ;
  wire \blk00000001/sig00000252 ;
  wire \blk00000001/sig00000251 ;
  wire \blk00000001/sig00000250 ;
  wire \blk00000001/sig0000024f ;
  wire \blk00000001/sig0000024e ;
  wire \blk00000001/sig0000024d ;
  wire \blk00000001/sig0000024c ;
  wire \blk00000001/sig0000024b ;
  wire \blk00000001/sig0000024a ;
  wire \blk00000001/sig00000249 ;
  wire \blk00000001/sig00000248 ;
  wire \blk00000001/sig00000247 ;
  wire \blk00000001/sig00000246 ;
  wire \blk00000001/sig00000245 ;
  wire \blk00000001/sig00000244 ;
  wire \blk00000001/sig00000243 ;
  wire \blk00000001/sig00000242 ;
  wire \blk00000001/sig00000241 ;
  wire \blk00000001/sig00000240 ;
  wire \blk00000001/sig0000023f ;
  wire \blk00000001/sig0000023e ;
  wire \blk00000001/sig0000023d ;
  wire \blk00000001/sig0000023c ;
  wire \blk00000001/sig0000023b ;
  wire \blk00000001/sig0000023a ;
  wire \blk00000001/sig00000239 ;
  wire \blk00000001/sig00000238 ;
  wire \blk00000001/sig00000237 ;
  wire \blk00000001/sig00000236 ;
  wire \blk00000001/sig00000235 ;
  wire \blk00000001/sig00000234 ;
  wire \blk00000001/sig00000233 ;
  wire \blk00000001/sig00000232 ;
  wire \blk00000001/sig00000231 ;
  wire \blk00000001/sig00000230 ;
  wire \blk00000001/sig0000022f ;
  wire \blk00000001/sig0000022e ;
  wire \blk00000001/sig0000022d ;
  wire \blk00000001/sig0000022c ;
  wire \blk00000001/sig0000022b ;
  wire \blk00000001/sig0000022a ;
  wire \blk00000001/sig00000229 ;
  wire \blk00000001/sig00000228 ;
  wire \blk00000001/sig00000227 ;
  wire \blk00000001/sig00000226 ;
  wire \blk00000001/sig00000225 ;
  wire \blk00000001/sig00000224 ;
  wire \blk00000001/sig00000223 ;
  wire \blk00000001/sig00000222 ;
  wire \blk00000001/sig00000221 ;
  wire \blk00000001/sig00000220 ;
  wire \blk00000001/sig0000021f ;
  wire \blk00000001/sig0000021e ;
  wire \blk00000001/sig0000021d ;
  wire \blk00000001/sig0000021c ;
  wire \blk00000001/sig0000021b ;
  wire \blk00000001/sig0000021a ;
  wire \blk00000001/sig00000219 ;
  wire \blk00000001/sig00000218 ;
  wire \blk00000001/sig00000217 ;
  wire \blk00000001/sig00000216 ;
  wire \blk00000001/sig00000215 ;
  wire \blk00000001/sig00000214 ;
  wire \blk00000001/sig00000213 ;
  wire \blk00000001/sig00000212 ;
  wire \blk00000001/sig00000211 ;
  wire \blk00000001/sig00000210 ;
  wire \blk00000001/sig0000020f ;
  wire \blk00000001/sig0000020e ;
  wire \blk00000001/sig0000020d ;
  wire \blk00000001/sig0000020c ;
  wire \blk00000001/sig0000020b ;
  wire \blk00000001/sig0000020a ;
  wire \blk00000001/sig00000209 ;
  wire \blk00000001/sig00000208 ;
  wire \blk00000001/sig00000207 ;
  wire \blk00000001/sig00000206 ;
  wire \blk00000001/sig00000205 ;
  wire \blk00000001/sig00000204 ;
  wire \blk00000001/sig00000203 ;
  wire \blk00000001/sig00000202 ;
  wire \blk00000001/sig00000201 ;
  wire \blk00000001/sig00000200 ;
  wire \blk00000001/sig000001ff ;
  wire \blk00000001/sig000001fe ;
  wire \blk00000001/sig000001fd ;
  wire \blk00000001/sig000001fc ;
  wire \blk00000001/sig000001fb ;
  wire \blk00000001/sig000001fa ;
  wire \blk00000001/sig000001f9 ;
  wire \blk00000001/sig000001f8 ;
  wire \blk00000001/sig000001f7 ;
  wire \blk00000001/sig000001f6 ;
  wire \blk00000001/sig000001f5 ;
  wire \blk00000001/sig000001f4 ;
  wire \blk00000001/sig000001f3 ;
  wire \blk00000001/sig000001f2 ;
  wire \blk00000001/sig000001f1 ;
  wire \blk00000001/sig000001f0 ;
  wire \blk00000001/sig000001ef ;
  wire \blk00000001/sig000001ee ;
  wire \blk00000001/sig000001ed ;
  wire \blk00000001/sig000001ec ;
  wire \blk00000001/sig000001eb ;
  wire \blk00000001/sig000001ea ;
  wire \blk00000001/sig000001e9 ;
  wire \blk00000001/sig000001e8 ;
  wire \blk00000001/sig000001e7 ;
  wire \blk00000001/sig000001e6 ;
  wire \blk00000001/sig000001e5 ;
  wire \blk00000001/sig000001e4 ;
  wire \blk00000001/sig000001e3 ;
  wire \blk00000001/sig000001e2 ;
  wire \blk00000001/sig000001e1 ;
  wire \blk00000001/sig000001e0 ;
  wire \blk00000001/sig000001df ;
  wire \blk00000001/sig000001de ;
  wire \blk00000001/sig000001dd ;
  wire \blk00000001/sig000001dc ;
  wire \blk00000001/sig000001db ;
  wire \blk00000001/sig000001da ;
  wire \blk00000001/sig000001d9 ;
  wire \blk00000001/sig000001d8 ;
  wire \blk00000001/sig000001d7 ;
  wire \blk00000001/sig000001d6 ;
  wire \blk00000001/sig000001d5 ;
  wire \blk00000001/sig000001d4 ;
  wire \blk00000001/sig000001d3 ;
  wire \blk00000001/sig000001d2 ;
  wire \blk00000001/sig000001d1 ;
  wire \blk00000001/sig000001d0 ;
  wire \blk00000001/sig000001cf ;
  wire \blk00000001/sig000001ce ;
  wire \blk00000001/sig000001cd ;
  wire \blk00000001/sig000001cc ;
  wire \blk00000001/sig000001cb ;
  wire \blk00000001/sig000001ca ;
  wire \blk00000001/sig000001c9 ;
  wire \blk00000001/sig000001c8 ;
  wire \blk00000001/sig000001c7 ;
  wire \blk00000001/sig000001c6 ;
  wire \blk00000001/sig000001c5 ;
  wire \blk00000001/sig000001c4 ;
  wire \blk00000001/sig000001c3 ;
  wire \blk00000001/sig000001c2 ;
  wire \blk00000001/sig000001c1 ;
  wire \blk00000001/sig000001c0 ;
  wire \blk00000001/sig000001bf ;
  wire \blk00000001/sig000001be ;
  wire \blk00000001/sig000001bd ;
  wire \blk00000001/sig000001bc ;
  wire \blk00000001/sig000001bb ;
  wire \blk00000001/sig000001ba ;
  wire \blk00000001/sig000001b9 ;
  wire \blk00000001/sig000001b8 ;
  wire \blk00000001/sig000001b7 ;
  wire \blk00000001/sig000001b6 ;
  wire \blk00000001/sig000001b5 ;
  wire \blk00000001/sig000001b4 ;
  wire \blk00000001/sig000001b3 ;
  wire \blk00000001/sig000001b2 ;
  wire \blk00000001/sig000001b1 ;
  wire \blk00000001/sig000001b0 ;
  wire \blk00000001/sig000001af ;
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
  wire \blk00000001/sig0000013b ;
  wire \blk00000001/sig0000013a ;
  wire \blk00000001/sig00000139 ;
  wire \blk00000001/sig00000138 ;
  wire \blk00000001/sig00000137 ;
  wire \blk00000001/sig00000136 ;
  wire \blk00000001/sig00000135 ;
  wire \blk00000001/sig00000134 ;
  wire \blk00000001/sig00000133 ;
  wire \blk00000001/sig00000132 ;
  wire \blk00000001/sig00000131 ;
  wire \blk00000001/sig00000130 ;
  wire \blk00000001/sig0000012f ;
  wire \blk00000001/sig0000012e ;
  wire \blk00000001/sig0000012d ;
  wire \blk00000001/sig0000012c ;
  wire \blk00000001/sig0000012b ;
  wire \blk00000001/sig0000012a ;
  wire \blk00000001/sig00000129 ;
  wire \blk00000001/sig00000128 ;
  wire \blk00000001/sig00000127 ;
  wire \blk00000001/sig00000126 ;
  wire \blk00000001/sig00000125 ;
  wire \blk00000001/sig00000124 ;
  wire \blk00000001/sig00000123 ;
  wire \blk00000001/sig00000122 ;
  wire \blk00000001/sig00000121 ;
  wire \blk00000001/sig00000120 ;
  wire \blk00000001/sig0000011f ;
  wire \blk00000001/sig0000011e ;
  wire \blk00000001/sig0000011d ;
  wire \blk00000001/sig0000011c ;
  wire \blk00000001/sig0000011b ;
  wire \blk00000001/sig0000011a ;
  wire \blk00000001/sig00000119 ;
  wire \blk00000001/sig00000118 ;
  wire \blk00000001/sig00000117 ;
  wire \blk00000001/sig00000116 ;
  wire \blk00000001/sig00000115 ;
  wire \blk00000001/sig00000114 ;
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
  wire \blk00000001/sig000000a3 ;
  wire \blk00000001/sig000000a2 ;
  wire \blk00000001/sig000000a1 ;
  wire \blk00000001/sig000000a0 ;
  wire \blk00000001/sig0000009f ;
  wire \blk00000001/sig0000009e ;
  wire \blk00000001/sig0000009d ;
  wire \blk00000001/sig0000009c ;
  wire \blk00000001/sig0000009b ;
  wire \blk00000001/sig0000009a ;
  wire \blk00000001/sig00000099 ;
  wire \blk00000001/sig00000098 ;
  wire \blk00000001/sig00000097 ;
  wire \blk00000001/sig00000096 ;
  wire \blk00000001/sig00000095 ;
  wire \blk00000001/sig00000094 ;
  wire \blk00000001/sig00000093 ;
  wire \blk00000001/sig00000092 ;
  wire \blk00000001/sig00000091 ;
  wire \blk00000001/sig00000090 ;
  wire \blk00000001/sig0000008f ;
  wire \blk00000001/sig0000008e ;
  wire \blk00000001/sig0000008d ;
  wire \blk00000001/sig0000008c ;
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
  wire \NLW_blk00000001/blk000000f9_PATTERNBDETECT_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_MULTSIGNOUT_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_CARRYCASCOUT_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_UNDERFLOW_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PATTERNDETECT_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_OVERFLOW_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_ACOUT<29>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_ACOUT<28>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_ACOUT<27>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_ACOUT<26>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_ACOUT<25>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_ACOUT<24>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_ACOUT<23>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_ACOUT<22>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_ACOUT<21>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_ACOUT<20>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_ACOUT<19>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_ACOUT<18>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_ACOUT<17>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_ACOUT<16>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_ACOUT<15>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_ACOUT<14>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_ACOUT<13>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_ACOUT<12>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_ACOUT<11>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_ACOUT<10>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_ACOUT<9>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_ACOUT<8>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_ACOUT<7>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_ACOUT<6>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_ACOUT<5>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_ACOUT<4>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_ACOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_ACOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_ACOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_ACOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_CARRYOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_CARRYOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_CARRYOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_CARRYOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_BCOUT<17>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_BCOUT<16>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_BCOUT<15>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_BCOUT<14>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_BCOUT<13>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_BCOUT<12>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_BCOUT<11>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_BCOUT<10>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_BCOUT<9>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_BCOUT<8>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_BCOUT<7>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_BCOUT<6>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_BCOUT<5>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_BCOUT<4>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_BCOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_BCOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_BCOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_BCOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_P<47>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_P<46>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_P<45>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_P<44>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_P<43>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_P<42>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_P<41>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_P<40>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_P<39>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_P<38>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_P<37>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_P<36>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_P<35>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_P<26>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_P<25>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_P<1>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_P<0>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<47>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<46>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<45>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<44>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<43>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<42>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<41>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<40>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<39>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<38>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<37>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<36>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<35>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<34>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<33>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<32>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<31>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<30>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<29>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<28>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<27>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<26>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<25>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<24>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<23>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<22>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<21>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<20>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<19>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<18>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<17>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<16>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<15>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<14>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<13>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<12>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<11>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<10>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<9>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<8>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<7>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<6>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<5>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<4>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000f9_PCOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PATTERNBDETECT_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_MULTSIGNOUT_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_CARRYCASCOUT_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_UNDERFLOW_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_OVERFLOW_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_ACOUT<29>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_ACOUT<28>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_ACOUT<27>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_ACOUT<26>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_ACOUT<25>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_ACOUT<24>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_ACOUT<23>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_ACOUT<22>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_ACOUT<21>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_ACOUT<20>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_ACOUT<19>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_ACOUT<18>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_ACOUT<17>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_ACOUT<16>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_ACOUT<15>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_ACOUT<14>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_ACOUT<13>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_ACOUT<12>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_ACOUT<11>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_ACOUT<10>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_ACOUT<9>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_ACOUT<8>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_ACOUT<7>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_ACOUT<6>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_ACOUT<5>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_ACOUT<4>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_ACOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_ACOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_ACOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_ACOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_CARRYOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_CARRYOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_CARRYOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_CARRYOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_BCOUT<17>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_BCOUT<16>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_BCOUT<15>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_BCOUT<14>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_BCOUT<13>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_BCOUT<12>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_BCOUT<11>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_BCOUT<10>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_BCOUT<9>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_BCOUT<8>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_BCOUT<7>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_BCOUT<6>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_BCOUT<5>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_BCOUT<4>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_BCOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_BCOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_BCOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_BCOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_P<47>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_P<46>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_P<45>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_P<44>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_P<43>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_P<42>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_P<41>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_P<40>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<47>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<46>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<45>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<44>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<43>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<42>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<41>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<40>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<39>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<38>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<37>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<36>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<35>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<34>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<33>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<32>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<31>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<30>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<29>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<28>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<27>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<26>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<25>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<24>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<23>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<22>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<21>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<20>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<19>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<18>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<17>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<16>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<15>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<14>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<13>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<12>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<11>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<10>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<9>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<8>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<7>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<6>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<5>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<4>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c2_PCOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000001/blk000000c0_O_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000079_O_UNCONNECTED ;
  LUT6 #(
    .INIT ( 64'h0000002828000000 ))
  \blk00000001/blk000001f4  (
    .I0(\blk00000001/sig000000b9 ),
    .I1(\blk00000001/sig000000bd ),
    .I2(\blk00000001/sig000000ba ),
    .I3(\blk00000001/sig000000bc ),
    .I4(\blk00000001/sig000000bb ),
    .I5(\blk00000001/sig000000be ),
    .O(\blk00000001/sig000001b0 )
  );
  LUT6 #(
    .INIT ( 64'h0010000404004000 ))
  \blk00000001/blk000001f3  (
    .I0(\blk00000001/sig000000b9 ),
    .I1(\blk00000001/sig000000bb ),
    .I2(\blk00000001/sig000000ba ),
    .I3(\blk00000001/sig000000bc ),
    .I4(\blk00000001/sig000000bd ),
    .I5(\blk00000001/sig000000be ),
    .O(\blk00000001/sig000001b1 )
  );
  LUT6 #(
    .INIT ( 64'h0000002828000000 ))
  \blk00000001/blk000001f2  (
    .I0(\blk00000001/sig000000b9 ),
    .I1(\blk00000001/sig000000be ),
    .I2(\blk00000001/sig000000bc ),
    .I3(\blk00000001/sig000000bd ),
    .I4(\blk00000001/sig000000ba ),
    .I5(\blk00000001/sig000000bb ),
    .O(\blk00000001/sig000001b2 )
  );
  LUT6 #(
    .INIT ( 64'h0010000404004000 ))
  \blk00000001/blk000001f1  (
    .I0(\blk00000001/sig000000b9 ),
    .I1(\blk00000001/sig000000bb ),
    .I2(\blk00000001/sig000000ba ),
    .I3(\blk00000001/sig000000be ),
    .I4(\blk00000001/sig000000bd ),
    .I5(\blk00000001/sig000000bc ),
    .O(\blk00000001/sig000001b3 )
  );
  LUT6 #(
    .INIT ( 64'h0000002828000000 ))
  \blk00000001/blk000001f0  (
    .I0(\blk00000001/sig000000b9 ),
    .I1(\blk00000001/sig000000bd ),
    .I2(\blk00000001/sig000000ba ),
    .I3(\blk00000001/sig000000be ),
    .I4(\blk00000001/sig000000bb ),
    .I5(\blk00000001/sig000000bc ),
    .O(\blk00000001/sig000001b4 )
  );
  LUT6 #(
    .INIT ( 64'h0400001000101000 ))
  \blk00000001/blk000001ef  (
    .I0(\blk00000001/sig000000b9 ),
    .I1(\blk00000001/sig000000bb ),
    .I2(\blk00000001/sig000000bc ),
    .I3(\blk00000001/sig000000ba ),
    .I4(\blk00000001/sig000000bd ),
    .I5(\blk00000001/sig000000be ),
    .O(\blk00000001/sig000001b5 )
  );
  LUT5 #(
    .INIT ( 32'h00800200 ))
  \blk00000001/blk000001ee  (
    .I0(\blk00000001/sig000000b9 ),
    .I1(\blk00000001/sig000000ba ),
    .I2(\blk00000001/sig000000bb ),
    .I3(\blk00000001/sig000000bc ),
    .I4(\blk00000001/sig000000bd ),
    .O(\blk00000001/sig000001b6 )
  );
  LUT6 #(
    .INIT ( 64'h0010100004000010 ))
  \blk00000001/blk000001ed  (
    .I0(\blk00000001/sig000000b9 ),
    .I1(\blk00000001/sig000000bb ),
    .I2(\blk00000001/sig000000bc ),
    .I3(\blk00000001/sig000000ba ),
    .I4(\blk00000001/sig000000bd ),
    .I5(\blk00000001/sig000000be ),
    .O(\blk00000001/sig000001b7 )
  );
  LUT6 #(
    .INIT ( 64'h0000002828000000 ))
  \blk00000001/blk000001ec  (
    .I0(\blk00000001/sig000000b9 ),
    .I1(\blk00000001/sig000000bd ),
    .I2(\blk00000001/sig000000ba ),
    .I3(\blk00000001/sig000000be ),
    .I4(\blk00000001/sig000000bc ),
    .I5(\blk00000001/sig000000bb ),
    .O(\blk00000001/sig000001b8 )
  );
  LUT6 #(
    .INIT ( 64'h1000040000040040 ))
  \blk00000001/blk000001eb  (
    .I0(\blk00000001/sig000000b9 ),
    .I1(\blk00000001/sig000000bb ),
    .I2(\blk00000001/sig000000ba ),
    .I3(\blk00000001/sig000000bc ),
    .I4(\blk00000001/sig000000bd ),
    .I5(\blk00000001/sig000000be ),
    .O(\blk00000001/sig000001b9 )
  );
  LUT6 #(
    .INIT ( 64'h0820000000000820 ))
  \blk00000001/blk000001ea  (
    .I0(\blk00000001/sig000000b9 ),
    .I1(\blk00000001/sig000000ba ),
    .I2(\blk00000001/sig000000bb ),
    .I3(\blk00000001/sig000000bd ),
    .I4(\blk00000001/sig000000bc ),
    .I5(\blk00000001/sig000000be ),
    .O(\blk00000001/sig000001ba )
  );
  LUT6 #(
    .INIT ( 64'h0400400000100004 ))
  \blk00000001/blk000001e9  (
    .I0(\blk00000001/sig000000b9 ),
    .I1(\blk00000001/sig000000bb ),
    .I2(\blk00000001/sig000000ba ),
    .I3(\blk00000001/sig000000bc ),
    .I4(\blk00000001/sig000000bd ),
    .I5(\blk00000001/sig000000be ),
    .O(\blk00000001/sig000001bb )
  );
  LUT6 #(
    .INIT ( 64'h2800000000000028 ))
  \blk00000001/blk000001e8  (
    .I0(\blk00000001/sig000000b9 ),
    .I1(\blk00000001/sig000000ba ),
    .I2(\blk00000001/sig000000bd ),
    .I3(\blk00000001/sig000000bb ),
    .I4(\blk00000001/sig000000bc ),
    .I5(\blk00000001/sig000000be ),
    .O(\blk00000001/sig000001bc )
  );
  LUT6 #(
    .INIT ( 64'h4001000000010004 ))
  \blk00000001/blk000001e7  (
    .I0(\blk00000001/sig000000b9 ),
    .I1(\blk00000001/sig000000ba ),
    .I2(\blk00000001/sig000000bb ),
    .I3(\blk00000001/sig000000bc ),
    .I4(\blk00000001/sig000000bd ),
    .I5(\blk00000001/sig000000be ),
    .O(\blk00000001/sig000001bd )
  );
  LUT6 #(
    .INIT ( 64'h8000000000000002 ))
  \blk00000001/blk000001e6  (
    .I0(\blk00000001/sig000000b9 ),
    .I1(\blk00000001/sig000000ba ),
    .I2(\blk00000001/sig000000bb ),
    .I3(\blk00000001/sig000000bc ),
    .I4(\blk00000001/sig000000bd ),
    .I5(\blk00000001/sig000000be ),
    .O(\blk00000001/sig000001be )
  );
  LUT5 #(
    .INIT ( 32'h00000001 ))
  \blk00000001/blk000001e5  (
    .I0(\blk00000001/sig000000b9 ),
    .I1(\blk00000001/sig000000ba ),
    .I2(\blk00000001/sig000000bb ),
    .I3(\blk00000001/sig000000bc ),
    .I4(\blk00000001/sig000000bd ),
    .O(\blk00000001/sig000001bf )
  );
  LUT6 #(
    .INIT ( 64'h666666666666666A ))
  \blk00000001/blk000001e4  (
    .I0(\blk00000001/sig000000bd ),
    .I1(\blk00000001/sig000000be ),
    .I2(\blk00000001/sig000000bc ),
    .I3(\blk00000001/sig000000bb ),
    .I4(\blk00000001/sig000000ba ),
    .I5(\blk00000001/sig000000b9 ),
    .O(\blk00000001/sig00000185 )
  );
  LUT6 #(
    .INIT ( 64'h0818181018181810 ))
  \blk00000001/blk000001e3  (
    .I0(\blk00000001/sig000000bc ),
    .I1(\blk00000001/sig000000bd ),
    .I2(\blk00000001/sig000000be ),
    .I3(\blk00000001/sig000000ba ),
    .I4(\blk00000001/sig000000bb ),
    .I5(\blk00000001/sig000000b9 ),
    .O(\blk00000001/sig00000184 )
  );
  INV   \blk00000001/blk000001e2  (
    .I(\blk00000001/sig0000010e ),
    .O(\blk00000001/sig000000c4 )
  );
  INV   \blk00000001/blk000001e1  (
    .I(\blk00000001/sig0000010d ),
    .O(\blk00000001/sig000000c6 )
  );
  INV   \blk00000001/blk000001e0  (
    .I(\blk00000001/sig0000010c ),
    .O(\blk00000001/sig000000c8 )
  );
  INV   \blk00000001/blk000001df  (
    .I(\blk00000001/sig00000185 ),
    .O(\blk00000001/sig00000200 )
  );
  LUT5 #(
    .INIT ( 32'hFF151515 ))
  \blk00000001/blk000001de  (
    .I0(\blk00000001/sig000000b8 ),
    .I1(\blk00000001/sig0000013d ),
    .I2(\blk00000001/sig0000012a ),
    .I3(\blk00000001/sig00000142 ),
    .I4(\blk00000001/sig0000012c ),
    .O(\blk00000001/sig0000027b )
  );
  LUT6 #(
    .INIT ( 64'h0000070007000000 ))
  \blk00000001/blk000001dd  (
    .I0(\blk00000001/sig00000129 ),
    .I1(\blk00000001/sig0000012b ),
    .I2(\blk00000001/sig00000114 ),
    .I3(\blk00000001/sig00000113 ),
    .I4(\blk00000001/sig00000117 ),
    .I5(\blk00000001/sig00000116 ),
    .O(\blk00000001/sig000000f7 )
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \blk00000001/blk000001dc  (
    .I0(\blk00000001/sig00000085 ),
    .I1(\blk00000001/sig00000106 ),
    .I2(\blk00000001/sig00000105 ),
    .O(m_axis_result_tdata[21])
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \blk00000001/blk000001db  (
    .I0(\blk00000001/sig00000082 ),
    .I1(\blk00000001/sig00000106 ),
    .I2(\blk00000001/sig00000105 ),
    .O(m_axis_result_tdata[18])
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \blk00000001/blk000001da  (
    .I0(\blk00000001/sig00000084 ),
    .I1(\blk00000001/sig00000106 ),
    .I2(\blk00000001/sig00000105 ),
    .O(m_axis_result_tdata[20])
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \blk00000001/blk000001d9  (
    .I0(\blk00000001/sig00000083 ),
    .I1(\blk00000001/sig00000106 ),
    .I2(\blk00000001/sig00000105 ),
    .O(m_axis_result_tdata[19])
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \blk00000001/blk000001d8  (
    .I0(\blk00000001/sig0000007f ),
    .I1(\blk00000001/sig00000106 ),
    .I2(\blk00000001/sig00000105 ),
    .O(m_axis_result_tdata[15])
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \blk00000001/blk000001d7  (
    .I0(\blk00000001/sig00000081 ),
    .I1(\blk00000001/sig00000106 ),
    .I2(\blk00000001/sig00000105 ),
    .O(m_axis_result_tdata[17])
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \blk00000001/blk000001d6  (
    .I0(\blk00000001/sig00000080 ),
    .I1(\blk00000001/sig00000106 ),
    .I2(\blk00000001/sig00000105 ),
    .O(m_axis_result_tdata[16])
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \blk00000001/blk000001d5  (
    .I0(\blk00000001/sig0000007c ),
    .I1(\blk00000001/sig00000106 ),
    .I2(\blk00000001/sig00000105 ),
    .O(m_axis_result_tdata[12])
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \blk00000001/blk000001d4  (
    .I0(\blk00000001/sig0000007e ),
    .I1(\blk00000001/sig00000106 ),
    .I2(\blk00000001/sig00000105 ),
    .O(m_axis_result_tdata[14])
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \blk00000001/blk000001d3  (
    .I0(\blk00000001/sig0000007d ),
    .I1(\blk00000001/sig00000106 ),
    .I2(\blk00000001/sig00000105 ),
    .O(m_axis_result_tdata[13])
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \blk00000001/blk000001d2  (
    .I0(\blk00000001/sig00000079 ),
    .I1(\blk00000001/sig00000106 ),
    .I2(\blk00000001/sig00000105 ),
    .O(m_axis_result_tdata[9])
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \blk00000001/blk000001d1  (
    .I0(\blk00000001/sig0000007b ),
    .I1(\blk00000001/sig00000106 ),
    .I2(\blk00000001/sig00000105 ),
    .O(m_axis_result_tdata[11])
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \blk00000001/blk000001d0  (
    .I0(\blk00000001/sig0000007a ),
    .I1(\blk00000001/sig00000106 ),
    .I2(\blk00000001/sig00000105 ),
    .O(m_axis_result_tdata[10])
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \blk00000001/blk000001cf  (
    .I0(\blk00000001/sig00000076 ),
    .I1(\blk00000001/sig00000106 ),
    .I2(\blk00000001/sig00000105 ),
    .O(m_axis_result_tdata[6])
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \blk00000001/blk000001ce  (
    .I0(\blk00000001/sig00000078 ),
    .I1(\blk00000001/sig00000106 ),
    .I2(\blk00000001/sig00000105 ),
    .O(m_axis_result_tdata[8])
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \blk00000001/blk000001cd  (
    .I0(\blk00000001/sig00000077 ),
    .I1(\blk00000001/sig00000106 ),
    .I2(\blk00000001/sig00000105 ),
    .O(m_axis_result_tdata[7])
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \blk00000001/blk000001cc  (
    .I0(\blk00000001/sig00000073 ),
    .I1(\blk00000001/sig00000106 ),
    .I2(\blk00000001/sig00000105 ),
    .O(m_axis_result_tdata[3])
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \blk00000001/blk000001cb  (
    .I0(\blk00000001/sig00000075 ),
    .I1(\blk00000001/sig00000106 ),
    .I2(\blk00000001/sig00000105 ),
    .O(m_axis_result_tdata[5])
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \blk00000001/blk000001ca  (
    .I0(\blk00000001/sig00000074 ),
    .I1(\blk00000001/sig00000106 ),
    .I2(\blk00000001/sig00000105 ),
    .O(m_axis_result_tdata[4])
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \blk00000001/blk000001c9  (
    .I0(\blk00000001/sig00000072 ),
    .I1(\blk00000001/sig00000106 ),
    .I2(\blk00000001/sig00000105 ),
    .O(m_axis_result_tdata[2])
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \blk00000001/blk000001c8  (
    .I0(\blk00000001/sig00000071 ),
    .I1(\blk00000001/sig00000106 ),
    .I2(\blk00000001/sig00000105 ),
    .O(m_axis_result_tdata[1])
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \blk00000001/blk000001c7  (
    .I0(\blk00000001/sig00000070 ),
    .I1(\blk00000001/sig00000106 ),
    .I2(\blk00000001/sig00000105 ),
    .O(m_axis_result_tdata[0])
  );
  LUT5 #(
    .INIT ( 32'hAAAAAA2A ))
  \blk00000001/blk000001c6  (
    .I0(\blk00000001/sig0000010f ),
    .I1(\blk00000001/sig00000253 ),
    .I2(\blk00000001/sig0000024b ),
    .I3(\blk00000001/sig00000111 ),
    .I4(\blk00000001/sig00000110 ),
    .O(m_axis_result_tdata[31])
  );
  LUT3 #(
    .INIT ( 8'hF4 ))
  \blk00000001/blk000001c5  (
    .I0(\blk00000001/sig00000106 ),
    .I1(\blk00000001/sig0000006f ),
    .I2(\blk00000001/sig00000105 ),
    .O(m_axis_result_tdata[30])
  );
  LUT3 #(
    .INIT ( 8'hF4 ))
  \blk00000001/blk000001c4  (
    .I0(\blk00000001/sig00000106 ),
    .I1(\blk00000001/sig0000006e ),
    .I2(\blk00000001/sig00000105 ),
    .O(m_axis_result_tdata[29])
  );
  LUT3 #(
    .INIT ( 8'hF4 ))
  \blk00000001/blk000001c3  (
    .I0(\blk00000001/sig00000106 ),
    .I1(\blk00000001/sig0000006d ),
    .I2(\blk00000001/sig00000105 ),
    .O(m_axis_result_tdata[28])
  );
  LUT3 #(
    .INIT ( 8'hF4 ))
  \blk00000001/blk000001c2  (
    .I0(\blk00000001/sig00000106 ),
    .I1(\blk00000001/sig0000006c ),
    .I2(\blk00000001/sig00000105 ),
    .O(m_axis_result_tdata[27])
  );
  LUT3 #(
    .INIT ( 8'hF4 ))
  \blk00000001/blk000001c1  (
    .I0(\blk00000001/sig00000106 ),
    .I1(\blk00000001/sig0000006b ),
    .I2(\blk00000001/sig00000105 ),
    .O(m_axis_result_tdata[26])
  );
  LUT3 #(
    .INIT ( 8'hF4 ))
  \blk00000001/blk000001c0  (
    .I0(\blk00000001/sig00000106 ),
    .I1(\blk00000001/sig0000006a ),
    .I2(\blk00000001/sig00000105 ),
    .O(m_axis_result_tdata[25])
  );
  LUT3 #(
    .INIT ( 8'hF4 ))
  \blk00000001/blk000001bf  (
    .I0(\blk00000001/sig00000106 ),
    .I1(\blk00000001/sig00000069 ),
    .I2(\blk00000001/sig00000105 ),
    .O(m_axis_result_tdata[24])
  );
  LUT3 #(
    .INIT ( 8'hF4 ))
  \blk00000001/blk000001be  (
    .I0(\blk00000001/sig00000106 ),
    .I1(\blk00000001/sig00000068 ),
    .I2(\blk00000001/sig00000105 ),
    .O(m_axis_result_tdata[23])
  );
  LUT5 #(
    .INIT ( 32'h77777770 ))
  \blk00000001/blk000001bd  (
    .I0(\blk00000001/sig00000129 ),
    .I1(\blk00000001/sig0000012b ),
    .I2(\blk00000001/sig00000113 ),
    .I3(\blk00000001/sig00000112 ),
    .I4(\blk00000001/sig00000114 ),
    .O(\blk00000001/sig000000f9 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF51154004 ))
  \blk00000001/blk000001bc  (
    .I0(\blk00000001/sig00000114 ),
    .I1(\blk00000001/sig00000113 ),
    .I2(\blk00000001/sig00000117 ),
    .I3(\blk00000001/sig00000116 ),
    .I4(\blk00000001/sig00000112 ),
    .I5(\blk00000001/sig00000115 ),
    .O(\blk00000001/sig000000fa )
  );
  LUT2 #(
    .INIT ( 4'h7 ))
  \blk00000001/blk000001bb  (
    .I0(\blk00000001/sig00000129 ),
    .I1(\blk00000001/sig0000012b ),
    .O(\blk00000001/sig000001c2 )
  );
  LUT6 #(
    .INIT ( 64'h95999555A6AAA666 ))
  \blk00000001/blk000001ba  (
    .I0(\blk00000001/sig00000107 ),
    .I1(\blk00000001/sig0000024f ),
    .I2(\blk00000001/sig00000244 ),
    .I3(\blk00000001/sig0000024d ),
    .I4(\blk00000001/sig00000246 ),
    .I5(\blk00000001/sig00000279 ),
    .O(\blk00000001/sig000000d2 )
  );
  LUT6 #(
    .INIT ( 64'h95999555A6AAA666 ))
  \blk00000001/blk000001b9  (
    .I0(\blk00000001/sig00000108 ),
    .I1(\blk00000001/sig0000024f ),
    .I2(\blk00000001/sig00000243 ),
    .I3(\blk00000001/sig0000024d ),
    .I4(\blk00000001/sig00000245 ),
    .I5(\blk00000001/sig00000278 ),
    .O(\blk00000001/sig000000d0 )
  );
  LUT4 #(
    .INIT ( 16'hA695 ))
  \blk00000001/blk000001b8  (
    .I0(\blk00000001/sig00000109 ),
    .I1(\blk00000001/sig0000024f ),
    .I2(\blk00000001/sig0000024d ),
    .I3(\blk00000001/sig00000251 ),
    .O(\blk00000001/sig000000ce )
  );
  LUT6 #(
    .INIT ( 64'h8088808A8088808C ))
  \blk00000001/blk000001b7  (
    .I0(\blk00000001/sig00000117 ),
    .I1(\blk00000001/sig00000116 ),
    .I2(\blk00000001/sig00000115 ),
    .I3(\blk00000001/sig00000114 ),
    .I4(\blk00000001/sig00000113 ),
    .I5(\blk00000001/sig0000027b ),
    .O(\blk00000001/sig000000f8 )
  );
  LUT5 #(
    .INIT ( 32'h02020257 ))
  \blk00000001/blk000001b6  (
    .I0(\blk00000001/sig000000b8 ),
    .I1(\blk00000001/sig000000ad ),
    .I2(\blk00000001/sig000000ac ),
    .I3(\blk00000001/sig00000096 ),
    .I4(\blk00000001/sig00000095 ),
    .O(\blk00000001/sig000001c3 )
  );
  LUT5 #(
    .INIT ( 32'h02020257 ))
  \blk00000001/blk000001b5  (
    .I0(\blk00000001/sig000000b8 ),
    .I1(\blk00000001/sig000000ab ),
    .I2(\blk00000001/sig000000aa ),
    .I3(\blk00000001/sig00000094 ),
    .I4(\blk00000001/sig00000093 ),
    .O(\blk00000001/sig000001c4 )
  );
  LUT5 #(
    .INIT ( 32'h02020257 ))
  \blk00000001/blk000001b4  (
    .I0(\blk00000001/sig000000b8 ),
    .I1(\blk00000001/sig000000a9 ),
    .I2(\blk00000001/sig000000a8 ),
    .I3(\blk00000001/sig00000092 ),
    .I4(\blk00000001/sig00000091 ),
    .O(\blk00000001/sig000001c5 )
  );
  LUT5 #(
    .INIT ( 32'h02020257 ))
  \blk00000001/blk000001b3  (
    .I0(\blk00000001/sig000000b8 ),
    .I1(\blk00000001/sig000000a7 ),
    .I2(\blk00000001/sig000000a6 ),
    .I3(\blk00000001/sig00000090 ),
    .I4(\blk00000001/sig0000008f ),
    .O(\blk00000001/sig000001c6 )
  );
  LUT5 #(
    .INIT ( 32'h02020257 ))
  \blk00000001/blk000001b2  (
    .I0(\blk00000001/sig000000b8 ),
    .I1(\blk00000001/sig000000a5 ),
    .I2(\blk00000001/sig000000a4 ),
    .I3(\blk00000001/sig0000008e ),
    .I4(\blk00000001/sig0000008d ),
    .O(\blk00000001/sig000001c7 )
  );
  LUT5 #(
    .INIT ( 32'h02020257 ))
  \blk00000001/blk000001b1  (
    .I0(\blk00000001/sig000000b8 ),
    .I1(\blk00000001/sig000000a3 ),
    .I2(\blk00000001/sig000000a2 ),
    .I3(\blk00000001/sig0000008c ),
    .I4(\blk00000001/sig0000008b ),
    .O(\blk00000001/sig000001c8 )
  );
  LUT5 #(
    .INIT ( 32'h02020257 ))
  \blk00000001/blk000001b0  (
    .I0(\blk00000001/sig000000b8 ),
    .I1(\blk00000001/sig000000a1 ),
    .I2(\blk00000001/sig000000a0 ),
    .I3(\blk00000001/sig0000008a ),
    .I4(\blk00000001/sig00000089 ),
    .O(\blk00000001/sig000001c9 )
  );
  LUT4 #(
    .INIT ( 16'hFFD8 ))
  \blk00000001/blk000001af  (
    .I0(\blk00000001/sig000000b8 ),
    .I1(\blk00000001/sig000000a9 ),
    .I2(\blk00000001/sig00000092 ),
    .I3(\blk00000001/sig00000185 ),
    .O(\blk00000001/sig000001f2 )
  );
  LUT4 #(
    .INIT ( 16'h00AC ))
  \blk00000001/blk000001ae  (
    .I0(\blk00000001/sig000000ad ),
    .I1(\blk00000001/sig00000096 ),
    .I2(\blk00000001/sig000000b8 ),
    .I3(\blk00000001/sig00000185 ),
    .O(\blk00000001/sig000001f6 )
  );
  LUT4 #(
    .INIT ( 16'h00AC ))
  \blk00000001/blk000001ad  (
    .I0(\blk00000001/sig000000ac ),
    .I1(\blk00000001/sig00000095 ),
    .I2(\blk00000001/sig000000b8 ),
    .I3(\blk00000001/sig00000185 ),
    .O(\blk00000001/sig000001f5 )
  );
  LUT4 #(
    .INIT ( 16'h00AC ))
  \blk00000001/blk000001ac  (
    .I0(\blk00000001/sig000000ab ),
    .I1(\blk00000001/sig00000094 ),
    .I2(\blk00000001/sig000000b8 ),
    .I3(\blk00000001/sig00000185 ),
    .O(\blk00000001/sig000001f4 )
  );
  LUT4 #(
    .INIT ( 16'h00AC ))
  \blk00000001/blk000001ab  (
    .I0(\blk00000001/sig000000aa ),
    .I1(\blk00000001/sig00000093 ),
    .I2(\blk00000001/sig000000b8 ),
    .I3(\blk00000001/sig00000185 ),
    .O(\blk00000001/sig000001f3 )
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \blk00000001/blk000001aa  (
    .I0(\blk00000001/sig00000089 ),
    .I1(\blk00000001/sig000000a0 ),
    .I2(\blk00000001/sig000000ae ),
    .I3(\blk00000001/sig00000097 ),
    .I4(\blk00000001/sig000000b8 ),
    .I5(\blk00000001/sig00000185 ),
    .O(\blk00000001/sig000001e9 )
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \blk00000001/blk000001a9  (
    .I0(\blk00000001/sig0000008a ),
    .I1(\blk00000001/sig000000a1 ),
    .I2(\blk00000001/sig000000af ),
    .I3(\blk00000001/sig00000098 ),
    .I4(\blk00000001/sig000000b8 ),
    .I5(\blk00000001/sig00000185 ),
    .O(\blk00000001/sig000001ea )
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \blk00000001/blk000001a8  (
    .I0(\blk00000001/sig0000008b ),
    .I1(\blk00000001/sig000000a2 ),
    .I2(\blk00000001/sig000000b0 ),
    .I3(\blk00000001/sig00000099 ),
    .I4(\blk00000001/sig000000b8 ),
    .I5(\blk00000001/sig00000185 ),
    .O(\blk00000001/sig000001eb )
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \blk00000001/blk000001a7  (
    .I0(\blk00000001/sig0000008c ),
    .I1(\blk00000001/sig000000a3 ),
    .I2(\blk00000001/sig000000b1 ),
    .I3(\blk00000001/sig0000009a ),
    .I4(\blk00000001/sig000000b8 ),
    .I5(\blk00000001/sig00000185 ),
    .O(\blk00000001/sig000001ec )
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \blk00000001/blk000001a6  (
    .I0(\blk00000001/sig0000008d ),
    .I1(\blk00000001/sig000000a4 ),
    .I2(\blk00000001/sig000000b2 ),
    .I3(\blk00000001/sig0000009b ),
    .I4(\blk00000001/sig000000b8 ),
    .I5(\blk00000001/sig00000185 ),
    .O(\blk00000001/sig000001ed )
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \blk00000001/blk000001a5  (
    .I0(\blk00000001/sig0000008e ),
    .I1(\blk00000001/sig000000a5 ),
    .I2(\blk00000001/sig000000b3 ),
    .I3(\blk00000001/sig0000009c ),
    .I4(\blk00000001/sig000000b8 ),
    .I5(\blk00000001/sig00000185 ),
    .O(\blk00000001/sig000001ee )
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \blk00000001/blk000001a4  (
    .I0(\blk00000001/sig0000008f ),
    .I1(\blk00000001/sig000000a6 ),
    .I2(\blk00000001/sig000000b4 ),
    .I3(\blk00000001/sig0000009d ),
    .I4(\blk00000001/sig000000b8 ),
    .I5(\blk00000001/sig00000185 ),
    .O(\blk00000001/sig000001ef )
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \blk00000001/blk000001a3  (
    .I0(\blk00000001/sig00000090 ),
    .I1(\blk00000001/sig000000a7 ),
    .I2(\blk00000001/sig000000b5 ),
    .I3(\blk00000001/sig0000009e ),
    .I4(\blk00000001/sig000000b8 ),
    .I5(\blk00000001/sig00000185 ),
    .O(\blk00000001/sig000001f0 )
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \blk00000001/blk000001a2  (
    .I0(\blk00000001/sig00000091 ),
    .I1(\blk00000001/sig000000a8 ),
    .I2(\blk00000001/sig000000b6 ),
    .I3(\blk00000001/sig0000009f ),
    .I4(\blk00000001/sig000000b8 ),
    .I5(\blk00000001/sig00000185 ),
    .O(\blk00000001/sig000001f1 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000001a1  (
    .I0(\blk00000001/sig00000185 ),
    .O(\blk00000001/sig0000027a )
  );
  LUT3 #(
    .INIT ( 8'h1B ))
  \blk00000001/blk000001a0  (
    .I0(\blk00000001/sig00000251 ),
    .I1(\blk00000001/sig0000024a ),
    .I2(\blk00000001/sig00000248 ),
    .O(\blk00000001/sig00000279 )
  );
  LUT3 #(
    .INIT ( 8'h1B ))
  \blk00000001/blk0000019f  (
    .I0(\blk00000001/sig00000251 ),
    .I1(\blk00000001/sig00000249 ),
    .I2(\blk00000001/sig00000247 ),
    .O(\blk00000001/sig00000278 )
  );
  LUT4 #(
    .INIT ( 16'h1000 ))
  \blk00000001/blk0000019e  (
    .I0(\blk00000001/sig00000192 ),
    .I1(\blk00000001/sig00000188 ),
    .I2(\blk00000001/sig00000276 ),
    .I3(\blk00000001/sig00000277 ),
    .O(\blk00000001/sig00000183 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \blk00000001/blk0000019d  (
    .I0(\blk00000001/sig0000018f ),
    .I1(\blk00000001/sig0000018e ),
    .I2(\blk00000001/sig00000190 ),
    .I3(\blk00000001/sig00000191 ),
    .I4(\blk00000001/sig00000186 ),
    .I5(\blk00000001/sig00000187 ),
    .O(\blk00000001/sig00000277 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000010000 ))
  \blk00000001/blk0000019c  (
    .I0(\blk00000001/sig00000189 ),
    .I1(\blk00000001/sig0000018a ),
    .I2(\blk00000001/sig0000018b ),
    .I3(\blk00000001/sig0000018c ),
    .I4(\blk00000001/sig000001c0 ),
    .I5(\blk00000001/sig0000018d ),
    .O(\blk00000001/sig00000276 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000008001 ))
  \blk00000001/blk0000019b  (
    .I0(\blk00000001/sig000000bf ),
    .I1(\blk00000001/sig000000c0 ),
    .I2(\blk00000001/sig000000c1 ),
    .I3(\blk00000001/sig000000be ),
    .I4(\blk00000001/sig00000275 ),
    .I5(\blk00000001/sig00000184 ),
    .O(\blk00000001/sig000001af )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \blk00000001/blk0000019a  (
    .I0(\blk00000001/sig00000129 ),
    .I1(\blk00000001/sig0000012b ),
    .O(\blk00000001/sig00000275 )
  );
  LUT6 #(
    .INIT ( 64'h8000000000000000 ))
  \blk00000001/blk00000199  (
    .I0(s_axis_a_tdata[30]),
    .I1(s_axis_a_tdata[29]),
    .I2(s_axis_a_tdata[28]),
    .I3(s_axis_a_tdata[27]),
    .I4(s_axis_a_tdata[26]),
    .I5(\blk00000001/sig00000274 ),
    .O(\blk00000001/sig00000130 )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \blk00000001/blk00000198  (
    .I0(s_axis_a_tdata[25]),
    .I1(s_axis_a_tdata[24]),
    .I2(s_axis_a_tdata[23]),
    .O(\blk00000001/sig00000274 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \blk00000001/blk00000197  (
    .I0(s_axis_a_tdata[30]),
    .I1(s_axis_a_tdata[29]),
    .I2(s_axis_a_tdata[28]),
    .I3(s_axis_a_tdata[27]),
    .I4(s_axis_a_tdata[26]),
    .I5(\blk00000001/sig00000273 ),
    .O(\blk00000001/sig0000012f )
  );
  LUT3 #(
    .INIT ( 8'hFE ))
  \blk00000001/blk00000196  (
    .I0(s_axis_a_tdata[25]),
    .I1(s_axis_a_tdata[24]),
    .I2(s_axis_a_tdata[23]),
    .O(\blk00000001/sig00000273 )
  );
  LUT6 #(
    .INIT ( 64'h8000000000000000 ))
  \blk00000001/blk00000195  (
    .I0(s_axis_b_tdata[30]),
    .I1(s_axis_b_tdata[29]),
    .I2(s_axis_b_tdata[28]),
    .I3(s_axis_b_tdata[27]),
    .I4(s_axis_b_tdata[26]),
    .I5(\blk00000001/sig00000272 ),
    .O(\blk00000001/sig0000012e )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \blk00000001/blk00000194  (
    .I0(s_axis_b_tdata[25]),
    .I1(s_axis_b_tdata[24]),
    .I2(s_axis_b_tdata[23]),
    .O(\blk00000001/sig00000272 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \blk00000001/blk00000193  (
    .I0(s_axis_b_tdata[30]),
    .I1(s_axis_b_tdata[29]),
    .I2(s_axis_b_tdata[28]),
    .I3(s_axis_b_tdata[27]),
    .I4(s_axis_b_tdata[26]),
    .I5(\blk00000001/sig00000271 ),
    .O(\blk00000001/sig0000012d )
  );
  LUT3 #(
    .INIT ( 8'hFE ))
  \blk00000001/blk00000192  (
    .I0(s_axis_b_tdata[25]),
    .I1(s_axis_b_tdata[24]),
    .I2(s_axis_b_tdata[23]),
    .O(\blk00000001/sig00000271 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \blk00000001/blk00000191  (
    .I0(\blk00000001/sig00000104 ),
    .I1(\blk00000001/sig00000103 ),
    .I2(\blk00000001/sig00000102 ),
    .I3(\blk00000001/sig00000101 ),
    .I4(\blk00000001/sig00000100 ),
    .I5(\blk00000001/sig00000270 ),
    .O(\blk00000001/sig000000eb )
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \blk00000001/blk00000190  (
    .I0(\blk00000001/sig000000ff ),
    .I1(\blk00000001/sig000000fe ),
    .I2(\blk00000001/sig000000fd ),
    .I3(\blk00000001/sig000000fc ),
    .I4(\blk00000001/sig000000fb ),
    .O(\blk00000001/sig00000270 )
  );
  LUT6 #(
    .INIT ( 64'h1000000000000000 ))
  \blk00000001/blk0000018f  (
    .I0(\blk00000001/sig00000104 ),
    .I1(\blk00000001/sig00000103 ),
    .I2(\blk00000001/sig00000102 ),
    .I3(\blk00000001/sig00000101 ),
    .I4(\blk00000001/sig00000100 ),
    .I5(\blk00000001/sig0000026f ),
    .O(\blk00000001/sig000000ec )
  );
  LUT5 #(
    .INIT ( 32'h80000000 ))
  \blk00000001/blk0000018e  (
    .I0(\blk00000001/sig000000ff ),
    .I1(\blk00000001/sig000000fe ),
    .I2(\blk00000001/sig000000fd ),
    .I3(\blk00000001/sig000000fc ),
    .I4(\blk00000001/sig000000fb ),
    .O(\blk00000001/sig0000026f )
  );
  LUT3 #(
    .INIT ( 8'h54 ))
  \blk00000001/blk0000018d  (
    .I0(\blk00000001/sig00000106 ),
    .I1(\blk00000001/sig00000105 ),
    .I2(\blk00000001/sig00000086 ),
    .O(m_axis_result_tdata[22])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \blk00000001/blk0000018c  (
    .I0(\blk00000001/sig00000253 ),
    .I1(\blk00000001/sig0000024b ),
    .O(\blk00000001/sig00000128 )
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \blk00000001/blk0000018b  (
    .I0(\blk00000001/sig00000252 ),
    .I1(\blk00000001/sig00000222 ),
    .O(\blk00000001/sig00000223 )
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \blk00000001/blk0000018a  (
    .I0(\blk00000001/sig00000205 ),
    .I1(\blk00000001/sig00000222 ),
    .I2(\blk00000001/sig00000252 ),
    .O(\blk00000001/sig00000224 )
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \blk00000001/blk00000189  (
    .I0(\blk00000001/sig00000221 ),
    .I1(\blk00000001/sig00000252 ),
    .I2(\blk00000001/sig00000251 ),
    .O(\blk00000001/sig00000225 )
  );
  LUT4 #(
    .INIT ( 16'h1000 ))
  \blk00000001/blk00000188  (
    .I0(\blk00000001/sig00000221 ),
    .I1(\blk00000001/sig00000251 ),
    .I2(\blk00000001/sig00000252 ),
    .I3(\blk00000001/sig00000220 ),
    .O(\blk00000001/sig00000226 )
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \blk00000001/blk00000187  (
    .I0(\blk00000001/sig0000021f ),
    .I1(\blk00000001/sig00000251 ),
    .I2(\blk00000001/sig00000250 ),
    .O(\blk00000001/sig00000227 )
  );
  LUT4 #(
    .INIT ( 16'h1000 ))
  \blk00000001/blk00000186  (
    .I0(\blk00000001/sig0000021f ),
    .I1(\blk00000001/sig00000250 ),
    .I2(\blk00000001/sig00000251 ),
    .I3(\blk00000001/sig0000021e ),
    .O(\blk00000001/sig00000228 )
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \blk00000001/blk00000185  (
    .I0(\blk00000001/sig0000021d ),
    .I1(\blk00000001/sig00000250 ),
    .I2(\blk00000001/sig0000024f ),
    .O(\blk00000001/sig00000229 )
  );
  LUT4 #(
    .INIT ( 16'h1000 ))
  \blk00000001/blk00000184  (
    .I0(\blk00000001/sig0000021d ),
    .I1(\blk00000001/sig0000024f ),
    .I2(\blk00000001/sig00000250 ),
    .I3(\blk00000001/sig0000021c ),
    .O(\blk00000001/sig0000022a )
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \blk00000001/blk00000183  (
    .I0(\blk00000001/sig0000021b ),
    .I1(\blk00000001/sig0000024f ),
    .I2(\blk00000001/sig0000024e ),
    .O(\blk00000001/sig0000022b )
  );
  LUT4 #(
    .INIT ( 16'h1000 ))
  \blk00000001/blk00000182  (
    .I0(\blk00000001/sig0000021b ),
    .I1(\blk00000001/sig0000024e ),
    .I2(\blk00000001/sig0000024f ),
    .I3(\blk00000001/sig0000021a ),
    .O(\blk00000001/sig0000022c )
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \blk00000001/blk00000181  (
    .I0(\blk00000001/sig00000219 ),
    .I1(\blk00000001/sig0000024e ),
    .I2(\blk00000001/sig0000024d ),
    .O(\blk00000001/sig0000022d )
  );
  LUT4 #(
    .INIT ( 16'h1000 ))
  \blk00000001/blk00000180  (
    .I0(\blk00000001/sig00000219 ),
    .I1(\blk00000001/sig0000024d ),
    .I2(\blk00000001/sig0000024e ),
    .I3(\blk00000001/sig00000218 ),
    .O(\blk00000001/sig0000022e )
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \blk00000001/blk0000017f  (
    .I0(\blk00000001/sig00000217 ),
    .I1(\blk00000001/sig0000024d ),
    .I2(\blk00000001/sig0000024c ),
    .O(\blk00000001/sig0000022f )
  );
  LUT4 #(
    .INIT ( 16'h1000 ))
  \blk00000001/blk0000017e  (
    .I0(\blk00000001/sig00000217 ),
    .I1(\blk00000001/sig0000024c ),
    .I2(\blk00000001/sig0000024d ),
    .I3(\blk00000001/sig00000216 ),
    .O(\blk00000001/sig00000230 )
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \blk00000001/blk0000017d  (
    .I0(\blk00000001/sig00000215 ),
    .I1(\blk00000001/sig0000024c ),
    .I2(\blk00000001/sig0000024b ),
    .O(\blk00000001/sig00000231 )
  );
  LUT4 #(
    .INIT ( 16'h1000 ))
  \blk00000001/blk0000017c  (
    .I0(\blk00000001/sig00000215 ),
    .I1(\blk00000001/sig0000024b ),
    .I2(\blk00000001/sig0000024c ),
    .I3(\blk00000001/sig00000214 ),
    .O(\blk00000001/sig00000232 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \blk00000001/blk0000017b  (
    .I0(\blk00000001/sig0000019c ),
    .I1(\blk00000001/sig00000087 ),
    .O(\blk00000001/sig0000025c )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \blk00000001/blk0000017a  (
    .I0(\blk00000001/sig0000019b ),
    .I1(\blk00000001/sig00000087 ),
    .O(\blk00000001/sig0000025b )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \blk00000001/blk00000179  (
    .I0(\blk00000001/sig0000019a ),
    .I1(\blk00000001/sig00000087 ),
    .O(\blk00000001/sig0000025a )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \blk00000001/blk00000178  (
    .I0(\blk00000001/sig00000199 ),
    .I1(\blk00000001/sig00000087 ),
    .O(\blk00000001/sig00000259 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \blk00000001/blk00000177  (
    .I0(\blk00000001/sig00000198 ),
    .I1(\blk00000001/sig00000087 ),
    .O(\blk00000001/sig00000258 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \blk00000001/blk00000176  (
    .I0(\blk00000001/sig00000197 ),
    .I1(\blk00000001/sig00000087 ),
    .O(\blk00000001/sig00000257 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \blk00000001/blk00000175  (
    .I0(\blk00000001/sig00000196 ),
    .I1(\blk00000001/sig00000087 ),
    .O(\blk00000001/sig00000256 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \blk00000001/blk00000174  (
    .I0(\blk00000001/sig00000195 ),
    .I1(\blk00000001/sig00000087 ),
    .O(\blk00000001/sig00000255 )
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \blk00000001/blk00000173  (
    .I0(\blk00000001/sig0000019d ),
    .I1(\blk00000001/sig000001ad ),
    .I2(\blk00000001/sig00000087 ),
    .O(\blk00000001/sig0000026d )
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \blk00000001/blk00000172  (
    .I0(\blk00000001/sig0000019c ),
    .I1(\blk00000001/sig000001ac ),
    .I2(\blk00000001/sig00000087 ),
    .O(\blk00000001/sig0000026c )
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \blk00000001/blk00000171  (
    .I0(\blk00000001/sig0000019b ),
    .I1(\blk00000001/sig000001ab ),
    .I2(\blk00000001/sig00000087 ),
    .O(\blk00000001/sig0000026b )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \blk00000001/blk00000170  (
    .I0(\blk00000001/sig000001aa ),
    .I1(\blk00000001/sig0000019a ),
    .I2(\blk00000001/sig00000087 ),
    .O(\blk00000001/sig0000026a )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \blk00000001/blk0000016f  (
    .I0(\blk00000001/sig000001a9 ),
    .I1(\blk00000001/sig00000199 ),
    .I2(\blk00000001/sig00000087 ),
    .O(\blk00000001/sig00000269 )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \blk00000001/blk0000016e  (
    .I0(\blk00000001/sig000001a8 ),
    .I1(\blk00000001/sig00000198 ),
    .I2(\blk00000001/sig00000087 ),
    .O(\blk00000001/sig00000268 )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \blk00000001/blk0000016d  (
    .I0(\blk00000001/sig000001a7 ),
    .I1(\blk00000001/sig00000197 ),
    .I2(\blk00000001/sig00000087 ),
    .O(\blk00000001/sig00000267 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \blk00000001/blk0000016c  (
    .I0(\blk00000001/sig00000194 ),
    .I1(\blk00000001/sig00000087 ),
    .O(\blk00000001/sig00000254 )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \blk00000001/blk0000016b  (
    .I0(\blk00000001/sig000001a6 ),
    .I1(\blk00000001/sig00000196 ),
    .I2(\blk00000001/sig00000087 ),
    .O(\blk00000001/sig00000266 )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \blk00000001/blk0000016a  (
    .I0(\blk00000001/sig000001a5 ),
    .I1(\blk00000001/sig00000195 ),
    .I2(\blk00000001/sig00000087 ),
    .O(\blk00000001/sig00000265 )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \blk00000001/blk00000169  (
    .I0(\blk00000001/sig000001a4 ),
    .I1(\blk00000001/sig00000194 ),
    .I2(\blk00000001/sig00000087 ),
    .O(\blk00000001/sig00000264 )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \blk00000001/blk00000168  (
    .I0(\blk00000001/sig000001a3 ),
    .I1(\blk00000001/sig00000193 ),
    .I2(\blk00000001/sig00000087 ),
    .O(\blk00000001/sig00000263 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \blk00000001/blk00000167  (
    .I0(\blk00000001/sig000001a2 ),
    .I1(\blk00000001/sig00000087 ),
    .O(\blk00000001/sig00000262 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \blk00000001/blk00000166  (
    .I0(\blk00000001/sig000001a1 ),
    .I1(\blk00000001/sig00000087 ),
    .O(\blk00000001/sig00000261 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \blk00000001/blk00000165  (
    .I0(\blk00000001/sig000001a0 ),
    .I1(\blk00000001/sig00000087 ),
    .O(\blk00000001/sig00000260 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \blk00000001/blk00000164  (
    .I0(\blk00000001/sig0000019f ),
    .I1(\blk00000001/sig00000087 ),
    .O(\blk00000001/sig0000025f )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \blk00000001/blk00000163  (
    .I0(\blk00000001/sig0000019e ),
    .I1(\blk00000001/sig00000087 ),
    .O(\blk00000001/sig0000025e )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \blk00000001/blk00000162  (
    .I0(\blk00000001/sig0000019d ),
    .I1(\blk00000001/sig00000087 ),
    .O(\blk00000001/sig0000025d )
  );
  LUT5 #(
    .INIT ( 32'h1111000F ))
  \blk00000001/blk00000161  (
    .I0(\blk00000001/sig0000019c ),
    .I1(\blk00000001/sig0000019d ),
    .I2(\blk00000001/sig000001ac ),
    .I3(\blk00000001/sig000001ad ),
    .I4(\blk00000001/sig00000087 ),
    .O(\blk00000001/sig00000242 )
  );
  LUT5 #(
    .INIT ( 32'h000F1111 ))
  \blk00000001/blk00000160  (
    .I0(\blk00000001/sig000001a6 ),
    .I1(\blk00000001/sig000001a7 ),
    .I2(\blk00000001/sig00000197 ),
    .I3(\blk00000001/sig00000196 ),
    .I4(\blk00000001/sig00000087 ),
    .O(\blk00000001/sig0000023f )
  );
  LUT5 #(
    .INIT ( 32'h03030055 ))
  \blk00000001/blk0000015f  (
    .I0(\blk00000001/sig000001aa ),
    .I1(\blk00000001/sig0000019a ),
    .I2(\blk00000001/sig0000019b ),
    .I3(\blk00000001/sig000001ab ),
    .I4(\blk00000001/sig00000087 ),
    .O(\blk00000001/sig00000241 )
  );
  LUT5 #(
    .INIT ( 32'h000F1111 ))
  \blk00000001/blk0000015e  (
    .I0(\blk00000001/sig000001a8 ),
    .I1(\blk00000001/sig000001a9 ),
    .I2(\blk00000001/sig00000198 ),
    .I3(\blk00000001/sig00000199 ),
    .I4(\blk00000001/sig00000087 ),
    .O(\blk00000001/sig00000240 )
  );
  LUT5 #(
    .INIT ( 32'h000F1111 ))
  \blk00000001/blk0000015d  (
    .I0(\blk00000001/sig000001a4 ),
    .I1(\blk00000001/sig000001a5 ),
    .I2(\blk00000001/sig00000195 ),
    .I3(\blk00000001/sig00000194 ),
    .I4(\blk00000001/sig00000087 ),
    .O(\blk00000001/sig0000023e )
  );
  LUT4 #(
    .INIT ( 16'h0F11 ))
  \blk00000001/blk0000015c  (
    .I0(\blk00000001/sig000001a2 ),
    .I1(\blk00000001/sig000001a3 ),
    .I2(\blk00000001/sig00000193 ),
    .I3(\blk00000001/sig00000087 ),
    .O(\blk00000001/sig0000023d )
  );
  LUT3 #(
    .INIT ( 8'hF1 ))
  \blk00000001/blk0000015b  (
    .I0(\blk00000001/sig000001a0 ),
    .I1(\blk00000001/sig000001a1 ),
    .I2(\blk00000001/sig00000087 ),
    .O(\blk00000001/sig0000023c )
  );
  LUT3 #(
    .INIT ( 8'hF1 ))
  \blk00000001/blk0000015a  (
    .I0(\blk00000001/sig0000019e ),
    .I1(\blk00000001/sig0000019f ),
    .I2(\blk00000001/sig00000087 ),
    .O(\blk00000001/sig0000023b )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \blk00000001/blk00000159  (
    .I0(\blk00000001/sig00000205 ),
    .I1(\blk00000001/sig00000222 ),
    .O(\blk00000001/sig00000204 )
  );
  LUT6 #(
    .INIT ( 64'hFBEAEAEA51404040 ))
  \blk00000001/blk00000158  (
    .I0(\blk00000001/sig000001ad ),
    .I1(\blk00000001/sig000001ac ),
    .I2(\blk00000001/sig00000194 ),
    .I3(\blk00000001/sig00000193 ),
    .I4(\blk00000001/sig000001ab ),
    .I5(\blk00000001/sig00000195 ),
    .O(\blk00000001/sig00000203 )
  );
  LUT6 #(
    .INIT ( 64'hFBEAEAEA51404040 ))
  \blk00000001/blk00000157  (
    .I0(\blk00000001/sig000001ad ),
    .I1(\blk00000001/sig000001ac ),
    .I2(\blk00000001/sig00000195 ),
    .I3(\blk00000001/sig00000194 ),
    .I4(\blk00000001/sig000001ab ),
    .I5(\blk00000001/sig00000196 ),
    .O(\blk00000001/sig00000202 )
  );
  LUT4 #(
    .INIT ( 16'hAA2A ))
  \blk00000001/blk00000156  (
    .I0(\blk00000001/sig00000208 ),
    .I1(\blk00000001/sig00000209 ),
    .I2(\blk00000001/sig00000088 ),
    .I3(\blk00000001/sig00000207 ),
    .O(\blk00000001/sig00000206 )
  );
  LUT4 #(
    .INIT ( 16'h1537 ))
  \blk00000001/blk00000155  (
    .I0(\blk00000001/sig000001ad ),
    .I1(\blk00000001/sig00000193 ),
    .I2(\blk00000001/sig000001ac ),
    .I3(\blk00000001/sig00000194 ),
    .O(\blk00000001/sig00000201 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \blk00000001/blk00000154  (
    .I0(\blk00000001/sig000000b7 ),
    .I1(\blk00000001/sig000001c0 ),
    .O(\blk00000001/sig000001ae )
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \blk00000001/blk00000153  (
    .I0(\blk00000001/sig000000b8 ),
    .I1(\blk00000001/sig00000092 ),
    .I2(\blk00000001/sig000000a9 ),
    .O(\blk00000001/sig000001da )
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \blk00000001/blk00000152  (
    .I0(\blk00000001/sig000000b8 ),
    .I1(\blk00000001/sig00000091 ),
    .I2(\blk00000001/sig000000a8 ),
    .O(\blk00000001/sig000001d9 )
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \blk00000001/blk00000151  (
    .I0(\blk00000001/sig000000b8 ),
    .I1(\blk00000001/sig00000090 ),
    .I2(\blk00000001/sig000000a7 ),
    .O(\blk00000001/sig000001d8 )
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \blk00000001/blk00000150  (
    .I0(\blk00000001/sig000000b8 ),
    .I1(\blk00000001/sig0000008f ),
    .I2(\blk00000001/sig000000a6 ),
    .O(\blk00000001/sig000001d7 )
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \blk00000001/blk0000014f  (
    .I0(\blk00000001/sig000000b8 ),
    .I1(\blk00000001/sig0000008e ),
    .I2(\blk00000001/sig000000a5 ),
    .O(\blk00000001/sig000001d6 )
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \blk00000001/blk0000014e  (
    .I0(\blk00000001/sig000000b8 ),
    .I1(\blk00000001/sig0000008d ),
    .I2(\blk00000001/sig000000a4 ),
    .O(\blk00000001/sig000001d5 )
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \blk00000001/blk0000014d  (
    .I0(\blk00000001/sig000000b8 ),
    .I1(\blk00000001/sig0000008c ),
    .I2(\blk00000001/sig000000a3 ),
    .O(\blk00000001/sig000001d4 )
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \blk00000001/blk0000014c  (
    .I0(\blk00000001/sig000000b8 ),
    .I1(\blk00000001/sig0000008b ),
    .I2(\blk00000001/sig000000a2 ),
    .O(\blk00000001/sig000001d3 )
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \blk00000001/blk0000014b  (
    .I0(\blk00000001/sig000000b8 ),
    .I1(\blk00000001/sig0000009f ),
    .I2(\blk00000001/sig000000b6 ),
    .O(\blk00000001/sig000001e7 )
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \blk00000001/blk0000014a  (
    .I0(\blk00000001/sig000000b8 ),
    .I1(\blk00000001/sig0000009e ),
    .I2(\blk00000001/sig000000b5 ),
    .O(\blk00000001/sig000001e6 )
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \blk00000001/blk00000149  (
    .I0(\blk00000001/sig000000b8 ),
    .I1(\blk00000001/sig0000009d ),
    .I2(\blk00000001/sig000000b4 ),
    .O(\blk00000001/sig000001e5 )
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \blk00000001/blk00000148  (
    .I0(\blk00000001/sig000000b8 ),
    .I1(\blk00000001/sig0000008a ),
    .I2(\blk00000001/sig000000a1 ),
    .O(\blk00000001/sig000001d2 )
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \blk00000001/blk00000147  (
    .I0(\blk00000001/sig000000b8 ),
    .I1(\blk00000001/sig0000009c ),
    .I2(\blk00000001/sig000000b3 ),
    .O(\blk00000001/sig000001e4 )
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \blk00000001/blk00000146  (
    .I0(\blk00000001/sig000000b8 ),
    .I1(\blk00000001/sig0000009b ),
    .I2(\blk00000001/sig000000b2 ),
    .O(\blk00000001/sig000001e3 )
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \blk00000001/blk00000145  (
    .I0(\blk00000001/sig000000b8 ),
    .I1(\blk00000001/sig0000009a ),
    .I2(\blk00000001/sig000000b1 ),
    .O(\blk00000001/sig000001e2 )
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \blk00000001/blk00000144  (
    .I0(\blk00000001/sig000000b8 ),
    .I1(\blk00000001/sig00000099 ),
    .I2(\blk00000001/sig000000b0 ),
    .O(\blk00000001/sig000001e1 )
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \blk00000001/blk00000143  (
    .I0(\blk00000001/sig000000b8 ),
    .I1(\blk00000001/sig00000098 ),
    .I2(\blk00000001/sig000000af ),
    .O(\blk00000001/sig000001e0 )
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \blk00000001/blk00000142  (
    .I0(\blk00000001/sig000000b8 ),
    .I1(\blk00000001/sig00000097 ),
    .I2(\blk00000001/sig000000ae ),
    .O(\blk00000001/sig000001df )
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \blk00000001/blk00000141  (
    .I0(\blk00000001/sig000000b8 ),
    .I1(\blk00000001/sig00000096 ),
    .I2(\blk00000001/sig000000ad ),
    .O(\blk00000001/sig000001de )
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \blk00000001/blk00000140  (
    .I0(\blk00000001/sig000000b8 ),
    .I1(\blk00000001/sig00000095 ),
    .I2(\blk00000001/sig000000ac ),
    .O(\blk00000001/sig000001dd )
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \blk00000001/blk0000013f  (
    .I0(\blk00000001/sig000000b8 ),
    .I1(\blk00000001/sig00000094 ),
    .I2(\blk00000001/sig000000ab ),
    .O(\blk00000001/sig000001dc )
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \blk00000001/blk0000013e  (
    .I0(\blk00000001/sig000000b8 ),
    .I1(\blk00000001/sig00000093 ),
    .I2(\blk00000001/sig000000aa ),
    .O(\blk00000001/sig000001db )
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \blk00000001/blk0000013d  (
    .I0(\blk00000001/sig000000b8 ),
    .I1(\blk00000001/sig00000089 ),
    .I2(\blk00000001/sig000000a0 ),
    .O(\blk00000001/sig000001d1 )
  );
  LUT4 #(
    .INIT ( 16'h00AC ))
  \blk00000001/blk0000013c  (
    .I0(\blk00000001/sig000000ae ),
    .I1(\blk00000001/sig00000097 ),
    .I2(\blk00000001/sig000000b8 ),
    .I3(\blk00000001/sig00000185 ),
    .O(\blk00000001/sig000001f7 )
  );
  LUT4 #(
    .INIT ( 16'h00AC ))
  \blk00000001/blk0000013b  (
    .I0(\blk00000001/sig000000af ),
    .I1(\blk00000001/sig00000098 ),
    .I2(\blk00000001/sig000000b8 ),
    .I3(\blk00000001/sig00000185 ),
    .O(\blk00000001/sig000001f8 )
  );
  LUT4 #(
    .INIT ( 16'h00AC ))
  \blk00000001/blk0000013a  (
    .I0(\blk00000001/sig000000b0 ),
    .I1(\blk00000001/sig00000099 ),
    .I2(\blk00000001/sig000000b8 ),
    .I3(\blk00000001/sig00000185 ),
    .O(\blk00000001/sig000001f9 )
  );
  LUT4 #(
    .INIT ( 16'h00AC ))
  \blk00000001/blk00000139  (
    .I0(\blk00000001/sig000000b1 ),
    .I1(\blk00000001/sig0000009a ),
    .I2(\blk00000001/sig000000b8 ),
    .I3(\blk00000001/sig00000185 ),
    .O(\blk00000001/sig000001fa )
  );
  LUT4 #(
    .INIT ( 16'h00AC ))
  \blk00000001/blk00000138  (
    .I0(\blk00000001/sig000000b2 ),
    .I1(\blk00000001/sig0000009b ),
    .I2(\blk00000001/sig000000b8 ),
    .I3(\blk00000001/sig00000185 ),
    .O(\blk00000001/sig000001fb )
  );
  LUT4 #(
    .INIT ( 16'h00AC ))
  \blk00000001/blk00000137  (
    .I0(\blk00000001/sig000000b3 ),
    .I1(\blk00000001/sig0000009c ),
    .I2(\blk00000001/sig000000b8 ),
    .I3(\blk00000001/sig00000185 ),
    .O(\blk00000001/sig000001fc )
  );
  LUT4 #(
    .INIT ( 16'h00AC ))
  \blk00000001/blk00000136  (
    .I0(\blk00000001/sig000000b4 ),
    .I1(\blk00000001/sig0000009d ),
    .I2(\blk00000001/sig000000b8 ),
    .I3(\blk00000001/sig00000185 ),
    .O(\blk00000001/sig000001fd )
  );
  LUT4 #(
    .INIT ( 16'h00AC ))
  \blk00000001/blk00000135  (
    .I0(\blk00000001/sig000000b5 ),
    .I1(\blk00000001/sig0000009e ),
    .I2(\blk00000001/sig000000b8 ),
    .I3(\blk00000001/sig00000185 ),
    .O(\blk00000001/sig000001fe )
  );
  LUT4 #(
    .INIT ( 16'h00AC ))
  \blk00000001/blk00000134  (
    .I0(\blk00000001/sig000000b6 ),
    .I1(\blk00000001/sig0000009f ),
    .I2(\blk00000001/sig000000b8 ),
    .I3(\blk00000001/sig00000185 ),
    .O(\blk00000001/sig000001ff )
  );
  LUT4 #(
    .INIT ( 16'h22B2 ))
  \blk00000001/blk00000133  (
    .I0(s_axis_b_tdata[1]),
    .I1(s_axis_a_tdata[1]),
    .I2(s_axis_b_tdata[0]),
    .I3(s_axis_a_tdata[0]),
    .O(\blk00000001/sig00000161 )
  );
  LUT4 #(
    .INIT ( 16'h22B2 ))
  \blk00000001/blk00000132  (
    .I0(s_axis_b_tdata[3]),
    .I1(s_axis_a_tdata[3]),
    .I2(s_axis_b_tdata[2]),
    .I3(s_axis_a_tdata[2]),
    .O(\blk00000001/sig0000015f )
  );
  LUT4 #(
    .INIT ( 16'h22B2 ))
  \blk00000001/blk00000131  (
    .I0(s_axis_b_tdata[5]),
    .I1(s_axis_a_tdata[5]),
    .I2(s_axis_b_tdata[4]),
    .I3(s_axis_a_tdata[4]),
    .O(\blk00000001/sig0000015d )
  );
  LUT4 #(
    .INIT ( 16'h22B2 ))
  \blk00000001/blk00000130  (
    .I0(s_axis_b_tdata[7]),
    .I1(s_axis_a_tdata[7]),
    .I2(s_axis_b_tdata[6]),
    .I3(s_axis_a_tdata[6]),
    .O(\blk00000001/sig0000015b )
  );
  LUT4 #(
    .INIT ( 16'h22B2 ))
  \blk00000001/blk0000012f  (
    .I0(s_axis_b_tdata[9]),
    .I1(s_axis_a_tdata[9]),
    .I2(s_axis_b_tdata[8]),
    .I3(s_axis_a_tdata[8]),
    .O(\blk00000001/sig00000159 )
  );
  LUT4 #(
    .INIT ( 16'h22B2 ))
  \blk00000001/blk0000012e  (
    .I0(s_axis_b_tdata[11]),
    .I1(s_axis_a_tdata[11]),
    .I2(s_axis_b_tdata[10]),
    .I3(s_axis_a_tdata[10]),
    .O(\blk00000001/sig00000157 )
  );
  LUT4 #(
    .INIT ( 16'h22B2 ))
  \blk00000001/blk0000012d  (
    .I0(s_axis_b_tdata[13]),
    .I1(s_axis_a_tdata[13]),
    .I2(s_axis_b_tdata[12]),
    .I3(s_axis_a_tdata[12]),
    .O(\blk00000001/sig00000155 )
  );
  LUT4 #(
    .INIT ( 16'h22B2 ))
  \blk00000001/blk0000012c  (
    .I0(s_axis_b_tdata[15]),
    .I1(s_axis_a_tdata[15]),
    .I2(s_axis_b_tdata[14]),
    .I3(s_axis_a_tdata[14]),
    .O(\blk00000001/sig00000153 )
  );
  LUT4 #(
    .INIT ( 16'h22B2 ))
  \blk00000001/blk0000012b  (
    .I0(s_axis_b_tdata[17]),
    .I1(s_axis_a_tdata[17]),
    .I2(s_axis_b_tdata[16]),
    .I3(s_axis_a_tdata[16]),
    .O(\blk00000001/sig00000151 )
  );
  LUT4 #(
    .INIT ( 16'h22B2 ))
  \blk00000001/blk0000012a  (
    .I0(s_axis_b_tdata[19]),
    .I1(s_axis_a_tdata[19]),
    .I2(s_axis_b_tdata[18]),
    .I3(s_axis_a_tdata[18]),
    .O(\blk00000001/sig0000014f )
  );
  LUT4 #(
    .INIT ( 16'h22B2 ))
  \blk00000001/blk00000129  (
    .I0(s_axis_b_tdata[21]),
    .I1(s_axis_a_tdata[21]),
    .I2(s_axis_b_tdata[20]),
    .I3(s_axis_a_tdata[20]),
    .O(\blk00000001/sig0000014d )
  );
  LUT4 #(
    .INIT ( 16'h22B2 ))
  \blk00000001/blk00000128  (
    .I0(s_axis_b_tdata[23]),
    .I1(s_axis_a_tdata[23]),
    .I2(s_axis_b_tdata[22]),
    .I3(s_axis_a_tdata[22]),
    .O(\blk00000001/sig0000014b )
  );
  LUT4 #(
    .INIT ( 16'h22B2 ))
  \blk00000001/blk00000127  (
    .I0(s_axis_b_tdata[25]),
    .I1(s_axis_a_tdata[25]),
    .I2(s_axis_b_tdata[24]),
    .I3(s_axis_a_tdata[24]),
    .O(\blk00000001/sig00000149 )
  );
  LUT4 #(
    .INIT ( 16'h22B2 ))
  \blk00000001/blk00000126  (
    .I0(s_axis_b_tdata[27]),
    .I1(s_axis_a_tdata[27]),
    .I2(s_axis_b_tdata[26]),
    .I3(s_axis_a_tdata[26]),
    .O(\blk00000001/sig00000147 )
  );
  LUT4 #(
    .INIT ( 16'h22B2 ))
  \blk00000001/blk00000125  (
    .I0(s_axis_b_tdata[29]),
    .I1(s_axis_a_tdata[29]),
    .I2(s_axis_b_tdata[28]),
    .I3(s_axis_a_tdata[28]),
    .O(\blk00000001/sig00000145 )
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \blk00000001/blk00000124  (
    .I0(s_axis_a_tdata[30]),
    .I1(s_axis_b_tdata[30]),
    .O(\blk00000001/sig00000143 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \blk00000001/blk00000123  (
    .I0(s_axis_b_tdata[1]),
    .I1(s_axis_a_tdata[1]),
    .I2(s_axis_b_tdata[0]),
    .I3(s_axis_a_tdata[0]),
    .O(\blk00000001/sig00000162 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \blk00000001/blk00000122  (
    .I0(s_axis_b_tdata[21]),
    .I1(s_axis_a_tdata[21]),
    .I2(s_axis_b_tdata[20]),
    .I3(s_axis_a_tdata[20]),
    .O(\blk00000001/sig0000014e )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \blk00000001/blk00000121  (
    .I0(s_axis_b_tdata[23]),
    .I1(s_axis_a_tdata[23]),
    .I2(s_axis_b_tdata[22]),
    .I3(s_axis_a_tdata[22]),
    .O(\blk00000001/sig0000014c )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \blk00000001/blk00000120  (
    .I0(s_axis_b_tdata[25]),
    .I1(s_axis_a_tdata[25]),
    .I2(s_axis_b_tdata[24]),
    .I3(s_axis_a_tdata[24]),
    .O(\blk00000001/sig0000014a )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \blk00000001/blk0000011f  (
    .I0(s_axis_b_tdata[27]),
    .I1(s_axis_a_tdata[27]),
    .I2(s_axis_b_tdata[26]),
    .I3(s_axis_a_tdata[26]),
    .O(\blk00000001/sig00000148 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \blk00000001/blk0000011e  (
    .I0(s_axis_b_tdata[29]),
    .I1(s_axis_a_tdata[29]),
    .I2(s_axis_b_tdata[28]),
    .I3(s_axis_a_tdata[28]),
    .O(\blk00000001/sig00000146 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000001/blk0000011d  (
    .I0(s_axis_b_tdata[30]),
    .I1(s_axis_a_tdata[30]),
    .O(\blk00000001/sig00000144 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \blk00000001/blk0000011c  (
    .I0(s_axis_b_tdata[3]),
    .I1(s_axis_a_tdata[3]),
    .I2(s_axis_b_tdata[2]),
    .I3(s_axis_a_tdata[2]),
    .O(\blk00000001/sig00000160 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \blk00000001/blk0000011b  (
    .I0(s_axis_b_tdata[5]),
    .I1(s_axis_a_tdata[5]),
    .I2(s_axis_b_tdata[4]),
    .I3(s_axis_a_tdata[4]),
    .O(\blk00000001/sig0000015e )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \blk00000001/blk0000011a  (
    .I0(s_axis_b_tdata[7]),
    .I1(s_axis_a_tdata[7]),
    .I2(s_axis_b_tdata[6]),
    .I3(s_axis_a_tdata[6]),
    .O(\blk00000001/sig0000015c )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \blk00000001/blk00000119  (
    .I0(s_axis_b_tdata[9]),
    .I1(s_axis_a_tdata[9]),
    .I2(s_axis_b_tdata[8]),
    .I3(s_axis_a_tdata[8]),
    .O(\blk00000001/sig0000015a )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \blk00000001/blk00000118  (
    .I0(s_axis_b_tdata[11]),
    .I1(s_axis_a_tdata[11]),
    .I2(s_axis_b_tdata[10]),
    .I3(s_axis_a_tdata[10]),
    .O(\blk00000001/sig00000158 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \blk00000001/blk00000117  (
    .I0(s_axis_b_tdata[13]),
    .I1(s_axis_a_tdata[13]),
    .I2(s_axis_b_tdata[12]),
    .I3(s_axis_a_tdata[12]),
    .O(\blk00000001/sig00000156 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \blk00000001/blk00000116  (
    .I0(s_axis_b_tdata[15]),
    .I1(s_axis_a_tdata[15]),
    .I2(s_axis_b_tdata[14]),
    .I3(s_axis_a_tdata[14]),
    .O(\blk00000001/sig00000154 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \blk00000001/blk00000115  (
    .I0(s_axis_b_tdata[17]),
    .I1(s_axis_a_tdata[17]),
    .I2(s_axis_b_tdata[16]),
    .I3(s_axis_a_tdata[16]),
    .O(\blk00000001/sig00000152 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \blk00000001/blk00000114  (
    .I0(s_axis_b_tdata[19]),
    .I1(s_axis_a_tdata[19]),
    .I2(s_axis_b_tdata[18]),
    .I3(s_axis_a_tdata[18]),
    .O(\blk00000001/sig00000150 )
  );
  LUT5 #(
    .INIT ( 32'h00000001 ))
  \blk00000001/blk00000113  (
    .I0(s_axis_b_tdata[18]),
    .I1(s_axis_b_tdata[19]),
    .I2(s_axis_b_tdata[20]),
    .I3(s_axis_b_tdata[21]),
    .I4(s_axis_b_tdata[22]),
    .O(\blk00000001/sig00000138 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \blk00000001/blk00000112  (
    .I0(s_axis_b_tdata[0]),
    .I1(s_axis_b_tdata[1]),
    .I2(s_axis_b_tdata[2]),
    .I3(s_axis_b_tdata[3]),
    .I4(s_axis_b_tdata[4]),
    .I5(s_axis_b_tdata[5]),
    .O(\blk00000001/sig00000137 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \blk00000001/blk00000111  (
    .I0(s_axis_b_tdata[6]),
    .I1(s_axis_b_tdata[7]),
    .I2(s_axis_b_tdata[8]),
    .I3(s_axis_b_tdata[9]),
    .I4(s_axis_b_tdata[10]),
    .I5(s_axis_b_tdata[11]),
    .O(\blk00000001/sig00000136 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \blk00000001/blk00000110  (
    .I0(s_axis_b_tdata[12]),
    .I1(s_axis_b_tdata[13]),
    .I2(s_axis_b_tdata[14]),
    .I3(s_axis_b_tdata[15]),
    .I4(s_axis_b_tdata[16]),
    .I5(s_axis_b_tdata[17]),
    .O(\blk00000001/sig00000135 )
  );
  LUT5 #(
    .INIT ( 32'h00000001 ))
  \blk00000001/blk0000010f  (
    .I0(s_axis_a_tdata[18]),
    .I1(s_axis_a_tdata[19]),
    .I2(s_axis_a_tdata[20]),
    .I3(s_axis_a_tdata[21]),
    .I4(s_axis_a_tdata[22]),
    .O(\blk00000001/sig00000134 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \blk00000001/blk0000010e  (
    .I0(s_axis_a_tdata[0]),
    .I1(s_axis_a_tdata[1]),
    .I2(s_axis_a_tdata[2]),
    .I3(s_axis_a_tdata[3]),
    .I4(s_axis_a_tdata[4]),
    .I5(s_axis_a_tdata[5]),
    .O(\blk00000001/sig00000133 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \blk00000001/blk0000010d  (
    .I0(s_axis_a_tdata[6]),
    .I1(s_axis_a_tdata[7]),
    .I2(s_axis_a_tdata[8]),
    .I3(s_axis_a_tdata[9]),
    .I4(s_axis_a_tdata[10]),
    .I5(s_axis_a_tdata[11]),
    .O(\blk00000001/sig00000132 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \blk00000001/blk0000010c  (
    .I0(s_axis_a_tdata[12]),
    .I1(s_axis_a_tdata[13]),
    .I2(s_axis_a_tdata[14]),
    .I3(s_axis_a_tdata[15]),
    .I4(s_axis_a_tdata[16]),
    .I5(s_axis_a_tdata[17]),
    .O(\blk00000001/sig00000131 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \blk00000001/blk0000010b  (
    .I0(\blk00000001/sig00000129 ),
    .I1(\blk00000001/sig0000012b ),
    .O(\blk00000001/sig00000115 )
  );
  LUT4 #(
    .INIT ( 16'h22F2 ))
  \blk00000001/blk0000010a  (
    .I0(\blk00000001/sig0000012c ),
    .I1(\blk00000001/sig00000142 ),
    .I2(\blk00000001/sig0000012a ),
    .I3(\blk00000001/sig0000013d ),
    .O(\blk00000001/sig00000114 )
  );
  LUT3 #(
    .INIT ( 8'h1B ))
  \blk00000001/blk00000109  (
    .I0(\blk00000001/sig000000c1 ),
    .I1(\blk00000001/sig00000118 ),
    .I2(\blk00000001/sig00000120 ),
    .O(\blk00000001/sig000000e3 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000108  (
    .I0(s_axis_a_tdata[31]),
    .I1(s_axis_b_tdata[31]),
    .O(\blk00000001/sig000000ed )
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \blk00000001/blk00000107  (
    .I0(\blk00000001/sig000000c1 ),
    .I1(\blk00000001/sig00000127 ),
    .I2(\blk00000001/sig0000011f ),
    .O(\blk00000001/sig000000ea )
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \blk00000001/blk00000106  (
    .I0(\blk00000001/sig000000c1 ),
    .I1(\blk00000001/sig00000126 ),
    .I2(\blk00000001/sig0000011e ),
    .O(\blk00000001/sig000000e9 )
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \blk00000001/blk00000105  (
    .I0(\blk00000001/sig000000c1 ),
    .I1(\blk00000001/sig00000125 ),
    .I2(\blk00000001/sig0000011d ),
    .O(\blk00000001/sig000000e8 )
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \blk00000001/blk00000104  (
    .I0(\blk00000001/sig000000c1 ),
    .I1(\blk00000001/sig00000124 ),
    .I2(\blk00000001/sig0000011c ),
    .O(\blk00000001/sig000000e7 )
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \blk00000001/blk00000103  (
    .I0(\blk00000001/sig000000c1 ),
    .I1(\blk00000001/sig00000123 ),
    .I2(\blk00000001/sig0000011b ),
    .O(\blk00000001/sig000000e6 )
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \blk00000001/blk00000102  (
    .I0(\blk00000001/sig000000c1 ),
    .I1(\blk00000001/sig00000122 ),
    .I2(\blk00000001/sig0000011a ),
    .O(\blk00000001/sig000000e5 )
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \blk00000001/blk00000101  (
    .I0(\blk00000001/sig000000c1 ),
    .I1(\blk00000001/sig00000121 ),
    .I2(\blk00000001/sig00000119 ),
    .O(\blk00000001/sig000000e4 )
  );
  LUT6 #(
    .INIT ( 64'hAAAAAAAAAAAAABAA ))
  \blk00000001/blk00000100  (
    .I0(\blk00000001/sig00000110 ),
    .I1(\blk00000001/sig00000128 ),
    .I2(\blk00000001/sig00000111 ),
    .I3(\blk00000001/sig000000ec ),
    .I4(\blk00000001/sig00000104 ),
    .I5(\blk00000001/sig000000eb ),
    .O(\blk00000001/sig00000105 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF55555554 ))
  \blk00000001/blk000000ff  (
    .I0(\blk00000001/sig00000110 ),
    .I1(\blk00000001/sig00000128 ),
    .I2(\blk00000001/sig000000ec ),
    .I3(\blk00000001/sig00000104 ),
    .I4(\blk00000001/sig000000eb ),
    .I5(\blk00000001/sig00000111 ),
    .O(\blk00000001/sig00000106 )
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \blk00000001/blk000000fe  (
    .I0(\blk00000001/sig0000012a ),
    .I1(\blk00000001/sig0000013d ),
    .I2(\blk00000001/sig0000012c ),
    .I3(\blk00000001/sig00000142 ),
    .O(\blk00000001/sig00000113 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \blk00000001/blk000000fd  (
    .I0(\blk00000001/sig0000012a ),
    .I1(\blk00000001/sig0000013d ),
    .I2(\blk00000001/sig0000012c ),
    .I3(\blk00000001/sig00000142 ),
    .O(\blk00000001/sig00000112 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \blk00000001/blk000000fc  (
    .I0(s_axis_a_tvalid),
    .I1(s_axis_b_tvalid),
    .O(\blk00000001/sig00000066 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000fb  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig00000066 ),
    .Q(\blk00000001/sig0000026e )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000fa  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig0000026e ),
    .Q(m_axis_result_tvalid)
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
    .USE_MULT ( "MULTIPLY" ),
    .USE_PATTERN_DETECT ( "NO_PATDET" ),
    .USE_SIMD ( "ONE48" ))
  \blk00000001/blk000000f9  (
    .PATTERNBDETECT(\NLW_blk00000001/blk000000f9_PATTERNBDETECT_UNCONNECTED ),
    .RSTC(\blk00000001/sig000001d0 ),
    .CEB1(\blk00000001/sig000001d0 ),
    .CEAD(\blk00000001/sig000001d0 ),
    .MULTSIGNOUT(\NLW_blk00000001/blk000000f9_MULTSIGNOUT_UNCONNECTED ),
    .CEC(\blk00000001/sig000001d0 ),
    .RSTM(\blk00000001/sig000001d0 ),
    .MULTSIGNIN(\blk00000001/sig000001d0 ),
    .CEB2(\blk00000001/sig000001d0 ),
    .RSTCTRL(\blk00000001/sig000001d0 ),
    .CEP(\blk00000001/sig000001d0 ),
    .CARRYCASCOUT(\NLW_blk00000001/blk000000f9_CARRYCASCOUT_UNCONNECTED ),
    .RSTA(\blk00000001/sig000001d0 ),
    .CECARRYIN(\blk00000001/sig000001d0 ),
    .UNDERFLOW(\NLW_blk00000001/blk000000f9_UNDERFLOW_UNCONNECTED ),
    .PATTERNDETECT(\NLW_blk00000001/blk000000f9_PATTERNDETECT_UNCONNECTED ),
    .RSTALUMODE(\blk00000001/sig000001d0 ),
    .RSTALLCARRYIN(\blk00000001/sig000001d0 ),
    .CED(\blk00000001/sig000001d0 ),
    .RSTD(\blk00000001/sig000001d0 ),
    .CEALUMODE(\blk00000001/sig000001d0 ),
    .CEA2(\blk00000001/sig000001d0 ),
    .CLK(aclk),
    .CEA1(\blk00000001/sig000001d0 ),
    .RSTB(\blk00000001/sig000001d0 ),
    .OVERFLOW(\NLW_blk00000001/blk000000f9_OVERFLOW_UNCONNECTED ),
    .CECTRL(\blk00000001/sig000001d0 ),
    .CEM(\blk00000001/sig000001d0 ),
    .CARRYIN(\blk00000001/sig000001d0 ),
    .CARRYCASCIN(\blk00000001/sig000001d0 ),
    .RSTINMODE(\blk00000001/sig000001d0 ),
    .CEINMODE(\blk00000001/sig000001d0 ),
    .RSTP(\blk00000001/sig000001d0 ),
    .ACOUT({\NLW_blk00000001/blk000000f9_ACOUT<29>_UNCONNECTED , \NLW_blk00000001/blk000000f9_ACOUT<28>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_ACOUT<27>_UNCONNECTED , \NLW_blk00000001/blk000000f9_ACOUT<26>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_ACOUT<25>_UNCONNECTED , \NLW_blk00000001/blk000000f9_ACOUT<24>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_ACOUT<23>_UNCONNECTED , \NLW_blk00000001/blk000000f9_ACOUT<22>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_ACOUT<21>_UNCONNECTED , \NLW_blk00000001/blk000000f9_ACOUT<20>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_ACOUT<19>_UNCONNECTED , \NLW_blk00000001/blk000000f9_ACOUT<18>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_ACOUT<17>_UNCONNECTED , \NLW_blk00000001/blk000000f9_ACOUT<16>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_ACOUT<15>_UNCONNECTED , \NLW_blk00000001/blk000000f9_ACOUT<14>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_ACOUT<13>_UNCONNECTED , \NLW_blk00000001/blk000000f9_ACOUT<12>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_ACOUT<11>_UNCONNECTED , \NLW_blk00000001/blk000000f9_ACOUT<10>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_ACOUT<9>_UNCONNECTED , \NLW_blk00000001/blk000000f9_ACOUT<8>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_ACOUT<7>_UNCONNECTED , \NLW_blk00000001/blk000000f9_ACOUT<6>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_ACOUT<5>_UNCONNECTED , \NLW_blk00000001/blk000000f9_ACOUT<4>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_ACOUT<3>_UNCONNECTED , \NLW_blk00000001/blk000000f9_ACOUT<2>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_ACOUT<1>_UNCONNECTED , \NLW_blk00000001/blk000000f9_ACOUT<0>_UNCONNECTED }),
    .OPMODE({\blk00000001/sig000001d0 , \blk00000001/sig000001e8 , \blk00000001/sig000001e8 , \blk00000001/sig000001d0 , \blk00000001/sig000001e8 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001e8 }),
    .PCIN({\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 }),
    .ALUMODE({\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 }),
    .C({\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig00000102 , \blk00000001/sig00000101 , 
\blk00000001/sig00000100 , \blk00000001/sig000000ff , \blk00000001/sig000000fe , \blk00000001/sig000000fd , \blk00000001/sig000000fc , 
\blk00000001/sig000000fb , \blk00000001/sig000001e8 , \blk00000001/sig00000205 , \blk00000001/sig00000204 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig00000206 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 }),
    .CARRYOUT({\NLW_blk00000001/blk000000f9_CARRYOUT<3>_UNCONNECTED , \NLW_blk00000001/blk000000f9_CARRYOUT<2>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_CARRYOUT<1>_UNCONNECTED , \NLW_blk00000001/blk000000f9_CARRYOUT<0>_UNCONNECTED }),
    .INMODE({\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 }),
    .BCIN({\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 }),
    .B({\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig00000232 , \blk00000001/sig00000231 , \blk00000001/sig00000230 , 
\blk00000001/sig0000022f , \blk00000001/sig0000022e , \blk00000001/sig0000022d , \blk00000001/sig0000022c , \blk00000001/sig0000022b , 
\blk00000001/sig0000022a , \blk00000001/sig00000229 , \blk00000001/sig00000228 , \blk00000001/sig00000227 , \blk00000001/sig00000226 , 
\blk00000001/sig00000225 , \blk00000001/sig00000224 , \blk00000001/sig00000223 }),
    .BCOUT({\NLW_blk00000001/blk000000f9_BCOUT<17>_UNCONNECTED , \NLW_blk00000001/blk000000f9_BCOUT<16>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_BCOUT<15>_UNCONNECTED , \NLW_blk00000001/blk000000f9_BCOUT<14>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_BCOUT<13>_UNCONNECTED , \NLW_blk00000001/blk000000f9_BCOUT<12>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_BCOUT<11>_UNCONNECTED , \NLW_blk00000001/blk000000f9_BCOUT<10>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_BCOUT<9>_UNCONNECTED , \NLW_blk00000001/blk000000f9_BCOUT<8>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_BCOUT<7>_UNCONNECTED , \NLW_blk00000001/blk000000f9_BCOUT<6>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_BCOUT<5>_UNCONNECTED , \NLW_blk00000001/blk000000f9_BCOUT<4>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_BCOUT<3>_UNCONNECTED , \NLW_blk00000001/blk000000f9_BCOUT<2>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_BCOUT<1>_UNCONNECTED , \NLW_blk00000001/blk000000f9_BCOUT<0>_UNCONNECTED }),
    .D({\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 }),
    .P({\NLW_blk00000001/blk000000f9_P<47>_UNCONNECTED , \NLW_blk00000001/blk000000f9_P<46>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_P<45>_UNCONNECTED , \NLW_blk00000001/blk000000f9_P<44>_UNCONNECTED , \NLW_blk00000001/blk000000f9_P<43>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_P<42>_UNCONNECTED , \NLW_blk00000001/blk000000f9_P<41>_UNCONNECTED , \NLW_blk00000001/blk000000f9_P<40>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_P<39>_UNCONNECTED , \NLW_blk00000001/blk000000f9_P<38>_UNCONNECTED , \NLW_blk00000001/blk000000f9_P<37>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_P<36>_UNCONNECTED , \NLW_blk00000001/blk000000f9_P<35>_UNCONNECTED , \blk00000001/sig0000006f , \blk00000001/sig0000006e 
, \blk00000001/sig0000006d , \blk00000001/sig0000006c , \blk00000001/sig0000006b , \blk00000001/sig0000006a , \blk00000001/sig00000069 , 
\blk00000001/sig00000068 , \NLW_blk00000001/blk000000f9_P<26>_UNCONNECTED , \NLW_blk00000001/blk000000f9_P<25>_UNCONNECTED , \blk00000001/sig00000086 
, \blk00000001/sig00000085 , \blk00000001/sig00000084 , \blk00000001/sig00000083 , \blk00000001/sig00000082 , \blk00000001/sig00000081 , 
\blk00000001/sig00000080 , \blk00000001/sig0000007f , \blk00000001/sig0000007e , \blk00000001/sig0000007d , \blk00000001/sig0000007c , 
\blk00000001/sig0000007b , \blk00000001/sig0000007a , \blk00000001/sig00000079 , \blk00000001/sig00000078 , \blk00000001/sig00000077 , 
\blk00000001/sig00000076 , \blk00000001/sig00000075 , \blk00000001/sig00000074 , \blk00000001/sig00000073 , \blk00000001/sig00000072 , 
\blk00000001/sig00000071 , \blk00000001/sig00000070 , \NLW_blk00000001/blk000000f9_P<1>_UNCONNECTED , \NLW_blk00000001/blk000000f9_P<0>_UNCONNECTED })
,
    .A({\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig00000221 , \blk00000001/sig00000220 , \blk00000001/sig0000021f , \blk00000001/sig0000021e , 
\blk00000001/sig0000021d , \blk00000001/sig0000021c , \blk00000001/sig0000021b , \blk00000001/sig0000021a , \blk00000001/sig00000219 , 
\blk00000001/sig00000218 , \blk00000001/sig00000217 , \blk00000001/sig00000216 , \blk00000001/sig00000215 , \blk00000001/sig00000214 , 
\blk00000001/sig00000213 , \blk00000001/sig00000212 , \blk00000001/sig00000211 , \blk00000001/sig00000210 , \blk00000001/sig0000020f , 
\blk00000001/sig0000020e , \blk00000001/sig0000020d , \blk00000001/sig0000020c , \blk00000001/sig0000020b , \blk00000001/sig0000020a }),
    .PCOUT({\NLW_blk00000001/blk000000f9_PCOUT<47>_UNCONNECTED , \NLW_blk00000001/blk000000f9_PCOUT<46>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_PCOUT<45>_UNCONNECTED , \NLW_blk00000001/blk000000f9_PCOUT<44>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_PCOUT<43>_UNCONNECTED , \NLW_blk00000001/blk000000f9_PCOUT<42>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_PCOUT<41>_UNCONNECTED , \NLW_blk00000001/blk000000f9_PCOUT<40>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_PCOUT<39>_UNCONNECTED , \NLW_blk00000001/blk000000f9_PCOUT<38>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_PCOUT<37>_UNCONNECTED , \NLW_blk00000001/blk000000f9_PCOUT<36>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_PCOUT<35>_UNCONNECTED , \NLW_blk00000001/blk000000f9_PCOUT<34>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_PCOUT<33>_UNCONNECTED , \NLW_blk00000001/blk000000f9_PCOUT<32>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_PCOUT<31>_UNCONNECTED , \NLW_blk00000001/blk000000f9_PCOUT<30>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_PCOUT<29>_UNCONNECTED , \NLW_blk00000001/blk000000f9_PCOUT<28>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_PCOUT<27>_UNCONNECTED , \NLW_blk00000001/blk000000f9_PCOUT<26>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_PCOUT<25>_UNCONNECTED , \NLW_blk00000001/blk000000f9_PCOUT<24>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_PCOUT<23>_UNCONNECTED , \NLW_blk00000001/blk000000f9_PCOUT<22>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_PCOUT<21>_UNCONNECTED , \NLW_blk00000001/blk000000f9_PCOUT<20>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_PCOUT<19>_UNCONNECTED , \NLW_blk00000001/blk000000f9_PCOUT<18>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_PCOUT<17>_UNCONNECTED , \NLW_blk00000001/blk000000f9_PCOUT<16>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_PCOUT<15>_UNCONNECTED , \NLW_blk00000001/blk000000f9_PCOUT<14>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_PCOUT<13>_UNCONNECTED , \NLW_blk00000001/blk000000f9_PCOUT<12>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_PCOUT<11>_UNCONNECTED , \NLW_blk00000001/blk000000f9_PCOUT<10>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_PCOUT<9>_UNCONNECTED , \NLW_blk00000001/blk000000f9_PCOUT<8>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_PCOUT<7>_UNCONNECTED , \NLW_blk00000001/blk000000f9_PCOUT<6>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_PCOUT<5>_UNCONNECTED , \NLW_blk00000001/blk000000f9_PCOUT<4>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_PCOUT<3>_UNCONNECTED , \NLW_blk00000001/blk000000f9_PCOUT<2>_UNCONNECTED , 
\NLW_blk00000001/blk000000f9_PCOUT<1>_UNCONNECTED , \NLW_blk00000001/blk000000f9_PCOUT<0>_UNCONNECTED }),
    .ACIN({\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 }),
    .CARRYINSEL({\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 })
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000f8  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig00000254 ),
    .Q(\blk00000001/sig0000020a )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000f7  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig00000255 ),
    .Q(\blk00000001/sig0000020b )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000f6  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig00000256 ),
    .Q(\blk00000001/sig0000020c )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000f5  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig00000257 ),
    .Q(\blk00000001/sig0000020d )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000f4  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig00000258 ),
    .Q(\blk00000001/sig0000020e )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000f3  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig00000259 ),
    .Q(\blk00000001/sig0000020f )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000f2  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig0000025a ),
    .Q(\blk00000001/sig00000210 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000f1  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig0000025b ),
    .Q(\blk00000001/sig00000211 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000f0  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig0000025c ),
    .Q(\blk00000001/sig00000212 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000ef  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig0000025d ),
    .Q(\blk00000001/sig00000213 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000ee  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig0000025e ),
    .Q(\blk00000001/sig00000214 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000ed  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig0000025f ),
    .Q(\blk00000001/sig00000215 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000ec  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig00000260 ),
    .Q(\blk00000001/sig00000216 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000eb  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig00000261 ),
    .Q(\blk00000001/sig00000217 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000ea  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig00000262 ),
    .Q(\blk00000001/sig00000218 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000e9  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig00000263 ),
    .Q(\blk00000001/sig00000219 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000e8  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig00000264 ),
    .Q(\blk00000001/sig0000021a )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000e7  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig00000265 ),
    .Q(\blk00000001/sig0000021b )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000e6  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig00000266 ),
    .Q(\blk00000001/sig0000021c )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000e5  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig00000267 ),
    .Q(\blk00000001/sig0000021d )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000e4  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig00000268 ),
    .Q(\blk00000001/sig0000021e )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000e3  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig00000269 ),
    .Q(\blk00000001/sig0000021f )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000e2  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig0000026a ),
    .Q(\blk00000001/sig00000220 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000e1  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig0000026b ),
    .Q(\blk00000001/sig00000221 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000e0  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig0000026c ),
    .Q(\blk00000001/sig00000205 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000df  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig0000026d ),
    .Q(\blk00000001/sig00000222 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000de  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig0000023a ),
    .Q(\blk00000001/sig00000252 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000dd  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig00000239 ),
    .Q(\blk00000001/sig00000251 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000dc  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig00000238 ),
    .Q(\blk00000001/sig00000250 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000db  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig00000237 ),
    .Q(\blk00000001/sig0000024f )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000da  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig00000236 ),
    .Q(\blk00000001/sig0000024e )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000d9  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig00000235 ),
    .Q(\blk00000001/sig0000024d )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000d8  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig00000234 ),
    .Q(\blk00000001/sig0000024c )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000d7  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig00000233 ),
    .Q(\blk00000001/sig0000024b )
  );
  LUT5 #(
    .INIT ( 32'h0000FF0C ))
  \blk00000001/blk000000d6  (
    .I0(\blk00000001/sig000001d0 ),
    .I1(\blk00000001/sig00000220 ),
    .I2(\blk00000001/sig00000221 ),
    .I3(\blk00000001/sig00000205 ),
    .I4(\blk00000001/sig00000222 ),
    .O(\blk00000001/sig0000024a )
  );
  LUT5 #(
    .INIT ( 32'h000000FC ))
  \blk00000001/blk000000d5  (
    .I0(\blk00000001/sig000001d0 ),
    .I1(\blk00000001/sig00000220 ),
    .I2(\blk00000001/sig00000221 ),
    .I3(\blk00000001/sig00000205 ),
    .I4(\blk00000001/sig00000222 ),
    .O(\blk00000001/sig00000249 )
  );
  LUT5 #(
    .INIT ( 32'h0000FF0C ))
  \blk00000001/blk000000d4  (
    .I0(\blk00000001/sig000001d0 ),
    .I1(\blk00000001/sig0000021c ),
    .I2(\blk00000001/sig0000021d ),
    .I3(\blk00000001/sig0000021e ),
    .I4(\blk00000001/sig0000021f ),
    .O(\blk00000001/sig00000248 )
  );
  LUT5 #(
    .INIT ( 32'h000000FC ))
  \blk00000001/blk000000d3  (
    .I0(\blk00000001/sig000001d0 ),
    .I1(\blk00000001/sig0000021c ),
    .I2(\blk00000001/sig0000021d ),
    .I3(\blk00000001/sig0000021e ),
    .I4(\blk00000001/sig0000021f ),
    .O(\blk00000001/sig00000247 )
  );
  LUT5 #(
    .INIT ( 32'h0000FF0C ))
  \blk00000001/blk000000d2  (
    .I0(\blk00000001/sig000001d0 ),
    .I1(\blk00000001/sig00000218 ),
    .I2(\blk00000001/sig00000219 ),
    .I3(\blk00000001/sig0000021a ),
    .I4(\blk00000001/sig0000021b ),
    .O(\blk00000001/sig00000246 )
  );
  LUT5 #(
    .INIT ( 32'h000000FC ))
  \blk00000001/blk000000d1  (
    .I0(\blk00000001/sig000001d0 ),
    .I1(\blk00000001/sig00000218 ),
    .I2(\blk00000001/sig00000219 ),
    .I3(\blk00000001/sig0000021a ),
    .I4(\blk00000001/sig0000021b ),
    .O(\blk00000001/sig00000245 )
  );
  LUT5 #(
    .INIT ( 32'h0000FF0C ))
  \blk00000001/blk000000d0  (
    .I0(\blk00000001/sig000001d0 ),
    .I1(\blk00000001/sig00000214 ),
    .I2(\blk00000001/sig00000215 ),
    .I3(\blk00000001/sig00000216 ),
    .I4(\blk00000001/sig00000217 ),
    .O(\blk00000001/sig00000244 )
  );
  LUT5 #(
    .INIT ( 32'h000000FC ))
  \blk00000001/blk000000cf  (
    .I0(\blk00000001/sig000001d0 ),
    .I1(\blk00000001/sig00000214 ),
    .I2(\blk00000001/sig00000215 ),
    .I3(\blk00000001/sig00000216 ),
    .I4(\blk00000001/sig00000217 ),
    .O(\blk00000001/sig00000243 )
  );
  MUXCY   \blk00000001/blk000000ce  (
    .CI(\blk00000001/sig000001e8 ),
    .DI(\blk00000001/sig000001d0 ),
    .S(\blk00000001/sig00000242 ),
    .O(\blk00000001/sig0000023a )
  );
  MUXCY   \blk00000001/blk000000cd  (
    .CI(\blk00000001/sig0000023a ),
    .DI(\blk00000001/sig000001d0 ),
    .S(\blk00000001/sig00000241 ),
    .O(\blk00000001/sig00000239 )
  );
  MUXCY   \blk00000001/blk000000cc  (
    .CI(\blk00000001/sig00000239 ),
    .DI(\blk00000001/sig000001d0 ),
    .S(\blk00000001/sig00000240 ),
    .O(\blk00000001/sig00000238 )
  );
  MUXCY   \blk00000001/blk000000cb  (
    .CI(\blk00000001/sig00000238 ),
    .DI(\blk00000001/sig000001d0 ),
    .S(\blk00000001/sig0000023f ),
    .O(\blk00000001/sig00000237 )
  );
  MUXCY   \blk00000001/blk000000ca  (
    .CI(\blk00000001/sig00000237 ),
    .DI(\blk00000001/sig000001d0 ),
    .S(\blk00000001/sig0000023e ),
    .O(\blk00000001/sig00000236 )
  );
  MUXCY   \blk00000001/blk000000c9  (
    .CI(\blk00000001/sig00000236 ),
    .DI(\blk00000001/sig000001d0 ),
    .S(\blk00000001/sig0000023d ),
    .O(\blk00000001/sig00000235 )
  );
  MUXCY   \blk00000001/blk000000c8  (
    .CI(\blk00000001/sig00000235 ),
    .DI(\blk00000001/sig000001d0 ),
    .S(\blk00000001/sig0000023c ),
    .O(\blk00000001/sig00000234 )
  );
  MUXCY   \blk00000001/blk000000c7  (
    .CI(\blk00000001/sig00000234 ),
    .DI(\blk00000001/sig000001d0 ),
    .S(\blk00000001/sig0000023b ),
    .O(\blk00000001/sig00000233 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000c6  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig00000087 ),
    .Q(\blk00000001/sig00000253 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000c5  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig00000203 ),
    .Q(\blk00000001/sig00000208 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000c4  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig00000201 ),
    .Q(\blk00000001/sig00000209 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000c3  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig00000202 ),
    .Q(\blk00000001/sig00000207 )
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
    .MASK ( 48'hFF0000FFFFFF ),
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
  \blk00000001/blk000000c2  (
    .PATTERNBDETECT(\NLW_blk00000001/blk000000c2_PATTERNBDETECT_UNCONNECTED ),
    .RSTC(\blk00000001/sig000001d0 ),
    .CEB1(\blk00000001/sig000001d0 ),
    .CEAD(\blk00000001/sig000001d0 ),
    .MULTSIGNOUT(\NLW_blk00000001/blk000000c2_MULTSIGNOUT_UNCONNECTED ),
    .CEC(\blk00000001/sig000001d0 ),
    .RSTM(\blk00000001/sig000001d0 ),
    .MULTSIGNIN(\blk00000001/sig000001d0 ),
    .CEB2(\blk00000001/sig000001d0 ),
    .RSTCTRL(\blk00000001/sig000001d0 ),
    .CEP(\blk00000001/sig000001d0 ),
    .CARRYCASCOUT(\NLW_blk00000001/blk000000c2_CARRYCASCOUT_UNCONNECTED ),
    .RSTA(\blk00000001/sig000001d0 ),
    .CECARRYIN(\blk00000001/sig000001d0 ),
    .UNDERFLOW(\NLW_blk00000001/blk000000c2_UNDERFLOW_UNCONNECTED ),
    .PATTERNDETECT(\blk00000001/sig00000087 ),
    .RSTALUMODE(\blk00000001/sig000001d0 ),
    .RSTALLCARRYIN(\blk00000001/sig000001d0 ),
    .CED(\blk00000001/sig000001d0 ),
    .RSTD(\blk00000001/sig000001d0 ),
    .CEALUMODE(\blk00000001/sig000001d0 ),
    .CEA2(\blk00000001/sig000001d0 ),
    .CLK(aclk),
    .CEA1(\blk00000001/sig000001d0 ),
    .RSTB(\blk00000001/sig000001d0 ),
    .OVERFLOW(\NLW_blk00000001/blk000000c2_OVERFLOW_UNCONNECTED ),
    .CECTRL(\blk00000001/sig000001d0 ),
    .CEM(\blk00000001/sig000001d0 ),
    .CARRYIN(\blk00000001/sig000001ae ),
    .CARRYCASCIN(\blk00000001/sig000001d0 ),
    .RSTINMODE(\blk00000001/sig000001d0 ),
    .CEINMODE(\blk00000001/sig000001d0 ),
    .RSTP(\blk00000001/sig000001d0 ),
    .ACOUT({\NLW_blk00000001/blk000000c2_ACOUT<29>_UNCONNECTED , \NLW_blk00000001/blk000000c2_ACOUT<28>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_ACOUT<27>_UNCONNECTED , \NLW_blk00000001/blk000000c2_ACOUT<26>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_ACOUT<25>_UNCONNECTED , \NLW_blk00000001/blk000000c2_ACOUT<24>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_ACOUT<23>_UNCONNECTED , \NLW_blk00000001/blk000000c2_ACOUT<22>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_ACOUT<21>_UNCONNECTED , \NLW_blk00000001/blk000000c2_ACOUT<20>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_ACOUT<19>_UNCONNECTED , \NLW_blk00000001/blk000000c2_ACOUT<18>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_ACOUT<17>_UNCONNECTED , \NLW_blk00000001/blk000000c2_ACOUT<16>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_ACOUT<15>_UNCONNECTED , \NLW_blk00000001/blk000000c2_ACOUT<14>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_ACOUT<13>_UNCONNECTED , \NLW_blk00000001/blk000000c2_ACOUT<12>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_ACOUT<11>_UNCONNECTED , \NLW_blk00000001/blk000000c2_ACOUT<10>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_ACOUT<9>_UNCONNECTED , \NLW_blk00000001/blk000000c2_ACOUT<8>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_ACOUT<7>_UNCONNECTED , \NLW_blk00000001/blk000000c2_ACOUT<6>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_ACOUT<5>_UNCONNECTED , \NLW_blk00000001/blk000000c2_ACOUT<4>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_ACOUT<3>_UNCONNECTED , \NLW_blk00000001/blk000000c2_ACOUT<2>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_ACOUT<1>_UNCONNECTED , \NLW_blk00000001/blk000000c2_ACOUT<0>_UNCONNECTED }),
    .OPMODE({\blk00000001/sig000001d0 , \blk00000001/sig000001c2 , \blk00000001/sig000001c2 , \blk00000001/sig000001d0 , \blk00000001/sig000001af , 
\blk00000001/sig000001d0 , \blk00000001/sig000001af }),
    .PCIN({\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 }),
    .ALUMODE({\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000000b7 , \blk00000001/sig000000b7 }),
    .C({\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001e8 , 
\blk00000001/sig000001e7 , \blk00000001/sig000001e6 , \blk00000001/sig000001e5 , \blk00000001/sig000001e4 , \blk00000001/sig000001e3 , 
\blk00000001/sig000001e2 , \blk00000001/sig000001e1 , \blk00000001/sig000001e0 , \blk00000001/sig000001df , \blk00000001/sig000001de , 
\blk00000001/sig000001dd , \blk00000001/sig000001dc , \blk00000001/sig000001db , \blk00000001/sig000001da , \blk00000001/sig000001d9 , 
\blk00000001/sig000001d8 , \blk00000001/sig000001d7 , \blk00000001/sig000001d6 , \blk00000001/sig000001d5 , \blk00000001/sig000001d4 , 
\blk00000001/sig000001d3 , \blk00000001/sig000001d2 , \blk00000001/sig000001d1 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 }),
    .CARRYOUT({\NLW_blk00000001/blk000000c2_CARRYOUT<3>_UNCONNECTED , \NLW_blk00000001/blk000000c2_CARRYOUT<2>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_CARRYOUT<1>_UNCONNECTED , \NLW_blk00000001/blk000000c2_CARRYOUT<0>_UNCONNECTED }),
    .INMODE({\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 }),
    .BCIN({\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 }),
    .B({\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001bf , \blk00000001/sig000001be , \blk00000001/sig000001bd , 
\blk00000001/sig000001bc , \blk00000001/sig000001bb , \blk00000001/sig000001ba , \blk00000001/sig000001b9 , \blk00000001/sig000001b8 , 
\blk00000001/sig000001b7 , \blk00000001/sig000001b6 , \blk00000001/sig000001b5 , \blk00000001/sig000001b4 , \blk00000001/sig000001b3 , 
\blk00000001/sig000001b2 , \blk00000001/sig000001b1 , \blk00000001/sig000001b0 }),
    .BCOUT({\NLW_blk00000001/blk000000c2_BCOUT<17>_UNCONNECTED , \NLW_blk00000001/blk000000c2_BCOUT<16>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_BCOUT<15>_UNCONNECTED , \NLW_blk00000001/blk000000c2_BCOUT<14>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_BCOUT<13>_UNCONNECTED , \NLW_blk00000001/blk000000c2_BCOUT<12>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_BCOUT<11>_UNCONNECTED , \NLW_blk00000001/blk000000c2_BCOUT<10>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_BCOUT<9>_UNCONNECTED , \NLW_blk00000001/blk000000c2_BCOUT<8>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_BCOUT<7>_UNCONNECTED , \NLW_blk00000001/blk000000c2_BCOUT<6>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_BCOUT<5>_UNCONNECTED , \NLW_blk00000001/blk000000c2_BCOUT<4>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_BCOUT<3>_UNCONNECTED , \NLW_blk00000001/blk000000c2_BCOUT<2>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_BCOUT<1>_UNCONNECTED , \NLW_blk00000001/blk000000c2_BCOUT<0>_UNCONNECTED }),
    .D({\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 }),
    .P({\NLW_blk00000001/blk000000c2_P<47>_UNCONNECTED , \NLW_blk00000001/blk000000c2_P<46>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_P<45>_UNCONNECTED , \NLW_blk00000001/blk000000c2_P<44>_UNCONNECTED , \NLW_blk00000001/blk000000c2_P<43>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_P<42>_UNCONNECTED , \NLW_blk00000001/blk000000c2_P<41>_UNCONNECTED , \NLW_blk00000001/blk000000c2_P<40>_UNCONNECTED , 
\blk00000001/sig000001ad , \blk00000001/sig000001ac , \blk00000001/sig000001ab , \blk00000001/sig000001aa , \blk00000001/sig000001a9 , 
\blk00000001/sig000001a8 , \blk00000001/sig000001a7 , \blk00000001/sig000001a6 , \blk00000001/sig000001a5 , \blk00000001/sig000001a4 , 
\blk00000001/sig000001a3 , \blk00000001/sig000001a2 , \blk00000001/sig000001a1 , \blk00000001/sig000001a0 , \blk00000001/sig0000019f , 
\blk00000001/sig0000019e , \blk00000001/sig0000019d , \blk00000001/sig0000019c , \blk00000001/sig0000019b , \blk00000001/sig0000019a , 
\blk00000001/sig00000199 , \blk00000001/sig00000198 , \blk00000001/sig00000197 , \blk00000001/sig00000196 , \blk00000001/sig00000195 , 
\blk00000001/sig00000194 , \blk00000001/sig00000193 , \blk00000001/sig00000186 , \blk00000001/sig00000187 , \blk00000001/sig00000188 , 
\blk00000001/sig00000189 , \blk00000001/sig0000018a , \blk00000001/sig0000018b , \blk00000001/sig0000018c , \blk00000001/sig0000018d , 
\blk00000001/sig0000018e , \blk00000001/sig0000018f , \blk00000001/sig00000190 , \blk00000001/sig00000191 , \blk00000001/sig00000192 }),
    .A({\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig00000200 , \blk00000001/sig000001ff , \blk00000001/sig000001fe , \blk00000001/sig000001fd , 
\blk00000001/sig000001fc , \blk00000001/sig000001fb , \blk00000001/sig000001fa , \blk00000001/sig000001f9 , \blk00000001/sig000001f8 , 
\blk00000001/sig000001f7 , \blk00000001/sig000001f6 , \blk00000001/sig000001f5 , \blk00000001/sig000001f4 , \blk00000001/sig000001f3 , 
\blk00000001/sig000001f2 , \blk00000001/sig000001f1 , \blk00000001/sig000001f0 , \blk00000001/sig000001ef , \blk00000001/sig000001ee , 
\blk00000001/sig000001ed , \blk00000001/sig000001ec , \blk00000001/sig000001eb , \blk00000001/sig000001ea , \blk00000001/sig000001e9 }),
    .PCOUT({\NLW_blk00000001/blk000000c2_PCOUT<47>_UNCONNECTED , \NLW_blk00000001/blk000000c2_PCOUT<46>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_PCOUT<45>_UNCONNECTED , \NLW_blk00000001/blk000000c2_PCOUT<44>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_PCOUT<43>_UNCONNECTED , \NLW_blk00000001/blk000000c2_PCOUT<42>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_PCOUT<41>_UNCONNECTED , \NLW_blk00000001/blk000000c2_PCOUT<40>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_PCOUT<39>_UNCONNECTED , \NLW_blk00000001/blk000000c2_PCOUT<38>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_PCOUT<37>_UNCONNECTED , \NLW_blk00000001/blk000000c2_PCOUT<36>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_PCOUT<35>_UNCONNECTED , \NLW_blk00000001/blk000000c2_PCOUT<34>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_PCOUT<33>_UNCONNECTED , \NLW_blk00000001/blk000000c2_PCOUT<32>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_PCOUT<31>_UNCONNECTED , \NLW_blk00000001/blk000000c2_PCOUT<30>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_PCOUT<29>_UNCONNECTED , \NLW_blk00000001/blk000000c2_PCOUT<28>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_PCOUT<27>_UNCONNECTED , \NLW_blk00000001/blk000000c2_PCOUT<26>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_PCOUT<25>_UNCONNECTED , \NLW_blk00000001/blk000000c2_PCOUT<24>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_PCOUT<23>_UNCONNECTED , \NLW_blk00000001/blk000000c2_PCOUT<22>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_PCOUT<21>_UNCONNECTED , \NLW_blk00000001/blk000000c2_PCOUT<20>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_PCOUT<19>_UNCONNECTED , \NLW_blk00000001/blk000000c2_PCOUT<18>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_PCOUT<17>_UNCONNECTED , \NLW_blk00000001/blk000000c2_PCOUT<16>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_PCOUT<15>_UNCONNECTED , \NLW_blk00000001/blk000000c2_PCOUT<14>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_PCOUT<13>_UNCONNECTED , \NLW_blk00000001/blk000000c2_PCOUT<12>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_PCOUT<11>_UNCONNECTED , \NLW_blk00000001/blk000000c2_PCOUT<10>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_PCOUT<9>_UNCONNECTED , \NLW_blk00000001/blk000000c2_PCOUT<8>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_PCOUT<7>_UNCONNECTED , \NLW_blk00000001/blk000000c2_PCOUT<6>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_PCOUT<5>_UNCONNECTED , \NLW_blk00000001/blk000000c2_PCOUT<4>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_PCOUT<3>_UNCONNECTED , \NLW_blk00000001/blk000000c2_PCOUT<2>_UNCONNECTED , 
\NLW_blk00000001/blk000000c2_PCOUT<1>_UNCONNECTED , \NLW_blk00000001/blk000000c2_PCOUT<0>_UNCONNECTED }),
    .ACIN({\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , 
\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 }),
    .CARRYINSEL({\blk00000001/sig000001d0 , \blk00000001/sig000001d0 , \blk00000001/sig000001d0 })
  );
  MUXCY   \blk00000001/blk000000c1  (
    .CI(\blk00000001/sig000001c1 ),
    .DI(\blk00000001/sig000001e8 ),
    .S(\blk00000001/sig0000027a ),
    .O(\blk00000001/sig000001c0 )
  );
  XORCY   \blk00000001/blk000000c0  (
    .CI(\blk00000001/sig000001c1 ),
    .LI(\blk00000001/sig0000027a ),
    .O(\NLW_blk00000001/blk000000c0_O_UNCONNECTED )
  );
  MUXCY   \blk00000001/blk000000bf  (
    .CI(\blk00000001/sig000001e8 ),
    .DI(\blk00000001/sig000001d0 ),
    .S(\blk00000001/sig000001c9 ),
    .O(\blk00000001/sig000001cf )
  );
  MUXCY   \blk00000001/blk000000be  (
    .CI(\blk00000001/sig000001cf ),
    .DI(\blk00000001/sig000001d0 ),
    .S(\blk00000001/sig000001c8 ),
    .O(\blk00000001/sig000001ce )
  );
  MUXCY   \blk00000001/blk000000bd  (
    .CI(\blk00000001/sig000001ce ),
    .DI(\blk00000001/sig000001d0 ),
    .S(\blk00000001/sig000001c7 ),
    .O(\blk00000001/sig000001cd )
  );
  MUXCY   \blk00000001/blk000000bc  (
    .CI(\blk00000001/sig000001cd ),
    .DI(\blk00000001/sig000001d0 ),
    .S(\blk00000001/sig000001c6 ),
    .O(\blk00000001/sig000001cc )
  );
  MUXCY   \blk00000001/blk000000bb  (
    .CI(\blk00000001/sig000001cc ),
    .DI(\blk00000001/sig000001d0 ),
    .S(\blk00000001/sig000001c5 ),
    .O(\blk00000001/sig000001cb )
  );
  MUXCY   \blk00000001/blk000000ba  (
    .CI(\blk00000001/sig000001cb ),
    .DI(\blk00000001/sig000001d0 ),
    .S(\blk00000001/sig000001c4 ),
    .O(\blk00000001/sig000001ca )
  );
  MUXCY   \blk00000001/blk000000b9  (
    .CI(\blk00000001/sig000001ca ),
    .DI(\blk00000001/sig000001d0 ),
    .S(\blk00000001/sig000001c3 ),
    .O(\blk00000001/sig000001c1 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000b8  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig00000183 ),
    .Q(\blk00000001/sig00000088 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000b7  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_b_tdata[0]),
    .Q(\blk00000001/sig00000089 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000b6  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_b_tdata[1]),
    .Q(\blk00000001/sig0000008a )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000b5  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_b_tdata[2]),
    .Q(\blk00000001/sig0000008b )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000b4  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_b_tdata[3]),
    .Q(\blk00000001/sig0000008c )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000b3  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_b_tdata[4]),
    .Q(\blk00000001/sig0000008d )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000b2  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_b_tdata[5]),
    .Q(\blk00000001/sig0000008e )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000b1  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_b_tdata[6]),
    .Q(\blk00000001/sig0000008f )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000b0  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_b_tdata[7]),
    .Q(\blk00000001/sig00000090 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000af  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_b_tdata[8]),
    .Q(\blk00000001/sig00000091 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000ae  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_b_tdata[9]),
    .Q(\blk00000001/sig00000092 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000ad  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_b_tdata[10]),
    .Q(\blk00000001/sig00000093 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000ac  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_b_tdata[11]),
    .Q(\blk00000001/sig00000094 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000ab  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_b_tdata[12]),
    .Q(\blk00000001/sig00000095 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000aa  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_b_tdata[13]),
    .Q(\blk00000001/sig00000096 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000a9  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_b_tdata[14]),
    .Q(\blk00000001/sig00000097 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000a8  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_b_tdata[15]),
    .Q(\blk00000001/sig00000098 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000a7  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_b_tdata[16]),
    .Q(\blk00000001/sig00000099 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000a6  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_b_tdata[17]),
    .Q(\blk00000001/sig0000009a )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000a5  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_b_tdata[18]),
    .Q(\blk00000001/sig0000009b )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000a4  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_b_tdata[19]),
    .Q(\blk00000001/sig0000009c )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000a3  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_b_tdata[20]),
    .Q(\blk00000001/sig0000009d )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000a2  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_b_tdata[21]),
    .Q(\blk00000001/sig0000009e )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000a1  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_b_tdata[22]),
    .Q(\blk00000001/sig0000009f )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000a0  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_a_tdata[0]),
    .Q(\blk00000001/sig000000a0 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000009f  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_a_tdata[1]),
    .Q(\blk00000001/sig000000a1 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000009e  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_a_tdata[2]),
    .Q(\blk00000001/sig000000a2 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000009d  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_a_tdata[3]),
    .Q(\blk00000001/sig000000a3 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000009c  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_a_tdata[4]),
    .Q(\blk00000001/sig000000a4 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000009b  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_a_tdata[5]),
    .Q(\blk00000001/sig000000a5 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000009a  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_a_tdata[6]),
    .Q(\blk00000001/sig000000a6 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000099  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_a_tdata[7]),
    .Q(\blk00000001/sig000000a7 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000098  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_a_tdata[8]),
    .Q(\blk00000001/sig000000a8 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000097  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_a_tdata[9]),
    .Q(\blk00000001/sig000000a9 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000096  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_a_tdata[10]),
    .Q(\blk00000001/sig000000aa )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000095  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_a_tdata[11]),
    .Q(\blk00000001/sig000000ab )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000094  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_a_tdata[12]),
    .Q(\blk00000001/sig000000ac )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000093  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_a_tdata[13]),
    .Q(\blk00000001/sig000000ad )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000092  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_a_tdata[14]),
    .Q(\blk00000001/sig000000ae )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000091  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_a_tdata[15]),
    .Q(\blk00000001/sig000000af )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000090  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_a_tdata[16]),
    .Q(\blk00000001/sig000000b0 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000008f  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_a_tdata[17]),
    .Q(\blk00000001/sig000000b1 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000008e  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_a_tdata[18]),
    .Q(\blk00000001/sig000000b2 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000008d  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_a_tdata[19]),
    .Q(\blk00000001/sig000000b3 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000008c  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_a_tdata[20]),
    .Q(\blk00000001/sig000000b4 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000008b  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_a_tdata[21]),
    .Q(\blk00000001/sig000000b5 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000008a  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_a_tdata[22]),
    .Q(\blk00000001/sig000000b6 )
  );
  MUXCY   \blk00000001/blk00000089  (
    .CI(\blk00000001/sig000001d0 ),
    .DI(\blk00000001/sig000001e8 ),
    .S(\blk00000001/sig000000e3 ),
    .O(\blk00000001/sig00000182 )
  );
  XORCY   \blk00000001/blk00000088  (
    .CI(\blk00000001/sig000001d0 ),
    .LI(\blk00000001/sig000000e3 ),
    .O(\blk00000001/sig00000181 )
  );
  MUXCY   \blk00000001/blk00000087  (
    .CI(\blk00000001/sig00000182 ),
    .DI(\blk00000001/sig000001d0 ),
    .S(\blk00000001/sig000000e4 ),
    .O(\blk00000001/sig00000180 )
  );
  XORCY   \blk00000001/blk00000086  (
    .CI(\blk00000001/sig00000182 ),
    .LI(\blk00000001/sig000000e4 ),
    .O(\blk00000001/sig0000017f )
  );
  MUXCY   \blk00000001/blk00000085  (
    .CI(\blk00000001/sig00000180 ),
    .DI(\blk00000001/sig000001d0 ),
    .S(\blk00000001/sig000000e5 ),
    .O(\blk00000001/sig0000017e )
  );
  XORCY   \blk00000001/blk00000084  (
    .CI(\blk00000001/sig00000180 ),
    .LI(\blk00000001/sig000000e5 ),
    .O(\blk00000001/sig0000017d )
  );
  MUXCY   \blk00000001/blk00000083  (
    .CI(\blk00000001/sig0000017e ),
    .DI(\blk00000001/sig000001d0 ),
    .S(\blk00000001/sig000000e6 ),
    .O(\blk00000001/sig0000017c )
  );
  XORCY   \blk00000001/blk00000082  (
    .CI(\blk00000001/sig0000017e ),
    .LI(\blk00000001/sig000000e6 ),
    .O(\blk00000001/sig0000017b )
  );
  MUXCY   \blk00000001/blk00000081  (
    .CI(\blk00000001/sig0000017c ),
    .DI(\blk00000001/sig000001d0 ),
    .S(\blk00000001/sig000000e7 ),
    .O(\blk00000001/sig0000017a )
  );
  XORCY   \blk00000001/blk00000080  (
    .CI(\blk00000001/sig0000017c ),
    .LI(\blk00000001/sig000000e7 ),
    .O(\blk00000001/sig00000179 )
  );
  MUXCY   \blk00000001/blk0000007f  (
    .CI(\blk00000001/sig0000017a ),
    .DI(\blk00000001/sig000001d0 ),
    .S(\blk00000001/sig000000e8 ),
    .O(\blk00000001/sig00000178 )
  );
  XORCY   \blk00000001/blk0000007e  (
    .CI(\blk00000001/sig0000017a ),
    .LI(\blk00000001/sig000000e8 ),
    .O(\blk00000001/sig00000177 )
  );
  MUXCY   \blk00000001/blk0000007d  (
    .CI(\blk00000001/sig00000178 ),
    .DI(\blk00000001/sig000001d0 ),
    .S(\blk00000001/sig000000e9 ),
    .O(\blk00000001/sig00000176 )
  );
  XORCY   \blk00000001/blk0000007c  (
    .CI(\blk00000001/sig00000178 ),
    .LI(\blk00000001/sig000000e9 ),
    .O(\blk00000001/sig00000175 )
  );
  MUXCY   \blk00000001/blk0000007b  (
    .CI(\blk00000001/sig00000176 ),
    .DI(\blk00000001/sig000001d0 ),
    .S(\blk00000001/sig000000ea ),
    .O(\blk00000001/sig00000174 )
  );
  XORCY   \blk00000001/blk0000007a  (
    .CI(\blk00000001/sig00000176 ),
    .LI(\blk00000001/sig000000ea ),
    .O(\blk00000001/sig00000173 )
  );
  XORCY   \blk00000001/blk00000079  (
    .CI(\blk00000001/sig00000174 ),
    .LI(\blk00000001/sig000001d0 ),
    .O(\NLW_blk00000001/blk00000079_O_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000078  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig000000f9 ),
    .Q(\blk00000001/sig00000110 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000077  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig000000fa ),
    .Q(\blk00000001/sig00000111 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000076  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig00000181 ),
    .Q(\blk00000001/sig00000107 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000075  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig0000017f ),
    .Q(\blk00000001/sig00000108 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000074  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig0000017d ),
    .Q(\blk00000001/sig00000109 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000073  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig0000017b ),
    .Q(\blk00000001/sig0000010a )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000072  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig00000179 ),
    .Q(\blk00000001/sig0000010b )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000071  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig00000177 ),
    .Q(\blk00000001/sig0000010c )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000070  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig00000175 ),
    .Q(\blk00000001/sig0000010d )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000006f  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig00000173 ),
    .Q(\blk00000001/sig0000010e )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000006e  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig000000ee ),
    .Q(\blk00000001/sig000000b9 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000006d  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig000000ef ),
    .Q(\blk00000001/sig000000ba )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000006c  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig000000f0 ),
    .Q(\blk00000001/sig000000bb )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000006b  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig000000f1 ),
    .Q(\blk00000001/sig000000bc )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000006a  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig000000f2 ),
    .Q(\blk00000001/sig000000bd )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000069  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig000000f3 ),
    .Q(\blk00000001/sig000000be )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000068  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig000000f4 ),
    .Q(\blk00000001/sig000000bf )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000067  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig000000f5 ),
    .Q(\blk00000001/sig000000c0 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000066  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig000000f6 ),
    .Q(\blk00000001/sig000000c1 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000065  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig000000ed ),
    .Q(\blk00000001/sig000000b7 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000064  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_b_tdata[31]),
    .Q(\blk00000001/sig00000116 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000063  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_a_tdata[31]),
    .Q(\blk00000001/sig00000117 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000062  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_b_tdata[23]),
    .Q(\blk00000001/sig00000118 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000061  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_b_tdata[24]),
    .Q(\blk00000001/sig00000119 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000060  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_b_tdata[25]),
    .Q(\blk00000001/sig0000011a )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000005f  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_b_tdata[26]),
    .Q(\blk00000001/sig0000011b )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000005e  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_b_tdata[27]),
    .Q(\blk00000001/sig0000011c )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000005d  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_b_tdata[28]),
    .Q(\blk00000001/sig0000011d )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000005c  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_b_tdata[29]),
    .Q(\blk00000001/sig0000011e )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000005b  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_b_tdata[30]),
    .Q(\blk00000001/sig0000011f )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000005a  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_a_tdata[23]),
    .Q(\blk00000001/sig00000120 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000059  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_a_tdata[24]),
    .Q(\blk00000001/sig00000121 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000058  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_a_tdata[25]),
    .Q(\blk00000001/sig00000122 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000057  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_a_tdata[26]),
    .Q(\blk00000001/sig00000123 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000056  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_a_tdata[27]),
    .Q(\blk00000001/sig00000124 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000055  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_a_tdata[28]),
    .Q(\blk00000001/sig00000125 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000054  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_a_tdata[29]),
    .Q(\blk00000001/sig00000126 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000053  (
    .C(aclk),
    .CE(aclken),
    .D(s_axis_a_tdata[30]),
    .Q(\blk00000001/sig00000127 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000052  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig00000163 ),
    .Q(\blk00000001/sig000000b8 )
  );
  MUXCY   \blk00000001/blk00000051  (
    .CI(\blk00000001/sig000001d0 ),
    .DI(\blk00000001/sig00000161 ),
    .S(\blk00000001/sig00000162 ),
    .O(\blk00000001/sig00000172 )
  );
  MUXCY   \blk00000001/blk00000050  (
    .CI(\blk00000001/sig00000172 ),
    .DI(\blk00000001/sig0000015f ),
    .S(\blk00000001/sig00000160 ),
    .O(\blk00000001/sig00000171 )
  );
  MUXCY   \blk00000001/blk0000004f  (
    .CI(\blk00000001/sig00000171 ),
    .DI(\blk00000001/sig0000015d ),
    .S(\blk00000001/sig0000015e ),
    .O(\blk00000001/sig00000170 )
  );
  MUXCY   \blk00000001/blk0000004e  (
    .CI(\blk00000001/sig00000170 ),
    .DI(\blk00000001/sig0000015b ),
    .S(\blk00000001/sig0000015c ),
    .O(\blk00000001/sig0000016f )
  );
  MUXCY   \blk00000001/blk0000004d  (
    .CI(\blk00000001/sig0000016f ),
    .DI(\blk00000001/sig00000159 ),
    .S(\blk00000001/sig0000015a ),
    .O(\blk00000001/sig0000016e )
  );
  MUXCY   \blk00000001/blk0000004c  (
    .CI(\blk00000001/sig0000016e ),
    .DI(\blk00000001/sig00000157 ),
    .S(\blk00000001/sig00000158 ),
    .O(\blk00000001/sig0000016d )
  );
  MUXCY   \blk00000001/blk0000004b  (
    .CI(\blk00000001/sig0000016d ),
    .DI(\blk00000001/sig00000155 ),
    .S(\blk00000001/sig00000156 ),
    .O(\blk00000001/sig0000016c )
  );
  MUXCY   \blk00000001/blk0000004a  (
    .CI(\blk00000001/sig0000016c ),
    .DI(\blk00000001/sig00000153 ),
    .S(\blk00000001/sig00000154 ),
    .O(\blk00000001/sig0000016b )
  );
  MUXCY   \blk00000001/blk00000049  (
    .CI(\blk00000001/sig0000016b ),
    .DI(\blk00000001/sig00000151 ),
    .S(\blk00000001/sig00000152 ),
    .O(\blk00000001/sig0000016a )
  );
  MUXCY   \blk00000001/blk00000048  (
    .CI(\blk00000001/sig0000016a ),
    .DI(\blk00000001/sig0000014f ),
    .S(\blk00000001/sig00000150 ),
    .O(\blk00000001/sig00000169 )
  );
  MUXCY   \blk00000001/blk00000047  (
    .CI(\blk00000001/sig00000169 ),
    .DI(\blk00000001/sig0000014d ),
    .S(\blk00000001/sig0000014e ),
    .O(\blk00000001/sig00000168 )
  );
  MUXCY   \blk00000001/blk00000046  (
    .CI(\blk00000001/sig00000168 ),
    .DI(\blk00000001/sig0000014b ),
    .S(\blk00000001/sig0000014c ),
    .O(\blk00000001/sig00000167 )
  );
  MUXCY   \blk00000001/blk00000045  (
    .CI(\blk00000001/sig00000167 ),
    .DI(\blk00000001/sig00000149 ),
    .S(\blk00000001/sig0000014a ),
    .O(\blk00000001/sig00000166 )
  );
  MUXCY   \blk00000001/blk00000044  (
    .CI(\blk00000001/sig00000166 ),
    .DI(\blk00000001/sig00000147 ),
    .S(\blk00000001/sig00000148 ),
    .O(\blk00000001/sig00000165 )
  );
  MUXCY   \blk00000001/blk00000043  (
    .CI(\blk00000001/sig00000165 ),
    .DI(\blk00000001/sig00000145 ),
    .S(\blk00000001/sig00000146 ),
    .O(\blk00000001/sig00000164 )
  );
  MUXCY   \blk00000001/blk00000042  (
    .CI(\blk00000001/sig00000164 ),
    .DI(\blk00000001/sig00000143 ),
    .S(\blk00000001/sig00000144 ),
    .O(\blk00000001/sig00000163 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000041  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig00000130 ),
    .Q(\blk00000001/sig0000012c )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000040  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig0000012f ),
    .Q(\blk00000001/sig0000012b )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000003f  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig0000012e ),
    .Q(\blk00000001/sig0000012a )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000003e  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig0000012d ),
    .Q(\blk00000001/sig00000129 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000003d  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig000000f8 ),
    .Q(\blk00000001/sig0000010f )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000003c  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig000000f7 ),
    .Q(\blk00000001/sig00000067 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000003b  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig0000013e ),
    .Q(\blk00000001/sig00000142 )
  );
  MUXCY   \blk00000001/blk0000003a  (
    .CI(\blk00000001/sig000001e8 ),
    .DI(\blk00000001/sig000001d0 ),
    .S(\blk00000001/sig00000133 ),
    .O(\blk00000001/sig00000141 )
  );
  MUXCY   \blk00000001/blk00000039  (
    .CI(\blk00000001/sig00000141 ),
    .DI(\blk00000001/sig000001d0 ),
    .S(\blk00000001/sig00000132 ),
    .O(\blk00000001/sig00000140 )
  );
  MUXCY   \blk00000001/blk00000038  (
    .CI(\blk00000001/sig00000140 ),
    .DI(\blk00000001/sig000001d0 ),
    .S(\blk00000001/sig00000131 ),
    .O(\blk00000001/sig0000013f )
  );
  MUXCY   \blk00000001/blk00000037  (
    .CI(\blk00000001/sig0000013f ),
    .DI(\blk00000001/sig000001d0 ),
    .S(\blk00000001/sig00000134 ),
    .O(\blk00000001/sig0000013e )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000036  (
    .C(aclk),
    .CE(aclken),
    .D(\blk00000001/sig00000139 ),
    .Q(\blk00000001/sig0000013d )
  );
  MUXCY   \blk00000001/blk00000035  (
    .CI(\blk00000001/sig000001e8 ),
    .DI(\blk00000001/sig000001d0 ),
    .S(\blk00000001/sig00000137 ),
    .O(\blk00000001/sig0000013c )
  );
  MUXCY   \blk00000001/blk00000034  (
    .CI(\blk00000001/sig0000013c ),
    .DI(\blk00000001/sig000001d0 ),
    .S(\blk00000001/sig00000136 ),
    .O(\blk00000001/sig0000013b )
  );
  MUXCY   \blk00000001/blk00000033  (
    .CI(\blk00000001/sig0000013b ),
    .DI(\blk00000001/sig000001d0 ),
    .S(\blk00000001/sig00000135 ),
    .O(\blk00000001/sig0000013a )
  );
  MUXCY   \blk00000001/blk00000032  (
    .CI(\blk00000001/sig0000013a ),
    .DI(\blk00000001/sig000001d0 ),
    .S(\blk00000001/sig00000138 ),
    .O(\blk00000001/sig00000139 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000001/blk00000031  (
    .I0(s_axis_b_tdata[23]),
    .I1(s_axis_a_tdata[23]),
    .O(\blk00000001/sig000000e2 )
  );
  MUXCY   \blk00000001/blk00000030  (
    .CI(\blk00000001/sig000001e8 ),
    .DI(s_axis_b_tdata[23]),
    .S(\blk00000001/sig000000e2 ),
    .O(\blk00000001/sig000000e1 )
  );
  XORCY   \blk00000001/blk0000002f  (
    .CI(\blk00000001/sig000001e8 ),
    .LI(\blk00000001/sig000000e2 ),
    .O(\blk00000001/sig000000ee )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000001/blk0000002e  (
    .I0(s_axis_b_tdata[24]),
    .I1(s_axis_a_tdata[24]),
    .O(\blk00000001/sig000000e0 )
  );
  MUXCY   \blk00000001/blk0000002d  (
    .CI(\blk00000001/sig000000e1 ),
    .DI(s_axis_b_tdata[24]),
    .S(\blk00000001/sig000000e0 ),
    .O(\blk00000001/sig000000df )
  );
  XORCY   \blk00000001/blk0000002c  (
    .CI(\blk00000001/sig000000e1 ),
    .LI(\blk00000001/sig000000e0 ),
    .O(\blk00000001/sig000000ef )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000001/blk0000002b  (
    .I0(s_axis_b_tdata[25]),
    .I1(s_axis_a_tdata[25]),
    .O(\blk00000001/sig000000de )
  );
  MUXCY   \blk00000001/blk0000002a  (
    .CI(\blk00000001/sig000000df ),
    .DI(s_axis_b_tdata[25]),
    .S(\blk00000001/sig000000de ),
    .O(\blk00000001/sig000000dd )
  );
  XORCY   \blk00000001/blk00000029  (
    .CI(\blk00000001/sig000000df ),
    .LI(\blk00000001/sig000000de ),
    .O(\blk00000001/sig000000f0 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000001/blk00000028  (
    .I0(s_axis_b_tdata[26]),
    .I1(s_axis_a_tdata[26]),
    .O(\blk00000001/sig000000dc )
  );
  MUXCY   \blk00000001/blk00000027  (
    .CI(\blk00000001/sig000000dd ),
    .DI(s_axis_b_tdata[26]),
    .S(\blk00000001/sig000000dc ),
    .O(\blk00000001/sig000000db )
  );
  XORCY   \blk00000001/blk00000026  (
    .CI(\blk00000001/sig000000dd ),
    .LI(\blk00000001/sig000000dc ),
    .O(\blk00000001/sig000000f1 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000001/blk00000025  (
    .I0(s_axis_b_tdata[27]),
    .I1(s_axis_a_tdata[27]),
    .O(\blk00000001/sig000000da )
  );
  MUXCY   \blk00000001/blk00000024  (
    .CI(\blk00000001/sig000000db ),
    .DI(s_axis_b_tdata[27]),
    .S(\blk00000001/sig000000da ),
    .O(\blk00000001/sig000000d9 )
  );
  XORCY   \blk00000001/blk00000023  (
    .CI(\blk00000001/sig000000db ),
    .LI(\blk00000001/sig000000da ),
    .O(\blk00000001/sig000000f2 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000001/blk00000022  (
    .I0(s_axis_b_tdata[28]),
    .I1(s_axis_a_tdata[28]),
    .O(\blk00000001/sig000000d8 )
  );
  MUXCY   \blk00000001/blk00000021  (
    .CI(\blk00000001/sig000000d9 ),
    .DI(s_axis_b_tdata[28]),
    .S(\blk00000001/sig000000d8 ),
    .O(\blk00000001/sig000000d7 )
  );
  XORCY   \blk00000001/blk00000020  (
    .CI(\blk00000001/sig000000d9 ),
    .LI(\blk00000001/sig000000d8 ),
    .O(\blk00000001/sig000000f3 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000001/blk0000001f  (
    .I0(s_axis_b_tdata[29]),
    .I1(s_axis_a_tdata[29]),
    .O(\blk00000001/sig000000d6 )
  );
  MUXCY   \blk00000001/blk0000001e  (
    .CI(\blk00000001/sig000000d7 ),
    .DI(s_axis_b_tdata[29]),
    .S(\blk00000001/sig000000d6 ),
    .O(\blk00000001/sig000000d5 )
  );
  XORCY   \blk00000001/blk0000001d  (
    .CI(\blk00000001/sig000000d7 ),
    .LI(\blk00000001/sig000000d6 ),
    .O(\blk00000001/sig000000f4 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000001/blk0000001c  (
    .I0(s_axis_b_tdata[30]),
    .I1(s_axis_a_tdata[30]),
    .O(\blk00000001/sig000000d4 )
  );
  MUXCY   \blk00000001/blk0000001b  (
    .CI(\blk00000001/sig000000d5 ),
    .DI(s_axis_b_tdata[30]),
    .S(\blk00000001/sig000000d4 ),
    .O(\blk00000001/sig000000d3 )
  );
  XORCY   \blk00000001/blk0000001a  (
    .CI(\blk00000001/sig000000d5 ),
    .LI(\blk00000001/sig000000d4 ),
    .O(\blk00000001/sig000000f5 )
  );
  XORCY   \blk00000001/blk00000019  (
    .CI(\blk00000001/sig000000d3 ),
    .LI(\blk00000001/sig000001e8 ),
    .O(\blk00000001/sig000000f6 )
  );
  MUXCY   \blk00000001/blk00000018  (
    .CI(\blk00000001/sig000001e8 ),
    .DI(\blk00000001/sig00000107 ),
    .S(\blk00000001/sig000000d2 ),
    .O(\blk00000001/sig000000d1 )
  );
  XORCY   \blk00000001/blk00000017  (
    .CI(\blk00000001/sig000001e8 ),
    .LI(\blk00000001/sig000000d2 ),
    .O(\blk00000001/sig000000fb )
  );
  MUXCY   \blk00000001/blk00000016  (
    .CI(\blk00000001/sig000000d1 ),
    .DI(\blk00000001/sig00000108 ),
    .S(\blk00000001/sig000000d0 ),
    .O(\blk00000001/sig000000cf )
  );
  XORCY   \blk00000001/blk00000015  (
    .CI(\blk00000001/sig000000d1 ),
    .LI(\blk00000001/sig000000d0 ),
    .O(\blk00000001/sig000000fc )
  );
  MUXCY   \blk00000001/blk00000014  (
    .CI(\blk00000001/sig000000cf ),
    .DI(\blk00000001/sig00000109 ),
    .S(\blk00000001/sig000000ce ),
    .O(\blk00000001/sig000000cd )
  );
  XORCY   \blk00000001/blk00000013  (
    .CI(\blk00000001/sig000000cf ),
    .LI(\blk00000001/sig000000ce ),
    .O(\blk00000001/sig000000fd )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000001/blk00000012  (
    .I0(\blk00000001/sig0000010a ),
    .I1(\blk00000001/sig0000024f ),
    .O(\blk00000001/sig000000cc )
  );
  MUXCY   \blk00000001/blk00000011  (
    .CI(\blk00000001/sig000000cd ),
    .DI(\blk00000001/sig0000010a ),
    .S(\blk00000001/sig000000cc ),
    .O(\blk00000001/sig000000cb )
  );
  XORCY   \blk00000001/blk00000010  (
    .CI(\blk00000001/sig000000cd ),
    .LI(\blk00000001/sig000000cc ),
    .O(\blk00000001/sig000000fe )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000001/blk0000000f  (
    .I0(\blk00000001/sig0000010b ),
    .I1(\blk00000001/sig00000253 ),
    .O(\blk00000001/sig000000ca )
  );
  MUXCY   \blk00000001/blk0000000e  (
    .CI(\blk00000001/sig000000cb ),
    .DI(\blk00000001/sig0000010b ),
    .S(\blk00000001/sig000000ca ),
    .O(\blk00000001/sig000000c9 )
  );
  XORCY   \blk00000001/blk0000000d  (
    .CI(\blk00000001/sig000000cb ),
    .LI(\blk00000001/sig000000ca ),
    .O(\blk00000001/sig000000ff )
  );
  MUXCY   \blk00000001/blk0000000c  (
    .CI(\blk00000001/sig000000c9 ),
    .DI(\blk00000001/sig0000010c ),
    .S(\blk00000001/sig000000c8 ),
    .O(\blk00000001/sig000000c7 )
  );
  XORCY   \blk00000001/blk0000000b  (
    .CI(\blk00000001/sig000000c9 ),
    .LI(\blk00000001/sig000000c8 ),
    .O(\blk00000001/sig00000100 )
  );
  MUXCY   \blk00000001/blk0000000a  (
    .CI(\blk00000001/sig000000c7 ),
    .DI(\blk00000001/sig0000010d ),
    .S(\blk00000001/sig000000c6 ),
    .O(\blk00000001/sig000000c5 )
  );
  XORCY   \blk00000001/blk00000009  (
    .CI(\blk00000001/sig000000c7 ),
    .LI(\blk00000001/sig000000c6 ),
    .O(\blk00000001/sig00000101 )
  );
  MUXCY   \blk00000001/blk00000008  (
    .CI(\blk00000001/sig000000c5 ),
    .DI(\blk00000001/sig0000010e ),
    .S(\blk00000001/sig000000c4 ),
    .O(\blk00000001/sig000000c3 )
  );
  XORCY   \blk00000001/blk00000007  (
    .CI(\blk00000001/sig000000c5 ),
    .LI(\blk00000001/sig000000c4 ),
    .O(\blk00000001/sig00000102 )
  );
  MUXCY   \blk00000001/blk00000006  (
    .CI(\blk00000001/sig000000c3 ),
    .DI(\blk00000001/sig000001d0 ),
    .S(\blk00000001/sig000001e8 ),
    .O(\blk00000001/sig000000c2 )
  );
  XORCY   \blk00000001/blk00000005  (
    .CI(\blk00000001/sig000000c3 ),
    .LI(\blk00000001/sig000001e8 ),
    .O(\blk00000001/sig00000103 )
  );
  XORCY   \blk00000001/blk00000004  (
    .CI(\blk00000001/sig000000c2 ),
    .LI(\blk00000001/sig000001e8 ),
    .O(\blk00000001/sig00000104 )
  );
  GND   \blk00000001/blk00000003  (
    .G(\blk00000001/sig000001d0 )
  );
  VCC   \blk00000001/blk00000002  (
    .P(\blk00000001/sig000001e8 )
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
