`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.09.2017 23:25:46
// Design Name: 
// Module Name: Mux_OperaA
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


module Mux_OperaA(sel_OperaA,D0A,Otro,A);
input [31:0]D0A,Otro;
input sel_OperaA;
output reg [31:0]A;

always @(sel_OperaA or D0A or Otro or A)
      case(sel_OperaA)
      1'b0: A = D0A;
      1'b1: A = Otro;
       default: A=32'b0;
      endcase
endmodule
