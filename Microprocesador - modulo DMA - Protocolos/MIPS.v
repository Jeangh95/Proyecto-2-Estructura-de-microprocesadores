`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.09.2017 21:44:01
// Design Name: 
// Module Name: MIPS
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


module MIPS(clk_pc,Check_in,Check_out,salida_in,Instruccion_in,MEM_RD,MEM_WR,dato_entrada,direccion,D0);
input clk_pc,Check_out;
output [31:0] salida_in,direccion,dato_entrada;
input [31:0]Instruccion_in,D0;
output MEM_RD,MEM_WR;
output wire Check_in;
wire [31:0]Direccion_in;
wire clk;

assign clk=~Check_out&clk_pc;
assign Check_in=Check_out&clk_pc;
/////////////////////////////////////////////////////////////////
//Etapa Instruction Fetch
/////////////////////////////////////////////////////////////////
//Instanciammu direcciones
wire [31:0]salto;
wire sel_direccion;
wire [31:0] entrada,salida_;
Mux_Direcciones M_direcciones (.sel_direccion(sel_direccion),.salida_(salida_),.salto(salto),.salida_in(salida_in));

assign Direccion_in=salida_in;
// instancia de registro PC
 reg_PC mips_pc (.clk (clk),
           .salida (salida_), 
           .entrada(entrada));

// instancia sumador
 suma_PC p_sum (
                .clk(clk),
                .a (salida_in),
               .b (32'b100), 
               .resultado (entrada));

// CONTADOR PROGRAMA


////////////////////////////////////////////////////////////////
//Instancia Registro IF_ID
wire [31:0]Instuccion_Out,Direccion_Out;
wire sel_IF_ID;
wire [63:0]c1;
assign Instuccion_Out=c1[63:32];
assign Direccion_Out=c1[31:0];
assign sel_IF_ID=(operacion[16]&clk);
IF_ID REG_IF_ID (.clk(clk),.b({Instruccion_in,Direccion_in}), .c(c1), .EN(sel_IF_ID));
//##########################################################################
//UNIDAD DE CONTROL
wire [2:0]alu_funct;
wire [5:0]FUNCT;
wire [19:0]operacion;
wire Der_Izq,IZ;
wire [1:0]sel_operaB1;
assign FUNCT =Instuccion_Out[5:0] ;
assign sel_direccion=operacion[15]; 
assign Der_Izq=sel_operaB1&&2'b11;
assign IZ=FUNCT&&6'b10;
Unidad_control Uni_Ctr (.Opcode(Instuccion_Out[31:26]),.FUNCT(FUNCT),.alu_funct(alu_funct),.operacion(operacion));//********************************************************************

control_deplazo C_desplaza (.opcode(Instuccion_Out[31:26]),.FUNCT(FUNCT),.sel_operaB1(sel_operaB1));
///////////////////////////////////////////////////////////////////
//Etapa Instruction Decode
///////////////////////////////////////////////////////////////////

//Instancia Banco de registros   
wire REG_RD,REG_WR,sel_dest;
wire [4:0]DIR_A,DIR_B,DIR_WR;
wire [4:0]sostiene;
wire [31:0]D0A,D0B,DI,SImm,ZImm;
wire [25:0]address;
assign DIR_A=Instuccion_Out[25:21];
assign DIR_B=Instuccion_Out[20:16];
assign address=Instuccion_Out[25:0];
assign sel_dest=operacion[0];
assign REG_RD=operacion[1];
assign REG_WR=operacion[2];

//calculo de salto/////////////////
assign salto={Direccion_Out[31:28],address,2'b0};
/////////////////////////////////////////////////
Registros Banco_REG (.clk(clk),.REG_RD(REG_RD),.REG_WR(REG_WR),.DIR_A(DIR_A),.DIR_B(DIR_B),.DIR_WR(DIR_WR),.DI(DI),.D0A(D0A),.D0B(D0B));
//intancia Mux selector de registro a guardar
MUX_DIR_WR MUX_DirWR (.rt(Instuccion_Out[20:16]),.rd(Instuccion_Out[15:11]),.sel_dest(sel_dest),.dir_wr(sostiene));
//Instancia extencion de signo
SignExtImm ExtSigno (.immediate(Instuccion_Out[15:0]),.SImm(SImm));
//Instancia extencion de cero
ZeroExtImm ExtZero (.immediate(Instuccion_Out[15:0]),.ZImm(ZImm));
// registro para guardar la direccion de guardado temporalmente
REG_Sostiene reg_sostiene (.clk(clk), .b(sostiene), .c(DIR_WR));

//desplazamientos
wire [31:0]Dezplaza;
Desplaza_D Des_R (.IZ(IZ),.Instruccion_out(D0B),.shanmt(Instuccion_Out[10:6]),.Dezplaza(Dezplaza),.Der_Izq(Der_Izq));
////////////////////////////////////////////////////////////////////////////////////////////////

//Instancia Registro ID_EXE
wire [150:0]c2;
wire sel_ID_EXE; 
wire [31:0] D0A1,D0B1,SImm1,ZImm1;
wire [19:0]operacion1;
wire [2:0]alu_funct1;
assign ZImm1=c2[31:0];
assign SImm1=c2[63:32];
assign D0B1=c2[95:64];
assign D0A1=c2[127:96];
assign alu_funct1=c2[130:128];
assign operacion1=c2[150:131];
assign sel_ID_EXE=(operacion[17]&clk);
ID_EXreg ID_EX (.clk(clk),.b({operacion,alu_funct,D0A,D0B,SImm,ZImm}),.c(c2),.EN(sel_ID_EXE));
/////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////
//Etapa Execute
///////////////////////////////////////////////////////////////////
//intancia de mux de selector de datos para la ALU

wire sel_OperaA,carry,zero;
wire [1:0]sel_OperaB;
wire [31:0]Otro,result,A,B;
assign sel_OperaA=operacion1[3];
assign sel_OperaB=operacion1[5:4];
Mux_OperaA Mux_A (.sel_OperaA(sel_OperaA),.D0A(D0A1),.Otro(Otro),.A(A));

Mux_OperaB Mux_B (.Desplazado(Dezplaza),.sel_OperaB(sel_OperaB|sel_operaB1),.D0B(D0B1),.SImm(SImm1),.ZImm(ZImm1),.B(B));

//Instanciacion ALU
wire [1:0]sel_DI;
wire [31:0]salida;
assign sel_DI=operacion1[7:6];
ALU ALU (.opcode(alu_funct1),.operand1(A), .operand2(B), .result(result), .flagC(carry), .flagZ(zero) );
MUX_DI MuxDI (.sel_DI(sel_DI),.A(result),.B(salida),.C(),.D(DI));
////////////////////////////////////////////////////////////////////////////////////7

//Instancia Registro ID_EXE
wire [51:0]c3;
wire sel_EXE_MEM;
assign sel_EXE_MEM=(operacion[18]&clk);
EXE_MEM  EX_MEM (.clk(clk),.b({operacion1,result}),.c(c3),.EN(sel_EXE_MEM));
/////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////
// Etapa MEMS
wire [31:0]result1;
wire [19:0]operacion2;
assign MEM_RD=operacion2[8];
assign MEM_WR=operacion2[9];
assign result1=c3[31:0];
assign operacion2=c3[51:32];

/////////////////////////////////////////////////////

//Instancia Registro ID_EXE
wire [51:0]c4;
wire sel_MEMS_WB; 
assign sel_MEMS_WB=(operacion[19]&clk);
MEM_WB MEM_WB (.clk(clk),.b({operacion2,D0}),.c(c4),.EN(sel_MEMS_WB));
/////////////////////////////////////////////////////////////////////////////////////////////////
wire sel_SL;
wire Sel_PC;
wire [19:0]operacion3;
assign operacion3=c4[51:32];
assign sel_SL=operacion3[10];
assign Sel_PC=operacion3[11];
MUX_SEL_DIR MUX_salida (.Dato_Dir_out(c4[31:0]),.Dato_Dir_imm(),.salida(salida),.sel_SL(sel_SL));
endmodule
