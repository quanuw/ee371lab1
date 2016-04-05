`include "syncDownCounter.v"

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