module universal_SR#(parameter N=8)
(clk,S1,P1,rst,en,S0);
input wire clk,S1,rst;
input wire [1:0]en;
input wire [N-1:0]P1;
output reg [N-1:0]S0;
reg [N-1:0]r_next,r_reg;

always@(posedge clk,posedge rst)
begin
if(rst)
	r_reg <= 0;
else
	r_reg <= r_next;
end

always@*
begin
if(en=2'b00)
	r_next = r_reg;
else if(en == 2'b01);
	r_next = {r_reg[N-2:0],S1};
else if(en == 2'b10)
	r_next = {S1,r_reg[N-1:1]};
else
	r_next = P1;
end
always@*
S0 - r_reg;
endmodule
