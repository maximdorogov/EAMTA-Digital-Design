`timescale 1ns/100ps

module tb_top();
	
	reg [3:0] i_enable;
	reg CLK100MHZ;
	reg i_reset;
	wire [3:0] o_led_r;
	wire [3:0] o_leds;
      
   initial begin
		i_reset = 1'b1;
		i_enable = 3'b000;
		CLK100MHZ = 1'b1;
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
		i_enable = 3'b110;
		#120
		i_enable = 3'b110;
		#140
		i_enable = 3'b111;
		#160
		i_enable = 3'b111;
   end

   always #5 CLK100MHZ = ~CLK100MHZ;

top
  u_top
    (
     .i_enable	(i_enable[0]),
     .clock		(CLK100MHZ),
     .i_reset	(i_reset),
     .o_led_r	(o_led_r[0]),
     .o_leds	(o_leds)
     );

endmodule // tb_shiftleds
