module part2 #(parameter CLOCK_FREQUENCY = 500) (input logic ClockIn, Reset, input logic [1:0] Speed, output logic [3:0] CounterValue);
	logic en;
	RateDivider #(CLOCK_FREQUENCY) rd(ClockIn, Reset, Speed, en);
	DisplayCounter disp(ClockIn, Reset, en, CounterValue);
endmodule

module RateDivider #(parameter CLOCK_FREQUENCY = 500) (input logic ClockIn, Reset, input logic [1:0] Speed, output logic Enable);
	logic [$clog2(CLOCK_FREQUENCY) + 2:0] count;
	
	always_ff@(posedge ClockIn)
	begin
		if(Reset)
			count <= 1'b0;
		else if(count == 0) begin
			case(Speed)
				0: count <= 0;
				1: count <= CLOCK_FREQUENCY - 1;
				2: count <= CLOCK_FREQUENCY * 2 - 1;
				3: count <= CLOCK_FREQUENCY * 4 - 1;
			endcase
		end else
			count <= count - 1;
	end
	
	assign Enable = (count == 0)? 1:0;
endmodule

module DisplayCounter(input logic Clock, Reset, EnableDC, output logic [3:0] CounterValue);
always_ff@(posedge Clock)
begin
    if(Reset)
        CounterValue <= 4'b0000;
    else if (EnableDC && CounterValue == 4'b1111)
        CounterValue <= 4'b0000;
    else if (EnableDC)
        CounterValue <= CounterValue + 1;
end
endmodule