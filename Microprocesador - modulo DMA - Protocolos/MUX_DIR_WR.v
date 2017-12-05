`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.09.2017 21:43:26
// Design Name: 
// Module Name: MUX_DIR_WR
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


module MUX_DIR_WR(rt,rd,sel_dest,dir_wr );
input [4:0]rt,rd;
input sel_dest;
output reg [4:0]dir_wr;

always @(sel_dest or rt or rd or dir_wr  )
      case(sel_dest)
      1'b0: dir_wr = rd;
      1'b1: dir_wr = rt;
       default: dir_wr=4'b0;
      endcase
endmodule
