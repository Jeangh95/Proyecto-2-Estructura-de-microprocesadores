`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.09.2017 13:23:03
// Design Name: 
// Module Name: Control_Etapas
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


module Control_Etapas(clk, rst, color);
    input clk;
    input rst;
    output [1:0] color;

    reg [1:0] state, nextState;
    reg [8:0] cnt;

    // Asignación asíncrona del siguiente estado
    always @(state, cnt)
      case(state)
      0:  // IF_ID
        if (cnt == 100) nextState = 1;
        else nextState = 0;
      1:  // Color Ambar
        if (cnt == 120) nextState = 2;
        else nextState = 1;
      2:  // Color Verde
        if (cnt == 200) nextState = 0;
        else nextState = 2;
      default: nextState = 0;
      endcase

    // Asignación síncrona: Actualización del estado
    always @(posedge clk or negedge rst)
      if(rst == 0) state = 0;
      else state = nextState;

    // Asignación de las salidas
    always @(state)
      if(state == 0) color = 2'b00; // Color Rojo
      else if(state == 1) color = 2'b01; // Color Ambar
      else color = 2'b10; // Color Verde

    // Contador
    always @(posedge clk or negedge rst)
      if(rst == 0) cnt = 0;
      else cnt = cnt + 1;
    endmodule
