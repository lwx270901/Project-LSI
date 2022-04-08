module FSM(A, start, reset, f, clk);
	input reset, clk;
	input [7:0] A;
	input start;
	output reg f;
	
	parameter s1 = 4'b0001;
	parameter s2 = 4'b0010;
	parameter s3 = 4'b0100;
	parameter s4 = 4'b1000;
	
	wire [7:0] beg, e;
	reg [7:0] in;
	reg [7:0] max, min;
	reg [7:0] mid;
	reg [3:0] state, next_state;
	
	
	memory_block uut1(.address(0), .clock(clk), .q(beg));
	memory_block uut2(.address(31), .clock(clk), .q(e));
	
	
	always @ (posedge clk or posedge reset) begin
		if(reset) state <= s1;
		else state = next_state;
	end
	
	//next state
	always @ (*) begin
	case(state)
	s1 : if(start) next_state = s3;
	s2 : begin
		if(min <= max) next_state = s3;
		else next_state = s1;
		end
	s3 : begin
		if(mid == in) next_state = s4;
		else next_state = s2;
		end
	s4: begin
		if(~start) next_state = s1;
		end
	default: next_state = s2;
	endcase
	end
	
	//process
	always @ (posedge clk) begin
	case (state)
	s1 : begin
		min <= beg;
		max <= e;
		in <= A;
		f <= 0;
		end
	s2: begin
		if(mid > in) min <= mid+1;
		else max <= mid - 1;
		f <= 0;
		end
	s3 : begin
		mid <= (max + min)  >> 1 ;
		f <= 0;
		end
	s4: begin
		f <= 1;
		end
	default: begin
		in <= A;
		f <= 0;
		min <= beg;
		max <= e;
		end
	endcase
	end
endmodule
	