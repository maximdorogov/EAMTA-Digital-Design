// testbench para el modulo counter implementardo en la 1er clase EAMTA2019


module tb_counter (   
   /*no hay salidas ni entradas*/   
  );

  reg clk, rst; 
  wire clk_out;

  initial begin
    clk = 1'b0;
    rst = 1'b1;
    repeat(4) #20 clk = ~clk;    //1ns es una ud de tiempo para el Isim. 
    rst = 1'b0;
    forever #20 clk = ~clk; // generate a clocK 
  end

clk_divider #(.NBITS(3)) DUT (

		.i_clk(clk),  // clock
    	.i_rst(rst),  // reset
    	.o_clk(clk_out)

);


endmodule