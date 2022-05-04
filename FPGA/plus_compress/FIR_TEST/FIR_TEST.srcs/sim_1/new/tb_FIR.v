`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/29 21:17:43
// Design Name: 
// Module Name: tb_ROM_S_I
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


module tb_ROM_S_I(
    );
reg         sys_clk     ;
reg         sys_rst_n   ;
reg [8:0]   addra       ;
reg [3:0]   cnt;

reg         s_axis_data_tvalid;
wire         s_axis_data_tready;
wire         m_axis_data_tvalid;
wire [23:0]  m_axis_data_tdata;
wire    [15:0]   SI   ;
wire    [15:0]  s_axis_data_tdata;
assign  s_axis_data_tdata=SI;

  
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
        s_axis_data_tvalid<=1'd0;
        end
    else    if(addra == 9'd320)begin
         addra   <=  9'd1;
         s_axis_data_tvalid<=1'd1;
         end
    else if (cnt==4'd1)begin
        addra   <=  addra   +   1'b1;
        s_axis_data_tvalid<=1'd1;
        cnt     <=  4'd0;
        end
    else begin
        cnt     <=  cnt+4'd1;
        s_axis_data_tvalid<=1'b0;
        end
        
        
ROM_S_I  ROM_S_I_inst
(
    .sys_clk     (sys_clk   ),   //系统时钟，频�?50MHz
    .addra       (addra     ),   //输入rom地址

    .SI       (SI     )    //输出rom数据
);

fir_h_i fir_hi_inst
(
    .aclk(sys_clk),
    .s_axis_data_tvalid(s_axis_data_tvalid),
    .s_axis_data_tready(s_axis_data_tready),
    .m_axis_data_tvalid( m_axis_data_tvalid),
    . m_axis_data_tdata( m_axis_data_tdata),
    .s_axis_data_tdata(s_axis_data_tdata)
    
);
endmodule
