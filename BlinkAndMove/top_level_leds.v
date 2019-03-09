


module top_level_leds /*#(parameter F_CLK_OUT = 1, F_CLK_IN = 50_000_000)*/ (
    input clk,  // clock
    input i_rst,  // reset
    input [3:0] i_sw, 
    output [3:0] o_led,
    output [3:0] o_ledR,
    output [3:0] o_ledG
  );

  wire valid;
  wire [3:0] dataLed;

  assign o_led = dataLed;

  assign o_ledR = (i_sw[3])?dataLed:4'd0;

  counter  u_counter(
  			   .clk(clk),
   			   .i_rst(i_rst), 
   			   .i_enable(i_sw[0]),
   			   .i_sel(i_sw[2:1]),
   			   .o_valid(valid)     				 
  );

  shift_reg u_shift_reg(

  				.i_rst(i_rst),
  				.clk(clk),
  				.i_valid(valid),
  				.o_data(dataLed)
  				);
endmodule