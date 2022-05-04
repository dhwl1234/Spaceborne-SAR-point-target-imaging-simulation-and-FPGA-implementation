`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/30 20:04:48
// Design Name: 
// Module Name: four_conv_out
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


module four_conv_out(
    );
    
reg         sys_clk     ;
reg         sys_rst_n   ;


reg [8:0]   addra       ;
reg [3:0]   cnt;

//real part
wire [39:0] result_compress_i;  
wire [39:0] result_compress_q;

//abs part
wire compress_result_data_valid;
wire [39:0] compress_result_0;
wire [39:0] compress_result_1;
wire [39:0] compress_result;
assign  compress_result=compress_result_1;

assign result_compress_i  = m_axis_data_tdata_sihi-m_axis_data_tdata_sqhq;
assign result_compress_q  = m_axis_data_tdata_sihq+m_axis_data_tdata_sqhi;
//sihi
reg          s_axis_data_tvalid_sihi;
wire         s_axis_data_tready_sihi;
wire         m_axis_data_tvalid_sihi;
wire [39:0]  m_axis_data_tdata_sihi;

//sihq
reg          s_axis_data_tvalid_sihq;
wire         s_axis_data_tready_sihq;
wire         m_axis_data_tvalid_sihq;
wire [39:0]  m_axis_data_tdata_sihq;

//sqhi
reg          s_axis_data_tvalid_sqhi;
wire         s_axis_data_tready_sqhi;
wire         m_axis_data_tvalid_sqhi;
wire [39:0]  m_axis_data_tdata_sqhi;

//sqhq
reg          s_axis_data_tvalid_sqhq;
wire         s_axis_data_tready_sqhq;
wire         m_axis_data_tvalid_sqhq;
wire [39:0]  m_axis_data_tdata_sqhq;


initial
    begin
            sys_clk     =   1'b1 ;
            sys_rst_n   <=  1'b0 ; 
    #200    sys_rst_n   <=  1'b1 ;
    end

always  #10 sys_clk =   ~sys_clk;



always@(posedge sys_clk or  negedge sys_rst_n)
    if(sys_rst_n == 1'b0)begin
        addra   <=  9'd0;
        cnt         <=  4'd0;
        s_axis_data_tvalid_sihi<=1'd0;
        s_axis_data_tvalid_sihq<=1'd0;
        s_axis_data_tvalid_sqhi<=1'd0;
        s_axis_data_tvalid_sqhq<=1'd0;
        end
    else    if(addra == 9'd320)begin
         addra   <=  9'd1;
        s_axis_data_tvalid_sihi<=1'd1;
        s_axis_data_tvalid_sihq<=1'd1;
        s_axis_data_tvalid_sqhi<=1'd1;
        s_axis_data_tvalid_sqhq<=1'd1;
         end
    else if (cnt==4'd1)begin
        addra   <=  addra   +   1'b1;
        s_axis_data_tvalid_sihi<=1'd1;
        s_axis_data_tvalid_sihq<=1'd1;
        s_axis_data_tvalid_sqhi<=1'd1;
        s_axis_data_tvalid_sqhq<=1'd1;
        cnt     <=  4'd0;
        end
    else begin
        cnt     <=  cnt+4'd1;
        s_axis_data_tvalid_sihi<=1'd0;
        s_axis_data_tvalid_sihq<=1'd0;
        s_axis_data_tvalid_sqhi<=1'd0;
        s_axis_data_tvalid_sqhq<=1'd0;
        end

rom_fir_connect rom_fir_connect_inst
(
    .sys_clk     (sys_clk   ),   
    .addra       (addra     ),  
    //sihi

    .s_axis_data_tvalid_si_hi(s_axis_data_tvalid_sihi),
    .s_axis_data_tready_si_hi(s_axis_data_tready_sihi),
    .m_axis_data_tvalid_si_hi( m_axis_data_tvalid_sihi),
    . m_axis_data_tdata_si_hi( m_axis_data_tdata_sihi),

    //sihq
    .s_axis_data_tvalid_si_hq(s_axis_data_tvalid_sihq),
    .s_axis_data_tready_si_hq(s_axis_data_tready_sihq),
    .m_axis_data_tvalid_si_hq( m_axis_data_tvalid_sihq),
    . m_axis_data_tdata_si_hq( m_axis_data_tdata_sihq),

    //sqhi
    .s_axis_data_tvalid_sq_hi(s_axis_data_tvalid_sqhi),
    .s_axis_data_tready_sq_hi(s_axis_data_tready_sqhi),
    .m_axis_data_tvalid_sq_hi( m_axis_data_tvalid_sqhi),
    .m_axis_data_tdata_sq_hi( m_axis_data_tdata_sqhi),

    //sqhq
    .s_axis_data_tvalid_sq_hq(s_axis_data_tvalid_sqhq),
    .s_axis_data_tready_sq_hq(s_axis_data_tready_sqhq),
    .m_axis_data_tvalid_sq_hq( m_axis_data_tvalid_sqhq),
    .m_axis_data_tdata_sq_hq( m_axis_data_tdata_sqhq)
);

result_out_abs result_out_abs_inst
(
    .aclk(sys_clk),
    .abs_data_in_valid(1'b1),
    .compress_result_I_Q({result_compress_i,result_compress_q}),
    .abs_data_out_valid(compress_result_data_valid),
    .compress_result({compress_result_0,compress_result_1})
);
    






























endmodule
