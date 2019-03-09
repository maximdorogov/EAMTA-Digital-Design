/*Shif register de 4 posiciones*/

module  shift_reg(
  			 input clk,
   			 input i_rst, 
   			 input  i_valid,
   			 output reg [3:0] o_data    				 
  );

	always @(posedge clk) begin
		if (rst) begin
			
			o_data <= 4'b0001;
			
		end
		else if (i_valid == 1'b1) begin

		/*	o_data <= o_data >> 1;

			o_data[3] <= o_data[0];  */
			
			o_data <= {o_data[0],o_data[3:1]}

		end else begin
			
			o_data <= o_data;

		end
	end



endmodule