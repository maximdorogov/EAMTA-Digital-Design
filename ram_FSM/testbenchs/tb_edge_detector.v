//testbench para el detector de flanco

module tb_edge_detector (   
   /*no hay salidas ni entradas*/   
  );

//los testbench son autocontenidos. Tengo que crear un clock y un reset propios.

  reg clk, rst,sw; 
  wire enable;
  
  initial begin

    clk = 1'b0;
    rst = 1'b1;
    sw = 1'b0;
   	#40 
    //repeat(10) #40 rst  = ~rst ;    //1ns es una ud de tiempo para el Isim. 
    rst = 1'b0;
    #40 
    sw = 1'b1;
    #40
    sw = 1'b0;
    #40
    sw = 1'b1;
    #40
    sw = 1'b0;
    #40
    sw = 1'b1;

    
  end
always #10 clk = ~clk; // generate a clocK


  //Instancio el modulo a probar y hago las conexiones
  edge_detector DUT (

  	.clk(clk),
  	.i_rst(rst),
  	.i_sw(sw),
  	.o_enable(enable)
   
  );

 endmodule