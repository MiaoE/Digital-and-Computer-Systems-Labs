`timescale 1ns / 1ns // `timescale time_unit/time_precision

//SW[2:0] data inputs
//SW[9] select signals

//LEDR[0] output display

module v7404 (pin1, pin3, pin5, pin9, pin11, pin13, pin2, pin4, pin6, pin8, pin10, pin12);
    input logic pin1, pin3, pin5, pin9, pin11, pin13;
    output logic pin2, pin4, pin6, pin8, pin10, pin12;

    assign pin2 = ~pin1;
	 assign pin4 = ~pin3;
	 assign pin6 = ~pin5;
	 assign pin8 = ~pin9;
	 assign pin10 = ~pin11;
	 assign pin12 = ~pin13;
endmodule

module v7432(pin1, pin2, pin3, pin4, pin5, pin6, pin8, pin9, pin10, pin11, pin12, pin13);
	input logic pin1, pin2, pin4, pin5, pin9, pin10, pin12, pin13;
	output logic pin3, pin6, pin8, pin11;
	
	assign pin3 = pin1 | pin2;
	assign pin6 = pin4 | pin5;
	assign pin8 = pin9 | pin10;
	assign pin11 = pin12 | pin13;
endmodule

module v7408 (pin1, pin3, pin5, pin9, pin11, pin13, pin2, pin4, pin6, pin8, pin10, pin12);
	input logic pin1, pin2, pin4, pin5, pin9, pin10, pin12, pin13;
	output logic pin3, pin6, pin8, pin11;
	
	assign pin3 = pin1 & pin2;
	assign pin6 = pin4 & pin5;
	assign pin8 = pin9 & pin10;
	assign pin11 = pin12 & pin13;
endmodule

module mux2to1(x, y, s, m);
    input logic x; //select 0
    input logic y; //select 1
    input logic s; //select signal
    output logic m; //output
	logic out, z1, z2, inv;  //out = final ans; z1, z2 = output of first and second and gate respectively, inv = inverse of s
  
    //assign m = s & y | ~s & x;
    // OR
    v7404 not_gate(.pin1(s), .pin2(inv)); 
	v7408 and_gate(.pin1(x), .pin2(inv), .pin3(z1), .pin4(s), .pin5(y), .pin6(z2));
	v7432 or_gate(.pin1(z1), .pin2(z2), .pin3(out));
	assign m = out;

endmodule
