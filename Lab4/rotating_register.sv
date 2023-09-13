module sub(left, right, LoadRight, loadn, d, clock, reset, q);
	input logic left, right, LoadRight, loadn, d, clock, reset;
	output logic q;
	logic w;
	always_comb
	begin
		// Mux for which direction to rotate the input
		case(LoadRight)
		1'b0: w = left;
		1'b1: w = right;	
		default: ;
		endcase
		// Mux for whether to rotate
		case(loadn)
		1'b0: w = d;
		1'b1: w = w;	
		default: ;
		endcase
	end
	always_ff @(posedge clock)
	begin
		if (reset) q <= 0;
		else q <= w;
	end
endmodule

module rotating_register(clock, reset, ParallelLoadn, RotateRight, ASRight, Data_IN, Q);
	input logic clock, reset, ParallelLoadn, RotateRight, ASRight;
	input logic [3:0] Data_IN;
	output logic [3:0] Q;
	logic arrwire;
	always_comb
	begin
		case(ASRight)
		0:arrwire = Q[0]; // Still keep the wire on the left
		1:arrwire = Q[3]; // The first register now feeds into itself so that the most significant bit will be copied
		default: ;
		endcase
	end
	sub register1(Q[3], Q[1], RotateRight, ParallelLoadn, Data_IN[0], clock, reset, Q[0]); // 2^0
	sub register2(Q[0], Q[2], RotateRight, ParallelLoadn, Data_IN[1], clock, reset, Q[1]); // 2^1
	sub register3(Q[1], Q[3], RotateRight, ParallelLoadn, Data_IN[2], clock, reset, Q[2]); // 2^2
	sub register4(Q[2], arrwire, RotateRight, ParallelLoadn, Data_IN[3], clock, reset, Q[3]); // 2^3
	
endmodule