
module fir_filter #(parameter NB_COEFF = 10, NBF_COEFF = 8, OVER_SAMP = 8, N_BAUDS = 7, NB_COUNT = 3)(

	input clk, i_enable, i_valid, i_prbs, i_rst;

);

/*Declaro la matriz de coeficientes del filtro*/

wire signed [NB_COEFF-1:0] coeffs [(OVER_SAMP*N_BAUDS)-1:0]; // [Q_COLs] coeffs [Q_ROWs]
reg [N_BAUDS-1:0] shift_reg;
reg [ NB_COUNT-1:0]counter;

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

 always @(posedge clk) begin
  
    if (i_rst)
          
      counter <= {NB_COUNT{1'b0}}; 
          
    else 
     	if (i_enable) 

    		counter <= counter + 1'b1;
    	else
    		counter <= counter; 
          
 end

 generate
 	genvar ptr;
 	
 	for(ptr = 0; ptr < OVER_SAMP; ptr = ptr + 1) begin :adds // La herramienta de sintesis de xilinx requiere que se coloquen labels
 		
 		assign sample_add[ptr] = $signed((shift_reg[0])? -coeffs[ptr + (OVER_SAMP*0)]:coeffs[ptr + (OVER_SAMP*0)]) +   //Si shift_reg[0] es 1 ==> el result es negativo
 								 $signed((shift_reg[1])? -coeffs[ptr + (OVER_SAMP*1)]:coeffs[ptr + (OVER_SAMP*1)]) + 
 								 $signed((shift_reg[2])? -coeffs[ptr + (OVER_SAMP*2)]:coeffs[ptr + (OVER_SAMP*2)]) + 
 								 $signed((shift_reg[3])? -coeffs[ptr + (OVER_SAMP*3)]:coeffs[ptr + (OVER_SAMP*3)]) + 
 								 $signed((shift_reg[4])? -coeffs[ptr + (OVER_SAMP*4)]:coeffs[ptr + (OVER_SAMP*4)]) + 
 								 $signed((shift_reg[5])? -coeffs[ptr + (OVER_SAMP*5)]:coeffs[ptr + (OVER_SAMP*5)]) + 
 								 $signed((shift_reg[6])? -coeffs[ptr + (OVER_SAMP*6)]:coeffs[ptr + (OVER_SAMP*6)]) ; 		
 	end

 endgenerate

endmodule