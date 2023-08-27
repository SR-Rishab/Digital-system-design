module mux16
(s,d,y);
input wire [3:0]s;
input wire [15:0]d;
output wire y;
wire p,q;
mux8 m0(s[2:0],d[7:0],p);
mux8 m2(s[2:0],d[15:8],q);
mux2 m3(s[2],{p,q},y);
endmodule
