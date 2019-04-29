/*
    This sprite table was generated using 'conv_to_sv.py'. Find out more here: https://github.com/Atrifex/ECE385-HelperTools
    To use, instantiate this module in your color mapper. The SpriteX input should be connected to
        'ObjectXSize - DistX', where ObjectXSize is the width of your object in pixels along the
        x direction. DistX is the horizontal distance between the DrawX pxiel and the top left corner
        of the object in question, so something like: 'DistX = DrawX - ObjectXPosition' is fine.
        Similarly this goes for SpriteY. Warning: If you don't do this, your image will be flipped along
        the axis you ignored. This is a handy way to flip an image if you need to, though.
 
    In the color mapper, you can then simply do something like:
    module ColorMapper(...)
    ...
    logic [7:0] ObjectR, ObjectG, ObjectB
    parameter ObjectXSize = 10'd10;
    parameter ObjectYSize = 10'd10;
    ...
    always_comb
    ...
         if(ObjectOn == 1'b1)
         begin
             Red = ObjectR
             Green = ObjectG
             Blue = ObjectB
         end
     ...
     ObjectSpriteTable ost(
                           .SpriteX(ObjectXSize - DistX), .SpriteY(ObjectYSize - DistY),
                           .SpriteR(ObjectR), .SpriteG(ObjectG), .SpriteB(ObjectB)
                           );
 
     See the comment at the top of the generation script if you're still confused.
*/
module numlookup(input [9:0] SpriteX, SpriteY,
            output [7:0] SpriteR, SpriteG, SpriteB);

logic [9:0] X_Index, Y_Index;

assign X_Index = SpriteX % 10'd8;
assign Y_Index = SpriteY % 10'd8;
logic [9:0] SpriteTableR;

