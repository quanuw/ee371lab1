module clock(output clk);
	reg clk;
	parameter CLOCK_PERIOD = 2; // gtkwave simulates in seconds
		initial begin
			clk=0;
			forever #(CLOCK_PERIOD / 2) clk = ~clk;
		end 
endmodule