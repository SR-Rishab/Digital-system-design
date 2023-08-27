module mux2_tb;
wire y;
reg  s;
reg [1:0]d;
mux2 m0(s,d,y);
initial
begin
d = 2'b10;
s = 0;
#10;
d = 2'b10;
s = 1;
#10;
end
endmodule
