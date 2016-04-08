// Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, the Altera Quartus II License Agreement,
// the Altera MegaCore Function License Agreement, or other 
// applicable license agreement, including, without limitation, 
// that your use is for the sole purpose of programming logic 
// devices manufactured by Altera and sold by Altera or its 
// authorized distributors.  Please refer to the applicable 
// agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 14.0.0 Build 200 06/17/2014 SJ Web Edition"
// CREATED		"Fri Apr 08 15:41:45 2016"

module counter4(
	clock,
	reset,
	out
);


input wire	clock;
input wire	reset;
output wire	[3:0] out;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_2;
reg	SYNTHESIZED_WIRE_18;
reg	SYNTHESIZED_WIRE_19;
reg	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
reg	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;

assign	SYNTHESIZED_WIRE_14 = 0;




always@(posedge clock or negedge reset or negedge SYNTHESIZED_WIRE_17)
begin
if (!reset)
	begin
	SYNTHESIZED_WIRE_21 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_17)
	begin
	SYNTHESIZED_WIRE_21 <= 1;
	end
else
	begin
	SYNTHESIZED_WIRE_21 <= SYNTHESIZED_WIRE_0;
	end
end


always@(posedge clock or negedge reset or negedge SYNTHESIZED_WIRE_17)
begin
if (!reset)
	begin
	SYNTHESIZED_WIRE_20 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_17)
	begin
	SYNTHESIZED_WIRE_20 <= 1;
	end
else
	begin
	SYNTHESIZED_WIRE_20 <= SYNTHESIZED_WIRE_2;
	end
end

assign	SYNTHESIZED_WIRE_4 = SYNTHESIZED_WIRE_18 | SYNTHESIZED_WIRE_19;

assign	SYNTHESIZED_WIRE_15 = SYNTHESIZED_WIRE_20 & SYNTHESIZED_WIRE_4;

assign	SYNTHESIZED_WIRE_16 = ~(SYNTHESIZED_WIRE_20 | SYNTHESIZED_WIRE_19 | SYNTHESIZED_WIRE_18);

assign	SYNTHESIZED_WIRE_0 = SYNTHESIZED_WIRE_5 | SYNTHESIZED_WIRE_6;

assign	SYNTHESIZED_WIRE_6 = ~(SYNTHESIZED_WIRE_21 | SYNTHESIZED_WIRE_18 | SYNTHESIZED_WIRE_20 | SYNTHESIZED_WIRE_19);

assign	SYNTHESIZED_WIRE_5 = SYNTHESIZED_WIRE_7 & SYNTHESIZED_WIRE_21;

assign	SYNTHESIZED_WIRE_7 = SYNTHESIZED_WIRE_18 | SYNTHESIZED_WIRE_20 | SYNTHESIZED_WIRE_19;



always@(posedge clock or negedge reset or negedge SYNTHESIZED_WIRE_17)
begin
if (!reset)
	begin
	SYNTHESIZED_WIRE_18 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_17)
	begin
	SYNTHESIZED_WIRE_18 <= 1;
	end
else
	begin
	SYNTHESIZED_WIRE_18 <= SYNTHESIZED_WIRE_8;
	end
end


always@(posedge clock or negedge reset or negedge SYNTHESIZED_WIRE_17)
begin
if (!reset)
	begin
	SYNTHESIZED_WIRE_19 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_17)
	begin
	SYNTHESIZED_WIRE_19 <= 1;
	end
else
	begin
	SYNTHESIZED_WIRE_19 <= SYNTHESIZED_WIRE_10;
	end
end

assign	SYNTHESIZED_WIRE_10 =  ~SYNTHESIZED_WIRE_19;

assign	SYNTHESIZED_WIRE_8 = SYNTHESIZED_WIRE_12 | SYNTHESIZED_WIRE_13;

assign	SYNTHESIZED_WIRE_17 =  ~SYNTHESIZED_WIRE_14;

assign	SYNTHESIZED_WIRE_12 = SYNTHESIZED_WIRE_18 & SYNTHESIZED_WIRE_19;

assign	SYNTHESIZED_WIRE_13 = ~(SYNTHESIZED_WIRE_19 | SYNTHESIZED_WIRE_18);

assign	SYNTHESIZED_WIRE_2 = SYNTHESIZED_WIRE_15 | SYNTHESIZED_WIRE_16;

assign out = {SYNTHESIZED_WIRE_18, SYNTHESIZED_WIRE_19, SYNTHESIZED_WIRE_20, SYNTHESIZED_WIRE_21};

endmodule
