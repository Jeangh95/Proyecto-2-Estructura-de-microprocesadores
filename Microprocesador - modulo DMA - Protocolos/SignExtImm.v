`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.08.2017 17:24:21
// Design Name: 
// Module Name: SignExtImm
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


module SignExtImm(immediate,SImm
    );
input [15:0]immediate;
output [0:31]SImm;

assign SImm={
immediate[15],
immediate[15],
immediate[15],
immediate[15],
immediate[15],
immediate[15],
immediate[15],
immediate[15],
immediate[15],
immediate[15],
immediate[15],
immediate[15],
immediate[15],
immediate[15],
immediate[15],
immediate[15],
immediate};
endmodule
