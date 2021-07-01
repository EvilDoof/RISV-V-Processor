`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:00:01 04/13/2021 
// Design Name: 
// Module Name:    IF_ID_Reg 
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
module IF_ID_Reg(
	input Clk,
	input Reset,
	input [7:0] Instruction_Code,
	output reg [7:0] IF_ID_Instruction_Code
    );

	always@(posedge Clk, negedge Reset)
	begin
		if (Reset==0) IF_ID_Instruction_Code <= 0;
		
		else IF_ID_Instruction_Code <= Instruction_Code;
	end

endmodule
