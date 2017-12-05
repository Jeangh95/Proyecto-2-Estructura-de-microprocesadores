`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.12.2017 16:27:22
// Design Name: 
// Module Name: TOPTX
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


module TOP_uartTX(
    input wire clk,
    input wire reset,
    input wire [31:0]Dato,
    output wire Tx,
    input wire start,
    output wire listo
    );
 ///cables
 wire Load;
 wire [31:0]Data;
 wire sal;
 wire Start;
 wire CLK;
 wire [5:0]ContadoR;
 wire status;
 ///   
desplaz desp(
       .carga(Load),.reset(reset),.clk(CLK),.sal(sal),.data(Data));
 
//
registro regis(
    .status(status),.reset(reset),.clk(clk),  //--Reloj
     .d_en(Dato), // dato entrada       
      .data(Data)); 
//////
contador Contado(
  .clk(CLK),// reloj de entrada del divisor
  .carga(Load),
  .btc(ContadoR));
//
 controlador Controlador(
    .dato_contador(ContadoR),
    .clk(clk),
    .start(Start),
    .reset(reset),
    .listo(listo),
    .carga(Load),
    .status(status)
   );  
 
 // 
 reg_tx regTx(
     .clk(clk),
     .dato_se(sal),
     .dato_sal(Tx)
     );
// 
reg_start RegS(
    .clk(clk),
    .sta_rt(start),
    .start(Start)
    );
//
divisor_clok Div(
     .clk(clk),
     .clk_sal(CLK)
    );
endmodule
