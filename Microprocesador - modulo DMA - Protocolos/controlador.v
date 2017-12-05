`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.12.2017 11:00:51
// Design Name: 
// Module Name: controlador
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


module controlador(
    input wire[5:0] dato_contador,
    input wire clk,
    input wire start,
    input wire reset,
    output wire listo,
    output wire carga,
    output wire status
    );
    

    
    
//------------------------------
//--       CONTROLADOR        --
//------------------------------
    
    //-- Estados del automata finito del controlador
    localparam IDLE  = 0;  //-- Estado de reposo
    localparam START = 1;  //-- Comienzo de transmision
    localparam TRANS = 2;  //-- Estado: transmitiendo dato
    
    //-- Estados del autómata del controlador
    reg [1:0] state;

//////////// definicion de la maquina de estados

//-- Transiciones entre los estados
always @(posedge clk)

  //-- Reset del automata. Al estado inicial
  if (reset == 1)
    state <= IDLE;

  else
    //-- Transiciones a los siguientes estados
    case (state)

      //-- Estado de reposo. Se sale cuando la señal
      //-- de start se pone a 1
      IDLE: 
        if (start == 1) 
          state <= START;
        else 
          state <= IDLE;

      //-- Estado de comienzo. Prepararse para empezar
      //-- a transmitir. Duracion: 1 ciclo de reloj
      START:
        state <= TRANS;

      //-- Transmitiendo. Se esta en este estado hasta
      //-- que se hayan transmitido todos los bits pendientes
      TRANS:
          if (dato_contador == 6'd11)
              state <= IDLE;
            else
              state <= TRANS;
    
          //-- Por defecto. NO USADO. Puesto para
          //-- cubrir todos los casos y que no se generen latches
          default:
            state <= IDLE;
    
        endcase
//-- Generacion de las microordenes
assign carga = (state == START) ? 1 : 0;

        
//-- Señal de salida. Esta a 1 cuando estamos en reposo (listos
//-- para transmitir). En caso contrario esta a 0
assign listo = (state == IDLE) ? 1 : 0;
    
    
endmodule
