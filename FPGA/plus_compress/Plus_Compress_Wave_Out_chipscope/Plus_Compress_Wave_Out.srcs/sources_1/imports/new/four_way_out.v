`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/30 16:56:42
// Design Name: 
// Module Name: four_way_out
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


module four_way_out(
    input wire          aclk,
    
    input wire [15:0]   s_axis_data_tdata_si_hi,
    input wire          s_axis_data_tvalid_si_hi,
    output wire         s_axis_data_tready_si_hi,
    output wire         m_axis_data_tvalid_si_hi,
    output wire [39:0]  m_axis_data_tdata_si_hi,
    
    input wire [15:0]   s_axis_data_tdata_si_hq,
    input wire          s_axis_data_tvalid_si_hq,
    output wire         s_axis_data_tready_si_hq,
    output wire         m_axis_data_tvalid_si_hq,
    output wire [39:0]  m_axis_data_tdata_si_hq,
    
    input wire [15:0]   s_axis_data_tdata_sq_hi,
    input wire          s_axis_data_tvalid_sq_hi,
    output wire         s_axis_data_tready_sq_hi,
    output wire         m_axis_data_tvalid_sq_hi,
    output wire [39:0]  m_axis_data_tdata_sq_hi,
    
    input wire [15:0]   s_axis_data_tdata_sq_hq,
    input wire          s_axis_data_tvalid_sq_hq,
    output wire         s_axis_data_tready_sq_hq,
    output wire         m_axis_data_tvalid_sq_hq,
    output wire [39:0]  m_axis_data_tdata_sq_hq
);    
Conv_Si_Hi Conv_Si_Hi_inst(
    .aclk(aclk),
    .s_axis_data_tdata(s_axis_data_tdata_si_hi),
    .s_axis_data_tvalid( s_axis_data_tvalid_si_hi),
    .s_axis_data_tready(s_axis_data_tready_si_hi),
    .m_axis_data_tvalid(m_axis_data_tvalid_si_hi),
    .m_axis_data_tdata(m_axis_data_tdata_si_hi)
);

Conv_Si_Hq Conv_Si_Hq_inst(
    .aclk(aclk),
    .s_axis_data_tdata(s_axis_data_tdata_si_hq),
    .s_axis_data_tvalid( s_axis_data_tvalid_si_hq),
    .s_axis_data_tready(s_axis_data_tready_si_hq),
    .m_axis_data_tvalid(m_axis_data_tvalid_si_hq),
    .m_axis_data_tdata(m_axis_data_tdata_si_hq)
);
Conv_Sq_Hi Conv_Sq_Hi_inst(
    .aclk(aclk),
    .s_axis_data_tdata(s_axis_data_tdata_sq_hi),
    .s_axis_data_tvalid( s_axis_data_tvalid_sq_hi),
    .s_axis_data_tready(s_axis_data_tready_sq_hi),
    .m_axis_data_tvalid(m_axis_data_tvalid_sq_hi),
    .m_axis_data_tdata(m_axis_data_tdata_sq_hi)
);
Conv_Sq_Hq Conv_Sq_Hq_inst(
    .aclk(aclk),
    .s_axis_data_tdata(s_axis_data_tdata_sq_hq),
    .s_axis_data_tvalid( s_axis_data_tvalid_sq_hq),
    .s_axis_data_tready(s_axis_data_tready_sq_hq),
    .m_axis_data_tvalid(m_axis_data_tvalid_sq_hq),
    .m_axis_data_tdata(m_axis_data_tdata_sq_hq)
);
endmodule
