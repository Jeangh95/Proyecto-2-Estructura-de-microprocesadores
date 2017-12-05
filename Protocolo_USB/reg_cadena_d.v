`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.12.2017 16:01:15
// Design Name: 
// Module Name: reg_cadena_d
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


module reg_cadena_d(
    input wire clk,
    input wire [31:0] dato_entrada,
    output wire dato_sal
    );
 reg sal_t; // señal de inicio
    always @(posedge clk)
        sal_t<=dato_entrada;
        
assign dato_sal=sal_t;

endmodule