parameter bit [7:0] SpritePaletteR[1:0] = '{8'd0, 8'd168};

	always_comb
	begin
		SpriteTableR = 10'd0;
		if(SpriteX >= 10'd0 && SpriteX < 10'd8 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableR = SpriteTableR_0_0[Y_Index][X_Index];
		end
		else
		if(SpriteX >= 10'd8 && SpriteX < 10'd16 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableR = SpriteTableR_1_0[Y_Index][X_Index];
		end
		else
		if(SpriteX >= 10'd16 && SpriteX < 10'd24 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableR = SpriteTableR_2_0[Y_Index][X_Index];
		end
		else
		if(SpriteX >= 10'd24 && SpriteX < 10'd32 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableR = SpriteTableR_3_0[Y_Index][X_Index];
		end
		else
		if(SpriteX >= 10'd32 && SpriteX < 10'd40 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableR = SpriteTableR_4_0[Y_Index][X_Index];
		end
		else
		if(SpriteX >= 10'd40 && SpriteX < 10'd48 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableR = SpriteTableR_5_0[Y_Index][X_Index];
		end
		else
		if(SpriteX >= 10'd48 && SpriteX < 10'd56 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableR = SpriteTableR_6_0[Y_Index][X_Index];
		end
		else
		if(SpriteX >= 10'd56 && SpriteX < 10'd64 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableR = SpriteTableR_7_0[Y_Index][X_Index];
		end
		else
		if(SpriteX >= 10'd64 && SpriteX < 10'd72 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableR = SpriteTableR_8_0[Y_Index][X_Index];
		end
		else
		if(SpriteX >= 10'd72 && SpriteX < 10'd80 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableR = SpriteTableR_9_0[Y_Index][X_Index];
		end
		else
		if(SpriteX >= 10'd80 && SpriteX < 10'd88 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableR = SpriteTableR_10_0[Y_Index][X_Index];
		end
		else
		if(SpriteX >= 10'd88 && SpriteX < 10'd96 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableR = SpriteTableR_11_0[Y_Index][X_Index];
		end
		else
		if(SpriteX >= 10'd96 && SpriteX < 10'd104 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableR = SpriteTableR_12_0[Y_Index][X_Index];
		end
		else
		if(SpriteX >= 10'd104 && SpriteX < 10'd106 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableR = SpriteTableR_13_0[Y_Index][X_Index];
		end
	end

parameter bit [0:0] SpriteTableR_0_0[7:0][7:0] = '{'{1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0},
'{1'd0,1'd0,1'd1,1'd1,1'd1,1'd1,1'd0,1'd0},
'{1'd0,1'd1,1'd1,1'd1,1'd0,1'd1,1'd1,1'd0},
'{1'd0,1'd1,1'd1,1'd1,1'd0,1'd1,1'd1,1'd0},
'{1'd0,1'd1,1'd1,1'd1,1'd0,1'd1,1'd1,1'd0},
'{1'd0,1'd1,1'd1,1'd1,1'd0,1'd1,1'd1,1'd0},
'{1'd0,1'd0,1'd1,1'd1,1'd1,1'd1,1'd0,1'd0},
'{1'd0,1'd0,1'd1,1'd1,1'd1,1'd1,1'd0,1'd0}};

parameter bit [0:0] SpriteTableR_1_0[7:0][7:0] = '{'{1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0},
'{1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd1,1'd1},
'{1'd0,1'd0,1'd0,1'd0,1'd0,1'd1,1'd1,1'd1},
'{1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd1,1'd1},
'{1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd1,1'd1},
'{1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd1,1'd1},
'{1'd0,1'd0,1'd0,1'd0,1'd0,1'd1,1'd1,1'd1},
'{1'd0,1'd0,1'd0,1'd0,1'd0,1'd1,1'd1,1'd1}};

parameter bit [0:0] SpriteTableR_2_0[7:0][7:0] = '{'{1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0},
'{1'd1,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0},
'{1'd1,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd1},
'{1'd1,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0},
'{1'd1,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0},
'{1'd1,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd1},
'{1'd1,1'd1,1'd0,1'd0,1'd0,1'd0,1'd0,1'd1},
'{1'd1,1'd1,1'd0,1'd0,1'd0,1'd0,1'd0,1'd1}};

parameter bit [0:0] SpriteTableR_3_0[7:0][7:0] = '{'{1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0},
'{1'd1,1'd1,1'd1,1'd1,1'd1,1'd0,1'd0,1'd0},
'{1'd1,1'd0,1'd0,1'd1,1'd1,1'd1,1'd0,1'd0},
'{1'd0,1'd0,1'd0,1'd1,1'd1,1'd1,1'd0,1'd0},
'{1'd1,1'd1,1'd1,1'd1,1'd1,1'd0,1'd0,1'd0},
'{1'd1,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0},
'{1'd1,1'd1,1'd1,1'd1,1'd1,1'd1,1'd0,1'd0},
'{1'd1,1'd1,1'd1,1'd1,1'd1,1'd1,1'd0,1'd0}};

parameter bit [0:0] SpriteTableR_4_0[7:0][7:0] = '{'{1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0},
'{1'd0,1'd1,1'd1,1'd1,1'd1,1'd1,1'd1,1'd1},
'{1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd1,1'd1},
'{1'd0,1'd0,1'd0,1'd0,1'd1,1'd1,1'd1,1'd0},
'{1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd1,1'd1},
'{1'd0,1'd1,1'd1,1'd0,1'd0,1'd0,1'd1,1'd1},
'{1'd0,1'd0,1'd0,1'd1,1'd1,1'd1,1'd1,1'd0},
'{1'd0,1'd0,1'd0,1'd1,1'd1,1'd1,1'd1,1'd0}};

parameter bit [0:0] SpriteTableR_5_0[7:0][7:0] = '{'{1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0},
'{1'd1,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd1},
'{1'd1,1'd0,1'd0,1'd0,1'd0,1'd1,1'd1,1'd0},
'{1'd0,1'd0,1'd0,1'd0,1'd0,1'd1,1'd1,1'd0},
'{1'd1,1'd0,1'd0,1'd0,1'd1,1'd0,1'd0,1'd0},
'{1'd1,1'd0,1'd0,1'd0,1'd1,1'd1,1'd1,1'd1},
'{1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0},
'{1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0}};

parameter bit [0:0] SpriteTableR_6_0[7:0][7:0] = '{'{1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0},
'{1'd1,1'd1,1'd0,1'd0,1'd0,1'd0,1'd0,1'd1},
'{1'd1,1'd1,1'd0,1'd0,1'd0,1'd0,1'd0,1'd1},
'{1'd1,1'd1,1'd0,1'd0,1'd0,1'd0,1'd0,1'd1},
'{1'd1,1'd1,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0},
'{1'd1,1'd1,1'd1,1'd0,1'd0,1'd0,1'd0,1'd1},
'{1'd1,1'd1,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0},
'{1'd1,1'd1,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0}};

parameter bit [0:0] SpriteTableR_7_0[7:0][7:0] = '{'{1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0},
'{1'd1,1'd1,1'd1,1'd1,1'd1,1'd0,1'd0,1'd0},
'{1'd1,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0},
'{1'd1,1'd1,1'd1,1'd1,1'd1,1'd0,1'd0,1'd0},
'{1'd0,1'd0,1'd0,1'd0,1'd1,1'd1,1'd0,1'd0},
'{1'd1,1'd0,1'd0,1'd0,1'd1,1'd1,1'd0,1'd0},
'{1'd1,1'd1,1'd1,1'd1,1'd1,1'd0,1'd0,1'd0},
'{1'd1,1'd1,1'd1,1'd1,1'd1,1'd0,1'd0,1'd0}};

parameter bit [0:0] SpriteTableR_8_0[7:0][7:0] = '{'{1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0},
'{1'd0,1'd0,1'd0,1'd1,1'd1,1'd1,1'd1,1'd1},
'{1'd0,1'd0,1'd1,1'd1,1'd0,1'd0,1'd0,1'd0},
'{1'd0,1'd0,1'd1,1'd1,1'd1,1'd1,1'd1,1'd1},
'{1'd0,1'd0,1'd1,1'd1,1'd0,1'd0,1'd1,1'd1},
'{1'd0,1'd0,1'd1,1'd1,1'd0,1'd0,1'd1,1'd1},
'{1'd0,1'd0,1'd0,1'd1,1'd1,1'd1,1'd1,1'd1},
'{1'd0,1'd0,1'd0,1'd1,1'd1,1'd1,1'd1,1'd1}};

parameter bit [0:0] SpriteTableR_9_0[7:0][7:0] = '{'{1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0},
'{1'd0,1'd0,1'd0,1'd0,1'd1,1'd1,1'd1,1'd1},
'{1'd0,1'd0,1'd0,1'd0,1'd1,1'd1,1'd1,1'd0},
'{1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0},
'{1'd1,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd1},
'{1'd1,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd1},
'{1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd1},
'{1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd1}};

