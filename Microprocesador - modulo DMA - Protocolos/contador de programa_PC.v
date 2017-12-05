`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.09.2017 13:49:49
// Design Name: 
// Module Name: contador de programa_PC
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


module reg_PC (clk, entrada, salida);
    input               clk;
    input   [31:0]entrada;
    output  [31:0] 	salida;

   reg [31:0] 	datoReg_inicial=0;
    always @(posedge clk)
    begin
         datoReg_inicial <= entrada;
    end
assign salida=datoReg_inicial;
endmodule

