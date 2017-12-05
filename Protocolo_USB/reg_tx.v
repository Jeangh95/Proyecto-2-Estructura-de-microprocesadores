`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.12.2017 12:52:31
// Design Name: 
// Module Name: reg_tx
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


module reg_tx(
    input wire clk,
    input wire dato_se,
    output wire dato_sal
    );
 reg sal_t; // señal de inicio
    always @(posedge clk)
        sal_t<=dato_se;
        
assign dato_sal=sal_t;

endmodule
