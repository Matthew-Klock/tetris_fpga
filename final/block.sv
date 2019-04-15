module Block (input logic clk, reset,
				input logic [1:0] state, 
				input logic [9:0] prev, write, collision,
				output logic [9:0] next, 
				//stop the falling and continue
				output logic Stop,
				//end the game 
				output logic endgame);
//states 
// 00-check
// 01-move
// 10-write select
// 11-shift
logic [9:0] row;

always_ff @ (posedge clk)
begin 
 
if(reset)
begin 
row <= 9'h000;
Stop <= 1'b0;
endgame <= 1'b0;
end
//checks if does nothing to a nonexistant block in the check state
else if(state== 2'b00)
begin 
	row <= row;
	Stop <= 1'b0;
	endgame <= 1'b0;
end 
//if it collides on the next cycle, stops. Else continues falling
else if(state == 2'b01)
	begin
	if(collision & row != 10'h0000)
	begin
	row <= row;
	Stop <= 1'b1;
	endgame <= 1'b0;
	end 
	else
	begin
	row <= prev;
	Stop <= 1'b0;
	endgame <= 1'b0;
	end

end


//if it is making a new block and senses a collision in the next row, ends the game and doesn't write the block
//else writes the block 

else if(state == 2'b10)
begin
if(collision & write != 10'h0000)
	begin 
	row <= row;
	Stop <= 1'b0;
	endgame <= 1'b1;
	
	
	end
else
	begin 
	row <= write;
	Stop <= 1'b0;
	endgame <= 1'b0;
	
	end 
end
//if in the shift state, does nothing
else 
	begin
	row <= row; 
	Stop <= 1'b0;
	endgame <= 1'b0;
	end

end	
//outputs next to the row
assign next = row;			
endmodule 