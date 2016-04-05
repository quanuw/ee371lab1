`include "DFlipFlop.v"

module syncDownCounter_gl(clk, rst, out);
	input clk, rst;
	wire [3:0] d;
	output[3:0] out;
	output wire orOut1, orOut2;


	not firstBit(d[0], out[0]);
	xnor secondBit(d[1], out[1], out[0]);
	or orOne(orOut1, out[1], out[0]);
	xnor thirdBit(d[2], out[2], (out[1] | out[0]));
	or orOut2(orOut2, out[2], out[1], out[0]);
	xnor fourthBit(d[3], out[3], (out[2] | out[1] | out[0]));

	DFlipFlop dff0(.q(out[0]), .qBar(), .D(d[0]), .clk, .rst);
	DFlipFlop dff1(.q(out[1]), .qBar(), .D(d[1]), .clk, .rst);
	DFlipFlop dff2(.q(out[2]), .qBar(), .D(d[2]), .clk, .rst);
	DFlipFlop dff3(.q(out[3]), .qBar(), .D(d[3]), .clk, .rst);
endmodule

module syncDownCounter_gl_tb();
	wire  clk, rst;
	wire [3:0] out;
	
	syncDownCounter_gl syncDownCounter_gl(.clk, .rst, .out);
	syncDownCounter_gl_tester tester(.out, .clk, .rst);
	
	initial begin
		$dumpfile("syncDownCounter_gl_tb.vcd");
		$dumpvars;
	end
	
endmodule 

module syncDownCounter_gl_tester(out, clk, rst);
	input[3:0] out;
	output clk, rst;
	reg clk, rst;
	
	parameter CLOCK_PERIOD = 2;
	initial begin
		clk=1;
		forever #(CLOCK_PERIOD/2) clk = ~clk;
	end 
	
	initial begin
		$display("\t\t rst \t clk \t bit");
		$monitor("\t\t %b \t %b \t %b %b %b %b", rst, clk, out[3], out[2], out[1], out[0], $time);
	end 
	
	initial begin
		// Active low reset:
		// Reset with rst = 0 and keep it
		// one for the rest of the time.
		rst <= 1'b1 ; @(posedge clk);
		rst <= 1'b0 ; @(posedge clk);
		rst <= 1'b1 ; @(posedge clk);
		repeat(10) @(posedge clk);
		$finish;
	end
	
endmodule 

