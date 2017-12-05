`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.08.2017 07:17:01
// Design Name: 
// Module Name: Registro
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


module Registro(In_REG,Out_REG,clk,ENwr,EN_RD,ENrd,EN_WR);
input [0:31]In_REG;
output reg [0:31]Out_REG;
input clk,ENwr,EN_RD,ENrd,EN_WR;
reg [0:31]dato;
initial Out_REG=32'b0;
always @ (posedge clk)
begin
if (EN_WR&&ENwr&&~clk)
begin
dato<=In_REG;
end
else if (EN_RD&&ENrd)
begin
Out_REG<=dato;
end
end
endmodule
