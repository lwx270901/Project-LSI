module datapath(A, start, reset, found, clk, L);
	input clk, reset, start;
	input [7:0] A;
	output found;
	output wire [4:0] L;
	
	reg [4:0] countadd;
	
	FSM uut(.A(A), .start(start), .reset(reset), .f(found), .clk(clk));
	always @ (posedge clk or posedge reset) begin
		if(reset) countadd <= 31;
		else countadd <= countadd >>1 ;
	end
	
	assign L = found == 1? countadd : 5'bxxxxx;
	
	
	
	
endmodule 