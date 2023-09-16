module freeSR(clk,S1,en,rst,S0);
input wire clk,S1,en,rst;
output reg [7:0]S0;
reg [7:0]r_reg,r_next;

always@(posedge clk,posedge rst)
begin
if(rst)
  r_reg <= 0;
else
  r_reg <= r_next;
  
always@*
begin
if(en)
  r_next - {S1,r_reg[7:1]};
else
  r_next = r_reg;
end
always@*
S0 = r_reg;
endmodule
