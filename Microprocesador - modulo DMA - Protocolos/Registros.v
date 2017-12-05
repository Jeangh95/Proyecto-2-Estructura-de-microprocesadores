`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.08.2017 06:38:25
// Design Name: 
// Module Name: Registros
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


module Registros(clk,REG_RD,REG_WR,DIR_A,DIR_B,DIR_WR,DI,D0A,D0B);
//Difinicion de variables de entradas y salidas
input clk;
input  REG_RD,REG_WR;
input  [0:4]DIR_A,DIR_B,DIR_WR;
input  [0:31]DI;
output  [0:31]D0A,D0B;

//conexioenes
wire [31:0]out_mux_A;
wire [31:0]out_mux_B;
wire [31:0]out_mux_WR;
wire [0:31]zero,v0,v1,a0,a1,a2,a3,t0,t1,t2,t3,t4,t5,t6,t7,s0,s1,s2,s3,s4,s5,s6,s7,t8,t9,gp,sp,fp,ra;

//instancio de selector de registro
Mux_EN REG_A (
.out_mux(out_mux_A),
.sel_mux(DIR_A)
);

Mux_EN REG_B (
.out_mux(out_mux_B),
.sel_mux(DIR_B)
);

Mux_EN REG_W (
.out_mux(out_mux_WR),
.sel_mux(DIR_WR)
);
//Instacia de los registros
wire [0:31]zero1;
assign zero=31'b0;
Registro Rzero (
.In_REG(DI),
.Out_REG(zero1),
.clk(clk),
.ENwr(out_mux_WR[0]),
.ENrd(out_mux_A[0]|out_mux_B[0]),
.EN_RD(REG_RD),
.EN_WR(REG_WR)
);

Registro Rv0 (
.In_REG(DI),
.Out_REG(v0),
.clk(clk),
.ENwr(out_mux_WR[2]),
.ENrd(out_mux_A[2]|out_mux_B[2]),
.EN_RD(REG_RD),
.EN_WR(REG_WR)
);

Registro Rv1 (
.In_REG(DI),
.Out_REG(v1),
.clk(clk),
.ENwr(out_mux_WR[3]),
.ENrd(out_mux_A[3]|out_mux_B[3]),
.EN_RD(REG_RD),
.EN_WR(REG_WR)
);

Registro Ra0 (
.In_REG(DI),
.Out_REG(a0),
.clk(clk),
.ENwr(out_mux_WR[4]),
.ENrd(out_mux_A[4]|out_mux_B[4]),
.EN_RD(REG_RD),
.EN_WR(REG_WR)
);
Registro Ra1 (
.In_REG(DI),
.Out_REG(a1),
.clk(clk),
.ENwr(out_mux_WR[5]),
.ENrd(out_mux_A[5]|out_mux_B[5]),
.EN_RD(REG_RD),
.EN_WR(REG_WR)
);

Registro Ra2 (
.In_REG(DI),
.Out_REG(a2),
.clk(clk),
.ENwr(out_mux_WR[6]),
.ENrd(out_mux_A[6]|out_mux_B[6]),
.EN_RD(REG_RD),
.EN_WR(REG_WR)
);

Registro Ra3 (
.In_REG(DI),
.Out_REG(a3),
.ENwr(out_mux_WR[7]),
.ENrd(out_mux_A[7]|out_mux_B[7]),
.clk(clk),
.EN_RD(REG_RD),
.EN_WR(REG_WR)
);

Registro Rt0 (
.In_REG(DI),
.Out_REG(t0),
.clk(clk),
.ENwr(out_mux_WR[8]),
.ENrd(out_mux_A[8]|out_mux_B[8]),
.EN_RD(REG_RD),
.EN_WR(REG_WR)
);

Registro Rt1 (
.In_REG(DI),
.Out_REG(t1),
.clk(clk),
.ENwr(out_mux_WR[9]),
.ENrd(out_mux_A[9]|out_mux_B[9]),
.EN_RD(REG_RD),
.EN_WR(REG_WR)
);

Registro Rt2 (
.In_REG(DI),
.Out_REG(t2),
.clk(clk),
.ENwr(out_mux_WR[10]),
.ENrd(out_mux_A[10]|out_mux_B[10]),
.EN_RD(REG_RD),
.EN_WR(REG_WR)
);

Registro Rt3 (
.In_REG(DI),
.Out_REG(t3),
.clk(clk),
.ENwr(out_mux_WR[11]),
.ENrd(out_mux_A[11]|out_mux_B[11]),
.EN_RD(REG_RD),
.EN_WR(REG_WR)
);

Registro Rt4 (
.In_REG(DI),
.Out_REG(t4),
.clk(clk),
.ENwr(out_mux_WR[12]),
.ENrd(out_mux_A[12]|out_mux_B[12]),
.EN_RD(REG_RD),
.EN_WR(REG_WR)
);

Registro Rt5 (
.In_REG(DI),
.Out_REG(t5),
.clk(clk),
.ENwr(out_mux_WR[13]),
.ENrd(out_mux_A[13]|out_mux_B[13]),
.EN_RD(REG_RD),
.EN_WR(REG_WR)
);

Registro Rt6 (
.In_REG(DI),
.Out_REG(t6),
.clk(clk),
.ENwr(out_mux_WR[14]),
.ENrd(out_mux_A[14]|out_mux_B[14]),
.EN_RD(REG_RD),
.EN_WR(REG_WR)
);

Registro Rt7 (
.In_REG(DI),
.Out_REG(t7),
.clk(clk),
.ENwr(out_mux_WR[15]),
.ENrd(out_mux_A[15]|out_mux_B[15]),
.EN_RD(REG_RD),
.EN_WR(REG_WR)
);

Registro Rs0 (
.In_REG(DI),
.Out_REG(s0),
.clk(clk),
.ENwr(out_mux_WR[16]),
.ENrd(out_mux_A[16]|out_mux_B[16]),
.EN_RD(REG_RD),
.EN_WR(REG_WR)
);

Registro Rs1 (
.In_REG(DI),
.Out_REG(s1),
.clk(clk),
.ENwr(out_mux_WR[17]),
.ENrd(out_mux_A[17]|out_mux_B[17]),
.EN_RD(REG_RD),
.EN_WR(REG_WR)
);

Registro Rs2 (
.In_REG(DI),
.Out_REG(s2),
.clk(clk),
.ENwr(out_mux_WR[18]),
.ENrd(out_mux_A[18]|out_mux_B[18]),
.EN_RD(REG_RD),
.EN_WR(REG_WR)
);

Registro Rs3 (
.In_REG(DI),
.Out_REG(s3),
.clk(clk),
.ENwr(out_mux_WR[19]),
.ENrd(out_mux_A[19]|out_mux_B[19]),
.EN_RD(REG_RD),
.EN_WR(REG_WR)
);

Registro Rs4 (
.In_REG(DI),
.Out_REG(s4),
.clk(clk),
.ENwr(out_mux_WR[20]),
.ENrd(out_mux_A[20]|out_mux_B[20]),
.EN_RD(REG_RD),
.EN_WR(REG_WR)
);

Registro Rs5 (
.In_REG(DI),
.Out_REG(s5),
.clk(clk),
.ENwr(out_mux_WR[21]),
.ENrd(out_mux_A[21]|out_mux_B[21]),
.EN_RD(REG_RD),
.EN_WR(REG_WR)
);

Registro Rs6 (
.In_REG(DI),
.Out_REG(s6),
.clk(clk),
.ENwr(out_mux_WR[22]),
.ENrd(out_mux_A[22]|out_mux_B[22]),
.EN_RD(REG_RD),
.EN_WR(REG_WR)
);

Registro Rs7 (
.In_REG(DI),
.Out_REG(s7),
.clk(clk),
.ENwr(out_mux_WR[23]),
.ENrd(out_mux_A[23]|out_mux_B[23]),
.EN_RD(REG_RD),
.EN_WR(REG_WR)
);

Registro Rt8 (
.In_REG(DI),
.Out_REG(t8),
.clk(clk),
.ENwr(out_mux_WR[24]),
.ENrd(out_mux_A[24]|out_mux_B[24]),
.EN_RD(REG_RD),
.EN_WR(REG_WR)
);

Registro Rt9 (
.In_REG(DI),
.Out_REG(t9),
.clk(clk),
.ENwr(out_mux_WR[25]),
.ENrd(out_mux_A[25]|out_mux_B[25]),
.EN_RD(REG_RD),
.EN_WR(REG_WR)
);

Registro Rgp (
.In_REG(DI),
.Out_REG(gp),
.clk(clk),
.ENwr(out_mux_WR[28]),
.ENrd(out_mux_A[28]|out_mux_B[28]),
.EN_RD(REG_RD),
.EN_WR(REG_WR)
);

Registro Rsp (
.In_REG(DI),
.Out_REG(sp),
.clk(clk),
.ENwr(out_mux_WR[29]),
.ENrd(out_mux_A[29]|out_mux_B[29]),
.EN_RD(REG_RD),
.EN_WR(REG_WR)
);

Registro Rfp (
.In_REG(DI),
.Out_REG(fp),
.clk(clk),
.ENwr(out_mux_WR[30]),
.ENrd(out_mux_A[30]|out_mux_B[30]),
.EN_RD(REG_RD),
.EN_WR(REG_WR)
);

Registro Rra (
.In_REG(DI),
.Out_REG(ra),
.clk(clk),
.ENwr(out_mux_WR[31]),
.ENrd(out_mux_A[31]|out_mux_B[31]),
.EN_RD(REG_RD),
.EN_WR(REG_WR)
);

Mux_out out_A (.A(D0A),.sel(DIR_A),.zero(zero),.v0(v0),.v1(v1),.a0(a0),.a1(a1),.a2(a2),.a3(a3),
.t0(t0),.t1(t1),.t2(t2),.t3(t3),.t4(t4),.t5(t5),.t6(t6),.t7(t7),.s0(s0),.s1(s1),.s2(s2),
.s3(s3),.s4(s4),.s5(s5),.s6(s6),.s7(s7),.t8(t8),.t9(t9),.gp(gp),.sp(sp),.fp(fp),.ra(ra));

Mux_out out_B (.A(D0B),.sel(DIR_B),.zero(zero),.v0(v0),.v1(v1),.a0(a0),.a1(a1),.a2(a2),.a3(a3),
.t0(t0),.t1(t1),.t2(t2),.t3(t3),.t4(t4),.t5(t5),.t6(t6),.t7(t7),.s0(s0),.s1(s1),.s2(s2),
.s3(s3),.s4(s4),.s5(s5),.s6(s6),.s7(s7),.t8(t8),.t9(t9),.gp(gp),.sp(sp),.fp(fp),.ra(ra));
endmodule
