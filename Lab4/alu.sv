module alu(Clock, Reset_b, Data, Function, ALUout);
	input logic Clock, Reset_b;
	input logic [3:0] Data;
	input logic [1:0] Function;
	output logic [7:0] ALUout;
	
	logic [7:0] q;
	
	always_comb
	begin
        case(Function)
        0: q = ALUout[3:0] + Data;
        1: q = ALUout[3:0] * Data;
        2: q = ALUout[3:0] << Data; 
        default: q = {4'b0000, ALUout[3:0]};
        endcase
    end
	
	always_ff @(posedge Clock)
	begin
		if (Reset_b) ALUout <= 8'b00000000;
		else ALUout <= q;
	end
endmodule

