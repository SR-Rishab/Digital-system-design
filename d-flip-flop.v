module dff(d,clk,q)
	input wire d,clk;
	output reg q;
	always@(posedge clk)
		q = 0;
	endmodule
