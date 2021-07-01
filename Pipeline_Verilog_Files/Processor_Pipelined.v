`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:18:09 04/13/2021 
// Design Name: 
// Module Name:    Processor_Pipelined 
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
module Processor_Pipelined(
	input Clk,
	input Reset
    );
wire [7:0] Instruction_Code, IF_ID_Instruction_Code, Data1, Data2, ID_EX_Data1, ID_EX_Data2, Result, EX_WB_ALUResult;
wire RegWrite, ID_EX_RegWrite, EX_WB_RegWrite, Forward_Rs1, Forward_Rs2, PC_src; //ALU_src, ID_EX_ALU_src;
wire [2:0] Read_Reg_Num_1, Read_Reg_Num_2, ID_EX_Read_Reg_Num_1, ID_EX_Read_Reg_Num_2;
wire [2:0] Write_Reg_Num, ID_EX_Write_Reg_Num, EX_WB_Write_Reg_Num;
wire [1:0] opcode, next_opcode;
wire [7:0] X, ImmVal;
wire ALU_Ctrl, ID_EX_ALU_Ctrl; 

//8 bit instruction code. First 2 bits are for opcode while the rest is for resistor or immediate addressing
assign Read_Reg_Num_1 = IF_ID_Instruction_Code[5:3];
assign Read_Reg_Num_2 = IF_ID_Instruction_Code[2:0];
assign Write_Reg_Num = IF_ID_Instruction_Code[5:3];
assign opcode = IF_ID_Instruction_Code[7:6];
assign next_opcode = Instruction_Code[7:6];

Sign_Extend_6_8 s1 (Instruction_Code[5:0], X); //for PC relative jump statements, calculate X
Sign_Extend_3_8 s2 (ID_EX_Read_Reg_Num_2, ImmVal); //for addi, find the immediate value

Instruction_Fetch m1(Clk, Reset, PC_src, X, Instruction_Code); //Obtain the instruction code from the instruction memory
	
IF_ID_Reg m2(Clk, Reset, Instruction_Code, IF_ID_Instruction_Code); //Generate IF_ID_code
	
Register_File m3(Read_Reg_Num_1, Read_Reg_Num_2, EX_WB_Write_Reg_Num, EX_WB_ALUResult, EX_WB_RegWrite, Reset, Data1, Data2);
//Perform register read and write operation

Control_Unit m4(opcode, next_opcode, RegWrite, PC_src, ALU_Ctrl); //Obtain control signals

ID_EX_Reg m5(Clk, Reset, 
			RegWrite, ALU_Ctrl, Data1, Data2, Write_Reg_Num, Read_Reg_Num_1, Read_Reg_Num_2, 
			ID_EX_RegWrite, ID_EX_ALU_Ctrl, ID_EX_Data1, ID_EX_Data2, ID_EX_Write_Reg_Num, ID_EX_Read_Reg_Num_1, ID_EX_Read_Reg_Num_2);
//Generate ID_EX Signals used for forwarding and ALU

Forwarding_Unit m6(ID_EX_Read_Reg_Num_1, ID_EX_Read_Reg_Num_2, EX_WB_Write_Reg_Num, EX_WB_RegWrite, Forward_Rs1, Forward_Rs2);
//Check for data hazard and implemet forwarding 

ALU m7(ID_EX_Data1, ID_EX_Data2, EX_WB_ALUResult, Forward_Rs1, Forward_Rs2, ImmVal, ID_EX_ALU_Ctrl, Result);
//Perform immediate addition or pass value of register 2 in the case of move

EX_WB_Reg m8(Clk, Reset, ID_EX_RegWrite, ID_EX_Write_Reg_Num, Result, EX_WB_RegWrite, EX_WB_Write_Reg_Num, EX_WB_ALUResult);
//Generated result returned to Register File
endmodule
