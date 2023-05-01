`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2023 17:42:48
// Design Name: 
// Module Name: Shifter
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


module Shifter (input[3:0]A,output [3:0]Y,input shift);
    assign Y[0] = ~shift & A[1];
    assign Y[1] = (shift & A[0]) | (~shift & A[2]);
    assign Y[2] = (shift & A[1]) | (~shift & A[3]);
    assign Y[3] =  shift & A[2];
    assign Y[3:0] = 4'b0101;
endmodule
