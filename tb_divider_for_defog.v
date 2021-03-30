module tb_divider_for_defog;
	reg	[7:0]	t2;
	reg	[11:0]	dividend;
	reg	clk;
	reg	nrst;
	wire	[7:0]	quotient;
	
initial begin
  nrst = 1'b0;
  clk = 1'b0;
  dividend = 12'd4095;
  t2 = 8'd188;
  #5 nrst = 1'b1;
  #100 t2 = 8'd103;
  #100 t2 = 8'd44;
end

always #5 clk = !clk;

divider_for_defog u0(
	.t2(t2),
	.dividend(dividend),
	.clk(clk),
	.nrst(nrst),
	.quotient(quotient)
);

endmodule