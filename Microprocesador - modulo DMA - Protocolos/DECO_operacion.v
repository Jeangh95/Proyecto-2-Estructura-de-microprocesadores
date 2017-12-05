`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.09.2017 16:12:19
// Design Name: 
// Module Name: DECO_operacion
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


module DECO_operacion(Opcode,operacion);
    input[5:0] Opcode;
    output reg[19:0] operacion;
    always @ (Opcode)
    begin
    case(Opcode)
    // sel_SL,lectura,escritura,sel_operaB,sel_operaA,Reg_WR,Reg_RD,sel_dest
    6'd0: operacion={ 4'd15, 4'd1, 4'd0,4'd0,4'd6};
    //6'h8: operacion = 20'b11110000000000010011;
    //6'h9: operacion = 20'b11110000000000010011;
    //6'hc: operacion = 20'b11110000000000100011;
    //6'hd: operacion = 20'b11110000000000100011;
    default operacion = 20'hxxxx;
    endcase
    end
endmodule
