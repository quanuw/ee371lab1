module RippleDownCounter_4bit(clk, rst, count);
	input clk, rst;
	output [3:0] count;
	
	DFlipFlop d0 (.q(count[0]), .qBar(), .D(~count[0]), .clk(clk), .rst(rst));
	DFlipFlop d1 (.q(count[1]), .qBar(), .D(~count[1]), .clk(count[0]), .rst(rst));
	DFlipFlop d2 (.q(count[2]), .qBar(), .D(~count[2]), .clk(count[1]), .rst(rst));
	DFlipFlop d3 (.q(count[3]), .qBar(), .D(~count[3]), .clk(count[2]), .rst(rst));
endmodule 

module DFlipFlop(q, qBar, D, clk, rst);
	input D, clk, rst;
	output q, qBar;
	reg q;
	not n1 (qBar, q);
	always@ (negedge rst or posedge clk)
	begin
	if(!rst)
	q = 0;
	else
	q = D;
	end
endmodule


module RippleDownCounter_4bit_testbench;
	reg clk, rst;
	wire [3:0] count;

	RippleDownCounter_4bit counter (clk, rst, count);
	
	parameter clk_PERIOD=10;
	initial clk=1;
	always begin
		#(clk_PERIOD/2);
		clk = ~clk;
	end 
	
	initial begin 
	$dumpfile("RippleDownCounter_4bit.vcd");
	$dumpvars(0, RippleDownCounter_4bit_testbench);
	
					@(posedge clk);
	rst <= 0;		@(posedge clk);
					@(posedge clk);
					@(posedge clk);
	rst = 1;		@(posedge clk);
					@(posedge clk);
					@(posedge clk);
					@(posedge clk);
					@(posedge clk);
					@(posedge clk);
					@(posedge clk);
					@(posedge clk);
					@(posedge clk);
					@(posedge clk);
					@(posedge clk);
					@(posedge clk);
					@(posedge clk);
					@(posedge clk);
					@(posedge clk);
					@(posedge clk);
					@(posedge clk);
					@(posedge clk);
	rst <= 0;		@(posedge clk);
					@(posedge clk);
					@(posedge clk);
	rst = 1;		@(posedge clk);
					@(posedge clk);
					@(posedge clk);
					@(posedge clk);
					@(posedge clk);
					@(posedge clk);
					@(posedge clk);
					@(posedge clk);
					@(posedge clk);
					@(posedge clk);
					@(posedge clk);
					@(posedge clk);
					@(posedge clk);
					@(posedge clk);
					@(posedge clk);
					@(posedge clk);
					@(posedge clk);
					@(posedge clk);
					@(posedge clk);
					@(posedge clk);
					@(posedge clk);
					@(posedge clk);
					@(posedge clk);
					@(posedge clk);
					@(posedge clk);
					@(posedge clk) $finish;
	end 
	
endmodule
