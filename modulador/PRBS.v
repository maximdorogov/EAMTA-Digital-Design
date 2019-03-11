

module PRBS #(parameter NB = 9, 
		      parameter SEED = 9'h1AA)
	
	output o_data,
	input i_reset, i_valid, clock, i_enable);

reg [NB-1:0] shift_reg;

always @(posedge clk) begin
	if (i_reset) begin
		
		shift_reg <= SEED;
		
	end
	else if () begin
		
	end
end

endmodule