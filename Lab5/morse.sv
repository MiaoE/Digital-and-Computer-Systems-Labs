module part3 #(parameter CLOCK_FREQUENCY = 500) (input logic ClockIn, Reset, Start, input logic [2:0] Letter, output logic DotDashOut, NewBitOut);
	logic [11:0] code;
	
	always_ff@(posedge ClockIn)
	begin
		if(Reset) code = 12'b000000000000;
		else if(Start) begin
			case(Letter)
			0 : code = 12'b101110000000;
			1 : code = 12'b111010101000;
			2 : code = 12'b111010111010;
			3 : code = 12'b111010100000;
			4 : code = 12'b100000000000;
			5 : code = 12'b101011101000;
			6 : code = 12'b111011101000;
			7 : code = 12'b101010100000;
			endcase
		end
	end
	
	RateDivider #(CLOCK_FREQUENCY) rate(ClockIn, Start, Reset, NewBitOut);
	encode_morse test(code, ClockIn, NewBitOut, Reset, DotDashOut);
endmodule

module RateDivider #(parameter CLOCK_FREQUENCY = 500) (input logic ClockIn, Start, Reset, output logic Enable);
	logic [$clog2(CLOCK_FREQUENCY)-1:0] count;
	logic started;
	
	always_ff@(posedge ClockIn)
	begin
		if(Reset) begin
			count <= 1'b1;
			started <= 0;
		end
		else if(Start && started == 0) begin 
			count <= CLOCK_FREQUENCY / 2 - 1;
			started = 1;
		end
		else if(started) begin
			if(count > 0)
				count <= count - 1;
			else
				count <= CLOCK_FREQUENCY / 2 - 1;
		end
	end
	
	assign Enable = (count == 0 && started)? 1:0;
endmodule

module encode_morse(input logic [11:0] code, input logic clk, enable, Reset, output logic DotDashOut);
	logic [3:0] ind;
	always_ff@(posedge clk)
	begin
		if(Reset) begin
			ind <= 11;
			DotDashOut <= 0;
		end
	end
	
	always_ff@(posedge enable)
	begin
		DotDashOut <= code[ind];
		if(ind == 0)
			ind <= 11;
		else
			ind <= ind - 1;
	end
endmodule