`timescale 10ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2023 17:39:44
// Design Name: 
// Module Name: Main
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

module main(input [3:0]A, input [3:0]B, input Start,input RST, input CLK, output reg[3:0]Y, output reg DONE, output reg ZF, output reg PF);
//FlipFlop( CLK, D, RST, EN)
    reg [2:0]SEL;
    reg [3:0]SAL;
    reg Etemp;
    reg Ztemp;
    reg Ptemp;
    reg ENtemp;
    assign RST=DONE;
    always @(*)
    if (Start) 
        begin
        Etemp = FlipFlop(CLK,0,RST,Start);
        SAL = Multiplexor(SEL,A,B,Etemp);
        Ztemp = ~(SAL|4'b0000);
        Ptemp = ~(SAL[3]^SAL[2]^SAL[1]^SAL[0]);
        ENtemp = FlipFlop(CLK,Start,RST,1);
        Y = FlipFlop(CLK,SAL,RST,ENtemp);        
        DONE = FlipFlop(CLK,ENtemp,RST,1);
        ZF = FlipFlop( CLK, Ztemp, RST, ENtemp);
        PF = FlipFlop( CLK, Ptemp, RST, ENtemp);
        end 
    else 
        begin 
        Y=4'b0000;
        end 
endmodule
