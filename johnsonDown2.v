`include "DFlipFlop.v"
module johnsonDown2(clk, reset, signal);
	input clk, reset;
	output [3:0] signal;
	
	DFlipFlop d0 (.q(signal[0]), .qBar(), .D(signal[1]), .clk(clk), .rst(rst));
	DFlipFlop d1 (.q(signal[1]), .qBar(), .D(signal[2]), .clk(clk), .rst(rst));
	DFlipFlop d2 (.q(signal[2]), .qBar(), .D(signal[3]), .clk(clk), .rst(rst));
	DFlipFlop d3 (.q(signal[3]), .qBar(), .D(~signal[0]), .clk(clk), .rst(rst));
endmodule