`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.12.2017 14:39:27
// Design Name: 
// Module Name: reg_COn
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


module reg_COn(
    input wire clk,
    input wire senal_tr,
    output wire trans
    );
 reg data;
 always @(posedge clk)
    data<=senal_tr;   
    
 assign trans=data;
endmodule
