module Plataform(
    input clk,
    output reg[9:0] plataform_start,
    output [9:0] plataform_end,
	 output reg[9:0] hole_start,
    output [9:0] hole_end
    );
	 
	 parameter[4:0] height = 5'd30;
	 reg[19:0] cont_clk;
	 reg[9:0] cont_y;
	 
	 assign plataform_end = plataform_start + height;
	 
	 always @ (posedge clk)
	 begin
		if(cont_clk < 840000)
			cont_clk = cont_clk + 1'b1;
		else
		begin
			cont_clk = 20'b0;
			cont_y = cont_y + 1'b1;
			plataform_start = plataform_start + 1'b1;
			if( cont_y > 480)
			begin
				plataform_start = 1'b0;
				cont_y = 1'b0;
			end
		end
	 end
	 
	 initial
	 begin
		plataform_start = 10'd0;
		cont_clk = 20'd0;
		cont_y = 10'd0;
	 end


endmodule
