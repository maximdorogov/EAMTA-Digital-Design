timescale 1ns/100ps

module tb_toptx();
	reg o_reset, clock;
	reg [3:0] i_enable;
	wire [3:0] o_leds;
	
	toptx
	(
		.i_reset(),
		.i_enable(),
		.clock(),
		.o_leds()
	);
	
	initial begin
		i_enable = 4'b0000;
		i_reset = 1'b0;
		
	
endmodule