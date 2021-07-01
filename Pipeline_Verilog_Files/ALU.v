`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:07:19 04/13/2021 
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
	input [7:0] Forwarded_reg,
	input Forward_Rs1,
	input Forward_Rs2,
	input [7:0] ImmVal,
	input ALU_ctrl,
   output reg [7:0] Result
    );
	
	reg [7:0] operand2;
	reg [7:0] ALU_Reg_1, ALU_Reg_2;
	
	always @(*)
	begin 
		if(Forward_Rs1==0) ALU_Reg_1 = A;
		else ALU_Reg_1 = Forwarded_reg;
		
		if(Forward_Rs2==0) ALU_Reg_2 = B;
		else ALU_Reg_2 = Forwarded_reg;
			
		case(ALU_ctrl)
			1'b0: Result = ALU_Reg_1 + ImmVal;
			1'b1: Result = ALU_Reg_2;
		endcase
	end
endmodule
