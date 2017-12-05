`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2017 12:15:40
// Design Name: omar zuñiga V
// Module Name: memoria_datos
// Tipo de Memoria a describir: RAM
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
// memoria ram para datos del procesador// 
// la posicion se define por la direccion//
// tamaño de ancho 32bits
// largo 1024

module memoria_datos( direccion, dato_entrada, dato_salida, clk,escritura, lectura

    );
    parameter N=31;
    input clk,escritura, lectura;
    input [N:0]direccion;
    input [31:0]dato_entrada;
    output reg [31:0]dato_salida;
    reg [31:0]memoria_T[0:1023];// defino el tamaño de la memoria ancho y largo
    
    always@(negedge clk)begin // en el procesador se escribe cuando esta en flanco negativo
        if(escritura==1)begin; // si me llega un 1 en la escritura quiere decir que debo escribir en la memoria
            memoria_T[direccion]=dato_entrada; // lo que digo aqui es que voy a escribir el dato entrada en la posicion de memoria dada por la direecion
            end 
            end
     always@(posedge clk)begin
     if (lectura==1)begin;// habilito la lectura. y el dato a salir es ultimo q se guardo
        dato_salida=memoria_T[direccion];// el dato que esta en la posicion de memoria dada x la direccion 
        end
        end
        
endmodule
