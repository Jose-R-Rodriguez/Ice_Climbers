module main(
    input clk50mhz,
    input reset,
    output [2:0] rgb,
    output hsync,
    output vsync
    );

	reg vga_clk;
	
	wire[9:0] plataform_start;
	wire[9:0] plataform_end;
	wire[9:0] hole_start;
	wire[9:0] hole_end;
	
	// synthesis attribute CLKFX_DIVIDE of vga_clock_dcm is 4
	// synthesis attribute CLKFX_MULTIPLY of vga_clock_dcm is 2
	//DCM_SP#(.CLKFX_DIVIDE(4), .CLKFX_MULTIPLY(2)) vga_clock_dcm (.CLKIN(clk50mhz), .CLKFX(vga_clk));
	
	always @ (posedge clk50mhz)
		vga_clk = !vga_clk;
		
	get_plataform_y get_pos( vga_clk, plataform_start, plataform_end);
	get_plataform_hole get_hole( vga_clk, hole_start, hole_end);

	vga_logic vga (
		.clk(vga_clk),
		.reset(reset),
		.plataform_start(plataform_start),
		.plataform_end(plataform_end),
		.hole_start(hole_start),
		.hole_end(hole_end),
		.hsync(hsync),
		.vsync(vsync),
		.rgb(rgb)
    );
	 
endmodule