module mux2
(s,d,y);
input wire [1:0]d;
input wire s;
output wire y;
wire a1,a2;
and a0(a1,~s,d[0]);
and a3(a2,s,d[1]);
or o1(y,a1,a2);
endmodule
