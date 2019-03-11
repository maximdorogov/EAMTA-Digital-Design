module  counter #(parameter 1000MS = 32'd100_000_000, 500MS = 32'd50_000_000,
							 250MS = 32'd25_500_000,100MS = 32'd12_000_000)(
  			 input clk,
   			 input i_rst, 
   			 input i_enable,
   			 input [1:0] i_sel,
   			 output reg o_valid,    				 
  );
	
	/*localparam 1000MS = 32'd100_000_000;
	localparam 500MS = 32'd50_000_000;
	localparam 250MS = 32'd25_500_000;
	localparam 100MS = 32'd12_000_000;*/
	
	reg [31:0]compare;
	reg [31:0]counter;

	always @(posedge clk) begin
	
		case(i_sel)
				2'b00: compare = 1000MS;
				2'b01: compare = 500MS;
				2'b10: compare = 250MS;
				2'b11: compare = 100MS;
		endcase

	    if (i_rst) begin
	     
	      counter <= 32'd0;
	      compare <=  1000MS;
	      o_valid <= 1'b0; 
	          
	    end else begin
	    
	    if (o_valid) begin

	    	counter <= counter + 32'b1;

		    if(counter >= compare) begin
		          
		        counter <= 0;
		        o_valid <= 1; 
		          
		      end else begin
		      	o_valid <= 1'b0;
		      end   
		 	end
	    end else begin
	    	counter <= counter;
	    end 

	end
endmodule