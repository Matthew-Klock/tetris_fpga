module letter_map(input logic [9:0] DrawX, DrawY, 
						input int score, level, rows_cleared,
						output logic [10:0] letter,
						output logic [2:0] xOffset);
						
always_comb
begin
//S
if(DrawY >= 400 && DrawY <416 && DrawX >= 100 && DrawX < 108)
	begin 
	letter <= 'h53*16 + (DrawY-400);
	xOffset <= DrawX-100;
	end
//c
else if(DrawY >= 400 && DrawY <416 && DrawX >= 108 && DrawX < 116)
	begin
	letter <= 'h63*16 + (DrawY-400);
	xOffset <= DrawX-108;
	end
//o
else if(DrawY >= 400 && DrawY <416 && DrawX >= 116 && DrawX < 124)
	begin
	letter <= 'h6F*16 + (DrawY-400);
	xOffset <= DrawX-116;
	end
	
//r
else if(DrawY >= 400 && DrawY <416 && DrawX >= 124 && DrawX < 132)
	begin
	letter <= 'h72*16 + (DrawY-400);
	xOffset <= DrawX-124;
	end
//e
else if(DrawY >= 400 && DrawY <416 && DrawX >= 132 && DrawX < 140)
	begin
	letter <= 'h65*16 + (DrawY-400);
	xOffset <= DrawX-132;
	end
//:
else if(DrawY >= 400 && DrawY <416 && DrawX >= 140 && DrawX < 148)
	begin
	letter <= 'h7C*16 + (DrawY-400);
	xOffset <= DrawX-140;
	end