parameter bit [0:0] SpriteTableR_10_0[7:0][7:0] = '{'{1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0},
'{1'd1,1'd1,1'd1,1'd1,1'd0,1'd0,1'd0,1'd0},
'{1'd0,1'd1,1'd1,1'd1,1'd0,1'd0,1'd0,1'd1},
'{1'd1,1'd1,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0},
'{1'd1,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd1},
'{1'd1,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd1},
'{1'd1,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0},
'{1'd1,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0}};

parameter bit [0:0] SpriteTableR_11_0[7:0][7:0] = '{'{1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0},
'{1'd1,1'd1,1'd1,1'd1,1'd1,1'd0,1'd0,1'd0},
'{1'd1,1'd1,1'd0,1'd0,1'd1,1'd1,1'd0,1'd0},
'{1'd1,1'd1,1'd1,1'd1,1'd1,1'd0,1'd0,1'd0},
'{1'd1,1'd1,1'd0,1'd0,1'd1,1'd1,1'd0,1'd0},
'{1'd1,1'd1,1'd0,1'd0,1'd1,1'd1,1'd0,1'd0},
'{1'd1,1'd1,1'd1,1'd1,1'd1,1'd0,1'd0,1'd0},
'{1'd1,1'd1,1'd1,1'd1,1'd1,1'd0,1'd0,1'd0}};

parameter bit [0:0] SpriteTableR_12_0[7:0][7:0] = '{'{1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0},
'{1'd0,1'd0,1'd0,1'd1,1'd1,1'd1,1'd1,1'd1},
'{1'd0,1'd0,1'd1,1'd1,1'd0,1'd0,1'd0,1'd1},
'{1'd0,1'd0,1'd1,1'd1,1'd0,1'd0,1'd0,1'd1},
'{1'd0,1'd0,1'd0,1'd1,1'd1,1'd1,1'd1,1'd1},
'{1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd0,1'd1},
'{1'd0,1'd0,1'd0,1'd1,1'd1,1'd1,1'd1,1'd1},
'{1'd0,1'd0,1'd0,1'd1,1'd1,1'd1,1'd1,1'd1}};

parameter bit [0:0] SpriteTableR_13_0[1:0][7:0] = '{'{1'd0,1'd0,1'd0,1'd0,1'd1,1'd0,1'd1,1'd0},
'{1'd1,1'd0,1'd1,1'd0,1'd0,1'd0,1'd0,1'd0}};

logic [9:0] SpriteTableG;

