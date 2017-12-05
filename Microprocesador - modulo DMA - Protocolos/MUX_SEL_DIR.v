`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.09.2017 16:20:35
// Design Name: 
// Module Name: MUX_SEL_DIR
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
module MUX_SEL_DIR(Dato_Dir_out,Dato_Dir_imm,salida,sel_SL);
input [31:0]Dato_Dir_out,Dato_Dir_imm;
input sel_SL;
output reg [31:0]salida;
always @(sel_SL or Dato_Dir_out or Dato_Dir_imm)
      case(sel_SL)
      1'b0: salida=Dato_Dir_out;
      1'b1: salida =Dato_Dir_out;
       default: salida=32'b0;
      endcase
endmodule

