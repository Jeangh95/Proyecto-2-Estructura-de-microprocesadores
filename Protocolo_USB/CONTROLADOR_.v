`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.12.2017 14:23:17
// Design Name: 
// Module Name: CONTROLADOR_
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


module CONTROLADOR_(
    input wire senal_tr,
    input wire clk,
    input wire reset,
    output reg start,
    input wire listo,
    input wire [31:0]conta,
    output reg cena
    );
    
    
    //----------------------------------------------------
    //-- CONTROLADOR
    //----------------------------------------------------
    localparam IDLE = 0;   //-- Reposo
    localparam TXCAR = 2'd1;  //-- Transmitiendo caracter
    localparam NEXT = 2'd2;   //-- Preparar transmision del sig caracter
    localparam END = 3;    //-- Terminar
    
    //-- Registro de estado del automata
    reg [1:0] state;
    
    //-- Gestionar el cambio de estado
    always @(posedge clk)
    
      if (reset == 1)
        //-- Ir al estado inicial
        state <= IDLE;
    
      else
        case (state)
          //-- Estado inicial. Se sale de este estado al recibirse la
          //-- señal de transmit, conectada al DTR
          IDLE: 
            if (senal_tr == 1) state <= TXCAR;
            else state <= IDLE;
    
          //-- Estado de transmision de un caracter. Esperar a que el 
          //-- transmisor serie este disponible. Cuando lo esta se pasa al
          //-- siguiente estado
          TXCAR: 
            if (conta == 1) state <= NEXT;
            else state <= TXCAR;
    
          //-- Envio del siguiente caracter. Es un estado transitorio
          //-- Cuando se llega al ultimo caracter se pasa para finalizar
          //-- la transmision 
          NEXT:    
            if (conta == 7) state <= END;
            else state <= TXCAR;
    
          //-- Ultimo estado:finalizacion de la transmision. Se espera hasta
          //-- que se haya enviado el ultimo caracter. Cuando ocurre se vuelve
          //-- al estado de reposo inicial
          END: 
            //--Esperar a que se termine ultimo caracter
            if (listo== 1) state <= IDLE;
            else state <= END;
    
          //-- Necesario para evitar latches
          default:
             state <= IDLE;
    
        endcase
    
    //-- Generacion de las microordenes
    always @*
      case (state)
        IDLE: begin
          start <= 0;
          cena <= 0;
        end
    
        TXCAR: begin
          start <= 1;
          cena <= 0;
        end
    
        NEXT: begin
          start <= 0;
          cena <= 1;
        end
    
        END: begin
          start <= 0;
          cena <= 0;
        end
    
        default: begin
          start <= 0;
          cena <= 0;
        end
      endcase

endmodule
