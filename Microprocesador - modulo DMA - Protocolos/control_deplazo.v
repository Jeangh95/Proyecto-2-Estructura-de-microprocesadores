`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.10.2017 14:59:57
// Design Name: 
// Module Name: control_deplazo
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


module control_deplazo(opcode,FUNCT,sel_operaB1);
input [5:0]FUNCT,opcode;
output reg [1:0]sel_operaB1;
wire [11:0]fun;
assign fun={opcode,FUNCT};
 always @ *
 begin
 case (fun)
 12'h00:sel_operaB1 = 2'b11;
 12'h02:sel_operaB1 = 2'b11;
 default sel_operaB1=2'b00;
 endcase
 end
endmodule
