//testbench para la maquina de estados

module tb_FSM (   
   /*no hay salidas ni entradas*/   
  );

  //los testbench son autocontenidos. Tengo que crear un clock y un reset propios.

  reg clk, rst, i_write_full,edge_signal; 
  wire write_ena,full_mem_indicator;
  
  initial begin

    clk = 1'b0;
    rst = 1'b1;
   	#40 
   	i_write_full = 1'b0;
    edge_signal = 1'b0;
    //repeat(4) #10 clk = ~clk;    //1ns es una ud de tiempo para el Isim. 
    rst = 1'b0;
    edge_signal = 1'b1;
    #100 i_write_full = 1'b1;
    
  end
always #10 clk = ~clk; // generate a clocK


  //Instancio el modulo a probar y hago las conexiones
  FSM DUT (

  	.clk(clk),
  	.i_rst(rst),
  	.i_write_full(i_write_full),
  	.edge_detector(edge_signal),
  	.full_mem_indicator(full_mem_indicator),
  	.o_write_ena(write_ena)
   
  );

 endmodule