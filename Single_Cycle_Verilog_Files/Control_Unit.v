`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:04:08 04/14/2021 
// Design Name: 
// Module Name:    Control_Unit 
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
module Control_Unit(
	input [1:0] opcode,		// not used in the code for now
	output reg RegWrite,
	output reg ALU_Ctrl,
	output reg PCSrc
    );
		
	always @ (*)
	begin
		case(opcode)
			2'b00: begin //mov
						RegWrite = 1'b1;
						PCSrc = 1'b0;
						ALU_Ctrl = 1'b1;
					end
			2'b01: begin //addi
						RegWrite = 1'b1;
						PCSrc = 1'b0;
						ALU_Ctrl = 1'b0;
					end
			2'b11: begin //jump
						RegWrite = 1'b0;
						PCSrc = 1'b1;
						ALU_Ctrl = 1'b0;
					end
			
			default: begin
						RegWrite = 1'b0;
						PCSrc = 1'b0;
						ALU_Ctrl = 1'b0;
					 end
		endcase			
	end

endmodule
