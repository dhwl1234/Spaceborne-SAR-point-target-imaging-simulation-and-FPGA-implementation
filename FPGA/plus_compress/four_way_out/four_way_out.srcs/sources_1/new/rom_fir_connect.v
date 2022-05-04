`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/30 19:35:24
// Design Name: 
// Module Name: rom_fir_connect
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


module rom_fir_connect(
        input wire              sys_clk,
        input wire  [8:0]      addra,
        //sihi
    input wire          s_axis_data_tvalid_si_hi,
    output wire         s_axis_data_tready_si_hi,
    output wire         m_axis_data_tvalid_si_hi,
    output wire [39:0]  m_axis_data_tdata_si_hi,
    
    //sihq
    input wire          s_axis_data_tvalid_si_hq,
    output wire         s_axis_data_tready_si_hq,
    output wire         m_axis_data_tvalid_si_hq,
    output wire [39:0]  m_axis_data_tdata_si_hq,
    
    //sqhi
    input wire          s_axis_data_tvalid_sq_hi,
    output wire         s_axis_data_tready_sq_hi,
    output wire         m_axis_data_tvalid_sq_hi,
    output wire [39:0]  m_axis_data_tdata_sq_hi,
    
    //sqhq
    input wire          s_axis_data_tvalid_sq_hq,
    output wire         s_axis_data_tready_sq_hq,
    output wire         m_axis_data_tvalid_sq_hq,
    output wire [39:0]  m_axis_data_tdata_sq_hq

    
    );
wire [15:0]      SI;
wire [15:0]      SQ;
four_way_out four_way_out_inst
(
    .s_axis_data_tdata_si_hi(SI),
    .s_axis_data_tdata_si_hq(SI),
    .s_axis_data_tdata_sq_hi(SQ),
    .s_axis_data_tdata_sq_hq(SQ),
    
     .aclk(sys_clk),
     
    .s_axis_data_tvalid_si_hi( s_axis_data_tvalid_si_hi),
    .s_axis_data_tready_si_hi(s_axis_data_tready_si_hi),
    .m_axis_data_tvalid_si_hi(m_axis_data_tvalid_si_hi),
    .m_axis_data_tdata_si_hi(m_axis_data_tdata_si_hi),
    
    .s_axis_data_tvalid_si_hq( s_axis_data_tvalid_si_hq),
    .s_axis_data_tready_si_hq(s_axis_data_tready_si_hq),
    .m_axis_data_tvalid_si_hq(m_axis_data_tvalid_si_hq),
    .m_axis_data_tdata_si_hq(m_axis_data_tdata_si_hq),
    
    .s_axis_data_tvalid_sq_hi( s_axis_data_tvalid_sq_hi),
    .s_axis_data_tready_sq_hi(s_axis_data_tready_sq_hi),
    .m_axis_data_tvalid_sq_hi(m_axis_data_tvalid_sq_hi),
    .m_axis_data_tdata_sq_hi(m_axis_data_tdata_sq_hi),
    
    .s_axis_data_tvalid_sq_hq( s_axis_data_tvalid_sq_hq),
    .s_axis_data_tready_sq_hq(s_axis_data_tready_sq_hq),
    .m_axis_data_tvalid_sq_hq(m_axis_data_tvalid_sq_hq),
    .m_axis_data_tdata_sq_hq(m_axis_data_tdata_sq_hq)
     
    
    
);

ROM_Control ROM_Control_inst
(
    .sys_clk(sys_clk),
    .addra  (addra),
    .SI(SI),
    .SQ(SQ)
);


endmodule
