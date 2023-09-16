module dff_en_2seg
(
	input wire clk,reset;
	input wire en;
	input wire d;
	output reg q;
);
reg present,next;
always@(posedge clk,posedge reset)
if(reset)
	present <=0;
else
	presetn <= next;
always@*
	if(en)
		next <= d;
	else
		next <= present;
		
