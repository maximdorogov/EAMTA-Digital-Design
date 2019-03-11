// testbench para el modulo counter implementardo en la 1er clase EAMTA2019


module tb_counter (   
   /*no hay salidas ni entradas*/   
  );

  reg clk, rst; 
	
  initial begin
    clk = 1'b0;
    rst = 1'b1;
    repeat(4) #20 clk = ~clk;    //1ns es una ud de tiempo para el Isim. 
    rst = 1'b0;
    forever #20 clk = ~clk; // generate a clocK 
  end


counter #(.1000MS(10), .500MS(5), .250MS(3)), .100MS(2)) DUT (
  			.clk(clk),
   			.i_rst(rst), 
   			.i_enable(),
   			.i_sel(),
   			.o_valid(),    				 
);

endmodule