`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:00:47 04/14/2021 
// Design Name: 
// Module Name:    Register_File 
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
//Read_Reg_Num_1, Read_Reg_Num_2, Write_Reg_Num, Result, RegWrite, Clk, Reset, Data1, Data2);

module Register_File(
    input [2:0] Read_reg_num_1,
    input [2:0] Read_reg_num_2,
    input [2:0] Write_reg_num,
    input [7:0] Write_data,
	 input RegWrite,
	 input clk,
	 input Reset,
    output [7:0] Read_data_1,
    output [7:0] Read_data_2
    );

reg [7:0] RegMemory [7:0];

assign Read_data_1 = RegMemory[Read_reg_num_1];
assign Read_data_2 = RegMemory[Read_reg_num_2];

always @(negedge Reset, posedge clk) 
begin
	if (Reset == 0)
	begin
		RegMemory[0] = 0;
		RegMemory[1] = 1;
		RegMemory[2] = 2;
		RegMemory[3] = 3;
		RegMemory[4] = 4;
		RegMemory[5] = 5;
		RegMemory[6] = 6;
		RegMemory[7] = 7;
	end
	
	else if (RegWrite == 1)
	begin
		RegMemory[Write_reg_num] = Write_data;
	end
end

endmodule
