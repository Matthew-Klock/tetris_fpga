module grid_mapper (input logic [9:0] DrawX, DrawY, 
							output logic is_grid);

//blocks are 20x20
//800x520 pixels
// 40x26 blocks
// 300 -- block -- 300 x has 15 block buffer
// 40^^ block ^^ 40  y has 2 block buffer
int xindex, yindex;
assign xindex = (DrawX)%20;
assign yindex = (DrawY)%20;

always_comb
begin
//out of the playing feild for x
if(DrawX < 10'd320 || DrawX > 10'd521) 
	is_grid = 1'b0;
else if (DrawY >= 441)
	is_grid = 1'b0;
else if(xindex == 0 || yindex == 0)
	is_grid = 1'b1;
else 
	is_grid = 1'b0;
end

endmodule