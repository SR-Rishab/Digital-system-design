module mux4
(s,d,y);
input wire [1:0]s;
input wire [3:0]d;
output wire y;
wire p,q;
mux2 m0(s[0],d[1:0],p);
mux2 m1(s[0],d[3:2],q);
mux2 m2(s[1],{p,q},y);
endmodule
