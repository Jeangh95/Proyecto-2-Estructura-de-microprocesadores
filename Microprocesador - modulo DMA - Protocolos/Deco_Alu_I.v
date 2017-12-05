`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.09.2017 22:00:01
// Design Name: 
// Module Name: Deco_Alu_I
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


module Deco_Alu_I(Opcode,alu_funct1);
output reg [2:0]alu_funct1;
input  [5:0] Opcode;

always @ (Opcode)
case(Opcode)
6'h08: alu_funct1 = 3'b000;//addi
6'h09: alu_funct1 = 3'b000;//addiu
6'h0C: alu_funct1 = 3'b011;//andi
6'h0D: alu_funct1 = 3'b100;//ori
6'h20: alu_funct1 = 3'b000;//add
6'h00: alu_funct1 = 3'b000;//add
6'h02: alu_funct1 = 3'b000;//add
6'h21: alu_funct1 = 3'b000;//adu
6'h24: alu_funct1 = 3'b011;//and
6'h22: alu_funct1 = 3'b001;//sub
6'h23: alu_funct1 = 3'b001;//subu
6'h25: alu_funct1 = 3'b100;//or
6'h27: alu_funct1 = 3'b110;//nor
default alu_funct1=3'b000;
endcase

endmodule
