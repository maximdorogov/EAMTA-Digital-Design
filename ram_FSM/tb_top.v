`timescale 1ns/100ps

module tb_top();
	
	wire [3:0] i_enable;
	wire CLK100MHZ;
	wire i_reset;
	wire [3:0] o_led_r;
	wire [3:0] o_leds
      
   initial begin
		i_reset = 1'b1;
		i_enable = 3'b000;
		CLK100MHZ = 1'b'1;
		#5
		CLK100MHZ = ~CLK100MHZ;
		#10
		CLK100MHZ = ~CLK100MHZ;
		#15
		CLK100MHZ = ~CLK100MHZ;
		#20
		CLK100MHZ = ~CLK100MHZ;
		i_reset = 1'b0;
		#40
		i_reset = 1'b1;
		#100
		i_enable = 3'111;
		#120
		i_enable = 3'b110;
   end

   always #5 CLK100MHZ = ~CLK100MHZ;

top
  u_top
    (
     .i_enable	(i_enable[0]),
     .clock		(CLK100MHZ),
     .i_reset	(i_reset),
     .o_led_r	(o_led_r),
     .o_leds	(o_leds),
     );

endmodule // tb_shiftleds
