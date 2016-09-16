module VGA_main(
    input clk50mhz,
    input reset,
    output [2:0] rgb,
    output hsync,
    output vsync
    );

	reg vga_clk;
	
	// synthesis attribute CLKFX_DIVIDE of vga_clock_dcm is 4
	// synthesis attribute CLKFX_MULTIPLY of vga_clock_dcm is 2
	//DCM_SP#(.CLKFX_DIVIDE(4), .CLKFX_MULTIPLY(2)) vga_clock_dcm (.CLKIN(clk50mhz), .CLKFX(vga_clk));
	
	always @ (posedge clk50mhz)
		vga_clk = !vga_clk;

	VGA_Logic vga_logic (
		.clk(vga_clk),
		.reset(reset),
		.hsync(hsync),
		.vsync(vsync),
		.rgb(rgb)
    );
	 
endmodule
