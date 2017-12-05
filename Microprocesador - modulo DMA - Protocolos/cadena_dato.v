`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.12.2017 15:29:02
// Design Name: 
// Module Name: cadena_dato
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


module cadena_dato(
     input wire [5:0]car_cont,
     output reg [31:0]dato
    );
 reg data;
 always @*
      case(car_cont)
      32'd0: data <= "H";
      32'd1: data <= "o";
      32'd2: data <= "l";
      32'd3: data <= "a";
      32'd4: data <= "!";
      32'd5: data <= ".";
      32'd6: data <= ".";
      32'd7: data <= ".";
      32'd8: data <= "P";
      32'd9: data <= "R";
      32'd10: data <= "O";
      32'd11: data <= "Y";
      32'd12: data <= "E";
      32'd13: data <= "C";
      32'd14: data <= "T";
      32'd15: data <= "O";
      32'd16: data <= ".";
      32'd17: data <= ".";
      32'd18: data <= "M";
      32'd19: data <= "I";
      32'd20: data <= "C";
      32'd21: data <= "R";
      32'd22: data <= "O";
      32'd23: data <= "S";
      32'd24: data <= ".";
      32'd25: data <= ".";
      32'd26: data <= ".";
      32'd27: data <= ".";
      32'd28: data <= ".";
      32'd29: data <= ".";
      32'd30: data <= ".";
      32'd31: data <= ".";
 default: data <= ".";
 endcase
always @*
   dato <= data;
endmodule
