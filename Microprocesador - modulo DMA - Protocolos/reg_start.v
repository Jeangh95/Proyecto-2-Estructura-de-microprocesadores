`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.12.2017 12:48:42
// Design Name: 
// Module Name: reg_start
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


module reg_start(
    input wire clk,
    input wire  sta_rt,
    output wire start
    );
 reg star_t; // señal de inicio
    always @(posedge clk)
        star_t<=sta_rt;
assign start=star_t;
endmodule