parameter bit [7:0] SpritePaletteG[2:0] = '{8'd0, 8'd128, 8'd168};

	always_comb
	begin
		SpriteTableG = 10'd0;
		if(SpriteX >= 10'd0 && SpriteX < 10'd8 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableG = SpriteTableG_0_0[Y_Index][X_Index];
		end
		else
		if(SpriteX >= 10'd8 && SpriteX < 10'd16 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableG = SpriteTableG_1_0[Y_Index][X_Index];
		end
		else
		if(SpriteX >= 10'd16 && SpriteX < 10'd24 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableG = SpriteTableG_2_0[Y_Index][X_Index];
		end
		else
		if(SpriteX >= 10'd24 && SpriteX < 10'd32 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableG = SpriteTableG_3_0[Y_Index][X_Index];
		end
		else
		if(SpriteX >= 10'd32 && SpriteX < 10'd40 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableG = SpriteTableG_4_0[Y_Index][X_Index];
		end
		else
		if(SpriteX >= 10'd40 && SpriteX < 10'd48 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableG = SpriteTableG_5_0[Y_Index][X_Index];
		end
		else
		if(SpriteX >= 10'd48 && SpriteX < 10'd56 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableG = SpriteTableG_6_0[Y_Index][X_Index];
		end
		else
		if(SpriteX >= 10'd56 && SpriteX < 10'd64 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableG = SpriteTableG_7_0[Y_Index][X_Index];
		end
		else
		if(SpriteX >= 10'd64 && SpriteX < 10'd72 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableG = SpriteTableG_8_0[Y_Index][X_Index];
		end
		else
		if(SpriteX >= 10'd72 && SpriteX < 10'd80 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableG = SpriteTableG_9_0[Y_Index][X_Index];
		end
		else
		if(SpriteX >= 10'd80 && SpriteX < 10'd88 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableG = SpriteTableG_10_0[Y_Index][X_Index];
		end
		else
		if(SpriteX >= 10'd88 && SpriteX < 10'd96 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableG = SpriteTableG_11_0[Y_Index][X_Index];
		end
		else
		if(SpriteX >= 10'd96 && SpriteX < 10'd104 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableG = SpriteTableG_12_0[Y_Index][X_Index];
		end
		else
		if(SpriteX >= 10'd104 && SpriteX < 10'd106 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableG = SpriteTableG_13_0[Y_Index][X_Index];
		end
	end

parameter bit [1:0] SpriteTableG_0_0[7:0][7:0] = '{'{2'd0,2'd0,2'd0,2'd0,2'd0,2'd0,2'd0,2'd0},
'{2'd0,2'd0,2'd2,2'd2,2'd2,2'd2,2'd0,2'd0},
'{2'd0,2'd2,2'd2,2'd2,2'd0,2'd2,2'd2,2'd0},
'{2'd0,2'd2,2'd2,2'd2,2'd0,2'd2,2'd2,2'd0},
'{2'd0,2'd2,2'd2,2'd2,2'd0,2'd2,2'd2,2'd0},
'{2'd0,2'd2,2'd2,2'd2,2'd0,2'd2,2'd2,2'd0},
'{2'd0,2'd0,2'd2,2'd2,2'd2,2'd2,2'd0,2'd0},
'{2'd0,2'd0,2'd2,2'd2,2'd2,2'd2,2'd0,2'd0}};

parameter bit [1:0] SpriteTableG_1_0[7:0][7:0] = '{'{2'd0,2'd0,2'd1,2'd0,2'd0,2'd0,2'd0,2'd0},
'{2'd0,2'd0,2'd1,2'd0,2'd0,2'd0,2'd2,2'd2},
'{2'd0,2'd0,2'd1,2'd0,2'd0,2'd2,2'd2,2'd2},
'{2'd0,2'd0,2'd1,2'd0,2'd0,2'd0,2'd2,2'd2},
'{2'd0,2'd0,2'd1,2'd0,2'd0,2'd0,2'd2,2'd2},
'{2'd0,2'd0,2'd1,2'd0,2'd0,2'd0,2'd2,2'd2},
'{2'd0,2'd0,2'd1,2'd0,2'd0,2'd2,2'd2,2'd2},
'{2'd0,2'd0,2'd1,2'd0,2'd0,2'd2,2'd2,2'd2}};

parameter bit [1:0] SpriteTableG_2_0[7:0][7:0] = '{'{2'd0,2'd0,2'd0,2'd0,2'd1,2'd0,2'd0,2'd0},
'{2'd2,2'd0,2'd0,2'd0,2'd1,2'd0,2'd0,2'd0},
'{2'd2,2'd0,2'd0,2'd0,2'd1,2'd0,2'd0,2'd2},
'{2'd2,2'd0,2'd0,2'd0,2'd1,2'd0,2'd0,2'd0},
'{2'd2,2'd0,2'd0,2'd0,2'd1,2'd0,2'd0,2'd0},
'{2'd2,2'd0,2'd0,2'd0,2'd1,2'd0,2'd0,2'd2},
'{2'd2,2'd2,2'd0,2'd0,2'd1,2'd0,2'd0,2'd2},
'{2'd2,2'd2,2'd0,2'd0,2'd1,2'd0,2'd0,2'd2}};

parameter bit [1:0] SpriteTableG_3_0[7:0][7:0] = '{'{2'd0,2'd0,2'd0,2'd0,2'd0,2'd0,2'd0,2'd1},
'{2'd2,2'd2,2'd2,2'd2,2'd2,2'd0,2'd0,2'd1},
'{2'd2,2'd0,2'd0,2'd2,2'd2,2'd2,2'd0,2'd1},
'{2'd0,2'd0,2'd0,2'd2,2'd2,2'd2,2'd0,2'd1},
'{2'd2,2'd2,2'd2,2'd2,2'd2,2'd0,2'd0,2'd1},
'{2'd2,2'd0,2'd0,2'd0,2'd0,2'd0,2'd0,2'd1},
'{2'd2,2'd2,2'd2,2'd2,2'd2,2'd2,2'd0,2'd1},
'{2'd2,2'd2,2'd2,2'd2,2'd2,2'd2,2'd0,2'd1}};

parameter bit [1:0] SpriteTableG_4_0[7:0][7:0] = '{'{2'd0,2'd0,2'd0,2'd0,2'd0,2'd0,2'd0,2'd0},
'{2'd0,2'd2,2'd2,2'd2,2'd2,2'd2,2'd2,2'd2},
'{2'd0,2'd0,2'd0,2'd0,2'd0,2'd0,2'd2,2'd2},
'{2'd0,2'd0,2'd0,2'd0,2'd2,2'd2,2'd2,2'd0},
'{2'd0,2'd0,2'd0,2'd0,2'd0,2'd0,2'd2,2'd2},
'{2'd0,2'd2,2'd2,2'd0,2'd0,2'd0,2'd2,2'd2},
'{2'd0,2'd0,2'd0,2'd2,2'd2,2'd2,2'd2,2'd0},
'{2'd0,2'd0,2'd0,2'd2,2'd2,2'd2,2'd2,2'd0}};

parameter bit [1:0] SpriteTableG_5_0[7:0][7:0] = '{'{2'd0,2'd0,2'd1,2'd0,2'd0,2'd0,2'd0,2'd0},
'{2'd2,2'd0,2'd1,2'd0,2'd0,2'd0,2'd0,2'd2},
'{2'd2,2'd0,2'd1,2'd0,2'd0,2'd2,2'd2,2'd0},
'{2'd0,2'd0,2'd1,2'd0,2'd0,2'd2,2'd2,2'd0},
'{2'd2,2'd0,2'd1,2'd0,2'd2,2'd0,2'd0,2'd0},
'{2'd2,2'd0,2'd1,2'd0,2'd2,2'd2,2'd2,2'd2},
'{2'd0,2'd0,2'd1,2'd0,2'd0,2'd0,2'd0,2'd0},
'{2'd0,2'd0,2'd1,2'd0,2'd0,2'd0,2'd0,2'd0}};

parameter bit [1:0] SpriteTableG_6_0[7:0][7:0] = '{'{2'd0,2'd0,2'd0,2'd0,2'd0,2'd1,2'd0,2'd0},
'{2'd2,2'd2,2'd0,2'd0,2'd0,2'd1,2'd0,2'd2},
'{2'd2,2'd2,2'd0,2'd0,2'd0,2'd1,2'd0,2'd2},
'{2'd2,2'd2,2'd0,2'd0,2'd0,2'd1,2'd0,2'd2},
'{2'd2,2'd2,2'd0,2'd0,2'd0,2'd1,2'd0,2'd0},
'{2'd2,2'd2,2'd2,2'd0,2'd0,2'd1,2'd0,2'd2},
'{2'd2,2'd2,2'd0,2'd0,2'd0,2'd1,2'd0,2'd0},
'{2'd2,2'd2,2'd0,2'd0,2'd0,2'd1,2'd0,2'd0}};

parameter bit [1:0] SpriteTableG_7_0[7:0][7:0] = '{'{2'd0,2'd0,2'd0,2'd0,2'd0,2'd0,2'd0,2'd1},
'{2'd2,2'd2,2'd2,2'd2,2'd2,2'd0,2'd0,2'd1},
'{2'd2,2'd0,2'd0,2'd0,2'd0,2'd0,2'd0,2'd1},
'{2'd2,2'd2,2'd2,2'd2,2'd2,2'd0,2'd0,2'd1},
'{2'd0,2'd0,2'd0,2'd0,2'd2,2'd2,2'd0,2'd1},
'{2'd2,2'd0,2'd0,2'd0,2'd2,2'd2,2'd0,2'd1},
'{2'd2,2'd2,2'd2,2'd2,2'd2,2'd0,2'd0,2'd1},
'{2'd2,2'd2,2'd2,2'd2,2'd2,2'd0,2'd0,2'd1}};

parameter bit [1:0] SpriteTableG_8_0[7:0][7:0] = '{'{2'd0,2'd0,2'd0,2'd0,2'd0,2'd0,2'd0,2'd0},
'{2'd0,2'd0,2'd0,2'd2,2'd2,2'd2,2'd2,2'd2},
'{2'd0,2'd0,2'd2,2'd2,2'd0,2'd0,2'd0,2'd0},
'{2'd0,2'd0,2'd2,2'd2,2'd2,2'd2,2'd2,2'd2},
'{2'd0,2'd0,2'd2,2'd2,2'd0,2'd0,2'd2,2'd2},
'{2'd0,2'd0,2'd2,2'd2,2'd0,2'd0,2'd2,2'd2},
'{2'd0,2'd0,2'd0,2'd2,2'd2,2'd2,2'd2,2'd2},
'{2'd0,2'd0,2'd0,2'd2,2'd2,2'd2,2'd2,2'd2}};

parameter bit [1:0] SpriteTableG_9_0[7:0][7:0] = '{'{2'd0,2'd0,2'd1,2'd0,2'd0,2'd0,2'd0,2'd0},
'{2'd0,2'd0,2'd1,2'd0,2'd2,2'd2,2'd2,2'd2},
'{2'd0,2'd0,2'd1,2'd0,2'd2,2'd2,2'd2,2'd0},
'{2'd0,2'd0,2'd1,2'd0,2'd0,2'd0,2'd0,2'd0},
'{2'd2,2'd0,2'd1,2'd0,2'd0,2'd0,2'd0,2'd2},
'{2'd2,2'd0,2'd1,2'd0,2'd0,2'd0,2'd0,2'd2},
'{2'd0,2'd0,2'd1,2'd0,2'd0,2'd0,2'd0,2'd2},
'{2'd0,2'd0,2'd1,2'd0,2'd0,2'd0,2'd0,2'd2}};

parameter bit [1:0] SpriteTableG_10_0[7:0][7:0] = '{'{2'd0,2'd0,2'd0,2'd0,2'd0,2'd1,2'd0,2'd0},
'{2'd2,2'd2,2'd2,2'd2,2'd0,2'd1,2'd0,2'd0},
'{2'd0,2'd2,2'd2,2'd2,2'd0,2'd1,2'd0,2'd2},
'{2'd2,2'd2,2'd0,2'd0,2'd0,2'd1,2'd0,2'd0},
'{2'd2,2'd0,2'd0,2'd0,2'd0,2'd1,2'd0,2'd2},
'{2'd2,2'd0,2'd0,2'd0,2'd0,2'd1,2'd0,2'd2},
'{2'd2,2'd0,2'd0,2'd0,2'd0,2'd1,2'd0,2'd0},
'{2'd2,2'd0,2'd0,2'd0,2'd0,2'd1,2'd0,2'd0}};

parameter bit [1:0] SpriteTableG_11_0[7:0][7:0] = '{'{2'd0,2'd0,2'd0,2'd0,2'd0,2'd0,2'd0,2'd0},
'{2'd2,2'd2,2'd2,2'd2,2'd2,2'd0,2'd0,2'd0},
'{2'd2,2'd2,2'd0,2'd0,2'd2,2'd2,2'd0,2'd0},
'{2'd2,2'd2,2'd2,2'd2,2'd2,2'd0,2'd0,2'd0},
'{2'd2,2'd2,2'd0,2'd0,2'd2,2'd2,2'd0,2'd0},
'{2'd2,2'd2,2'd0,2'd0,2'd2,2'd2,2'd0,2'd0},
'{2'd2,2'd2,2'd2,2'd2,2'd2,2'd0,2'd0,2'd0},
'{2'd2,2'd2,2'd2,2'd2,2'd2,2'd0,2'd0,2'd0}};

parameter bit [1:0] SpriteTableG_12_0[7:0][7:0] = '{'{2'd1,2'd0,2'd0,2'd0,2'd0,2'd0,2'd0,2'd0},
'{2'd1,2'd0,2'd0,2'd2,2'd2,2'd2,2'd2,2'd2},
'{2'd1,2'd0,2'd2,2'd2,2'd0,2'd0,2'd0,2'd2},
'{2'd1,2'd0,2'd2,2'd2,2'd0,2'd0,2'd0,2'd2},
'{2'd1,2'd0,2'd0,2'd2,2'd2,2'd2,2'd2,2'd2},
'{2'd1,2'd0,2'd0,2'd0,2'd0,2'd0,2'd0,2'd2},
'{2'd1,2'd0,2'd0,2'd2,2'd2,2'd2,2'd2,2'd2},
'{2'd1,2'd0,2'd0,2'd2,2'd2,2'd2,2'd2,2'd2}};

parameter bit [1:0] SpriteTableG_13_0[1:0][7:0] = '{'{2'd0,2'd0,2'd0,2'd0,2'd2,2'd0,2'd2,2'd0},
'{2'd2,2'd0,2'd2,2'd0,2'd0,2'd0,2'd0,2'd0}};

logic [9:0] SpriteTableB;

parameter bit [7:0] SpritePaletteB[2:0] = '{8'd0, 8'd128, 8'd168};

	always_comb
	begin
		SpriteTableB = 10'd0;
		if(SpriteX >= 10'd0 && SpriteX < 10'd8 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableB = SpriteTableB_0_0[Y_Index][X_Index];
		end
		else
		if(SpriteX >= 10'd8 && SpriteX < 10'd16 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableB = SpriteTableB_1_0[Y_Index][X_Index];
		end
		else
		if(SpriteX >= 10'd16 && SpriteX < 10'd24 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableB = SpriteTableB_2_0[Y_Index][X_Index];
		end
		else
		if(SpriteX >= 10'd24 && SpriteX < 10'd32 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableB = SpriteTableB_3_0[Y_Index][X_Index];
		end
		else
		if(SpriteX >= 10'd32 && SpriteX < 10'd40 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableB = SpriteTableB_4_0[Y_Index][X_Index];
		end
		else
		if(SpriteX >= 10'd40 && SpriteX < 10'd48 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableB = SpriteTableB_5_0[Y_Index][X_Index];
		end
		else
		if(SpriteX >= 10'd48 && SpriteX < 10'd56 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableB = SpriteTableB_6_0[Y_Index][X_Index];
		end
		else
		if(SpriteX >= 10'd56 && SpriteX < 10'd64 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableB = SpriteTableB_7_0[Y_Index][X_Index];
		end
		else
		if(SpriteX >= 10'd64 && SpriteX < 10'd72 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableB = SpriteTableB_8_0[Y_Index][X_Index];
		end
		else
		if(SpriteX >= 10'd72 && SpriteX < 10'd80 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableB = SpriteTableB_9_0[Y_Index][X_Index];
		end
		else
		if(SpriteX >= 10'd80 && SpriteX < 10'd88 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableB = SpriteTableB_10_0[Y_Index][X_Index];
		end
		else
		if(SpriteX >= 10'd88 && SpriteX < 10'd96 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableB = SpriteTableB_11_0[Y_Index][X_Index];
		end
		else
		if(SpriteX >= 10'd96 && SpriteX < 10'd104 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableB = SpriteTableB_12_0[Y_Index][X_Index];
		end
		else
		if(SpriteX >= 10'd104 && SpriteX < 10'd106 && SpriteY >= 10'd0 && SpriteY < 10'd8)
		begin
		    SpriteTableB = SpriteTableB_13_0[Y_Index][X_Index];
		end
	end

parameter bit [1:0] SpriteTableB_0_0[7:0][7:0] = '{'{2'd0,2'd0,2'd0,2'd0,2'd0,2'd0,2'd0,2'd0},
'{2'd0,2'd0,2'd2,2'd2,2'd2,2'd2,2'd0,2'd0},
'{2'd0,2'd2,2'd2,2'd2,2'd0,2'd2,2'd2,2'd0},
'{2'd0,2'd2,2'd2,2'd2,2'd0,2'd2,2'd2,2'd0},
'{2'd0,2'd2,2'd2,2'd2,2'd0,2'd2,2'd2,2'd0},
'{2'd0,2'd2,2'd2,2'd2,2'd0,2'd2,2'd2,2'd0},
'{2'd0,2'd0,2'd2,2'd2,2'd2,2'd2,2'd0,2'd0},
'{2'd0,2'd0,2'd2,2'd2,2'd2,2'd2,2'd0,2'd0}};

parameter bit [1:0] SpriteTableB_1_0[7:0][7:0] = '{'{2'd0,2'd0,2'd1,2'd0,2'd0,2'd0,2'd0,2'd0},
'{2'd0,2'd0,2'd1,2'd0,2'd0,2'd0,2'd2,2'd2},
'{2'd0,2'd0,2'd1,2'd0,2'd0,2'd2,2'd2,2'd2},
'{2'd0,2'd0,2'd1,2'd0,2'd0,2'd0,2'd2,2'd2},
'{2'd0,2'd0,2'd1,2'd0,2'd0,2'd0,2'd2,2'd2},
'{2'd0,2'd0,2'd1,2'd0,2'd0,2'd0,2'd2,2'd2},
'{2'd0,2'd0,2'd1,2'd0,2'd0,2'd2,2'd2,2'd2},
'{2'd0,2'd0,2'd1,2'd0,2'd0,2'd2,2'd2,2'd2}};

parameter bit [1:0] SpriteTableB_2_0[7:0][7:0] = '{'{2'd0,2'd0,2'd0,2'd0,2'd1,2'd0,2'd0,2'd0},
'{2'd2,2'd0,2'd0,2'd0,2'd1,2'd0,2'd0,2'd0},
'{2'd2,2'd0,2'd0,2'd0,2'd1,2'd0,2'd0,2'd2},
'{2'd2,2'd0,2'd0,2'd0,2'd1,2'd0,2'd0,2'd0},
'{2'd2,2'd0,2'd0,2'd0,2'd1,2'd0,2'd0,2'd0},
'{2'd2,2'd0,2'd0,2'd0,2'd1,2'd0,2'd0,2'd2},
'{2'd2,2'd2,2'd0,2'd0,2'd1,2'd0,2'd0,2'd2},
'{2'd2,2'd2,2'd0,2'd0,2'd1,2'd0,2'd0,2'd2}};

parameter bit [1:0] SpriteTableB_3_0[7:0][7:0] = '{'{2'd0,2'd0,2'd0,2'd0,2'd0,2'd0,2'd0,2'd1},
'{2'd2,2'd2,2'd2,2'd2,2'd2,2'd0,2'd0,2'd1},
'{2'd2,2'd0,2'd0,2'd2,2'd2,2'd2,2'd0,2'd1},
'{2'd0,2'd0,2'd0,2'd2,2'd2,2'd2,2'd0,2'd1},
'{2'd2,2'd2,2'd2,2'd2,2'd2,2'd0,2'd0,2'd1},
'{2'd2,2'd0,2'd0,2'd0,2'd0,2'd0,2'd0,2'd1},
'{2'd2,2'd2,2'd2,2'd2,2'd2,2'd2,2'd0,2'd1},
'{2'd2,2'd2,2'd2,2'd2,2'd2,2'd2,2'd0,2'd1}};

parameter bit [1:0] SpriteTableB_4_0[7:0][7:0] = '{'{2'd0,2'd0,2'd0,2'd0,2'd0,2'd0,2'd0,2'd0},
'{2'd0,2'd2,2'd2,2'd2,2'd2,2'd2,2'd2,2'd2},
'{2'd0,2'd0,2'd0,2'd0,2'd0,2'd0,2'd2,2'd2},
'{2'd0,2'd0,2'd0,2'd0,2'd2,2'd2,2'd2,2'd0},
'{2'd0,2'd0,2'd0,2'd0,2'd0,2'd0,2'd2,2'd2},
'{2'd0,2'd2,2'd2,2'd0,2'd0,2'd0,2'd2,2'd2},
'{2'd0,2'd0,2'd0,2'd2,2'd2,2'd2,2'd2,2'd0},
'{2'd0,2'd0,2'd0,2'd2,2'd2,2'd2,2'd2,2'd0}};

parameter bit [1:0] SpriteTableB_5_0[7:0][7:0] = '{'{2'd0,2'd0,2'd1,2'd0,2'd0,2'd0,2'd0,2'd0},
'{2'd2,2'd0,2'd1,2'd0,2'd0,2'd0,2'd0,2'd2},
'{2'd2,2'd0,2'd1,2'd0,2'd0,2'd2,2'd2,2'd0},
'{2'd0,2'd0,2'd1,2'd0,2'd0,2'd2,2'd2,2'd0},
'{2'd2,2'd0,2'd1,2'd0,2'd2,2'd0,2'd0,2'd0},
'{2'd2,2'd0,2'd1,2'd0,2'd2,2'd2,2'd2,2'd2},
'{2'd0,2'd0,2'd1,2'd0,2'd0,2'd0,2'd0,2'd0},
'{2'd0,2'd0,2'd1,2'd0,2'd0,2'd0,2'd0,2'd0}};

parameter bit [1:0] SpriteTableB_6_0[7:0][7:0] = '{'{2'd0,2'd0,2'd0,2'd0,2'd0,2'd1,2'd0,2'd0},
'{2'd2,2'd2,2'd0,2'd0,2'd0,2'd1,2'd0,2'd2},
'{2'd2,2'd2,2'd0,2'd0,2'd0,2'd1,2'd0,2'd2},
'{2'd2,2'd2,2'd0,2'd0,2'd0,2'd1,2'd0,2'd2},
'{2'd2,2'd2,2'd0,2'd0,2'd0,2'd1,2'd0,2'd0},
'{2'd2,2'd2,2'd2,2'd0,2'd0,2'd1,2'd0,2'd2},
'{2'd2,2'd2,2'd0,2'd0,2'd0,2'd1,2'd0,2'd0},
'{2'd2,2'd2,2'd0,2'd0,2'd0,2'd1,2'd0,2'd0}};

parameter bit [1:0] SpriteTableB_7_0[7:0][7:0] = '{'{2'd0,2'd0,2'd0,2'd0,2'd0,2'd0,2'd0,2'd1},
'{2'd2,2'd2,2'd2,2'd2,2'd2,2'd0,2'd0,2'd1},
'{2'd2,2'd0,2'd0,2'd0,2'd0,2'd0,2'd0,2'd1},
'{2'd2,2'd2,2'd2,2'd2,2'd2,2'd0,2'd0,2'd1},
'{2'd0,2'd0,2'd0,2'd0,2'd2,2'd2,2'd0,2'd1},
'{2'd2,2'd0,2'd0,2'd0,2'd2,2'd2,2'd0,2'd1},
'{2'd2,2'd2,2'd2,2'd2,2'd2,2'd0,2'd0,2'd1},
'{2'd2,2'd2,2'd2,2'd2,2'd2,2'd0,2'd0,2'd1}};

parameter bit [1:0] SpriteTableB_8_0[7:0][7:0] = '{'{2'd0,2'd0,2'd0,2'd0,2'd0,2'd0,2'd0,2'd0},
'{2'd0,2'd0,2'd0,2'd2,2'd2,2'd2,2'd2,2'd2},
'{2'd0,2'd0,2'd2,2'd2,2'd0,2'd0,2'd0,2'd0},
'{2'd0,2'd0,2'd2,2'd2,2'd2,2'd2,2'd2,2'd2},
'{2'd0,2'd0,2'd2,2'd2,2'd0,2'd0,2'd2,2'd2},
'{2'd0,2'd0,2'd2,2'd2,2'd0,2'd0,2'd2,2'd2},
'{2'd0,2'd0,2'd0,2'd2,2'd2,2'd2,2'd2,2'd2},
'{2'd0,2'd0,2'd0,2'd2,2'd2,2'd2,2'd2,2'd2}};

parameter bit [1:0] SpriteTableB_9_0[7:0][7:0] = '{'{2'd0,2'd0,2'd1,2'd0,2'd0,2'd0,2'd0,2'd0},
'{2'd0,2'd0,2'd1,2'd0,2'd2,2'd2,2'd2,2'd2},
'{2'd0,2'd0,2'd1,2'd0,2'd2,2'd2,2'd2,2'd0},
'{2'd0,2'd0,2'd1,2'd0,2'd0,2'd0,2'd0,2'd0},
'{2'd2,2'd0,2'd1,2'd0,2'd0,2'd0,2'd0,2'd2},
'{2'd2,2'd0,2'd1,2'd0,2'd0,2'd0,2'd0,2'd2},
'{2'd0,2'd0,2'd1,2'd0,2'd0,2'd0,2'd0,2'd2},
'{2'd0,2'd0,2'd1,2'd0,2'd0,2'd0,2'd0,2'd2}};

parameter bit [1:0] SpriteTableB_10_0[7:0][7:0] = '{'{2'd0,2'd0,2'd0,2'd0,2'd0,2'd1,2'd0,2'd0},
'{2'd2,2'd2,2'd2,2'd2,2'd0,2'd1,2'd0,2'd0},
'{2'd0,2'd2,2'd2,2'd2,2'd0,2'd1,2'd0,2'd2},
'{2'd2,2'd2,2'd0,2'd0,2'd0,2'd1,2'd0,2'd0},
'{2'd2,2'd0,2'd0,2'd0,2'd0,2'd1,2'd0,2'd2},
'{2'd2,2'd0,2'd0,2'd0,2'd0,2'd1,2'd0,2'd2},
'{2'd2,2'd0,2'd0,2'd0,2'd0,2'd1,2'd0,2'd0},
'{2'd2,2'd0,2'd0,2'd0,2'd0,2'd1,2'd0,2'd0}};

parameter bit [1:0] SpriteTableB_11_0[7:0][7:0] = '{'{2'd0,2'd0,2'd0,2'd0,2'd0,2'd0,2'd0,2'd0},
'{2'd2,2'd2,2'd2,2'd2,2'd2,2'd0,2'd0,2'd0},
'{2'd2,2'd2,2'd0,2'd0,2'd2,2'd2,2'd0,2'd0},
'{2'd2,2'd2,2'd2,2'd2,2'd2,2'd0,2'd0,2'd0},
'{2'd2,2'd2,2'd0,2'd0,2'd2,2'd2,2'd0,2'd0},
'{2'd2,2'd2,2'd0,2'd0,2'd2,2'd2,2'd0,2'd0},
'{2'd2,2'd2,2'd2,2'd2,2'd2,2'd0,2'd0,2'd0},
'{2'd2,2'd2,2'd2,2'd2,2'd2,2'd0,2'd0,2'd0}};

parameter bit [1:0] SpriteTableB_12_0[7:0][7:0] = '{'{2'd1,2'd0,2'd0,2'd0,2'd0,2'd0,2'd0,2'd0},
'{2'd1,2'd0,2'd0,2'd2,2'd2,2'd2,2'd2,2'd2},
'{2'd1,2'd0,2'd2,2'd2,2'd0,2'd0,2'd0,2'd2},
'{2'd1,2'd0,2'd2,2'd2,2'd0,2'd0,2'd0,2'd2},
'{2'd1,2'd0,2'd0,2'd2,2'd2,2'd2,2'd2,2'd2},
'{2'd1,2'd0,2'd0,2'd0,2'd0,2'd0,2'd0,2'd2},
'{2'd1,2'd0,2'd0,2'd2,2'd2,2'd2,2'd2,2'd2},
'{2'd1,2'd0,2'd0,2'd2,2'd2,2'd2,2'd2,2'd2}};

parameter bit [1:0] SpriteTableB_13_0[1:0][7:0] = '{'{2'd0,2'd0,2'd0,2'd0,2'd2,2'd0,2'd2,2'd0},
'{2'd2,2'd0,2'd2,2'd0,2'd0,2'd0,2'd0,2'd0}};

assign SpriteR = SpritePaletteR[SpriteTableR];
assign SpriteG = SpritePaletteG[SpriteTableG];
assign SpriteB = SpritePaletteB[SpriteTableB];

endmodule