//score  
else if(DrawY >= 400 && DrawY <416 && DrawX >= 148 && DrawX < 156)
	begin
	letter <= ('h30 +(score/100000) %10)*16 + (DrawY-400);
	xOffset <= DrawX-148;
	end
else if(DrawY >= 400 && DrawY <416 && DrawX >= 156 && DrawX < 164)
	begin
	letter <= ('h30+(score/10000)%10)*16 + (DrawY-400);
	xOffset <= DrawX-156;
	end
else if(DrawY >= 400 && DrawY <416 && DrawX >= 164 && DrawX < 172)
	begin
	letter <= ('h30+(score/1000)%10)*16 + (DrawY-400);
	xOffset <= DrawX-164;
	end
else if(DrawY >= 400 && DrawY <416 && DrawX >= 172 && DrawX < 180)
	begin
	letter <= ('h30+(score/100)%10)*16 + (DrawY-400);
	xOffset <= DrawX-172;
	end
else if(DrawY >= 400 && DrawY <416 && DrawX >= 180 && DrawX < 188)
	begin
	letter <= ('h30+(score/10) %10)*16 + (DrawY-400);
	xOffset <= DrawX-180;
	end
else if(DrawY >= 400 && DrawY <416 && DrawX >= 188 && DrawX < 196)
	begin
	letter <= ('h30+score%10)*16 + (DrawY-400);
	xOffset <= DrawX-188;
	end
//L
else if(DrawY >= 420 && DrawY <436 && DrawX >= 100 && DrawX < 108)
	begin 
	letter <= 'h4C*16 + (DrawY-420);
	xOffset <= DrawX-100;
	end
//e
else if(DrawY >= 420 && DrawY <436 && DrawX >= 108 && DrawX < 116)
	begin
	letter <= 'h65*16 + (DrawY-420);
	xOffset <= DrawX-108;
	end
//v
else if(DrawY >= 420 && DrawY <436 && DrawX >= 116 && DrawX < 124)
	begin
	letter <= 'h76*16 + (DrawY-420);
	xOffset <= DrawX-116;
	end
	
//e
else if(DrawY >= 420 && DrawY <436 && DrawX >= 124 && DrawX < 132)
	begin
	letter <= 'h65*16 + (DrawY-420);
	xOffset <= DrawX-124;
	end
//l
else if(DrawY >= 420 && DrawY <436 && DrawX >= 132 && DrawX < 140)
	begin
	letter <= 'h6C*16 + (DrawY-420);
	xOffset <= DrawX-132;
	end
//:
else if(DrawY >= 420 && DrawY <436 && DrawX >= 140 && DrawX < 148)
	begin
	letter <= 'h7C*16 + (DrawY-420);
	xOffset <= DrawX-140;
	end
//level  
else if(DrawY >= 420 && DrawY <436 && DrawX >= 148 && DrawX < 156)
	begin
	letter <= ('h30 +(level/10)%10)*16 + (DrawY-420);
	xOffset <= DrawX-148;
	end
else if(DrawY >= 420 && DrawY <436 && DrawX >= 156 && DrawX < 164)
	begin
	letter <= ('h30+(level)%10)*16 + (DrawY-420);
	xOffset <= DrawX-156;
	end
	
//R
else if(DrawY >= 440 && DrawY <456 && DrawX >= 44 && DrawX < 52)
	begin 
	letter <= 'h52*16 + (DrawY-440);
	xOffset <= DrawX-44;
	end
//o
else if(DrawY >= 440 && DrawY <456 && DrawX >= 52 && DrawX < 60)
	begin 
	letter <= 'h6F*16 + (DrawY-440);
	xOffset <= DrawX-52;
	end
//w
else if(DrawY >= 440 && DrawY <456 && DrawX >= 60 && DrawX < 68)
	begin
	letter <= 'h77*16 + (DrawY-440);
	xOffset <= DrawX-60;
	end
//s
else if(DrawY >= 440 && DrawY <456 && DrawX >= 68 && DrawX < 76)
	begin
	letter <= 'h73*16 + (DrawY-440);
	xOffset <= DrawX-68;
	end
	
//' '
else if(DrawY >= 440 && DrawY <456 && DrawX >= 76 && DrawX < 84)
	begin
	letter <= 'h0*16 + (DrawY-440);
	xOffset <= DrawX-76;
	end
//C
else if(DrawY >= 440 && DrawY <456 && DrawX >= 84 && DrawX < 92)
	begin
	letter <= 'h43*16 + (DrawY-440);
	xOffset <= DrawX-84;
	end
//l
else if(DrawY >= 440 && DrawY <456 && DrawX >= 92 && DrawX < 100)
	begin
	letter <= 'h6C*16 + (DrawY-440);
	xOffset <= DrawX-92;
	end	
//e
else if(DrawY >= 440 && DrawY <456 && DrawX >= 100 && DrawX < 108)
	begin 
	letter <= 'h65*16 + (DrawY-440);
	xOffset <= DrawX-100;
	end
//a
else if(DrawY >= 440 && DrawY <456 && DrawX >= 108 && DrawX < 116)
	begin
	letter <= 'h61*16 + (DrawY-440);
	xOffset <= DrawX-108;
	end
//r
else if(DrawY >= 440 && DrawY <456 && DrawX >= 116 && DrawX < 124)
	begin
	letter <= 'h72*16 + (DrawY-440);
	xOffset <= DrawX-116;
	end
	
//e
else if(DrawY >= 440 && DrawY <456 && DrawX >= 124 && DrawX < 132)
	begin
	letter <= 'h65*16 + (DrawY-440);
	xOffset <= DrawX-124;
	end
//d
else if(DrawY >= 440 && DrawY <456 && DrawX >= 132 && DrawX < 140)
	begin
	letter <= 'h64*16 + (DrawY-440);
	xOffset <= DrawX-132;
	end
//:
else if(DrawY >= 440 && DrawY <456 && DrawX >= 140 && DrawX < 148)
	begin
	letter <= 'h7C*16 + (DrawY-440);
	xOffset <= DrawX-140;
	
	
	end
//score  
else if(DrawY >= 440 && DrawY <456 && DrawX >= 148 && DrawX < 156)
	begin
	letter <= ('h30 +(rows_cleared/100) %10)*16 + (DrawY-440);
	xOffset <= DrawX-148;
	end
else if(DrawY >= 440 && DrawY <456 && DrawX >= 156 && DrawX < 164)
	begin
	letter <= ('h30*16+(rows_cleared/10)%10) + (DrawY-440);
	xOffset <= DrawX-156;
	end
else if(DrawY >= 440 && DrawY <456 && DrawX >= 164 && DrawX < 172)
	begin
	letter <= ('h30*16+(rows_cleared)%10) + (DrawY-440);
	xOffset <= DrawX-156;
	end
else
	begin
	letter <= 'h0;
	xOffset <= 'h0;
	end


end



endmodule