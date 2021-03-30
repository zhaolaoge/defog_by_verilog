/**********************************
copyright@FPGA OPEN SOURCE STUDIO
微信公众号：FPGA开源工作室
***********************************/
`timescale 1ns / 1ps
//`define pix_1920_1080
//`define pix_1280_768
`define pix_1280_720
//`define pix_800_600

module vga_ctl
	(
	input			pix_clk,
	input           reset_n,
	input  [23:0]   VGA_RGB,
	output [11:0]   hcount,
	output [11:0]   vcount,
	output          VGA_CLK,
	output [7:0]	VGA_R,
	output [7:0]	VGA_G,
	output [7:0]	VGA_B,
	output			VGA_HS,
	output			VGA_VS,
	output			VGA_DE,
	output          BLK
	);
	
`include "vga_parameter.vh"

reg[11:0]	x_cnt;
reg[11:0]	y_cnt;
reg	        hsync_r;
reg	        hs_de;
reg	        vsync_r;
reg	        vs_de;
assign VGA_CLK = pix_clk;
always @(posedge pix_clk or negedge reset_n)	 //H count	
begin
	if(!reset_n)
	  x_cnt	<=	1;
	else if(x_cnt==H_Total)
	  x_cnt	<=	1;
	else
	  x_cnt	<=	x_cnt+1;
end

always @(posedge pix_clk or negedge reset_n) //H SYNC DE
begin
	if(!reset_n)
	  hsync_r	<=	1'b1;
	else if(x_cnt==1)
	  hsync_r	<=	1'b0;
	else if(x_cnt==H_Sync)
	  hsync_r	<=	1'b1;
	
	if(!reset_n)
	  hs_de	<=	1'b0;
	else if(x_cnt==H_Start)
	  hs_de	<=	1'b1;
	else if(x_cnt==H_End)
	  hs_de	<=	1'b0;
end

always @(posedge pix_clk or negedge reset_n) //V count
begin
	if(!reset_n)
	  y_cnt	<=	1;
	else if(y_cnt==V_Total)
	  y_cnt	<=	1;
	else if(x_cnt==H_Total)
	  y_cnt	<=	y_cnt+1;
end

always @(posedge pix_clk or negedge reset_n) //V SYNC DE
begin
	if(!reset_n)
	  vsync_r	<=	1'b1;
	else if(y_cnt==1)
	  vsync_r	<=	1'b0;
	else if(y_cnt==V_Sync)
	  vsync_r	<=	1'b1;
	
	if(!reset_n)
	  vs_de	<=	1'b0;
	else if(y_cnt==V_Start)
	  vs_de	<=	1'b1;
	else if(y_cnt==V_End)
	  vs_de	<=	1'b0;
end

assign BLK      =   1'b1;
assign VGA_HS	=	hsync_r;
assign VGA_VS	=	vsync_r;
assign VGA_DE	=	hs_de & vs_de;
assign VGA_R	=	(hs_de & vs_de)? VGA_RGB[23:16]:8'h0;//R
assign VGA_G	=	(hs_de & vs_de)? VGA_RGB[15:8]:8'h0; //G
assign VGA_B	=	(hs_de & vs_de)? VGA_RGB[7:0]:8'h0;  //B
assign hcount   =   (hs_de & vs_de)? (x_cnt - H_Start):12'd0;
assign vcount   =   (hs_de & vs_de)? (y_cnt - V_Start):12'd0;
endmodule

