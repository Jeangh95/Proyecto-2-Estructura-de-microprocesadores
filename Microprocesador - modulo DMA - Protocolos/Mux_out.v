`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.08.2017 13:05:42
// Design Name: 
// Module Name: Mux_out
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


module Mux_out(A,sel,zero,v0,v1,a0,a1,a2,a3,
t0,t1,t2,t3,t4,t5,t6,t7,s0,s1,s2,
s3,s4,s5,s6,s7,t8,t9,gp,sp,fp,ra);
output  reg[0:31]A;
input [0:4]sel;
input [0:31]zero,v0,v1,a0,a1,a2,a3,t0,t1,t2,t3,t4,t5,t6,t7,s0,s1,s2,s3,s4,s5,s6,s7,t8,t9,gp,sp,fp,ra;
always @ *
case (sel)
5'b00000: A=zero;
5'b00010: A=v0;
5'b00011: A=v1;
5'b00100: A=a0;
5'b00101: A=a1;
5'b00110: A=a2;
5'b00111: A=a3;
5'b01000: A=t0;
5'b01001: A=t1;
5'b01010: A=t2;
5'b01011: A=t3;
5'b01100: A=t4;
5'b01101: A=t5;
5'b01110: A=t6;
5'b01111: A=t7;
5'b10000: A=s0;
5'b10001: A=s1;
5'b10010: A=s2;
5'b10011: A=s3;
5'b10100: A=s4;
5'b10101: A=s5;
5'b10110: A=s6;
5'b10111: A=s7;
5'b11000: A=t8;
5'b11001: A=t9;
5'b11100: A=gp;
5'b11101: A=sp;
5'b11110: A=fp;
5'b11111: A=ra;
endcase
endmodule
