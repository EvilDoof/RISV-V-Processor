`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:01:49 04/14/2021 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
	input [7:0] A,
    input [7:0] B,
	 input [7:0] ImmVal,
    input ALU_Ctrl,
    output reg [7:0] Result
    );
	
	always @(*)
	begin case(ALU_Ctrl)
			1'b0: Result = A+ImmVal;//Addi
			1'b1: Result = B;	//Mov
		   endcase
	end
endmodule

