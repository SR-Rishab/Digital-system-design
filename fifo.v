module fifo#(
parameter B=8, // Number of bits in a word
	  W=4  // Number of address bits
)
(
input wire clk,reset,
input wire rd,wr,
input wire [B-1:0] w_data,
output wire empty,full,
output wire [B-1:0] r_data
);

// Signal declaration
reg [B-1:0] array_reg [2**W-1:0]; // Register array
reg [W-1:0] w_ptr_reg, w_ptr_next, w_ptr_succ;
reg [W-1:0] r_ptr_reg, r_ptr_next, r_ptr_succ;
reg full_reg, empty_reg, full_next, empty_next;
wire wr_en;

// Body 
// Register file write operations
always@(posedge clk)
	if(wr_en)
	arrray_reg[w_ptr_reg] <= w_data;
// Register file read operations
assign r_data = array_reg[r_ptr_reg];
// Write enabled only when FIFO is not full
assign wr_en = wr & ~full_reg;
// FIFO control logic
//Register for read and write pointers
always@(posedge clk,posedge reset)
	if(reset)
	begin
	w_ptr_reg <= 0;
	r_ptr_reg <= 0;
	full_reg <= 1'b0;
	empty_reg <= 1'b1;
	end
	
	else
	begin
	w_ptr_reg <= w_ptr_next;
	r_ptr_reg <= r_ptr_next;
	full_reg <= full_next;
	empty_reg <= empty_reg;
	end
//Next state logic for read and write pointers
always@*
begin
//Successive pointer values
w_ptr_succ = w_ptr_reg +1;
r_ptr_succ = r_ptr_reg +1;
// Default: Keep old values
w_ptr_next = w_ptr_reg;
r_ptr_next = r_ptr_reg;
full_next = full_reg;
empty_next = empty_reg;
case({wr,rd})
// 2'b00: no operation

2'b01: // read
	if(~empty_reg) // Not empty
	begin
	r_ptr_next = r_ptr_succ;
	full_next = 1'b0;
	if(r_ptr_succ == w_ptr_reg)
		empty_next = 1'b1;
	end
2'b10: // Write
	if(~full_reg)// Not full
	begin
	w_ptr_next = w_ptr_succ;
	empty_next = 1'b0;
	if(w_ptr_succ == r_ptr_reg)
		full_next = 1'b1;
	end
2'b11:
	begin
	w_ptr_read = w_ptr_succ;
	r_ptr_next = r_ptr_succ;
	end
endcase
end

// Output 
assign full = full_reg;
assign empty = empty_reg;
endmodule
