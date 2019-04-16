module GameLogic(
	input logic clk, reset,
	input logic [1:0] gameOver, 
	input logic [21:0] shift, stop, 
	
	
	output logic [1:0] out_state,
	output logic [21:0] shift_row
	); 
	




//code- state 
// 000- check block (deletes full rows)
// 001- move block
// 010- write block to rows
// 011- shift down rows
// 100- add block
// 000 - endgame/HALT
	
	enum logic [2:0] {
	
	
						check_block, 
						move_block, 
						write_block_to_rows, 
						shift_down_rows,  
						add_block, 
						HALT
	
	} state, next_state; 
	
	
	always_ff @ (posedge clk)
		begin 
			state <= next_state; 
		end
		
		
	always_comb
	begin  
		// check_block, 
		// 	move_block, 
		// 	write_block_to_rows, 
		// 	shift_down_rows,  
		// 	add_block, 
		//				HALT
		//TODO: default values 
		case(state)
		//check keeps checking until shift is negative
		check_block:     	
			begin
			if(shift != 21'h0)
				next_state = shift_down_rows; 
			else
				next_state = add_block;
			end 			
		//shift down rows unconditionally goes back to check
		shift_down_rows:
			begin 
				next_state = check_block; 
			end
		//write block to rows goes to move_block near unconditionally
		write_block_to_rows:
			begin
			if(gameOver != 2'h0)
				next_state = HALT; 
			else
				next_state = move_block; 
			end
		//move block loops until stop signal
		move_block:
			begin
			if(stop != 21'h0 )
				next_state = move_block; 
			else
				next_state = write_block_to_rows; 
			end 
		//add block goes to move block unless the game is over			
		add_block:
			begin
			if(gameOver != 2'h0)
				next_state = HALT; 
			else
			next_state = move_block;
			end
		HALT: 
			begin
				next_state = HALT;
			end
		default: 
			next_state = check_block;
		endcase
	//deals with all the outputs
	
//code- state 
// 000- check block (deletes full rows)
// 001- move block
// 010- write block to rows
// 011- shift down rows
// 100- add block
// 000 - endgame/HALT
//TODO make shift rows logic 
		case(state)
		//check keeps checking until shift is negative
		check_block:     	
			begin
				out_state = 3'b000;
			end 			
		//shift down rows unconditionally goes back to check
		shift_down_rows:
			begin 
				out_state = 3'b011;
			end
		//write block to rows goes to move_block near unconditionally
		write_block_to_rows:
			begin
			out_state = 3'b010;
			end
		//move block loops until stop signal
		move_block:
			begin
			out_state = 3'b001; 
			end 
		//add block goes to move block unless the game is over			
		add_block:
			begin
		out_state = 3'b100;
			end
		HALT: 
			begin
				out_state = 3'b000;
			end
		default: 
			out_state = 3'b000;
		endcase
	end
assign shift_row = 21'h0;	
	
endmodule 