`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.12.2017 13:39:05
// Design Name: 
// Module Name: Mux_I_O
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


module Mux_I_O(
    input sel,
    input [31:0] PS2_Datos,
    input [31:0] USB_Datos,
    input [31:0] PS2_dir,
    input [31:0] USB_dir,
    output reg [31:0] Datos_I_O,
    output reg  [31:0] Dir_I_O,
    output Estado_in,
    input Estado_PS2,
    input Estado_USB
    );
assign Estado_in=Estado_USB|Estado_PS2;
always@ *
    begin
    case (sel)
    1'b1:begin 
    //Agrupados los proveniente del PS2
    Datos_I_O<=PS2_Datos;
    Dir_I_O<=PS2_dir;
    end
    1'b0:
    begin 
    //Agrupados los proveniente del USB
    Datos_I_O<=USB_Datos;
    Dir_I_O<=USB_dir;
    end
    endcase
    end

endmodule

