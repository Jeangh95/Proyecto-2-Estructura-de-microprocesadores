`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.11.2017 00:31:51
// Design Name: 
// Module Name: DMA
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


module DMA(clk, Check_in,Check_out,Estado_in,Datos_in,dato_entrada_0,direccion_I_O,direccion_pc,D0_0,MEM_RD_I_O,MEM_WR_I_O,MEM_RD_pc,MEM_WR_pc,dato_entrada_1,direccion_1,D0_1,MEM_RD_1,MEM_WR_1);
input [31:0] dato_entrada_0,direccion_I_O,direccion_pc,D0_0,Datos_in;
input clk,Estado_in;
output [31:0] dato_entrada_1,direccion_1,D0_1;
output MEM_RD_1,MEM_WR_1;
input  Check_in;
input MEM_RD_I_O;
input MEM_WR_I_O;
input MEM_RD_pc;
input MEM_WR_pc;
output Check_out;

wire sel;
wire [31:0]Datos_o;
wire enviar;
wire recibir;
assign D0_1=D0_0;
Buffer_DMA Buffer(
    .clk(clk),
    .Estado_in(recibir),
    .Datos_in(Datos_in),
    .Estado_out(enviar),
    .Datos_out(Datos_o)
    );

Chequeo Check (
.clk(clk),
.Estado_in(Estado_in),
.Check_in(Check_in),
.Check_out(Check_out),
.sel(sel),
.recibir(recibir),
.enviar(enviar)
    );

Mux_D Mux_Direccionamiento (
    .sel(sel),
    .Datos_I_O(Datos_o),
    .datos_pc(dato_entrada_0),
    .direccion_I_O(direccion_I_O),
    .direccion_pc(direccion_pc),
    .MEM_RD_pc(MEM_RD_pc),
    .MEM_WR_pc(MEM_WR_pc),
    .MEM_RD_I_O(MEM_RD_I_O),
    .MEM_WR_I_O(MEM_WR_I_O),
    .Datos_out(dato_entrada_1),
    .direccion_out(direccion_1),
    .MEM_RD_out(MEM_RD_1),
    .MEM_WR_out(MEM_WR_1)
    );        
endmodule
