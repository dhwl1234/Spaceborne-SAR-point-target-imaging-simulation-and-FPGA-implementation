// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "cordic_v6_0_14,Vivado 2018.3" *)
module cordic_0(aclk, s_axis_cartesian_tvalid, 
  s_axis_cartesian_tdata, m_axis_dout_tvalid, m_axis_dout_tdata);
  input aclk;
  input s_axis_cartesian_tvalid;
  input [79:0]s_axis_cartesian_tdata;
  output m_axis_dout_tvalid;
  output [79:0]m_axis_dout_tdata;
endmodule
