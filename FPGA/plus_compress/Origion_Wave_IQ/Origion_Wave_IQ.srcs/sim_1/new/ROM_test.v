`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/29 20:37:33
// Design Name: 
// Module Name: ROM_test
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


module tb_ROM_320x32_S_I_Q( );

reg         sys_clk     ;
reg         sys_rst_n   ;
reg [8:0]   addra       ;

wire    [31:0]   SI   ;
wire    [31:0]   SQ   ;

initial
    begin
            sys_clk     =   1'b1 ;
            sys_rst_n   <=  1'b0 ;
    #200    sys_rst_n   <=  1'b1 ;
    end

always  #10 sys_clk =   ~sys_clk;

always@(posedge sys_clk or  negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        addra   <=  9'd0;
    else    if(addra == 9'd320)
        addra   <=  9'd1;
    else
        addra   <=  addra   +   1'b1;
ROM_S_I_Q ROM_S_I_Q_inst
(
    .sys_clk     (sys_clk   ),   //系统时钟，频�?50MHz
    .addra       (addra     ),   //输入rom地址

    .SI       (SI     ),    //输出rom数据
    .SQ       (SQ    )    //输出rom数据

);


endmodule
