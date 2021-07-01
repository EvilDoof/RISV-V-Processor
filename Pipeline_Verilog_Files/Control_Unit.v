`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:15:21 04/13/2021 
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
	input [1:0] opcode,
	input [1:0] next_opcode,
	output reg RegWrite,
	output reg PCSrc,
	output reg ALU_Ctrl
    );
	
 	always @ (*)
	begin
		
		case(opcode)
			2'b00:  begin
						RegWrite = 1'b1; //mov
						ALU_Ctrl = 1'b1;
					end
							
			2'b01:  begin
						RegWrite = 1'b1; //addi
						ALU_Ctrl = 1'b0;
					end
			default:begin
						RegWrite = 1'b0;
						ALU_Ctrl = 1'b0;
					end
		endcase			
	
		case(next_opcode)
			2'b11:	PCSrc = 1'b1; //jump
			
			default: PCSrc = 1'b0;
		endcase
		
	end

endmodule
