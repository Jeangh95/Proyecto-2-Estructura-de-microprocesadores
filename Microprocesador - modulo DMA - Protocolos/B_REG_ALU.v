`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.08.2017 22:37:12
// Design Name: 
// Module Name: B_REG_ALU
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


module B_REG_ALU(clk,Instuccion_in,Direccion_in);
input clk;
input [31:0]Instuccion_in,Direccion_in;

/*FUNCT,immediate,result,clk,REG_RD,REG_WR,DIR_A,DIR_B,DIR_WR,DI,ID_EXE,zero,carry);
output [31:0]result;
input [15:0] immediate;
input clk,ID_EXE;
output carry,zero;
input  REG_RD,REG_WR;
input  [0:4]DIR_A,DIR_B,DIR_WR;
input  [0:31]DI; 
input  [0:5]FUNCT;
wire [2:0] alu_funct;
wire [31:0] D0A,D0B;
wire [15:0] SImm,ZImm;
*/


/////////////////////////////////////////////////////////////////
//Etapa Instruction Fetch
/////////////////////////////////////////////////////////////////



//////////////////////////////////////////////////////////////////
//Instancia Registro IF_ID
wire [31:0]Instuccion_Out,Direccion_Out;
wire sel_IF_ID;
IF_ID REG_IF_ID (
.clk(clk), 
.b({Instuccion_in,Direccion_in}), .c({Instuccion_Out,Direccion_Out}), .EN(sel_IF_ID));
//##########################################################################

///////////////////////////////////////////////////////////////////
//Etapa Instruction Decode
///////////////////////////////////////////////////////////////////
//********************************************************************
//UNIDAD DE CONTROL
Unidad_control Uni_Ctr (.FUNCT(FUNCT),.alu_funct(alu_funct),.sel_alu(sel_alu));
//********************************************************************
//Instancia Banco de registros   
wire REG_RD,REG_WR;
Registros Banco_REG (.clk(clk),.REG_RD(REG_RD),.REG_WR(REG_WR),.DIR_A(DIR_A),.DIR_B(DIR_B),.DIR_WR(DIR_WR),.DI(DI),.D0A(D0A),.D0B(D0B));

//Intancia ALU
wire [132:0]c;
wire [31:0]D0_A,D0_B;

assign D0_A=c[31:0];
assign D0_B=c[63:32];
//instancia mux_Alu
wire [0:1]sel_alu;
wire [0:31]in_B,out_B;


Mux_Alu M_A (.sel_alu(c[129:128]),.in_B(D0_B),.Imm(c[95:64]),.ZImm(c[127:96]),.out_B(out_B));
//intancia ALU
ALU ALU (.opcode(c[132:130]),.operand1(D0_A), .operand2(out_B), .result(result), .flagC(carry), .flagZ(zero) );
//Instancia Unidad de control

//Instancia registros de segmantacion
wire [132:0]b;
assign b[31:0]=D0A;
assign b[63:32]=D0B;
assign b[95:64]=SImm;
assign b[127:96]=ZImm;
assign b[129:128]=sel_alu;
assign b[132:130]=alu_funct;
wire ID_EXE; 
ID_EXreg ID_EX (.clk(clk),.b(b),.c(c),.enableEX(ID_EXE));

//Instancia extencion de signo
SignExtImm ExtSigno (.immediate(immediate),.SImm(SImm));
//Instancia extencion de cero
ZeroExtImm ExtZero (.immediate(immediate),.ZImm(ZImm));
endmodule
