module isText 			(input logic [9:0] DrawX, DrawY,
							 input int score, level, rows_cleared,
							output logic is_letter);
				
	
logic [10:0] letter, addr;

logic [7:0] data;

logic [2:0] xOffset;



letter_map lm(.DrawX, .DrawY, .letter, .xOffset,.*);
assign addr = letter;

font_rom FR(.addr, .data);	
assign is_letter = data[7-xOffset];						
							
							
							
							
							
							
							
							
							
							
							
							
endmodule
