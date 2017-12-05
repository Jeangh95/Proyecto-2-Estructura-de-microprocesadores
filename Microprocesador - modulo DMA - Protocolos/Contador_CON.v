`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.12.2017 15:13:39
// Design Name: 
// Module Name: Contador_CON
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


module Contador_CON(
      input wire clk,// reloj de entrada del divisor
       input wire reset,
       input wire enable,
  output wire [5:0] car_cont
   );
reg [5:0] dato = 0;
always @(posedge clk)
  if (reset==1)
   dato <= 0;
else if(enable)
   dato <= dato + 1;
     
assign car_cont=dato;

endmodule
