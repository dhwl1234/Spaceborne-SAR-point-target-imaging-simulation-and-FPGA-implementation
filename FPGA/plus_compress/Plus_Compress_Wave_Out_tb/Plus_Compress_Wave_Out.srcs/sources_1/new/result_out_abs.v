`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/30 22:01:39
// Design Name: 
// Module Name: result_out_abs
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module result_out_abs(
    input wire aclk,
    input wire[79:0] compress_result_I_Q,
    input wire       abs_data_in_valid,
    output wire      abs_data_out_valid,
    output wire[79:0]compress_result

    );
    
cordic_0 cordic_0_inst
(
    .aclk(aclk),
    .s_axis_cartesian_tdata(compress_result_I_Q),
    .s_axis_cartesian_tvalid(abs_data_in_valid),
    .m_axis_dout_tdata(compress_result),
    .m_axis_dout_tvalid(abs_data_out_valid)
);
endmodule
