`include "DFlipFlop.v"
module syncDownCounter(clk, rst, out);
	input clk;
	input rst;
	output [3:0] out;
	wire [3:0] d;

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
	
	assign d[0] = ~out[0];
	assign d[1] = out[1] ~^ out[0];
	assign d[2] = out[2] ~^ (out[1] | out[0]);
	assign d[3] = out[3] ~^ (out[2] | out[1] | out[0]);

	DFlipFlop dff0(.q(out[0]), .qBar(), .D(d[0]), .clk, .rst);
	DFlipFlop dff1(.q(out[1]), .qBar(), .D(d[1]), .clk, .rst);
	DFlipFlop dff2(.q(out[2]), .qBar(), .D(d[2]), .clk, .rst);
	DFlipFlop dff3(.q(out[3]), .qBar(), .D(d[3]), .clk, .rst);
endmodule

module syncDownCounter_tb();
	wire clk, rst;
	wire[3:0] out;

	syncDownCounter sd_counter(.clk, .rst, .out);
	sd_counter_tester tester(.out, .clk, .rst);

	initial begin
		$dumpfile("syncDownCounter_tb.vcd");
		$dumpvars;
	end
endmodule

module sd_counter_tester(rst, clk, out);
	output reg rst, clk;
	input [3:0] out;

	parameter CLOCK_PERIOD = 2; //gtkwave simulates in seconds
	initial begin
		clk=0;
		forever #(CLOCK_PERIOD / 2) clk = ~clk;
	end 
	initial begin
		$display("\t\t rst \t clk \t out");
		$monitor("\t\t %b \t %b \t %b %b %b %b", rst, clk, out[3], out[2], out[1], out[0], $time);
	end 
	
	initial begin
		// Active low rst:
		// rst with rst = 0 and keep it
		// one for the rest of the time.
		rst <= 1'b1 ; @(posedge clk);
		rst <= 1'b0 ; @(posedge clk);
		rst <= 1'b1 ; @(posedge clk);
		repeat(32) @(posedge clk); // ascend once then descend once			
		$finish;
	end
endmodule