module top#(
			parameter MAX_COUNT = 2047
			)
			(
			input [3:0] i_enable,
			input clock,
			input i_reset,
			output o_led_r,
			output o_leds
			);
	/**
		Señales
	*/	
	reg [COUNT_WIDTH-1 : 0] countR;
	reg [COUNT_WIDTH-1 : 0] countW;
				
	wire write_enable;
	wire read_enable;
	wire [10:0] fir_out;
	wire bram_full;
	wire pulso_countW_max;
	/**
		Instancias
	*/
	top_tx
		inst_top_tx#(
					.NB_COUNT(3)
					)
				   (
				   .i_reset(i_reset),
				   .i_enable(i_enable),
				   .clock(clock),
				   .o_leds(o_leds),
				   .fir_out(fir_out)
				   );
	bram
		inst_bram#(
				   .NB_ADDR(15),
				   .NB_DATA(14),
				   .INIT_FILE("RAM_INIT.txt"
				   )
				   (
				   .o_data(),
				   .i_data(),
				   .i_write_addr(countW),
				   .i_read_addr(countR),
				   .i_read_enable(1'b1),
				   .i_write_enable(write_enable),
				   .clock(clock)
				   );
		
	FSM
		inst_fsm#()
				(
				.clk(clock),
				.i_rst(i_reset),
				.i_write_full(pulso_countW_max),
				.edge_detector(pulso_inicial),
				.full_mem_indicator(bram_full),
				.o_write_ena(write_enable)
				);
	
	assign o_led_r = bram_full;
	assign pulso_countW_max <= (contW == MAX-1)? 1 : 0;
	/**
		Detector de flanco
	*/
	reg val_anterior;
	reg pulso_inicial;
	always@(posedge clock)begin
		if(i_enable[3])begin
			if(val_anterior == 0)begin
				val_anterior <= 1'b1;
				pulso_inicial <= 1'b1;
			end else
				val_anterior <= 1'b1;
				pulso_inicial <= 1'b0;
			end
		end else
			val_anterior <= 1'b0;
			pulso_inicial <= 1'b0;
		end
	end
	//cuando llegue a cuenta-1 tiene que mandar un pulsito
	/**
		Contador Write
	*/
	always@(posedge clock)begin:contW
		if(i_enable[3] && write_enable)begin
				countW <= countW + 1'b1;				
			else begin
				countW <= countW;
			end
		else
			countW <= countW;
		end
	end
	/**
		Contador Read
	*/
	always@(posedge clock)being:contR
		if(i_enable[0])begin
			countR <= countR + 1'b1;
		else
			countR <= countR;
		end
	end
				
endmodule