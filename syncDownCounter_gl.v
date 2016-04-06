`include "DFlipFlop.v"

module syncDownCounter_gl(clk, rst, out);
	input clk, rst;
	wire [3:0] d;
	output[3:0] out;
	wire orOut1, orOut2;


	not firstBit(d[0], out[0]);
	xnor secondBit(d[1], out[1], out[0]);
	or orOne(orOut1, out[1], out[0]);
	xnor thirdBit(d[2], out[2], orOut1);
	or orTwo(orOut2, out[2], out[1], out[0]);
	xnor fourthBit(d[3], out[3], orOut2);

	DFlipFlop dff0(.q(out[0]), .qBar(), .D(d[0]), .clk, .rst);
	DFlipFlop dff1(.q(out[1]), .qBar(), .D(d[1]), .clk, .rst);
	DFlipFlop dff2(.q(out[2]), .qBar(), .D(d[2]), .clk, .rst);
	DFlipFlop dff3(.q(out[3]), .qBar(), .D(d[3]), .clk, .rst);
endmodule
