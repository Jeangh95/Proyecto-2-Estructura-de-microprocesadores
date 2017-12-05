`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.08.2017 10:19:49
// Design Name: 
// Module Name: Mux_Alu
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


module Mux_Alu(sel_alu,in_B,Imm,ZImm,out_B);
input [0:1]sel_alu;
input [0:31]in_B,Imm,ZImm;
output reg [0:31]out_B;

always @(sel_alu or Imm or ZImm or in_B or out_B )
      case(sel_alu)
      2'b00: out_B = in_B;
      2'b01: out_B = Imm;
      2'b10: out_B = ZImm;
      default: out_B = 32'b0;
      endcase


endmodule
