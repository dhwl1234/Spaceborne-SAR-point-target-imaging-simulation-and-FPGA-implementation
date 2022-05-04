`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/29 21:15:43
// Design Name: 
// Module Name: ROM_S_I
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


module ROM_S_I(
    input wire              sys_clk,
    input wire  [8:0]      addra,
    output wire [15:0]      SI
    );
ROM_320x16_S_I ROM_320x16_S_I_inst
(
    .clka   (sys_clk),
    .addra  (addra),
    .douta  (SI)
);
endmodule
