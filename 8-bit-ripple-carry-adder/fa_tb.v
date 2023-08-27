module fa_tb();
wire s,co;
reg  a,b,cin;
full_adder t1(s,co,a,b,cin);
initial
begin
a = 0;
b = 0;
cin = 1;
#10;
a = 1;
b = 1;
cin = 1;
#10;
end
endmodule
