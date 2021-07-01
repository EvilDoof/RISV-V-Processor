`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:41:55 04/13/2021 
// Design Name: 
// Module Name:    Sign_Extend_3_to_8 
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
module Sign_Extend_3_8(
	input [2:0] data_in,
	output reg [7:0] data_out
    );
	
	always@(*)
	begin
		if(data_in[2]==0) data_out = {5'b0, data_in};
		
		else data_out = {5'b11111, data_in};
	end

endmodule
