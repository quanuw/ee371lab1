// Top-level module
module signalTapTest0 (SW, CLOCK_50, LEDR);
	input [9:0] SW;
	input CLOCK_50;
	output [9:0] LEDR;
	
	wire [31:0] dclock;
	
	// Clock divider added to allow us to physically observe the behaviors of the counter.
	clock_divider cdiv (.clock(CLOCK_50), .divided_clocks(dclock));
	
	// su_counter counter (.out(LEDR[3:0]), .clk(CLOCK_50), .rst(SW[9]));
	// johnsonBehavioural counter1 (.reset(SW[9]), .clk(CLOCK_50), .out(LEDR[3:0]));
	rd_counter counter2 (.clk(dclock[25]), .rst(SW[9]), .bit(LEDR[3:0]));
	
endmodule