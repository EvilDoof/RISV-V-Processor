`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:53:26 04/15/2021
// Design Name:   Processor_Pipelined
// Module Name:   C:/Users/tejus/Downloads/Final_Pipeline/Pipeline_Processor/Pipeline_Tb.v
// Project Name:  Pipeline_Processor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Processor_Pipelined
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Pipeline_Tb;

	// Inputs
	reg Clk;
	reg Reset;

	// Instantiate the Unit Under Test (UUT)
	Processor_Pipelined uut (
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

