`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:37:15 04/13/2021 
// Design Name: 
// Module Name:    Forwarding_Unit 
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
module Forwarding_Unit(
	input [2:0] ID_EX_Read_Reg_Num_1,
	input [2:0] ID_EX_Read_Reg_Num_2,
	input [2:0] EX_WB_Write_Reg_Num,
	input EX_WB_RegWrite,
	output reg Forward_Rs1,
	output reg Forward_Rs2
    );
	
	always@(*)
	begin
		if(EX_WB_RegWrite && (EX_WB_Write_Reg_Num==ID_EX_Read_Reg_Num_1)) Forward_Rs1 = 1;
		else Forward_Rs1 = 0;
		if(EX_WB_RegWrite && (EX_WB_Write_Reg_Num==ID_EX_Read_Reg_Num_2)) Forward_Rs2 = 1;
		else Forward_Rs2 = 0;
	end
endmodule
