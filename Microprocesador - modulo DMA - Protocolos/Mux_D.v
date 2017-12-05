`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.12.2017 23:48:41
// Design Name: 
// Module Name: Mux_D
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


module Mux_D(
input sel,
input [31:0]Datos_I_O,
input [31:0]datos_pc,
input [31:0]direccion_I_O,
input [31:0]direccion_pc,
input MEM_RD_pc,
input MEM_WR_pc,
input MEM_RD_I_O,
input MEM_WR_I_O,
output reg[31:0]Datos_out,
output reg[31:0]direccion_out,
output reg MEM_RD_out,
output reg MEM_WR_out
);

always@ *
begin
case (sel)
1'b1:begin 
//Agrupados los proveniente del I/O
Datos_out<=Datos_I_O;
direccion_out<=direccion_I_O;
MEM_RD_out<=MEM_RD_I_O;
MEM_WR_out<=MEM_WR_I_O;
end
1'b0:
begin 
//Agrupados los proveniente del pc
Datos_out<=datos_pc;
direccion_out<=direccion_pc;
MEM_RD_out<=MEM_RD_pc;
MEM_WR_out<=MEM_WR_pc;
end
endcase
end
endmodule
