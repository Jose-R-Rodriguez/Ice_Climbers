module get_plataform_hole(
    input clk,
    output reg[9:0] hole_start,
    output [9:0] hole_end
    );
	 
	 parameter[4:0] width = 5'd30;
	 reg[19:0] cont_clk;
	 
	 reg direccion;
	 
	 assign hole_end = hole_start + width;
	 
	 always @ (posedge clk)
	 begin
		if(cont_clk < 840000)
			cont_clk = cont_clk + 1'b1;
		else
		begin
			cont_clk = 20'b0;
			hole_start = (direccion)?(hole_start + 2'd3):(hole_start - 2'd3);;
			if( hole_end > 640)
				direccion = 0;
			else if( hole_start <= 0)
				direccion = 1;
		end
	 end
	 
	 initial
	 begin
		hole_start = 10'd0;
		cont_clk = 20'd0;
		direccion = 1;
	 end


endmodule
