`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.09.2017 23:26:11
// Design Name: 
// Module Name: Mux_OperaB
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


module Mux_OperaB(sel_OperaB,D0B,SImm,ZImm,Desplazado,B);
input [31:0]D0B,SImm,ZImm,Desplazado;
input [1:0]sel_OperaB;
output reg [31:0]B;

always @(sel_OperaB or D0B or SImm or ZImm or B)
      case(sel_OperaB)
      2'b00: B = D0B;
      2'b01: B = SImm;
      2'b10: B = ZImm;
      2'b11: B = Desplazado;
       default: B=32'b0;
      endcase
endmodule