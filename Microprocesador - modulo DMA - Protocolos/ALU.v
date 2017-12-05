`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.08.2017 22:29:44
// Design Name: 
// Module Name: ALU
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


module ALU (opcode,operand1, operand2, result, flagC, flagZ );
input [2:0] opcode;
input [31:0] operand1,operand2;
output reg [31:0]result;
output reg flagC=1'b0, flagZ=1'b0;

////////////////////////////////////parametros para definir las operaciones///
parameter  [2:0] ADD = 3'b000,

                 SUB = 3'b001,

                 MUL = 3'b010,

                 AND = 3'b011,

                 OR = 3'b100,

                 NAND = 3'b101,

                 NOR = 3'b110,

                 XOR = 3'b111;      
always @ (opcode or operand1 or operand2)
case (opcode)
    ADD: begin
      result = operand1 + operand2;
      flagC  = result[8];
      flagZ  = (result == 31'b0);
      end

 SUB: begin

   result = operand1 - operand2;

   flagC  = result[8];

   flagZ  = (result == 31'b0);

  end

 MUL: begin

   result = operand1 * operand2;

   flagZ  = (result == 31'b0);

  end

 AND: begin

   result = operand1 & operand2;

   flagZ  = (result == 32'b0);

  end

 OR:  begin

    result = operand1 | operand2;

    flagZ  = (result == 31'b0);

   end

 NAND: begin

   result = ~(operand1 & operand2);

   flagZ  = (result ==31'b0);

  end
  
 NOR: begin

   result = ~(operand1 | operand2);

   flagZ  = (result == 31'b0);

  end

 XOR: begin

   result = operand1 ^ operand2;

   flagZ  = (result == 31'b0);

  end

 default: begin

   result = 31'b0;

   flagC  = 1'b0;

   flagZ  = 1'b0;

  end

 endcase
endmodule
