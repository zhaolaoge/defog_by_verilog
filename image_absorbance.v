module image_absorbance(
	input	clk,
	input	nrst,
	input	hsync,
	input	vsync,
	input	en,
	input	[7:0]	in_data,
	output	o_hsync,
	output	o_vsync,
	output	o_en,
	output	[7:0]	out_data
);
localparam [15:0]	defog_factor = 16'd167;   //magnify 0.85 at 255 times 
localparam [15:0]	global_average_factor = 16'd26;
reg	[15:0]	t1,t2;
always@(posedge clk or negedge nrst)begin
	if(!nrst)begin
		t1	<=	16'd0;
		t2	<=	16'd0;
	end
	else begin
		t1	<=	16'd255 - ((defog_factor * in_data )>> 8);
		t2	<=	global_average_factor; 
	end
end
assign out_data	=	(t1 >= t2)	?	t1[7:0]:t2[7:0] ;

reg hsync_r,vsync_r,en_r;
always@(posedge clk or negedge nrst)begin
	if(!nrst)begin
		hsync_r	<=	1'b0;
		vsync_r	<=	1'b0;
		en_r	<=	1'b0;
	end
	else begin
		hsync_r	<=	hsync;
		vsync_r	<=	vsync;
		en_r	<=	en;
	end
end

assign o_hsync	=	hsync_r;
assign o_vsync	=	vsync_r;
assign o_en		=	en_r;

endmodule
		