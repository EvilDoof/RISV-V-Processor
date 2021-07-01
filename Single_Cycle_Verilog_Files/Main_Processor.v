`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:23:51 04/14/2021 
// Design Name: 
// Module Name:    Processor 
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
module Main_Processor(
	input Clk,
	input Reset
    );
wire [7:0] Instruction_Code, Data1, Data2, Result, X, ImmVal;
wire RegWrite, PCSrc, ALU_Ctrl;
wire [2:0] Read_Reg_Num_1, Read_Reg_Num_2;
wire [2:0] Write_Reg_Num;
wire [1:0] opcode;
	
assign Read_Reg_Num_1 = Instruction_Code[5:3];
assign Read_Reg_Num_2 = Instruction_Code[2:0];
assign Write_Reg_Num = Instruction_Code[5:3];
assign opcode = Instruction_Code[7:6];

Instruction_Fetch m1(Clk, Reset, X, PCSrc, Instruction_Code); //Obtain Instruction code from instruction memory

Sign_Extend_6_8 s1(Instruction_Code[5:0], X); //For PC relative jump, get the value of X
Sign_Extend_3_8 s2(Instruction_Code[2:0], ImmVal); //For addi, get the immediate value
	
Register_File m2(Read_Reg_Num_1, Read_Reg_Num_2, Write_Reg_Num, Result, RegWrite, Clk, Reset, Data1, Data2);
//Perform register read and write operations

Control_Unit m3(opcode, RegWrite, ALU_Ctrl, PCSrc); //Obtain control signals

ALU m4(Data1, Data2, ImmVal, ALU_Ctrl, Result); // Perform immediate addition or pass register 2 value for mov

endmodule
