`timescale 1ns / 1ns


module tb;
	reg clock;
	reg reset;
	reg start;
	reg[7:0] data_in;
	wire [4:0] L;
	wire found;
	
	datapath uut(.A(data_in), .start(start), .reset(resset), .found(found), .clk(clock), .L(L));
	
	always #5 clock = !clock;
	initial begin
	clock = 0; reset = 0; start = 0; data_in = 0;
	#4 reset = 1;
	#2 reset = 0;
		data_in = 8'b00001111;
		#14 start = 0;
		#10 start = 1;
		#500 $stop;
	end
endmodule 