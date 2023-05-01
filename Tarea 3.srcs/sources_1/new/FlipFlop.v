`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2023 17:41:36
// Design Name: 
// Module Name: FlipFlop
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


module FlipFlop(input CLK,input D,input RST,input EN,output reg Q);
    always @(posedge CLK)
        if (RST) begin
        Q <= 1'b0;
        end else if (EN) 
        begin         
        Q <= D;
        end
endmodule
