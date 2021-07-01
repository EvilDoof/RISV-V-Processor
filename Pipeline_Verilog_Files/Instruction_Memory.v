`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:34:55 04/13/2021 
// Design Name: 
// Module Name:    Instruction_Memory 
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
module Instruction_Mem(
    input [7:0] PC,
    input Reset,
    output [7:0] Instruction_Code
    );

reg [7:0] Mem [7:0];

assign Instruction_Code = Mem[PC];

always @(Reset)
begin
if (Reset == 0)
	begin
	//mov = 00, addi = 01, jump = 11
	Mem[0] = 8'b00101101; //mov r5, r5
	Mem[1] = 8'b01101011; //addi r5, 3
	Mem[2] = 8'b01101010; //addi r5, 2
	Mem[3] = 8'b11000010; //j L1
	Mem[4] = 8'b00100101; //mov r4, r5
	Mem[5] = 8'b01100101; //L1: addi r4, -3
	Mem[6] = 8'b10000000; //nop
	Mem[7] = 8'b10000000; //nop	
	end
end

endmodule
