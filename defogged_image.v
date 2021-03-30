module	defogged_image(
	input	clk,
	input	nrst,
	input	hsync,
	input	vsync,
	input	en,
	input	[7:0]	r,
	input	[7:0]	g,	
	input	[7:0]	b,
	input	[7:0]	t2,
	input	[7:0]	max_of_dark,
	output	[7:0]	defogged_r,
	output	[7:0]	defogged_g,
	output	[7:0]	defogged_b,
	output	o_hsync,
	output	o_vsync,
	output	o_en
);

wire [7:0]  quotient;
// this divider comsumes 8 cycles in  a pipline
divider_for_defog u4(
	.t2(t2),
	.dividend(12'd4080),
	.clk(clk),
	.nrst(nrst),
	.quotient(quotient)
);
reg [7:0] r_r1,r_r2,r_r3,r_r4,r_r5,r_r6,r_r7,r_r8;
reg [7:0] g_r1,g_r2,g_r3,g_r4,g_r5,g_r6,g_r7,g_r8;
reg [7:0] b_r1,b_r2,b_r3,b_r4,b_r5,b_r6,b_r7,b_r8;
always@(posedge clk or negedge nrst)begin
  if(!nrst)begin
    r_r1  <=  8'd0;
    r_r2  <=  8'd0;
    r_r3  <=  8'd0;
    r_r4  <=  8'd0;
    r_r5  <=  8'd0;
    r_r6  <=  8'd0;
    r_r7  <=  8'd0;
    r_r8  <=  8'd0;
    g_r1  <=  8'd0;
    g_r2  <=  8'd0;
    g_r3  <=  8'd0;
    g_r4  <=  8'd0;
    g_r5  <=  8'd0;
    g_r6  <=  8'd0;
    g_r7  <=  8'd0;
    g_r8  <=  8'd0;
    b_r1  <=  8'd0;
    b_r2  <=  8'd0;
    b_r3  <=  8'd0;
    b_r4  <=  8'd0;
    b_r5  <=  8'd0;
    b_r6  <=  8'd0;
    b_r7  <=  8'd0;
    b_r8  <=  8'd0;
  end
  else begin
    r_r1  <=  r;
    r_r2  <=  r_r1;
    r_r3  <=  r_r2;
    r_r4  <=  r_r3;
    r_r5  <=  r_r4;
    r_r6  <=  r_r5;
    r_r7  <=  r_r6;
    r_r8  <=  r_r7;
    g_r1  <=  g;
    g_r2  <=  g_r1;
    g_r3  <=  g_r2;
    g_r4  <=  g_r3;
    g_r5  <=  g_r4;
    g_r6  <=  g_r5;
    g_r7  <=  g_r6;
    g_r8  <=  g_r7;   
    b_r1  <=  b;
    b_r2  <=  b_r1;
    b_r3  <=  b_r2;
    b_r4  <=  b_r3;
    b_r5  <=  b_r4;
    b_r6  <=  b_r5;
    b_r7  <=  b_r6;
    b_r8  <=  b_r7;
  end
end       
reg	[15:0]	out_r,out_g,out_b;
always@(posedge clk or negedge nrst)begin    // ?? t2???26???????1
	if(!nrst)begin
		out_r	<=	16'd0;
		out_g	<=	16'd0;
		out_b	<=	16'd0;
	end
	else begin
		out_r	<=	((max_of_dark - r_r8) * quotient);
		out_g	<=	((max_of_dark - g_r8) * quotient);
		out_b	<=	((max_of_dark - b_r8) * quotient);
	end
end

assign defogged_r	=	({4'h0,max_of_dark} >= out_r[15:4]) ? (max_of_dark - out_r[11:4]) : 8'd0;
assign defogged_g	=	({4'h0,max_of_dark} >= out_g[15:4]) ? (max_of_dark - out_g[11:4]) : 8'd0;
assign defogged_b	=	({4'h0,max_of_dark} >= out_b[15:4]) ? (max_of_dark - out_b[11:4]) : 8'd0;

reg hsync_r0,vsync_r0,en_r0,hsync_r1,vsync_r1,en_r1,hsync_r2,vsync_r2,en_r2,hsync_r3,vsync_r3,en_r3;
reg hsync_r4,vsync_r4,en_r4,hsync_r5,vsync_r5,en_r5,hsync_r6,vsync_r6,en_r6,hsync_r7,vsync_r7,en_r7;
reg hsync_r8,vsync_r8,en_r8;
always@(posedge clk or negedge nrst)begin
	if(!nrst)begin
		hsync_r0	<=	1'b0;
		vsync_r0	<=	1'b0;
		en_r0	<=	1'b0;
		hsync_r1	<=	1'b0;
		vsync_r1	<=	1'b0;
		en_r1	<=	1'b0;
		hsync_r2	<=	1'b0;
		vsync_r2	<=	1'b0;
		en_r2	<=	1'b0;
		hsync_r3	<=	1'b0;
		vsync_r3	<=	1'b0;
		en_r3	<=	1'b0;
		hsync_r4	<=	1'b0;
		vsync_r4	<=	1'b0;
		en_r4	<=	1'b0;
		hsync_r5	<=	1'b0;
		vsync_r5	<=	1'b0;
		en_r5	<=	1'b0;
		hsync_r6	<=	1'b0;
		vsync_r6	<=	1'b0;
		en_r6	<=	1'b0;
		hsync_r7	<=	1'b0;
		vsync_r7	<=	1'b0;
		en_r7	<=	1'b0;
		hsync_r8	<=	1'b0;
		vsync_r8	<=	1'b0;
		en_r8	<=	1'b0;		
	end
	else begin
		hsync_r0	<=	hsync;
		vsync_r0	<=	vsync;
		en_r0	<=	en;
		hsync_r1	<=	hsync_r0;
		vsync_r1	<=	vsync_r0;
		en_r1	<=	en_r0;
		hsync_r2	<=	hsync_r1;
		vsync_r2	<=	vsync_r1;
		en_r2	<=	en_r1;
		hsync_r3	<=	hsync_r2;
		vsync_r3	<=	vsync_r2;
		en_r3	<=	en_r2;
		hsync_r4	<=	hsync_r3;
		vsync_r4	<=	vsync_r3;
		en_r4	<=	en_r3;
		hsync_r5	<=	hsync_r4;
		vsync_r5	<=	vsync_r4;
		en_r5	<=	en_r4;
		hsync_r6	<=	hsync_r5;
		vsync_r6	<=	vsync_r5;
		en_r6	<=	en_r5;
		hsync_r7	<=	hsync_r6;
		vsync_r7	<=	vsync_r6;
		en_r7	<=	en_r6;
		hsync_r8	<=	hsync_r7;
		vsync_r8	<=	vsync_r7;
		en_r8	<=	en_r7;				
	end
end
assign	o_hsync	=	hsync_r8;
assign	o_vsync	=	vsync_r8;
assign	o_en	=	en_r8;

endmodule