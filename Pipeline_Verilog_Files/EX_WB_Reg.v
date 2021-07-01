`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:08:09 04/13/2021 
// Design Name: 
// Module Name:    EX_WB_Reg 
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
module EX_WB_Reg(
	input Clk,
	input Reset,
	
	input ID_EX_RegWrite,
	input [2:0] ID_EX_Write_Reg_Num,
	input [7:0] ALUResult,
	
	output reg EX_WB_RegWrite,
	output reg [2:0] EX_WB_Write_Reg_Num,
	output reg [7:0] EX_WB_ALUResult
	
    );
	
	always@(posedge Clk, negedge Reset)
	begin
	if(Reset==0)
	begin
		EX_WB_RegWrite <= 0;
		EX_WB_Write_Reg_Num <= 0;
		EX_WB_ALUResult <= 0;
	end
	
	else
	begin
		EX_WB_RegWrite <= ID_EX_RegWrite;
		EX_WB_Write_Reg_Num <= ID_EX_Write_Reg_Num;
		EX_WB_ALUResult <= ALUResult;
	end
	
	end
endmodule
