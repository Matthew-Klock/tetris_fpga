module GameLogic(
	input logic clk, reset
	input logic Stop, endgame, 
	input logic [21:0] Shift, 
	input logic [9:0] collision, 
	
	
	output logic [1:0] state,
	output logic [21:0] shift_row
	); 
	

//states 
// 000-check
// 001-move
// 010-write select (ws)
// 011-shift
// 100 - endgame 
	
	enum logic [2:0] {
	
	
						check, 
						move, 
						ws, 
						shift, 
						done, 
						state, 
						next_state
	
	}; 
	
	
	always_ff @ (posedge clk)
		begin 
		if(reset)
			state <= done; 
		else 
			state <= next_state; 
		
		end
		
		
	always_comb
	begin 
			
		next_state = state; 
		
		//TODO: default values 
		
		unique case(state):
		begin
		check:      // first state is check and will either branch to shift or ws based on Shift value

			
			if(Shift != 0)
				next_state = shift; 
			else
				next_state = ws; 
				
			shift ;
			if(Shift)
				next_state = check; 
			else
				next_state = check; // unconditional jump to check. use while statement??
			ws:
			if(endgame)
				next_state = done; 
			else
				next_state = move; 
			move:
			if(Stop)
				next_state = check; 
			else
				next_state = move; 
			
		
		
		endcase
		
		
		
		// Define States:
		
			check :
					
					begin 
					
					endgame <= 1'b0; 
					Shift <= 
					
					
					end
		
			shift : 
			
				begin 
				
				shift_row  = 5'b11111; 
				
				
				
				end 
			
			ws: 
				begin 
				
				
				
				end
			
			
		 move:
			begin 
		 
		 
			end
		 
		 done
		 begin
		 endgame = 1'b1; 
		 end
		
		
		
		
		
		
		
		
		
		
		
		
	end
		
	

	
	
	
	
	
	
	
	
endmodule 