`timescale 1ns/100ps

module tb_top();

	wire [3:0] o_leds;
	reg [3:0] i_enable;
	reg i_reset,clock;

	top   u_top 
	    	(.i_reset(i_reset),
	    	 .i_enable(i_enable),
	    	 .clock(clock),
	    	 .o_leds(o_leds)			
	    	);

	initial begin
		
		i_enable = 4'b0000;
		i_reset = 1'b0;
		clock = 1'b1;

		#2000 i_reset = 1'b1;
		#2000 i_enable = 4'b1111;
		#100000 $finish;
	end  

	always #5 clock = ~clock;
endmodule	