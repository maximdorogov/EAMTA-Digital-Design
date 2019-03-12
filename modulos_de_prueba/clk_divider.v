/*This module slows down the main clock

receive as parameter the output frequency

and the output clock frequency

*/

module clk_divider #(parameter NBITS  = 3) (
    input i_clk,  // clock
    input i_rst,  // reset
    output o_clk
  );
    
  reg aux_clk_out;
  reg [NBITS-1:0] counter;
  
  assign o_clk = aux_clk_out;
  
  always @(posedge i_clk) begin
  
    if (i_rst) begin
          
      aux_clk_out <= 0;
      counter <= {NBITS{1'b0}}; 
          
    end else begin
      
      counter <= counter + 1'b1; 
      
      if(!counter) begin
          
        counter <= 0;
        aux_clk_out <= ~aux_clk_out;  
          
      end      
    end
  end
  
endmodule
