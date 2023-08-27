//4-bit up counter using behavioural modelling
module(clk,q,reset);
	wire clk = 1'b0;
	input wire reset = 1'b0;
	output reg q = 4'b0;
	always@(posedge clk)
	begin
		q = q +1;
		if(reset)
		begin
			q = 0;
		end
	end
	endmodule
