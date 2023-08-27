module mux8
(s,d,y);
input wire [2:0]s;
input wire [7:0]d;
output wire y;
wire p,q;
mux4 m0(s[1:0],d[3:0],p);
mux4 m2(s[1:0],d[7:4],q);
mux2 m3(s[2],{p,q},y);
endmodule
