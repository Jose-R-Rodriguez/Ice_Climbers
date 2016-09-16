module Plataform(
    input clk,
    output reg[9:0] plataform_start,
    output [9:0] plataform_end
    );
	 
	 parameter[4:0] height = 5'd30;
	 reg[19:0] cont;
	 
	 assign plataform_end = plataform_start + height;
	 
	 always @ (posedge clk)
	 begin
		if(cont < 840000)
			cont = cont + 1'b1;
		else
		begin
			cont = 20'b0;
			plataform_start = plataform_start + 1'b1;
		end
	 end
	 
	 initial
	 begin
		plataform_start = 10'd0;
		cont = 20'd0;
	 end


endmodule
