module hex_decoder(c, display);
	input logic [3:0] c;
	output logic [6:0] display;
	
	assign display[0]=(~c[3] & ~c[2]  & ~c[1] & c[0]) |(~c[3] & c[2] & ~c[1] & ~c[0]) |(c[3] & ~c[2] & c[1] & c[0]) |(c[3] & c[2] & ~c[1] & c[0]);
	assign display[1]=(~c[3] & c[2] & ~c[1] & c[0]) |(~c[3] & c[2] & c[1] & ~c[0]) |(c[3] & ~c[2] & c[1] & c[0]) |(c[3] & c[2] & ~c[1] & ~c[0]) |(c[3] & c[2] & c[1] & ~c[0]) |(c[3] & c[2] & c[1] & c[0]);
	assign display[2]=(~c[3] & ~c[2] & c[1] & ~c[0]) |(c[3] & c[2] & ~c[1] & ~c[0]) |(c[3] & c[2] & c[1] & ~c[0]) |(c[3] & c[2] & c[1] & c[0]);
	assign display[3]=(~c[3] & ~c[2] & ~c[1] & c[0]) |(~c[3] & c[2] & ~c[1] & ~c[0]) |(~c[3] & c[2] & c[1] & c[0]) |(c[3] & ~c[2] & c[1] & ~c[0]) |(c[3] & c[2] & c[1] & c[0]);
	assign display[4]=(~c[3] & ~c[2] & ~c[1] & c[0]) |(~c[3] & ~c[2] & c[1] & c[0]) |(~c[3] & c[2] & ~c[1] & ~c[0]) |(~c[3] & c[2] & ~c[1] & c[0]) |(~c[3] & c[2] & c[1] & c[0]) |(c[3] & ~c[2] & ~c[1] & c[0]);
	assign display[5]=(~c[3] & ~c[2] & ~c[1] & c[0]) |(~c[3] & ~c[2] & c[1] & ~c[0]) |(~c[3] & ~c[2] & c[1] & c[0]) |(~c[3] & c[2] & c[1] & c[0]) |(c[3] & c[2] & ~c[1] & c[0]);
	assign display[6]=(~c[3] & ~c[2] & ~c[1] & ~c[0]) |(~c[3] & ~c[2] & ~c[1] & c[0]) |(~c[3] & c[2] & c[1] & c[0]) |(c[3] & c[2] & ~c[1] & ~c[0]);

endmodule 

module sequential_ALU(KEY, SW, HEX0, HEX4, HEX5, LEDR); // tester module
	input logic [1:0] KEY;
	input logic [9:0] SW;
	output logic [6:0] HEX0, HEX4, HEX5;
	output logic [7:0] LEDR;
	logic [7:0] output;
	
	part2 test1(.Clock(KEY[0]), .Reset_b(KEY[1]), .Data(SW[3:0]), .Function(SW[9:8]), .ALUout(output));
	hex_decoder(SW[3:0], HEX0);
	hex_decoder(output[7:4], HEX5);
	hex_decoder(output[3:0], HEX4);
	assign LEDR = output;
endmodule