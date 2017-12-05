`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.09.2017 19:45:55
// Design Name: 
// Module Name: REG_Sostiene
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


module REG_Sostiene(clk, b, c);
parameter N=4;
input clk;
input [N:0] b;
output reg [N:0] c;
always @ (posedge clk)
    c<=b;
endmodule
