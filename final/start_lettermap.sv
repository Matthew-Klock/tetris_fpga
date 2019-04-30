// Bryce created Module 

module start_lettermap (input logic [9:0] DrawX, DrawY, 
                                            
                                                output logic [10:0] letter,
                                                output logic [2:0] xOffset);


// "Press Enter to Start" 


always_comb begin
//P 

if(DrawY >= 300 && DrawY <316 && DrawX >= 260 && DrawX < 268)
        begin 
        letter <= 'h50*16 + (DrawY-300);
        xOffset <= DrawX-260;
        end
//R
else if(DrawY >= 300 && DrawY <316 && DrawX >= 268 && DrawX < 276)
        begin
        letter <= 'h52*16 + (DrawY-300);
        xOffset <= DrawX-268;
        end
//E
else if(DrawY >= 300 && DrawY <316 && DrawX >= 276 && DrawX < 284)
        begin
        letter <= 'h45*16 + (DrawY-300);
        xOffset <= DrawX-276;
        end
//S
else if(DrawY >= 300 && DrawY <316 && DrawX >= 284 && DrawX < 292)
        begin
        letter <= 'h53*16 + (DrawY-300);
        xOffset <= DrawX-284;
        end
//S

else if(DrawY >= 300 && DrawY <316 && DrawX >= 292 && DrawX < 300)
        begin
        letter <= 'h53*16 + (DrawY-300);
        xOffset <= DrawX-292;
        end




//E
else if(DrawY >= 300 && DrawY <316 && DrawX >= 308 && DrawX < 316)
        begin 
        letter <= 'h45*16 + (DrawY-300);
        xOffset <= DrawX-308;
        end
//N
else if(DrawY >= 300 && DrawY <316 && DrawX >= 316 && DrawX < 324)
        begin 
        letter <= 'h4e*16 + (DrawY-300);
        xOffset <= DrawX-316;
        end
//T
else if(DrawY >= 300 && DrawY <316 && DrawX >= 324 && DrawX < 332)
        begin
        letter <= 'h54*16 + (DrawY-300);
        xOffset <= DrawX-324;
        end
//E
else if(DrawY >= 300 && DrawY <316 && DrawX >= 332 && DrawX < 340)
        begin
        letter <= 'h45*16 + (DrawY-300);
        xOffset <= DrawX-332;
        end
//R
else if(DrawY >= 300 && DrawY <316 && DrawX >= 340 && DrawX < 348) //
        begin
        letter <= 'h52*16 + (DrawY-300);
        xOffset <= DrawX-340;
        end



//T
else if(DrawY >= 300 && DrawY <316 && DrawX >= 356 && DrawX < 364) //
        begin
        letter <= 'h54*16 + (DrawY-300);
        xOffset <= DrawX-356;
        end
//O
else if(DrawY >= 300 && DrawY < 316 && DrawX >= 364 && DrawX < 372) //
        begin
        letter <= 'h4f*16 + (DrawY-300);
        xOffset <= DrawX-364;
        end



//S

else if(DrawY >= 300 && DrawY < 316 && DrawX >= 380 && DrawX < 388) //
        begin
        letter <= 'h53*16 + (DrawY-300);
        xOffset <= DrawX-380;
        end


//T
else if(DrawY >= 300 && DrawY < 316 && DrawX >= 388 && DrawX < 396) //
        begin
        letter <= 'h54*16 + (DrawY-300);
        xOffset <= DrawX-388;
        end
//A
else if(DrawY >= 300 && DrawY < 316 && DrawX >= 396 && DrawX < 404) //
        begin
        letter <= 'h41*16 + (DrawY-300);
        xOffset <= DrawX-396;
        end
//R
else if(DrawY >= 300 && DrawY < 316 && DrawX >= 404 && DrawX < 412) //
        begin
        letter <= 'h52*16 + (DrawY-300);
        xOffset <= DrawX-404;
        end
//T
else if(DrawY >= 300 && DrawY < 316 && DrawX >= 412 && DrawX < 420) //
        begin
        letter <= 'h54*16 + (DrawY-300);
        xOffset <= DrawX-412;
        end
else
	begin
	letter <= 'h0;
	xOffset <= 'h0;
	end

end


endmodule
