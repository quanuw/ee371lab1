module CounterBoard(CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR,
SW);
	
	input CLOCK_50; // 50MHz clock.
	output reg [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	output [9:0] LEDR;
	input [3:0] KEY; // True when not pressed, False when pressed
	input [9:0] SW;
	
	wire [31:0] divided_clocks;
	wire [3:0] CounterLights;
	

	clock_divider dividclock(.clock(CLOCK_50), .divided_clocks(divided_clocks));
	RippleDownCounter_4bit RippleDown(.clk(divided_clocks[25]), .rst(SW[9]), .count(LEDR[3:0]));
	// syncDownCounter(.clk(divided_clocks[25]), .rst(SW[9]), .out(LEDR[3:0]));
	// johnsonDown johnsonDownCounter(.clk(divided_clocks[25]), .reset(SW[9]), .signal(LEDR[3:0]));
	// counter4 schematic (.clock(divided_clocks[25]), .reset(SW[9]), .out(LEDR[3:0]));
	
endmodule
