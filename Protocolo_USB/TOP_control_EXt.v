`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.12.2017 19:28:34
// Design Name: 
// Module Name: TOP_control_EXt
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


module TOP_control_EXt(
    input wire Inicio,
    input wire clk,
    input wire reset,
    output wire Tx,
    output wire listo
 );
 
 // 
 wire [5:0]Contador;
 wire enableC;
 wire [31:0]DaT;
 wire [31:0]DAtS;
 wire Start;
 wire inicio;
 //
 CONTROLADOR_ Control(
     .senal_tr(inicio),
     .clk(clk),
     .reset(reset),
     .start(Start),
     .listo(listo),
     .conta(Contador),
     .cena(enableC)
     );
 // 
 Contador_CON Con_t(
       .clk(clk),// reloj de entrada del divisor
       .reset(reset),
       .enable(enableC),
       .car_cont(Contador)
    );
//
cadena_dato cade_dato(
     .car_cont(Contador),
     .dato(DaT)
    );
//
reg_COn cont(
    .clk(clk),
    .senal_tr(Inicio),
    .trans(inicio)
    );
// 
reg_cadena_d cadena(
    .clk(clk),
    .dato_entrada(DaT),
    .dato_sal(DAtS)
    );
    
//
TOP_uartTX TX(
    .clk(clk),
    .reset(reset),
    .Dato(DAtS),
    .Tx(Tx),
    .start(Start),
    .listo(listo)
    );
endmodule
