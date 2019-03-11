module top(input i_reset,
			input i_enb,
			input clock
			)
			
	prbs
		u_prbs#(parameter NB = 9,
			  parameter SEED = 9'h1AA,
			  parameter HIGH = 9,
			  parameter LOW = 5
			 )
			(
			.o_data(),
			.i_reset(),
			.i_valid(),
			.clock(),
			.i_enable()
			);
		
	fir
		u_fir(
		);
		
	counter
		u_counter(
		);
		
	always@(posedge clock) begin
		
	end

endmodule