module johnsonDown(input clk, input reset, output [3:0] signal);
	reg [3:0] temp;
	always @ (posedge clk) begin
		if (reset) begin
			temp <= 4'b0;
		end else if (signal[0]) begin
			temp <= {1'b0, signal[3:1]};
		end else begin
			temp <= {1'b1, signal[3:1]};	
		end	
	end
	assign signal = temp;
endmodule
			