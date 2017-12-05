`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2017 05:40:16
// Design Name: 
// Module Name: Desplaza_D
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


module Desplaza_D(IZ,Instruccion_out,shanmt,Dezplaza,Der_Izq);
input [31:0]Instruccion_out;
input [4:0]shanmt;
input Der_Izq,IZ;
output reg [31:0]Dezplaza;
always @ * 
begin
if ((Der_Izq&&IZ)==1'b1)
Dezplaza=(Instruccion_out>>shanmt);
else
if ((Der_Izq&&IZ)==1'b0)
Dezplaza=(Instruccion_out<<shanmt);
end
endmodule
