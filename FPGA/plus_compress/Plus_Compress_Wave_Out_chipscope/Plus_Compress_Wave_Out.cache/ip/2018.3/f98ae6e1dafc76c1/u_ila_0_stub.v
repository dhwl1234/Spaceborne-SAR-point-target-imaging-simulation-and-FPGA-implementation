// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Sat Apr  2 20:49:59 2022
// Host        : LAPTOP-50M5PQTT running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ u_ila_0_stub.v
// Design      : u_ila_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tfbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ila,Vivado 2018.3" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk, probe0, probe1, probe2, probe3, probe4, probe5, 
  probe6, probe7, probe8, probe9, probe10)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[15:0],probe1[15:0],probe2[39:0],probe3[39:0],probe4[39:0],probe5[39:0],probe6[39:0],probe7[39:0],probe8[39:0],probe9[0:0],probe10[0:0]" */;
  input clk;
  input [15:0]probe0;
  input [15:0]probe1;
  input [39:0]probe2;
  input [39:0]probe3;
  input [39:0]probe4;
  input [39:0]probe5;
  input [39:0]probe6;
  input [39:0]probe7;
  input [39:0]probe8;
  input [0:0]probe9;
  input [0:0]probe10;
endmodule
