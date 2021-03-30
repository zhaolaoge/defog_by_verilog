module dark_channel(
	input	clk,
	input	nrst,
	input	[7:0]	r,
	input	[7:0]	g,
	input	[7:0]	b,
	input	hsync,
	input	vsync,
	input	en,
	input frame_done_flag,
	output	[7:0]	dark,
	output	o_hsync,
	output	o_vsync,
	output	o_en,
	output reg[7:0] max_of_dark
);
reg	[7:0]	r_r,g_r,b_r;
always@(posedge clk or negedge nrst)begin
	if(!nrst)begin
		r_r	<=	8'd0;
		g_r	<=	8'd0;
		b_r	<=	8'd0;
	end
	else begin
		r_r	<=	r;
		g_r	<=	g;
		b_r	<=	b;
	end
end

reg	[7:0]	min_rg;
always@(posedge clk or negedge nrst)begin
	if(!nrst)
		min_rg	<=	8'd0;
	else begin
		min_rg	<=	(r <= g)	?	r:g;
	end
end

reg [7:0]	min_rgb;
always@(posedge clk or negedge nrst)begin
	if(!nrst)
		min_rgb	<=	8'd0;
	else
		min_rgb	<=	(min_rg	<=	b_r)	?	min_rg: b_r;
end

assign dark = min_rgb;

reg hsync_r,vsync_r,en_r,hsync_rr,vsync_rr,en_rr;
always@(posedge clk or negedge nrst)begin
	if(!nrst)begin
		hsync_r	<=	1'b0;
		vsync_r	<=	1'b0;
		en_r	<=	1'b0;
		hsync_rr	<=	1'b0;
		vsync_rr	<=	1'b0;
		en_rr	<=	1'b0;
	end
	else begin
		hsync_r	<=	hsync;
		vsync_r	<=	vsync;
		en_r	<=	en;
		hsync_rr	<=	hsync_r;
		vsync_rr	<=	vsync_r;
		en_rr	<=	en_r;
	end
end
assign o_hsync	=	hsync_rr;
assign o_vsync	=	vsync_rr;
assign o_en	=	en_rr;

always@(posedge clk or negedge nrst)begin
  if(!nrst  || frame_done_flag == 1'b1)
    max_of_dark <=  8'd0;
  else if(max_of_dark < min_rgb)
    max_of_dark <=  min_rgb;
  else
    max_of_dark <=  max_of_dark;
end
endmodule
