`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/30 10:44:51
// Design Name: 
// Module Name: fir_h_i
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


module fir_h_i(
    input wire          aclk,
    input wire [15:0]   s_axis_data_tdata,
    input wire          s_axis_data_tvalid,
    output wire         s_axis_data_tready,
    output wire         m_axis_data_tvalid,
    output wire [23:0]  m_axis_data_tdata

    );
    
fir_h_i fir_h_i_inst(
    .aclk(aclk),
    .s_axis_data_tdata(s_axis_data_tdata),
    .s_axis_data_tvalid( s_axis_data_tvalid),
    .s_axis_data_tready(s_axis_data_tready),
    .m_axis_data_tvalid(m_axis_data_tvalid),
    .m_axis_data_tdata(m_axis_data_tdata)
);
endmodule
