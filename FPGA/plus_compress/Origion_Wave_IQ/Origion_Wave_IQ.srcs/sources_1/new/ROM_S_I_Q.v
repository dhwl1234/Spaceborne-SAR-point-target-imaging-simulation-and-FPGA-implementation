`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/29 20:34:11
// Design Name: 
// Module Name: ROM_S_I_Q
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


module ROM_S_I_Q(
    input wire              sys_clk,
    input wire  [8:0]      addra,
    output wire [31:0]      SI,
    output wire [31:0]      SQ
    );
    
ROM_320x32_S_I ROM_320x32_S_I_inst
(
    .clka   (sys_clk),
    .addra  (addra),
    .douta  (SI)
);
ROM_320x32_S_Q ROM_320x32_S_Q_inst
(
    .clka   (sys_clk),
    .addra  (addra),
    .douta  (SQ)
);
endmodule
