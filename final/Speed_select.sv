module Speed_select(input logic [7:0] keycode,
							input int level, 
						   output int speed);

							
//assign speed = (keycode == 8'h16) ? 'd10:'d51;
always_comb
begin
case(keycode)
8'h2c:
speed = 'd2;
8'h16:
speed = 'd10;
default:
speed = ('d4 > 'd51-2*level) ?  'd4 :'d51-2*level;




endcase





end							
							
							
endmodule 