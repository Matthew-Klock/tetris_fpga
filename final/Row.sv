module Row(input logic clk, reset, shift_row,
				input logic [1:0] state,
				input logic [9:0] prev,write,
				output logic [9:0] next,
				output logic Shift);
//states 
// 00-check
// 01- move
// 10-write select
// 11-shift
				
logic [9:0] row;

always_ff @ (posedge clk)
begin 

if(reset)
begin 
row <= 10'h000;
shift <= 0;
end


//checks for a shift
else if(state == 2'b00)
begin 
//clears row and sends signal to shift
if(row == 10'hFFFF)
	begin
	row <= 10'h0000;
	shift <= 1'b1;
	end
//does nothing
else
	begin
	row <= row;
	shift <= 1'b0;
	end
end 


//writes from the map 
else if(state == 2'b10)
	begin 
	row <= write;
	shift <= 0;
	end 
//if in the shift state, and a shift is supposed to occur in the row,  takes the last value
//todo: make it shift multiple rows
//probably in state machine 
else if(state == 2'b11 && shift_row == 1'b1)
begin 
	row <= prev;
	shift <= 0;
end 
//if in the move state does nothing.
//Also covers shift state where it does not shift
else
begin
Shift <= 0;
row <= row;
end 

end
	
assign next = row;			

endmodule 