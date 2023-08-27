module ripple8(s,co,a,b,cin);
output wire [7:0]s;
output wire co;
input wire [7:0]a,b;
input wire cin;
wire x1,x2,x3,x4,x5,x6,x7;
full_adder fa1(s[0],x1,a[0],b[0],cin);
full_adder fa2(s[1],x2,a[1],b[1],x1);
full_adder fa3(s[2],x3,a[2],b[2],x2);
full_adder fa4(s[3],x4,a[3],b[3],x3);
full_adder fa5(s[4],x5,a[4],b[4],x4);
full_adder fa6(s[5],x6,a[5],b[5],x5);
full_adder fa7(s[6],x7,a[6],b[6],x6);
full_adder fa8(s[7],co,a[7],b[7],x7);
endmodule
