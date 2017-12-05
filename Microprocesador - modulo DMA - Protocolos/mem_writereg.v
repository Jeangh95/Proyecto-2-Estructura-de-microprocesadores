`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.08.2017 15:26:33
// Design Name: 
// Module Name: mem_writereg
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


module mem_writereg(clk, b, c, enableWR);
parameter N=63;
input clk, enableWR;
input [N:0] b;
output reg [N:0] c;

always @ (posedge clk)
    if (enableWR==1'b1) c<=b;
    else c<=64'b0;

   
endmodule
