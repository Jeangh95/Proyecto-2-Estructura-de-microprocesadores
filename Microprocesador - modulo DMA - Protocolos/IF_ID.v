`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.08.2017 15:15:35
// Design Name: 
// Module Name: ID_EXreg
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


module IF_ID(clk, b, c, EN);
parameter N=63;
input clk, EN;
input [N:0] b;
output reg [N:0] c;

always @ (posedge clk)
    if (EN==1'b1) c<=b;
    else c<=64'b0;
endmodule
