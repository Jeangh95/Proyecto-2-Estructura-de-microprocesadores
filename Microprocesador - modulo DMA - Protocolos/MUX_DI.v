`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.09.2017 19:57:35
// Design Name: 
// Module Name: MUX_DI
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


module MUX_DI(sel_DI,A,B,C,D);
input [31:0]A,B,C;
input [1:0]sel_DI;
output reg [31:0]D;

always @(sel_DI or A or B or C)
      case(sel_DI)
      2'b00: D = A;
      3'b01: D = B;
      3'b10: D = C;
       default: D=32'b0;
      endcase
endmodule
