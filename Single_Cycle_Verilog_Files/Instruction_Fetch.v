`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:52:43 04/14/2021 
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
    input Clk,
    input Reset,
	 input [7:0] X,
	 input PCSrc,
    output [7:0] Instruction_Code
    );

reg [7:0] PC;

Instruction_Mem m1(PC,Reset,Instruction_Code);

always @(posedge Clk, negedge Reset)
begin
	if (Reset == 0) PC = 8'b00000000;
	else 
	begin case(PCSrc) 
		1'b0: PC = PC + 8'b00000001;
	   1'b1: PC = PC + X;
	endcase
	end
end

endmodule
