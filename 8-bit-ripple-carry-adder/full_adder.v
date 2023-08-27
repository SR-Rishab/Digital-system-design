module full_adder(s,co,a,b,cin);
output wire s,co;
input wire a,b,cin;
assign s = a^b^cin;
assign  co = (a&b)|(b&cin)|(a&cin);
endmodule

