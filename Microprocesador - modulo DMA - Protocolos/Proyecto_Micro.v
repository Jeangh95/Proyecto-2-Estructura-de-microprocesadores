`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.11.2017 21:20:45
// Design Name: 
// Module Name: Proyecto_Micro
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


module Proyecto_Micro(
input sel,
input clk,
input rst, 
input ps2d,ps2c, rx_en);
wire [31:0] salida_in,Instruccion_in,dato_entrada,direccion,D0;
wire MEM_RD_pc,MEM_WR_pc;
wire [31:0] dato_entrada_0,direccion_0,D0_0;
wire MEM_RD_0,MEM_WR_0;
wire [31:0] dato_entrada_1,direccion_1,D0_1;
wire MEM_RD_1,MEM_WR_1;
wire Check_in,Check_out;
wire [31:0]dire; 
wire [31:0]Datos_in;
wire listo;
wire [31:0]USB_Datos;
 wire [31:0]USB_Dir;
  wire [31:0]PS2_Dir;
 wire [31:0]PS2_Datos;
 wire [31:0]Datos_I_O;
 wire [31:0]Dir_I_O;
 wire  Estado_PS2;
 wire Estado_USB; 
 wire Estado_in;
//Instacion Procesador
 MIPS Procesador(
                .Check_in(Check_in),
                .Check_out(Check_out),
                .clk_pc(clk),
                .salida_in(salida_in),
                .Instruccion_in(Instruccion_in),
                .MEM_RD(MEM_RD_pc),
                .MEM_WR(MEM_WR_pc),
                .dato_entrada(dato_entrada),
                .direccion(direccion),
                .D0(D0_1));
///////////////////////////////////////////////////////////////////                
                               
//Instacion Memoria
                
MEM_Datos_Instrucciones Memoria_Datos_Instrucciones (
                   .clk(clk),
                   .salida_in(salida_in),
                   .dato_entrada(dato_entrada_1),
                   .direccion(direccion_1),.D0(D0),
                   .Instruccion_in(Instruccion_in),
                   .MEM_RD(MEM_RD_1),.MEM_WR(MEM_WR_1));                
//////////////////////////////////////////////////////////////////////////////////
//Instancia Modulo DMA
DMA Modulo_DMA (
                .clk(clk),
                .Check_in(Check_in),
                .Check_out(Check_out),
                .Estado_in(Estado_in),
                .direccion_I_O(Dir_I_O),
                .dato_entrada_0(dato_entrada),
                .direccion_pc(direccion),
                .Datos_in(Datos_I_O),
                .D0_0(D0),
                .MEM_RD_I_O(1'b0),
                .MEM_WR_I_O(1'b1),
                .MEM_RD_pc(MEM_RD_pc),
                .MEM_WR_pc(MEM_WR_pc),
                .dato_entrada_1(dato_entrada_1),
                .direccion_1(direccion_1),
                .D0_1(D0_1),
                .MEM_RD_1(MEM_RD_1),
                .MEM_WR_1(MEM_WR_1)
                );

TopPPS2Dir Modulo_PS2 (
                    .clk(clk),.rst(rst), // clk y reset del sistema
                    .ps2d(ps2d),.ps2c(ps2c),.rx_en(rx_en), // bits de entrada del teclado
                    .joi(PS2_Datos), // salida de 32 bits del buffer
                    .listo(Estado_PS2), // bandera hacia modulo I/O
                    .tick(), // bandera de dato valido en el teclado, y entrada de clk al contador
                    .qfi(), // salida primer registro
                    .qs(), // salida segundo reistro
                    .qt(), // salida tercer registro
                    .qf(), // salida cuarto registro
                    .z(), // valor del contador
                    .dire(PS2_Dir)
                    );
 
 
 TOP_control_EXt USB_I_O(
                        .Inicio(rst),
                        .clk(clk),
                        .reset(rst),
                        .Tx(),
                        .listo(Estado_USB)
                     );
                  
 Mux_I_O I_O_Mux(
                        .sel(sel),
                        .PS2_Datos(PS2_Datos),
                        .USB_Datos(USB_Datos),
                        .PS2_dir(PS2_Dir),
                        .USB_dir(USB_Dir),
                        .Datos_I_O(Datos_I_O),
                        .Dir_I_O(Dir_I_O),
                        .Estado_in(Estado_in),
                        .Estado_PS2(Estado_PS2),
                        .Estado_USB(Estado_USB)
                        );
endmodule
