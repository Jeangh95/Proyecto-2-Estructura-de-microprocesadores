`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.08.2017 06:16:50
// Design Name: 
// Module Name: Unidad_control
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


module Unidad_control(FUNCT,Opcode,alu_funct,operacion);
input [5:0]Opcode;
input  wire [5:0] FUNCT;
output reg [19:0]operacion;
output wire [2:0]alu_funct;

DECO_ALU D_A (.FUNCT(FUNCT),.alu_funct(alu_funct),.Opcode(Opcode),.tipo(operacion[0]));
always @ (Opcode)
begin
case(Opcode)
// sel_SL,lectura,escritura,sel_operaB,sel_operaA,Reg_WR,Reg_RD,sel_dest
6'h1: operacion = 20'b11110000100000000110;
6'h0: operacion = 20'b11110000100000000110;
6'h8: operacion = 20'b11110000100000010111;
6'h9: operacion = 20'b11110000100000010111;
6'hc: operacion = 20'b11110000100000100111;
6'hd: operacion = 20'b11110000100000100111;
6'h2: operacion = 20'b11111000000000000000;
endcase
end
endmodule
