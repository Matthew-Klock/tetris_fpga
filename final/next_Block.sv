module next_Block(
input logic  [2:0] block, 
output logic [9:0] new_block [1:0]
);
always_comb
begin
new_block[0] = 10'b0000100000;
new_block[1] = 10'b0001110000;
end
endmodule