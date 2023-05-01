`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.05.2023 11:01:03
// Design Name: 
// Module Name: main_tb
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


module main_tb();
reg [3:0] A;
reg [3:0] B;
reg [2:0] SEL;
reg CLK;
reg RST;
reg Start;
// Outputs
wire [3:0] Y;
wire ZF;
wire PF;
wire Done;
// Instantiate the Unit Under Test (UUT)
main uut (
.A(A),
.B(B),
.SEL(SEL),
.CLK(CLK),
.RST(RST),
.Start(Start),
.Y(Y),
.ZF(ZF),
.PF(PF),
.Done(Done)
);
initial begin
// Initialize Inputs
A = 0;
B = 0;
SEL = 0;
Start = 0;
RST = 0;
CLK = 0;
#100 RST = 1;
#100 RST = 0;
SEL = 0;
#100 Start = 1;
#10 Start = 0;
SEL = 1;
#100 Start = 1;
#10 Start = 0;
SEL = 2;
#100 Start = 1;
#10 Start = 0;
SEL = 3;
#100 Start = 1;
#10 Start = 0;
SEL = 4;
#100 Start = 1;
#10 Start = 0;
SEL = 5;
#100 Start = 1;
#10 Start = 0;
SEL = 6;
#100 Start = 1;
#10 Start = 0;
SEL = 7;
#100 Start = 1;
#10 Start = 0;
// Wait 100 ns for global reset to finish
#100;
end
task ZF_monitor();
if (ZF)
$display("At time %t, Zero flag is asserted.", $time);
endtask
task PF_monitor();
if (PF)
$display("At time %t, Parity flag is asserted.", $time);
endtask
task Start_monitor();
if (Start)
$display("At time %t, Start is asserted. A is %d. B is %d.", $time, A, B);
endtask
task Done_monitor();
if (Done)
$display("At time %t, Done is asserted. Y is %d.", $time, Y);
endtask
always @(posedge CLK) begin
ZF_monitor();
end
always @(posedge CLK) begin
PF_monitor();
end
always @(posedge CLK) begin
Start_monitor();
end
always @(posedge CLK) begin
Done_monitor();
end
always #23 A = A + 1;
always #37 B = B + 1;
always #5 CLK = CLK + 1;

endmodule
