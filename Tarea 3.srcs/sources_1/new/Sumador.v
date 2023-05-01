`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2023 17:43:14
// Design Name: 
// Module Name: Sumador
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


module Sumador(input[3:0]A,input[3:0]B,output reg[3:0]Y);
    parameter ADDER_WIDTH = 4;

   wire [ADDER_WIDTH-1:0] A;
   wire [ADDER_WIDTH-1:0] B;
   wire carry_out;
   wire [ADDER_WIDTH-1:0] temp;

   assign {carry_out, temp} = A + B;
   always @(A or B)
     if (carry_out) begin
         Y <= 4'b1111;
     end

    else begin
          Y = temp;
    end
endmodule
   
