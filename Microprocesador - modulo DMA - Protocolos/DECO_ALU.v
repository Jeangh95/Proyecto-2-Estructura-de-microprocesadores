`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.09.2017 22:14:37
// Design Name: 
// Module Name: DECO_ALU
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


module DECO_ALU(FUNCT,alu_funct,Opcode,tipo);
input [5:0]FUNCT;
input [5:0]Opcode;
input tipo;
output reg [2:0]alu_funct;

wire [2:0]alu_funct1,alu_funct2;
//instacia control alu
Control_Alu Control_Alu (.FUNCT(FUNCT),.alu_funct(alu_funct2));
Deco_Alu_I Control_AluI(Opcode,alu_funct1);
// instancia

always @ *
begin
if(tipo==1)
alu_funct=alu_funct1;
else
alu_funct=alu_funct2;
end
endmodule
