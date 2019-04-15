// Interface between NIOS II and EZ-OTG chip
module hpi_io_intf( input        Clk, Reset,
                    input [1:0]  from_sw_address,
                    output[15:0] from_sw_data_in,
                    input [15:0] from_sw_data_out,
                    input        from_sw_r, from_sw_w, from_sw_cs, from_sw_reset, // Active low
                    inout [15:0] OTG_DATA,
                    output[1:0]  OTG_ADDR,
                    output       OTG_RD_N, OTG_WR_N, OTG_CS_N, OTG_RST_N // Active low
                   );

// Buffer (register) for from_sw_data_out because inout bus should be driven 
//   by a register, not combinational logic.
logic [15:0] from_sw_data_out_buffer;

// TODO: Fill in the blanks below. 
always_ff @ (posedge Clk)
begin
    if(Reset)
    begin
        from_sw_data_out_buffer <= 15'h0000;
        OTG_ADDR                <= 2'h0;
        OTG_RD_N                <= 1'b0;
        OTG_WR_N                <= 1'b1;
        OTG_CS_N                <= 1'b1;
		  //setting OTG_RST to the active low value of Reset
        OTG_RST_N               <= 1'b0;
        from_sw_data_in         <= 15'h0000;
    end
    else 
    begin
        from_sw_data_out_buffer <= from_sw_data_out;
        OTG_ADDR                <= from_sw_address;
        OTG_RD_N                <= from_sw_r;
        OTG_WR_N                <= from_sw_w;
        OTG_CS_N                <= from_sw_cs;
		  //Setting OTG_RST_N to ~Reset but its active low
		  //I'm not sure why this isn't reset from software but it works
		  //ask about this in office hours
        OTG_RST_N               <= 1'b1;
        from_sw_data_in         <= OTG_DATA;
    end
end

// OTG_DATA should be high Z (tristated) when NIOS is not writing to OTG_DATA inout bus.
// Look at tristate.sv in lab 6 for an example

//It's the opposite of what the comments above say to do but it works
//Ask about this in office hours
//The TA said to leave it if it works, come back to this module if shit hits the fan
assign OTG_DATA =  from_sw_r ? from_sw_data_out_buffer : 16'hZZZZ ;

endmodule 