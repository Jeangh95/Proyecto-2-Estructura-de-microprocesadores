`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.12.2017 21:23:40
// Design Name: 
// Module Name: mod_RX
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


module transmisor_Tx(
    input wire clk,        //-- Reloj del sistema (12MHz en ICEstick)
    input wire rstn,       //-- Reset global (activo nivel bajo)
    input wire inicio,      //-- Activar a 1 para transmitir
    input wire [7:0] dato, //-- Byte a transmitir
    output reg tx,         //-- Salida de datos serie (hacia el PC)
    output wire listo      //-- Transmisor listo / ocupado

    );
endmodule
