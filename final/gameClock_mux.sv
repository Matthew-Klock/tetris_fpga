module gameClock_mux(
input logic Clk,
input logic VGA_VS,
input logic reset,
input logic [7:0] keycode,
input logic [2:0] state,
output logic gameClk
);

logic select, select_in, ready, ready_in;
always_ff @ (posedge Clk)
begin
if(reset)
begin
select <= 0;
ready <= 1;
end
else
begin
select <= select_in;
ready <= ready_in;
end

end
always_comb
begin
if(keycode == 8'h2c && (ready == 1'b1))
begin
select_in = 1'b1;
ready_in = 1'b0;
end

else if(state == 3'b010)
begin 
select_in = 1'b0;

if(keycode == 8'h2c)
ready_in = 1'b0;
else 
ready_in = 1'b1;

end

else 
begin
select_in <= select;

if(keycode == 8'h2c)
ready_in = 1'b0;
else 
ready_in = 1'b1;
end

end

always_comb
begin
if(select)
gameClk = Clk;
else 
gameClk = VGA_VS;
end





endmodule