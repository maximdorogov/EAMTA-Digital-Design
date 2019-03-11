
`define N_LEDS 4
`define NB_SW 4

`timescale 1ns/100ps

module top_level_leds_tb (   
   /*no hay salidas ni entradas*/   
  );

	parameter N_LEDS = `N_LEDS;

	wire [N_LEDS - 1:0] o_led;
	wire [NB_SW - 1:0] i_sw;
	reg ck_rst;
	reg CLK100MHZ;


  initial begin
    clk = 1'b0;
    rst = 1'b1;
    repeat(4) #20 clk = ~clk;    //1ns es una ud de tiempo para el Isim. 
    rst = 1'b0;
    forever #20 clk = ~clk; // generate a clocK 
  end