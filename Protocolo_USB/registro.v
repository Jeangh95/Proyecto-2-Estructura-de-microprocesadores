`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.12.2017 09:15:03
// Design Name: 
// Module Name: registro
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

module registro(
    input wire status,
    input wire reset,
    input wire clk,  //--Reloj
    input wire [31:0] d_en, // dato entrada       
    output wire [31:0] data    //-- Salida del registro);
);

reg [31:0]d_sal; //dato salida

always @(posedge clk or posedge reset )
    if (reset==1'b1)
           d_sal=0;
    else
    d_sal <= d_en;

assign data=d_sal;
endmodule

