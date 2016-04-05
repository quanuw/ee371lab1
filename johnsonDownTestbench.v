`include "clock.v"
`include "johnsonDown.v"
module johnsonDownTestbench();
	output reg reset;
	output wire clk;
	output wire [3:0] out;

	clock makeclk(.clk);
	johnsonDown counter(.clk, .reset, .signal(out));
	
	initial begin
		$display("\t\t reset \t clk \t out");
		$monitor("\t\t %b \t %b \t %b %b %b %b", reset, clk, out[3], out[2], out[1], out[0], $time);
	end 
	
	initial begin
		// Active low rst:
		// rst with rst = 0 and keep it
		// one for the rest of the time.
		reset <= 1'b1 ; @(posedge clk);
		reset <= 1'b0 ; @(posedge clk);
		reset <= 1'b1 ; @(posedge clk);
		repeat(32) @(posedge clk); // ascend once then descend once			
		$finish;
	end
	
	initial begin
		$dumpfile("johnsonDown_tb.vcd");
		$dumpvars;
	end
endmodule
			