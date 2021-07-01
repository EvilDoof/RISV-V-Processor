`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:34:11 04/13/2021 
// Design Name: 
// Module Name:    Instruction_Fetch 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Instruction_Fetch(
    input clk,
    input reset,
	input PCSrc,
	input [7:0] X,
    output [7:0] Instruction_Code
    );
reg [7:0] PC;

Instruction_Mem m1(PC,reset,Instruction_Code);

always @(posedge clk, negedge reset)
begin

if (reset == 0) PC <= 0;
else 
begin
	case(PCSrc) 
		1'b0: PC <= PC + 1;
		1'b1: PC <= PC + X;
	endcase
end
end

endmodule

