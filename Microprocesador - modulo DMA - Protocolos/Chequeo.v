`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.12.2017 20:08:03
// Design Name: 
// Module Name: Chequeo
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


module Chequeo(
input clk,
input Estado_in,
input Check_in,
output reg Check_out,
output reg sel,
output reg recibir,
output reg enviar
    );
reg [1:0] state, nextState;
initial state=0;
//chequea si hay dato desde un I/O
always @ (posedge clk or posedge Estado_in)
begin
if (Estado_in==1)
state=1;
else
state=0;
end
//Chequea si el procesador le da permiso de uso del bus de sistema


// Asignación de las salidas
always @(state,Check_in)
begin
      case(state)
      0:begin
        Check_out=1'b0;
        sel=1'b0;
        recibir=1'b0;
        enviar=1'b0;
        end
      1:
        begin
                
                Check_out=1'b0;
                sel=1'b0;
                recibir=1'b1;
                enviar=1'b0;
                nextState = 2;
         
         end     
    
      2: begin 
               Check_out=1'b1;
               recibir=1'b0;
      if(Check_in==1)begin
                sel=1'b1;
                enviar=1'b1;
                
          end 
                nextState = 3;
          end 
       3: begin  
                Check_out=1'b0;
                sel=1'b0;
                recibir=1'b0;
                enviar=1'b0;
                nextState = 0;        
         end
         default: nextState=0; 
      endcase
end
// Asignación síncrona: Actualización del estado
    always @(posedge clk)
    begin
      state = nextState;
    end 
endmodule
