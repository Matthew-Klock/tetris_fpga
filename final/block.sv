module Block (input logic clk, reset,
				input logic [2:0] state, 
				input logic [9:0] prev, write, collision,
				output logic [9:0] next, 
				//stop the falling and continue
				output logic Stop,
				//end the game 
				output logic endgame);
//code- state 
// 000- check block (deletes full rows)
// 001- move block
// 010- write block to rows
// 011- shift down rows
// 100- add block
// 000 - endgame/HALT
logic [9:0] row;


//checks if the game should stop
assign Stop = ((collision & row) == 10'h0000) ? 1'b0:1'b1;





always_ff @ (posedge clk, posedge reset)
begin 
 
if(reset)
begin 
row <= 10'h000;
//Stop <= 1'b0;
endgame <= 1'b0;
end

//checks if does nothing to a nonexistant block in the check state

else if(state== 3'b000)
begin 
	row <= row;
//	Stop <= 1'b0;
	endgame <= 1'b0;
end 
//if it collides on the next cycle, stops. Else continues falling
else if(state == 3'b001)
	//begin
	//else
	begin
	row <= prev;
//	Stop <= 1'b0;
	endgame <= 1'b0;
	end
//end


//if it is making a new block and senses a collision in the next row, ends the game and doesn't write the block
//else writes the block 

else if(state == 3'b100)
begin
if(((collision & write) != 10'h0000))
	begin 
	row <= write;
//	Stop <= 1'b0;
	endgame <= 1'b1;
	
	
	end
else
	begin 
	row <= write;
//	Stop <= 1'b0;
	endgame <= 1'b0;
	
	end 
end
//if in the shift state, does nothing
else 
	begin
	row <= row; 
//	Stop <= 1'b0;
	endgame <= 1'b0;
	end

end

	
//outputs next to the row
assign next = row;			
endmodule 