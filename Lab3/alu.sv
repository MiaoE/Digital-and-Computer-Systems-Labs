module mux2to1(input logic a, b, s, output logic out);
    assign out = s&a | ~s&b;
endmodule

module one_bit_adder(a, b, c_in, s, c_out);
    input logic a, b, c_in;
    output logic s, c_out;
    logic w;
    assign w = a ^ b ^ c_in;
    mux2to1 p1(.a(b), .b(c_in), .s(w), .out(c_out));
endmodule

module four_bit_adder(a, b, c_in, s, c_out);
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

module part2(A, B, Function, ALUOut);
    input logic [3:0] A;
    input logic [3:0] B;
    input logic [1:0] Function;
    output logic [7:0] ALUOut; // signal set by always_comb block
    logic [7:0] w;
    four_bit_adder adder(.a(A), .b(B), .c_in(0), .s(w));
    
    always_comb // declare always_comb block
    begin
        case(Function)
        2'b00: ALUOut = w;
        2'b01: ALUOut = |A | |B;
        2'b10: ALUOut = &A & &B; 
        2'b11: ALUOut = {A[3:0], B[3:0]};
        default : ALUOut = 0;
        endcase
    end
endmodule