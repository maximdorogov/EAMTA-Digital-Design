


module top_level_leds /*#(parameter F_CLK_OUT = 1, F_CLK_IN = 50_000_000)*/ (
    input clk,  // clock
    input i_rst,  // reset
    input [3:0] i_sw, 
    output [3:0] o_led,
    output [3:0] o_ledR,
    output [3:0] o_ledG
  );

  counter  u_counter(
  			   .clk(clk),
   			   .i_rst(i_rst), 
   			   .i_enable(),
   			   .i_sel(),
   			   .o_valid()     				 
  );

  shift_reg u_shift_reg(

  				.rst(),
  				.clk(),
  				.i_valid(),
  				.o_data()
  				);
endmodule