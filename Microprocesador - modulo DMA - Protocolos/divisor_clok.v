`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.12.2017 20:07:55
// Design Name: 
// Module Name: divisor_clok
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


module divisor_clok(
    input clk,
    output reg clk_sal
    );
    // suponiendo que clk entrada es de 12MHZ
    //-- Valor por defecto del divisor
   //-- lo que se transmite es un dato de 32bits y la velocidad del protocolo usb es 1.5Mbits/s
    // entonces la frec de transmision es 46,875KHz 
    // si la entrada es 12MHz, para simular esa frec de transmision hay q hacer un divisor para obtener en la salida 46,875KHz
    parameter frecuencia=100000000;
    parameter frec_out= 46875;
    parameter max_contador=(frecuencia)/(2*frec_out);
    reg [25:0]contador;
    //
    initial begin
    contador=0;
    clk_sal=0;
    end
   always @(posedge clk) 
    begin
    if (contador==max_contador)
    begin
    clk_sal=~clk_sal;
    contador=0;
    end
    else begin
        contador=contador+1;
        end
     end
        
    endmodule
