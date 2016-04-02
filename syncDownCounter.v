`include "DFlipFlop.v"
module syncDownCounter(clk, rst, enable, out);
	input clk;
	input rst;
	input enable;
	output [3:0] out;
	reg  [3:0] out;

	always @(posedge clk) // registers
		if (rst == 1'b0)  begin
			out <= 4'b1111;
		end else if (enable == 1'b1) begin
			out <= out - 1'b1;
		end
endmodule
