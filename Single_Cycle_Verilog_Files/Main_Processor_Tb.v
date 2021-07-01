`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:48:42 04/15/2021
// Design Name:   Main_Processor
// Module Name:   C:/Users/tejus/Downloads/Final_Single_Cycle/Single_Cycle_Processor/Main_Processor_Tb.v
// Project Name:  Single_Cycle_Processor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Main_Processor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Main_Processor_Tb;

	// Inputs
	reg Clk;
	reg Reset;

	// Instantiate the Unit Under Test (UUT)
	Main_Processor uut (
		.Clk(Clk), 
		.Reset(Reset)
	);

	always #5 Clk = ~Clk;

	initial begin
		// Initialize Inputs
		Clk = 1'b1;
		Reset = 1'b1;
		#3 Reset = ~Reset;
		#3 Reset = ~Reset;
	end
      
endmodule

