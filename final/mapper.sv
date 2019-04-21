module mapper(input logic  [9:0] rows [21:0],
				  input logic [9:0] blocks [21:0] , 
			     output logic [9:0] map_b [21:0]);
always_comb
begin
for(int i = 0; i<  22; i++)	
begin			  
map_b[i] = rows[i] | blocks[i]; 
end	
end	  
endmodule 