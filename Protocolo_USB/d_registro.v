`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.12.2017 09:50:53
// Design Name: 
// Module Name: d_registro
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
module desplaz(
    input wire [31:0]data,
    input wire carga,
    input wire reset,
    input wire clk,
    output wire sal);

reg [33:0] desplaza;

//-- Cuando la microorden load es 1 se carga la trama
//-- con load 0 se desplaza a la derecha y se envia un bit, al
//-- activarse la señal de clk_baud que marca el tiempo de bit
//-- Se introducen 1s por la izquierda
always @(posedge clk)
  if (reset == 0)
    desplaza <= 34'b1;

  else if (carga ==1)
    desplaza <= {data,2'b01};
  else if(carga==1 && clk==1)
    desplaza <= {1'b1, desplaza[33:1]};
    
assign sal = (carga) ? desplaza[0] : 1;

endmodule
