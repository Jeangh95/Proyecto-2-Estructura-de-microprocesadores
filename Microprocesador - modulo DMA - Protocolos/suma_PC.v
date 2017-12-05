`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.09.2017 16:48:30
// Design Name: 
// Module Name: suma_PC
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


module suma_PC(clk,a, b, resultado);
  input clk;
  input [31:0] a, b;
  output reg [31:0] resultado;
  always@(posedge clk)
  begin
  if(clk==1)
  resultado = (a + b);
  else
  resultado = resultado;
  end
endmodule
