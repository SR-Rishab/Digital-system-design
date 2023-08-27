module mux4_tb();
wire y;
reg  [1:0]s;
reg [3:0]d;
mux4 m0(s,d,y);
initial
begin
d = 4'b1010;
s = 2'b00;
#10;
d = 4'b1010;
s = 2'b01;
#10;
d = 4'b1010;
s = 2'b10;
#10;
d = 4'b1010;
s = 2'b11;
#10;
end
endmodule
