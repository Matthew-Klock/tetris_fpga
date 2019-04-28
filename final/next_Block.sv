module next_Block(
input logic  [2:0] block, 
output logic [9:0] new_block [1:0]
);
always_comb
begin

case (block)
3'b000:
begin 
new_block[0] = 10'b0000100000;
new_block[1] = 10'b0001110000;
end
3'b001:
begin 
new_block[0] = 10'b0000010000;
new_block[1] = 10'b0001110000;
end
3'b010:
begin
new_block[0] = 10'b0001000000;
new_block[1] = 10'b0001110000;
end
3'b011:
begin
new_block[0] = 10'b0000110000;
new_block[1] = 10'b0001100000;
end
3'b100:
begin 
new_block[0] = 10'b0001100000;
new_block[1] = 10'b0000110000;
end
3'b101:
begin
new_block[0] = 10'b0000110000;
new_block[1] = 10'b0000110000;
end
3'b110:
begin
new_block[0] = 10'b0000000000;
new_block[1] = 10'b0001111000;
end
default:
begin 
new_block[0] = 10'b0001110000;
new_block[1] = 10'b0001110000;
end
endcase
end
endmodule