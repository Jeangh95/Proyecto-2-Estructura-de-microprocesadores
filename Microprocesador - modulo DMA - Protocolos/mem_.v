`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.09.2017 13:34:12
// Design Name: 
// Module Name: mem_ToD
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


module mem_In(direccion, instruccion);
  input  [31:0] direccion;
  output reg [31:0] instruccion;
  

  parameter pos_inicial = 25'd0; // direccion inicial en memoria

  reg [31:0] TM [0:31];
  wire [6:0] dir_Memoria;// bit para direccionar posicion de memoria
  wire direccion_escogida;//puntero q se va ir actualizando 

  assign dir_Memoria = direccion[7:2];  // asigno los 6 bits que direccionaran cada posicion
  // como necesito correr 15 instrucciones, entonces escojo 6 bits
  // 2^6= 64 
  // cada instruccion va en paquete de 4 bits en la memoria
  // entonces en 64 alcanza 16 instrucciones
  //
 
 // address decoding
  assign direccion_escogida = (direccion[31:8] == pos_inicial);  // los bits restantes son asignados tanto en pos inicial como la escogida
// cada ves se ira actualizando

always @(direccion_escogida or dir_Memoria)
  begin
    if ((direccion % 4) != 0) 
     $display($time, " Mem error: linea erronea de memoria %d", direccion);// error no deseado, cuando la direccion no es multiplo de 4
    if (direccion_escogida == 1)
    begin
case (dir_Memoria) // comienzo a buscar en memoria

// concatenacion de instrucciones
//tipo R
 //   ___________________________________________________________
//    |opcode  |  rs     |   rt    |  rd    | shanmt   | func   |
///
//ej   { 6'd0, 5'd0, 5'd0,5'd0,5'd0,6'd0 }
// tipo I
//   ________________________________________________
//   |opcode  |  rs     |   rt    |       inmediate |

//ej  6'd8, 5'd4, 5'd11,16'd45 };
//tipo J
//   ________________________________________________
//   |opcode  | address                              |
//
//
 

   6'd0 : instruccion = { 6'd0, 5'd0, 5'd0,5'd0,5'd0,6'd0 };//pos1: 0 NOP
   
   6'd1 : instruccion = { 6'd8, 5'd0, 5'd16,16'd1000};//addi $s0,$zero,Inmediato
      
   6'd2 : instruccion = { 6'd8, 5'd0, 5'd8,16'd1};//addi $t0,$zero,Inmediato
   
   6'd3 : instruccion = { 6'd8, 5'd0, 5'd9,16'd1};//addi $t1,$zero,Inmediato
   
   6'd4 : instruccion = { 6'd8, 5'd0, 5'd3,16'd145};//addi $s0,$zero,Inmediato
   
   6'd5 : instruccion = { 6'd0, 5'd0, 5'd0,5'd0,5'd0,6'd0 };//pos1: 0 NOP
      
   6'd6 : instruccion = { 6'd0,5'd8, 5'd9,5'd8,5'd0,6'd32 };//add $a3,$t0,$t1
   
   //6'd6 : instruccion = { 6'd0,5'd8, 5'd7,5'd7,5'd0,6'd32 };//and $a2,$t0,$t1
   
   //6'd6 : instruccion = { 6'd0,5'd8, 5'd9,5'd5,5'd0,6'd39 };//nor $a1,$t0,$t1
   
   //6'd7 : instruccion = { 6'd0,5'd8, 5'd9,5'd4,5'd0,6'd37 };//or $a0,$t0,$t1
   
   6'd7 : instruccion = { 6'd0,5'd16, 5'd9,5'd16,5'd0,6'd34 };//sub $a0,$t0,$t1
   
   6'd8 : instruccion = { 6'd0,5'd3, 5'd16,5'd3,5'd0,6'd32 };//and $a2,$t0,$t1
   //6'd7 : instruccion = { 6'd0,5'd0, 5'd9,5'd16,5'd0,6'd02 };
   
   
   
   
   
   //6'd8 : instruccion = { 6'd0,5'd16, 5'd9,5'd16,5'd0,6'd34 };
   
   6'd9 : instruccion = { 6'd2,26'd4 };//sub $a0,$t0,$t1
     
   
   default instruccion = 32'h0;
   endcase
      $display($time, " leyendo instruccion: rom_de_instrucciones[%h]", direccion, instruccion);
    end
  end 
endmodule

