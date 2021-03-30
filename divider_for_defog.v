module divider_for_defog(
	input	[7:0]	t2,
	input	[11:0]	dividend,
	input	clk,
	input	nrst,
	output	[7:0]	quotient
);
reg	[8:0]	step1,step2,step3,step4,step5,step6,step7,step8;
reg	[7:0]	results1,results2,results3,results4,results5,results6,results7,results8;
reg	[7:0]	t2_r1,t2_r2,t2_r3,t2_r4,t2_r5,t2_r6,t2_r7,t2_r8;
always@(posedge clk or negedge nrst)begin
	if(!nrst)	begin
		step1	<=	8'd0;
		results1	<=	8'd0;
		t2_r1	<=	8'd0;
	end
	else if(t2	>=	8'd128)begin
		step1	<=	(dividend[11:4]	>=	t2)	?	(dividend[11:4]	-	t2)	:	dividend[11:4];
		results1	<=	(dividend[11:4]	>=	t2)	?	1'b1	:	1'b0;
		t2_r1	<=	t2;
	end
	else if(t2	>=	8'd64)begin
		step1	<=	(dividend[11:5]	>=	t2)	?	(dividend[11:5]	-	t2)	:	dividend[11:5];
		results1	<=	(dividend[11:5]	>=	t2)	?	1'b1	:	1'b0;
		t2_r1	<=	t2;
	end
	else if(t2	>=	8'd32)begin
		step1	<=	(dividend[11:6]	>=	t2)	?	(dividend[11:6]	-	t2)	:	dividend[11:6];
		results1	<=	(dividend[11:6]	>=	t2)	?	1'b1	:	1'b0;
		t2_r1	<=	t2;		
	end
	else begin
		step1	<=	(dividend[11:7]	>=	t2)	?	(dividend[11:7]	-	t2)	:	dividend[11:7];
		results1	<=	(dividend[11:7]	>=	t2)	?	1'b1	:	1'b0;
		t2_r1	<=	t2;		
	end
end

always@(posedge clk or negedge nrst)begin
	if(!nrst)	begin
		step2	<=	8'd0;
		results2	<=	8'd0;
		t2_r2	<=	8'd0;
	end
	else if(t2_r1	>=	8'd128)begin
		step2	<=	({step1,dividend[3]}	>=	t2_r1)	?	({step1,dividend[3]}	-	t2_r1)	:	{step1,dividend[3]};
		results2	<=	({step1,dividend[3]}	>=	t2_r1)	?	(results1 << 1)+1'b1	:	(results1 << 1)+1'b0;
		t2_r2	<=	t2_r1;
	end
	else if(t2_r1	>=	8'd64)begin
		step2	<=	({step1,dividend[4]}	>=	t2_r1)	?	({step1,dividend[4]}	-	t2_r1)	:	{step1,dividend[4]};
		results2	<=	({step1,dividend[4]}	>=	t2_r1)	?	(results1 << 1)+1'b1	:	(results1 << 1)+1'b0;
		t2_r2	<=	t2_r1;
	end
	else if(t2_r1	>=	8'd32)begin
		step2	<=	({step1,dividend[5]}	>=	t2_r1)	?	({step1,dividend[5]}	-	t2_r1)	:	{step1,dividend[5]};
		results2	<=	({step1,dividend[5]}	>=	t2_r1)	?	(results1 << 1)+1'b1	:	(results1 << 1)+1'b0;
		t2_r2	<=	t2_r1;	
	end
	else begin
		step2	<=	({step1,dividend[6]}	>=	t2_r1)	?	({step1,dividend[6]}	-	t2_r1)	:	{step1,dividend[6]};
		results2	<=	({step1,dividend[6]}	>=	t2_r1)	?	(results1 << 1)+1'b1	:	(results1 << 1)+1'b0;
		t2_r2	<=	t2_r1;	
	end
end

always@(posedge clk or negedge nrst)begin
	if(!nrst)	begin
		step3	<=	8'd0;
		results3	<=	8'd0;
		t2_r3	<=	8'd0;
	end
	else if(t2_r2	>=	8'd128)begin
		step3	<=	({step2,dividend[2]}	>=	t2_r2)	?	({step2,dividend[2]}	-	t2_r2)	:	{step2,dividend[2]};
		results3	<=	({step2,dividend[2]}	>=	t2_r2)	?	(results2 << 1)+1'b1	:	(results2 << 1)+1'b0;
		t2_r3	<=	t2_r2;
	end
	else if(t2_r2	>=	8'd64)begin
		step3	<=	({step2,dividend[3]}	>=	t2_r2)	?	({step2,dividend[3]}	-	t2_r2)	:	{step2,dividend[3]};
		results3	<=	({step2,dividend[3]}	>=	t2_r2)	?	(results2 << 1)+1'b1	:	(results2 << 1)+1'b0;
		t2_r3	<=	t2_r2;
	end
	else if(t2_r2	>=	8'd32)begin
		step3	<=	({step2,dividend[4]}	>=	t2_r2)	?	({step2,dividend[4]}	-	t2_r2)	:	{step2,dividend[4]};
		results3	<=	({step2,dividend[4]}	>=	t2_r2)	?	(results2 << 1)+1'b1	:	(results2 << 1)+1'b0;
		t2_r3	<=	t2_r2;
	end
	else begin
		step3	<=	({step2,dividend[5]}	>=	t2_r2)	?	({step2,dividend[5]}	-	t2_r2)	:	{step2,dividend[5]};
		results3	<=	({step2,dividend[5]}	>=	t2_r2)	?	(results2 << 1)+1'b1	:	(results2 << 1)+1'b0;
		t2_r3	<=	t2_r2;
	end
end

always@(posedge clk or negedge nrst)begin
	if(!nrst)	begin
		step4	<=	8'd0;
		results4	<=	8'd0;
		t2_r4	<=	8'd0;
	end
	else if(t2_r3	>=	8'd128)begin
		step4	<=	({step3,dividend[1]}	>=	t2_r3)	?	({step3,dividend[1]}	-	t2_r3)	:	{step3,dividend[1]};
		results4	<=	({step3,dividend[1]}	>=	t2_r3)	?	(results3 << 1)+1'b1	:	(results3 << 1)+1'b0;
		t2_r4	<=	t2_r3;
	end
	else if(t2_r3	>=	8'd64)begin
		step4	<=	({step3,dividend[2]}	>=	t2_r3)	?	({step3,dividend[2]}	-	t2_r3)	:	{step3,dividend[2]};
		results4	<=	({step3,dividend[2]}	>=	t2_r3)	?	(results3 << 1)+1'b1	:	(results3 << 1)+1'b0;
		t2_r4	<=	t2_r3;
	end
	else if(t2_r3	>=	8'd32)begin
		step4	<=	({step3,dividend[3]}	>=	t2_r3)	?	({step3,dividend[3]}	-	t2_r3)	:	{step3,dividend[3]};
		results4	<=	({step3,dividend[3]}	>=	t2_r3)	?	(results3 << 1)+1'b1	:	(results3 << 1)+1'b0;
		t2_r4	<=	t2_r3;
	end
	else begin
		step4	<=	({step3,dividend[4]}	>=	t2_r3)	?	({step3,dividend[4]}	-	t2_r3)	:	{step3,dividend[4]};
		results4	<=	({step3,dividend[4]}	>=	t2_r3)	?	(results3 << 1)+1'b1	:	(results3 << 1)+1'b0;
		t2_r4	<=	t2_r3;
	end
end

always@(posedge clk or negedge nrst)begin
	if(!nrst)	begin
		step5	<=	8'd0;
		results5	<=	8'd0;
		t2_r5	<=	8'd0;
	end
	else if(t2_r4	>=	8'd128)begin
		step5	<=	({step4,dividend[0]}	>=	t2_r4)	?	({step4,dividend[0]}	-	t2_r4)	:	{step4,dividend[0]};
		results5	<=	({step4,dividend[0]}	>=	t2_r4)	?	(results4 << 1)+1'b1	:	(results4 << 1)+1'b0;
		t2_r5	<=	t2_r4;
	end
	else if(t2_r4	>=	8'd64)begin
		step5	<=	({step4,dividend[1]}	>=	t2_r4)	?	({step4,dividend[1]}	-	t2_r4)	:	{step4,dividend[1]};
		results5	<=	({step4,dividend[1]}	>=	t2_r4)	?	(results4 << 1)+1'b1	:	(results4 << 1)+1'b0;
		t2_r5	<=	t2_r4;
	end
	else if(t2_r4	>=	8'd32)begin
		step5	<=	({step4,dividend[2]}	>=	t2_r4)	?	({step4,dividend[2]}	-	t2_r4)	:	{step4,dividend[2]};
		results5	<=	({step4,dividend[2]}	>=	t2_r4)	?	(results4 << 1)+1'b1	:	(results4 << 1)+1'b0;
		t2_r5	<=	t2_r4;
	end
	else begin
		step5	<=	({step4,dividend[3]}	>=	t2_r4)	?	({step4,dividend[3]}	-	t2_r4)	:	{step4,dividend[3]};
		results5	<=	({step4,dividend[3]}	>=	t2_r4)	?	(results4 << 1)+1'b1	:	(results4 << 1)+1'b0;
		t2_r5	<=	t2_r4;
	end
end

always@(posedge clk or negedge nrst)begin
	if(!nrst)	begin
		step6	<=	8'd0;
		results6	<=	8'd0;
		t2_r6	<=	8'd0;
	end
	else if(t2_r5	>=	8'd128)begin
		step6	<=	9'd0;
		results6	<=	results5;
		t2_r6	<=	t2_r5;
	end
	else if(t2_r5	>=	8'd64)begin
		step6	<=	({step5,dividend[0]}	>=	t2_r5)	?	({step5,dividend[0]}	-	t2_r5)	:	{step5,dividend[0]};
		results6	<=	({step5,dividend[0]}	>=	t2_r5)	?	(results5 << 1)+1'b1	:	(results5 << 1)+1'b0;
		t2_r6	<=	t2_r5;
	end
	else if(t2_r5	>=	8'd32)begin
		step6	<=	({step5,dividend[1]}	>=	t2_r5)	?	({step5,dividend[1]}	-	t2_r5)	:	{step5,dividend[1]};
		results6	<=	({step5,dividend[1]}	>=	t2_r5)	?	(results5 << 1)+1'b1	:	(results5 << 1)+1'b0;
		t2_r6	<=	t2_r5;
	end
	else begin
		step6	<=	({step5,dividend[2]}	>=	t2_r5)	?	({step5,dividend[2]}	-	t2_r5)	:	{step5,dividend[2]};
		results6	<=	({step5,dividend[2]}	>=	t2_r5)	?	(results5 << 1)+1'b1	:	(results5 << 1)+1'b0;
		t2_r6	<=	t2_r5;
	end
end

always@(posedge clk or negedge nrst)begin
	if(!nrst)	begin
		step7	<=	8'd0;
		results7	<=	8'd0;
		t2_r7	<=	8'd0;
	end
	else if(t2_r6	>=	8'd128)begin
		step7	<=	9'd0;
		results7	<=	results6;
		t2_r7	<=	t2_r6;
	end
	else if(t2_r6	>=	8'd64)begin
		step7	<=	9'd0;
		results7	<=	results6;
		t2_r7	<=	t2_r6;
	end
	else if(t2_r6	>=	8'd32)begin
		step7	<=	({step6,dividend[0]}	>=	t2_r6)	?	({step6,dividend[0]}	-	t2_r6)	:	{step6,dividend[0]};
		results7	<=	({step6,dividend[0]}	>=	t2_r6)	?	(results6 << 1)+1'b1	:	(results6 << 1)+1'b0;
		t2_r7	<=	t2_r6;
	end
	else begin
		step7	<=	({step6,dividend[1]}	>=	t2_r6)	?	({step6,dividend[1]}	-	t2_r6)	:	{step6,dividend[1]};
		results7	<=	({step6,dividend[1]}	>=	t2_r6)	?	(results6 << 1)+1'b1	:	(results6 << 1)+1'b0;
		t2_r7	<=	t2_r6;
	end
end

always@(posedge clk or negedge nrst)begin
	if(!nrst)	begin
		step8	<=	8'd0;
		results8	<=	8'd0;
		t2_r8	<=	8'd0;
	end
	else if(t2_r7	>=	8'd128)begin
		step8	<=	9'd0;
		results8	<=	results7;
		t2_r8	<=	t2_r7;
	end
	else if(t2_r7	>=	8'd64)begin
		step8	<=	9'd0;
		results8	<=	results7;
		t2_r8	<=	t2_r7;
	end
	else if(t2_r7	>=	8'd32)begin
		step8	<=	9'd0;
		results8	<=	results7;
		t2_r8	<=	t2_r7;
	end
	else begin
		step8	<=	({step7,dividend[0]}	>=	t2_r7)	?	({step7,dividend[0]}	-	t2_r7)	:	{step7,dividend[0]};
		results8	<=	({step7,dividend[0]}	>=	t2_r7)	?	(results7 << 1)+1'b1	:	(results7 << 1)+1'b0;
		t2_r8	<=	t2_r7;
	end
end
assign	quotient	=	results8;

endmodule

