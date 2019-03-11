
module fir_filter #(parameter NB_COEFF = 10, NBF_COEFF = 8, OVER_SAMP = 8, N_BAUDS = 7)(

	input clk, i_enable, i_valid, i_prbs;

);

/*Declaro la matriz de coeficientes del filtro*/

wire signed [NB_COEFF-1:0] coeffs [(OVER_SAMP*N_BAUDS)-1:0];
reg [N_BAUDS-1:0] shift_reg;

`include "coeffs.v" 

always @(posedge clk) begin
	if (rst) begin
		
		shift_reg <= {N_BAUDS{1'b0}};
		
	end
	else if (i_enable && i_valid) begin

		shift_reg <= {shift_reg[N_BAUDS-2-:N_BAUDS-1],i_prbs}
		
	end else begin
		
		shift_reg <= shift_reg;

	end
end

endmodule