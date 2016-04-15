// this module will simulate the operation of a 4 bit synchronous down counter.
module syncDownCounter(clk, rst, out);
	input clk;
	input rst;
	output [3:0] out;
	wire [3:0] d;
	
	// assign each bit of wire to logical operations with outputs.
	assign d[0] = ~out[0];
	assign d[1] = out[1] ~^ out[0];
	assign d[2] = out[2] ~^ (out[1] | out[0]);
	assign d[3] = out[3] ~^ (out[2] | out[1] | out[0]);

	// inputs each bit of wire d to a D flip flop.
	// outputs of D flip flops are the bits of the output out.
	DFlipFlop dff0(.q(out[0]), .qBar(), .D(d[0]), .clk(clk), .rst(rst));
	DFlipFlop dff1(.q(out[1]), .qBar(), .D(d[1]), .clk(clk), .rst(rst));
	DFlipFlop dff2(.q(out[2]), .qBar(), .D(d[2]), .clk(clk), .rst(rst));
	DFlipFlop dff3(.q(out[3]), .qBar(), .D(d[3]), .clk(clk), .rst(rst));
endmodule

	/* truth table:
		15. 1 1 1 1 
		14. 1 1 1 0
		13. 1 1 0 1
		12. 1 1 0 0
		11. 1 0 1 1
		10. 1 0 1 0
		9.  1 0 0 1
		8.  1 0 0 0
		7.  0 1 1 1
		6.  0 1 1 0
		5.  0 1 0 1
		4.  0 1 0 0
		3.  0 0 1 1
		2.  0 0 1 0
		1.  0 0 0 1
		0.  0 0 0 0
	*/