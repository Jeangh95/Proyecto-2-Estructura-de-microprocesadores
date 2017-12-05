`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.11.2017 23:11:05
// Design Name: 
// Module Name: MEM_Datos_Instrucciones
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


module MEM_Datos_Instrucciones(clk,salida_in,dato_entrada,direccion,D0,Instruccion_in,MEM_RD,MEM_WR);

input [31:0]salida_in,dato_entrada,direccion;
output [31:0]D0,Instruccion_in;
input MEM_RD,MEM_WR,clk;

///////////////////////////////////////////////////////////////7
// instancia de memoria

mem_In memoria_instrucciones(
                .direccion(salida_in),    
                .instruccion(Instruccion_in));
                
/////////////////////////////////////////////                
                
//INSTANCIA MEMORIA DE Datos
memoria_datos MEM ( 
                    .direccion(direccion), 
                    .dato_entrada(dato_entrada), 
                    .dato_salida(D0), 
                    .clk(clk),
                    .escritura(MEM_WR),
                    .lectura(MEM_RD));
endmodule
