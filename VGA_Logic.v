module VGA_Logic(
    input clk,
	 input reset,
    output reg hsync,
    output reg vsync,
    output reg [2:0] rgb
    );

	reg[9:0] hcount;
	reg[9:0] vcount;
	
	wire[9:0] plataform_start;
	wire[9:0] plataform_end;
	
	Plataform get_pos( clk, plataform_start, plataform_end);
	
	always @ (posedge clk)
	begin
		if(reset)
			{hcount, vcount, rgb} = {10'd0, 10'd0, 3'b0};
		else
		begin
			if(hcount == 799)
			begin
				hcount = 0;
				if(vcount == 524)
					vcount = 0;
				else
					vcount = vcount + 1'b1;
			end
			else
				hcount = hcount + 1'b1;
		end
		
		if(vcount >= 490 && vcount < 492)
			vsync = 0;
		else
			vsync = 1;
			
		if(hcount >= 656 && hcount < 752)
			hsync = 0;
		else
			hsync = 1;
			
		if(hcount < 640 && vcount < 480)
			begin
			if(vcount >= plataform_start && vcount < plataform_end )
				rgb = 3'b100;
			else
				rgb = 3'b011;
			end
		else
			rgb = 3'b000;
	end


endmodule
