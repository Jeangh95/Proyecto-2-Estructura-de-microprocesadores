`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.12.2017 22:21:57
// Design Name: 
// Module Name: Buffer_DMA
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


module Buffer_DMA(
    input clk,
    input Estado_in,
    input [31:0] Datos_in,
    input Estado_out,
    output reg [31:0]Datos_out
    );
reg [31:0]Datos_interno;
always @ (posedge clk or posedge Estado_in) 
begin   
if (Estado_in==1)
Datos_interno<=Datos_in;
end
always @ (posedge clk or posedge Estado_out) 
begin
if (Estado_out==1)
Datos_out<=Datos_interno;
end
endmodule
