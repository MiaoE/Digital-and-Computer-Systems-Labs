module part0(MuxSelect , MuxIn , Out);
	input logic [6:0] MuxIn;
	input logic [2:0] MuxSelect;
	output logic Out; // signal set by always_comb block
	always_comb // declare always_comb block
	begin
		case (MuxSelect) // start case statement
			3’b000: Out = MuxIn [0]; // Case 0
			3’b001: Out = MuxIn [1]; // Case 1
			3’b010: Out = MuxIn [2]; // Case 2
			3’b011: Out = MuxIn [3]; // Case 3
			3’b100: Out = MuxIn [4]; // Case 4
			3’b101: Out = MuxIn [5]; // Case 5
			3’b110: Out = MuxIn [6]; // Case 6
			default: Out = MuxIn [0]; // Default case
		endcase
	end
endmodule

module mux2to1(input logic a, b, s, output logic out);
    assign out = s&a | ~s&b;
endmodule

module one_bit_adder(a, b, c_in, s, c_out);
    input logic a, b, c_in;
    output logic s, c_out;
    assign s = a ^ b ^ c_in;
    mux2to1 p1(.a(b), .b(c_in), .s(s), .out(c_out));
endmodule

module part1(a, b, c_in, s, c_out);
    input logic [3:0] a;
    input logic [3:0] b;
    input logic c_in;
    output logic [3:0] s;
    output logic [3:0] c_out;
	one_bit_adder add(.a(a[i]), .b(b[i]), .c_in(c_in), .s(s[i]), .c_out(c_out[0]));
    generate
        for (i = 1; i < 4; i = i + 1) begin : for_loop
            one_bit_adder adder(.a(a[i]), .b(b[i]), .c_in(c_out[i - 1]), .s(s[i]), .c_out(c_out[i]));
        end
    endgenerate
    assign c_out = c_in;
endmodule

	
	