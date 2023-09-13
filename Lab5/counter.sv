module counter(input logic Clock, Enable, Reset, output logic [7:0] CounterValue);
	logic [7:1] S;
	assign S[1] = Enable & CounterValue[0];
	assign S[2] = S[1] & CounterValue[1];
	assign S[3] = S[2] & CounterValue[2];
	assign S[4] = S[3] & CounterValue[3];
	assign S[5] = S[4] & CounterValue[4];
	assign S[6] = S[5] & CounterValue[5];
	assign S[7] = S[6] & CounterValue[6];
	
	tog_ff t0(Clock, Enable, Reset, CounterValue[0]);
	tog_ff t1(Clock, S[1], Reset, CounterValue[1]);
	tog_ff t2(Clock, S[2], Reset, CounterValue[2]);
	tog_ff t3(Clock, S[3], Reset, CounterValue[3]);
	tog_ff t4(Clock, S[4], Reset, CounterValue[4]);
	tog_ff t5(Clock, S[5], Reset, CounterValue[5]);
	tog_ff t6(Clock, S[6], Reset, CounterValue[6]);
	tog_ff t7(Clock, S[7], Reset, CounterValue[7]);
endmodule

module tog_ff(input logic Clock, T, Reset, output logic Q);
	always_ff@(posedge Clock)
	begin
		if(Reset) Q <= 0;  // Reset
		else Q <= T ^ Q;  // XOR operation
	end
endmodule