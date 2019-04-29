module scoreKeeper(
input logic clk, reset,
input logic [2:0] state,
output int score, rows_cleared, level 
);

//code- state 
// 000- check block(deletes full rows)
// 001- move block
// 010- write block to rows
// 011- shift down rows
// 100- add block
// 000 - endgame/HALT
// 111 - move left and right 
	
//make more complex if you feel like it @bryce 

int score_reg, rows_cleared_reg, level_reg;
always_ff @ (posedge clk)
begin
if(reset)
begin 
score_reg <= 0;
rows_cleared_reg <= 0;
level_reg <= 0;
end

else if(state == 3'b010)
begin 
score_reg <= score_reg+20;
rows_cleared_reg <= rows_cleared_reg;
level_reg <= level_reg;
end

else if(state == 3'b011)
begin 
score_reg <= score_reg+200;
rows_cleared_reg++;
level_reg <= rows_cleared_reg/10;
end
else
begin 
score_reg <= score_reg;
rows_cleared_reg <= rows_cleared_reg;
level_reg <= level_reg;
end



end 
assign score = score_reg;
assign level = level_reg;
assign rows_cleared = rows_cleared_reg;


endmodule