`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.09.2017 09:00:45
// Design Name: 
// Module Name: Mux_Direcciones
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


module Mux_Direcciones(sel_direccion,salida_,salto,salida_in);
input sel_direccion;
input [31:0]salida_,salto;
output reg [31:0]salida_in;

always @(sel_direccion or salida_ or salto or salida_in  )
      case(sel_direccion)
      1'b0: salida_in = salida_;
      1'b1: salida_in = salto;
       default: salida_in=31'b0;
      endcase
endmodule
