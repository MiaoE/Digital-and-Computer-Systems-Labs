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

module de1soc_top 
(
    input logic CLOCK_50,
    output logic [6:0] HEX0,
    output logic [6:0] HEX1,
    output logic [6:0] HEX2,
    output logic [6:0] HEX3,
    output logic [6:0] HEX4,
    output logic [6:0] HEX5,

    input logic [3:0] KEY,
    output logic [9:0] LEDR,
    input logic [9:0] SW,
	
	input logic Clock,
	input logic Reset_B,
	input logic [1:0] Function,
	input logic [3:0] Data;
	output logic [7:0] ALUOut
);
	part2 p2(.Clock(Clock), .Reset_B(Reset_B), .Data(Data), .Function(Function), .ALUout(ALUout));	
	//part3 p3(.clock(Clock), .reset(Reset_B), ParallelLoadn, RotateRight, ASRight, Data IN, Q);
endmodule