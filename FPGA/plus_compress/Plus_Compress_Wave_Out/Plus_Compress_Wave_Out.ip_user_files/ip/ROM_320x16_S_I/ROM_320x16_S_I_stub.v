// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Wed Mar 30 20:56:10 2022
// Host        : LAPTOP-50M5PQTT running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out/Plus_Compress_Wave_Out.srcs/sources_1/ip/ROM_320x16_S_I/ROM_320x16_S_I_stub.v
// Design      : ROM_320x16_S_I
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tfbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_2,Vivado 2018.3" *)
module ROM_320x16_S_I(clka, addra, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,addra[8:0],douta[15:0]" */;
  input clka;
  input [8:0]addra;
  output [15:0]douta;
endmodule
