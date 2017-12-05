`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.12.2017 10:31:00
// Design Name: 
// Module Name: contador
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


module contador(
    input wire clk,// reloj de entrada del divisor
    input wire carga,
    output wire [5:0] btc
     );
reg [5:0] dato = 0;
always @(posedge clk)
    if (carga==0)
     dato <= 0;
     else
       dato <= dato + 1;
       
 assign btc=dato;
 
endmodule
