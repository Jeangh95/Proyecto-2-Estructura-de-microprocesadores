`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.09.2017 15:46:57
// Design Name: 
// Module Name: MEM_WB
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


module MEM_WB(clk, b, c, EN);
parameter N=51;
input clk, EN;
input [N:0] b;
output reg [N:0] c;

always @ (posedge clk)
    if (EN==1'b1) c<=b;
    else c<=52'b0;

endmodule

