`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2023 17:43:55
// Design Name: 
// Module Name: Multiplexor
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


module Multiplexor(input [2:0]SEL,output reg [3:0]Y,input [3:0]A,input [3:0]B,EN);
      
      always @(*)//SEL, XOR, NAND, OR, 
                 //despiz, despder,suma,cuadruple,incremento
      
      if (EN) 
      begin
        case (SEL)
         3'b000: Y = A^B;
         3'b001: Y = ~(A&B);
         3'b010: Y = A|B;
         3'b011: Y = A <<< 1;
         3'b100: Y = A >> 1;
         3'b101: Y = A+B;
         3'b110: Y = A <<< 2;
         3'b111: Y = A+1;
         endcase
      end
      else  begin Y=4'b0000;
      end
endmodule
