module get_plataform_y(
    input clk,
    output reg[9:0] plataform_start,
    output [9:0] plataform_end
    );
	 
	 parameter[4:0] height = 5'd30;
	 reg[19:0] cont_clk;
	 
	 assign plataform_end = plataform_start + height;
	 
	 always @ (posedge clk)
	 begin
		if(cont_clk < 840000)
			cont_clk = cont_clk + 1'b1;
		else
		begin
			cont_clk = 20'b0;
			plataform_start = plataform_start + 1'b1;
			if( plataform_start > 480)
				plataform_start = 1'b0;
		end
	 end
	 
	 initial
	 begin
		plataform_start = 10'd0;
		cont_clk = 20'd0;
	 end


endmodule