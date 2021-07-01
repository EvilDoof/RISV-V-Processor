`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:36:26 04/15/2021 
// Design Name: 
// Module Name:    Sign_Extend 
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
module Sign_Extend_6_8(
	input [5:0] data_in,
	output reg [7:0] data_out
    );
	
	always@(*)
	begin
		if(data_in[5]==0) data_out = {2'b00, data_in};
		
		else data_out = {2'b11, data_in};
	end

endmodule
