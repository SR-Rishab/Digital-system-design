module mux8_tb();
wire y;
reg  [2:0]s;
reg [7:0]d;
mux8 m0(s,d,y);
initial
begin
d = 8'b1010_1010;
s = 3'b000;
#10;
d = 8'b1010_1010;
s = 3'b001;
#10;
d = 8'b1010_1010;
s = 3'b010;
#10;
d = 8'b1010_1010;
s = 3'b011;
#10;
end
endmodule
