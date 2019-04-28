//-------------------------------------------------------------------------
//      lab8.sv                                                          --
//      Christine Chen                                                   --
//      Fall 2014                                                        --
//                                                                       --
//      Modified by Po-Han Huang                                         --
//      10/06/2017                                                       --
//                                                                       --
//      Fall 2017 Distribution                                           --
//                                                                       --
//      For use with ECE 385 Lab 8                                       --
//      UIUC ECE Department                                              --
//-------------------------------------------------------------------------


module lab8( input               CLOCK_50,
             input        [3:0]  KEY,          //bit 0 is set up as Reset
             output logic [6:0]  HEX0, HEX1,
             // VGA Interface 
             output logic [7:0]  VGA_R,        //VGA Red
                                 VGA_G,        //VGA Green
                                 VGA_B,        //VGA Blue
             output logic        VGA_CLK,      //VGA Clock
                                 VGA_SYNC_N,   //VGA Sync signal
                                 VGA_BLANK_N,  //VGA Blank signal
                                 VGA_VS,       //VGA virtical sync signal
                                 VGA_HS,       //VGA horizontal sync signal
             // CY7C67200 Interface
             inout  wire  [15:0] OTG_DATA,     //CY7C67200 Data bus 16 Bits
             output logic [1:0]  OTG_ADDR,     //CY7C67200 Address 2 Bits
             output logic        OTG_CS_N,     //CY7C67200 Chip Select
                                 OTG_RD_N,     //CY7C67200 Write
                                 OTG_WR_N,     //CY7C67200 Read
                                 OTG_RST_N,    //CY7C67200 Reset
             input               OTG_INT,      //CY7C67200 Interrupt
             // SDRAM Interface for Nios II Software
             output logic [12:0] DRAM_ADDR,    //SDRAM Address 13 Bits
             inout  wire  [31:0] DRAM_DQ,      //SDRAM Data 32 Bits
             output logic [1:0]  DRAM_BA,      //SDRAM Bank Address 2 Bits
             output logic [3:0]  DRAM_DQM,     //SDRAM Data Mast 4 Bits
             output logic        DRAM_RAS_N,   //SDRAM Row Address Strobe
                                 DRAM_CAS_N,   //SDRAM Column Address Strobe
                                 DRAM_CKE,     //SDRAM Clock Enable
                                 DRAM_WE_N,    //SDRAM Write Enable
                                 DRAM_CS_N,    //SDRAM Chip Select
                                 DRAM_CLK      //SDRAM Clock
                    );
    
    logic Reset_h, Clk;
    logic [7:0] keycode;
	 //assign keycode = 8'h1A;
    //delete this code
    assign Clk = CLOCK_50;
    always_ff @ (posedge Clk) begin
        Reset_h <= ~(KEY[1]);        // The push buttons are active low		  
		  
    end
    //legacy
    logic [1:0] hpi_addr;
    logic [15:0] hpi_data_in, hpi_data_out;
    logic hpi_r, hpi_w, hpi_cs, hpi_reset;
    //current pixel being drawn
	 logic [9:0] DrawX, DrawY;
	 //tells the color mapper to draw a block or not
	 logic is_block;
	 //tells the color mappper to draw the grid
	 logic is_grid;
	 //rows
	 logic [9:0] rows [21:0];
	//refreshes rows
	 logic [9:0] rows_in [21:0];
     //block register
     logic [9:0] blocks [21:0];
    //block next
     logic [9:0] blocks_in [21:0];
	  //tells the blocks if they can shift right or left
	  logic block_can_shift_right;
	  logic block_can_shift_left;
	  //tells if the block can rotate 
	  logic can_rotate;
	  //tells the next rotation
	  logic [9:0] next_rotation [21:0];
	  //keeps track of the rotation
	  int centerX, centerY;
	  //output to the screen
	 logic [9:0] map [21:0];
     //frame buffer?
     logic [9:0] map_b [21:0];
	 //output to write the piece to the two rows
	 logic [9:0] write [1:0];
	 logic [9:0] next_write [21:0];
	 //defines what/if rows are full and are giving the
	 logic [21:0] shift; 
	 //tell what rows to shift 
	 logic [21:0] shift_row;
	 //tells the piece to stop moving and to write it to the rows
     logic [21:0] stop;
     //tells the game to stop because it's donezo
     //only hooked up for the top two because they are the only ones that matter.
     logic [1:0] gameOver;
     //the state of the game (what the blocks should do)
     logic [2:0] state;	
	//the speed
		int speed; 
	//the next block
		logic [2:0] random;
	  //new blocks
	  logic [9:0] new_block [1:0];
	 always_ff @ (posedge Clk) begin 
		  	rows <= rows_in;        
            blocks <= blocks_in;
            map <= map_b;
    end


    // Interface between NIOS II and EZ-OTG chip
    hpi_io_intf hpi_io_inst(
                            .Clk(Clk),
                            .Reset(Reset_h),
                            // signals connected to NIOS II
                            .from_sw_address(hpi_addr),
                            .from_sw_data_in(hpi_data_in),
                            .from_sw_data_out(hpi_data_out),
                            .from_sw_r(hpi_r),
                            .from_sw_w(hpi_w),
                            .from_sw_cs(hpi_cs),
                            .from_sw_reset(hpi_reset),
                            // signals connected to EZ-OTG chip
                            .OTG_DATA(OTG_DATA),    
                            .OTG_ADDR(OTG_ADDR),    
                            .OTG_RD_N(OTG_RD_N),    
                            .OTG_WR_N(OTG_WR_N),    
                            .OTG_CS_N(OTG_CS_N),
                            .OTG_RST_N(OTG_RST_N)
    );
     
     // You need to make sure that the port names here match the ports in Qsys-generated codes.
     lab8_soc nios_system(
                             .clk_clk(Clk),         
                             .reset_reset_n(1'b1),    // Never reset NIOS
                             .sdram_wire_addr(DRAM_ADDR), 
                             .sdram_wire_ba(DRAM_BA),   
                             .sdram_wire_cas_n(DRAM_CAS_N),
                             .sdram_wire_cke(DRAM_CKE),  
                             .sdram_wire_cs_n(DRAM_CS_N), 
                             .sdram_wire_dq(DRAM_DQ),   
                             .sdram_wire_dqm(DRAM_DQM),  
                             .sdram_wire_ras_n(DRAM_RAS_N),
                             .sdram_wire_we_n(DRAM_WE_N), 
                             .sdram_clk_clk(DRAM_CLK),
                             .keycode_export(keycode),  
                             .otg_hpi_address_export(hpi_addr),
                             .otg_hpi_data_in_port(hpi_data_in),
                             .otg_hpi_data_out_port(hpi_data_out),
                             .otg_hpi_cs_export(hpi_cs),
                             .otg_hpi_r_export(hpi_r),
                             .otg_hpi_w_export(hpi_w),
                             .otg_hpi_reset_export(hpi_reset)
    );
    
    // Use PLL to generate the 25MHZ VGA_CLK.
    // You will have to generate it on your own in simulation.
    vga_clk vga_clk_instance(.inclk0(Clk), .c0(VGA_CLK));
    
    // TODO: Fill in the connections for the rest of the modules 
    VGA_controller vga_controller_instance(
	.*,
	.Reset(Reset_h),
	.DrawX,
	.DrawY
	 
	 );
	  Speed_select ss(.*);
    //used VGA_VS
    GameLogic game(.clk(VGA_VS), .reset(Reset_h), .shift, .stop, .gameOver, .shift_row, .out_state(state), .*); 

	 

	 fibonacci_lfsr randomn(.clk(VGA_VS), .reset(Reset_h), .data(random));
	 
	 next_Block block(.block(random), .new_block);
	 //use VGA_VS
	 block_actions act(.Clk(VGA_VS), .reset(Reset_h), .*);
	 //use VGA_VS
	 centerTracker center(.Clk(VGA_VS), .reset(Reset_h), .*);
	 mapper mapp(.rows, .blocks, .map_b);

	 block_mapper bmap(.DrawX, .DrawY, .map, .is_block(is_block));
	 grid_mapper gmap(.DrawX, .DrawY, .is_grid);
	 //clocked  off the VGA_VS 
	 //writes from the map when ws is high
	 //outputs next to its respective row
     //takes in shift_row if it is supposed to shift down
     //outputs shift if it detects a full row
	  //use VGA_VS
	 Row row21( .clk(VGA_VS), .reset(Reset_h), .state, .prev(10'b0) ,.write(map[21]), .next(rows_in[21]),    .shift_row(shift_row[21]) , .shift(shift[21]));
	 Row row20( .clk(VGA_VS), .reset(Reset_h), .state, .prev(rows[21]) ,.write(map[20]), .next(rows_in[20]), .shift_row(shift_row[20])  , .shift(shift[20]));
	 Row row19( .clk(VGA_VS), .reset(Reset_h), .state, .prev(rows[20]) ,.write(map[19]), .next(rows_in[19]), .shift_row(shift_row[19])  , .shift(shift[19]));
	 Row row18( .clk(VGA_VS), .reset(Reset_h), .state, .prev(rows[19]) ,.write(map[18]), .next(rows_in[18]),  .shift_row(shift_row[18])  , .shift(shift[18]));
    Row row17( .clk(VGA_VS), .reset(Reset_h), .state, .prev(rows[18]) ,.write(map[17]), .next(rows_in[17]),  .shift_row(shift_row[17])  , .shift(shift[17]));
	 Row row16( .clk(VGA_VS), .reset(Reset_h), .state, .prev(rows[17]) ,.write(map[16]), .next(rows_in[16]),  .shift_row(shift_row[16])  , .shift(shift[16]));
	 Row row15( .clk(VGA_VS), .reset(Reset_h), .state, .prev(rows[16]) ,.write(map[15]), .next(rows_in[15]),  .shift_row(shift_row[15])  , .shift(shift[15]));
	 Row row14( .clk(VGA_VS), .reset(Reset_h), .state, .prev(rows[15]) ,.write(map[14]), .next(rows_in[14]),  .shift_row(shift_row[14])  , .shift(shift[14]));
	 Row row13( .clk(VGA_VS), .reset(Reset_h), .state, .prev(rows[14]) ,.write(map[13]), .next(rows_in[13]),  .shift_row(shift_row[13])  , .shift(shift[13]));
	 Row row12( .clk(VGA_VS), .reset(Reset_h), .state, .prev(rows[13]) ,.write(map[12]), .next(rows_in[12]),  .shift_row(shift_row[12])  , .shift(shift[12])); 
	 Row row11( .clk(VGA_VS), .reset(Reset_h), .state, .prev(rows[12]) ,.write(map[11]), .next(rows_in[11]),  .shift_row(shift_row[11])  , .shift(shift[11]));
	 Row row10( .clk(VGA_VS), .reset(Reset_h), .state, .prev(rows[11]) ,.write(map[10]), .next(rows_in[10]),  .shift_row(shift_row[10])  , .shift(shift[10]));
	 Row row09( .clk(VGA_VS), .reset(Reset_h), .state, .prev(rows[10]) ,.write(map[9]), .next(rows_in[09]),   .shift_row(shift_row[9])  , .shift(shift[9]));
	 Row row08( .clk(VGA_VS), .reset(Reset_h), .state, .prev(rows[09]) ,.write(map[8]), .next(rows_in[08]),  .shift_row(shift_row[8])  , .shift(shift[8]));
     Row row07( .clk(VGA_VS), .reset(Reset_h), .state, .prev(rows[08]) ,.write(map[7]), .next(rows_in[07]),  .shift_row(shift_row[7])  , .shift(shift[7]));
	 Row row06( .clk(VGA_VS), .reset(Reset_h), .state, .prev(rows[07]) ,.write(map[6]), .next(rows_in[06]),  .shift_row(shift_row[6])  , .shift(shift[6]));
	 Row row05( .clk(VGA_VS), .reset(Reset_h), .state, .prev(rows[06]) ,.write(map[5]), .next(rows_in[05]),  .shift_row(shift_row[5])  , .shift(shift[5]));
	 Row row04( .clk(VGA_VS), .reset(Reset_h), .state, .prev(rows[05]) ,.write(map[4]), .next(rows_in[04]),  .shift_row(shift_row[4])  , .shift(shift[4]));
	 Row row03( .clk(VGA_VS), .reset(Reset_h), .state, .prev(rows[04]) ,.write(map[3]), .next(rows_in[03]),  .shift_row(shift_row[3])  , .shift(shift[3]));
	 Row row02( .clk(VGA_VS), .reset(Reset_h), .state, .prev(rows[03]) ,.write(map[2]), .next(rows_in[02]),  .shift_row(shift_row[2])  , .shift(shift[2]));
	 Row row01( .clk(VGA_VS), .reset(Reset_h), .state, .prev(rows[02]) ,.write(map[1]), .next(rows_in[01]),  .shift_row(shift_row[1])  , .shift(shift[1]));
     Row row00( .clk(VGA_VS), .reset(Reset_h), .state, .prev(rows[01]) ,.write(map[0]), .next(rows_in[00]),  .shift_row(shift_row[0])  , .shift(shift[0]));
    //write is 
	//stop stops the block from falling 
	write_mux writemux(.*);
	
	
	
	Block block21( .clk(VGA_VS), .reset(Reset_h), .state, .prev(10'b0),       .write(next_write[21]), .collision(rows[20]), .next(blocks_in[21]) , .Stop(stop[21]), .endgame(gameOver[0]) ,.block_can_shift_right, .block_can_shift_left, .keycode, .can_rotate );
    Block block20( .clk(VGA_VS), .reset(Reset_h), .state, .prev(blocks[21]), .write(next_write[20]), .collision(rows[19]), .next(blocks_in[20]), .Stop(stop[20]), .endgame(gameOver[1]) ,.block_can_shift_right, .block_can_shift_left, .keycode, .can_rotate);
    Block block19( .clk(VGA_VS), .reset(Reset_h), .state, .prev(blocks[20]), .write(next_write[19]), .collision(rows[18]), .next(blocks_in[19]), .Stop(stop[19]) ,.block_can_shift_right, .block_can_shift_left, .keycode, .can_rotate);
    Block block18( .clk(VGA_VS), .reset(Reset_h), .state, .prev(blocks[19]), .write(next_write[18]), .collision(rows[17]), .next(blocks_in[18]), .Stop(stop[18]),.block_can_shift_right, .block_can_shift_left, .keycode, .can_rotate);
    Block block17( .clk(VGA_VS), .reset(Reset_h), .state, .prev(blocks[18]), .write(next_write[17]), .collision(rows[16]), .next(blocks_in[17]), .Stop(stop[17]),.block_can_shift_right, .block_can_shift_left, .keycode, .can_rotate);
    Block block16( .clk(VGA_VS), .reset(Reset_h), .state, .prev(blocks[17]), .write(next_write[16]), .collision(rows[15]), .next(blocks_in[16]), .Stop(stop[16]),.block_can_shift_right, .block_can_shift_left, .keycode, .can_rotate);
    Block block15( .clk(VGA_VS), .reset(Reset_h), .state, .prev(blocks[16]), .write(next_write[15]), .collision(rows[14]), .next(blocks_in[15]), .Stop(stop[15]),.block_can_shift_right, .block_can_shift_left, .keycode, .can_rotate);
    Block block14( .clk(VGA_VS), .reset(Reset_h), .state, .prev(blocks[15]), .write(next_write[14]), .collision(rows[13]), .next(blocks_in[14]), .Stop(stop[14]),.block_can_shift_right, .block_can_shift_left, .keycode, .can_rotate);
	Block block13( .clk(VGA_VS), .reset(Reset_h), .state, .prev(blocks[14]), .write(next_write[13]), .collision(rows[12]), .next(blocks_in[13]), .Stop(stop[13]),.block_can_shift_right, .block_can_shift_left, .keycode, .can_rotate);
    Block block12( .clk(VGA_VS), .reset(Reset_h), .state, .prev(blocks[13]), .write(next_write[12]), .collision(rows[11]), .next(blocks_in[12]), .Stop(stop[12]),.block_can_shift_right, .block_can_shift_left, .keycode, .can_rotate);
    Block block11( .clk(VGA_VS), .reset(Reset_h), .state, .prev(blocks[12]), .write(next_write[11]), .collision(rows[10]), .next(blocks_in[11]), .Stop(stop[11]),.block_can_shift_right, .block_can_shift_left, .keycode, .can_rotate);
    Block block10( .clk(VGA_VS), .reset(Reset_h), .state, .prev(blocks[11]), .write(next_write[10]), .collision(rows[9]), .next(blocks_in[10]), .Stop(stop[10]),.block_can_shift_right, .block_can_shift_left, .keycode, .can_rotate);
    Block block9( .clk(VGA_VS), .reset(Reset_h), .state, .prev(blocks[10]), .write(next_write[9]), .collision(rows[8]), .next(blocks_in[9]), .Stop(stop[9]),.block_can_shift_right, .block_can_shift_left, .keycode, .can_rotate);
    Block block8( .clk(VGA_VS), .reset(Reset_h), .state, .prev(blocks[9]), .write(next_write[8]), .collision(rows[7]), .next(blocks_in[8]), .Stop(stop[8]),.block_can_shift_right, .block_can_shift_left, .keycode, .can_rotate);
    Block block7( .clk(VGA_VS), .reset(Reset_h), .state, .prev(blocks[8]), .write(next_write[7]), .collision(rows[6]), .next(blocks_in[7]), .Stop(stop[7]),.block_can_shift_right, .block_can_shift_left, .keycode, .can_rotate);
    Block block6( .clk(VGA_VS), .reset(Reset_h), .state, .prev(blocks[7]), .write(next_write[6]), .collision(rows[5]), .next(blocks_in[6]), .Stop(stop[6]),.block_can_shift_right, .block_can_shift_left, .keycode, .can_rotate);
    Block block5( .clk(VGA_VS), .reset(Reset_h), .state, .prev(blocks[6]), .write(next_write[5]), .collision(rows[4]), .next(blocks_in[5]), .Stop(stop[5]),.block_can_shift_right, .block_can_shift_left, .keycode, .can_rotate);
    Block block4( .clk(VGA_VS), .reset(Reset_h), .state, .prev(blocks[5]), .write(next_write[4]), .collision(rows[3]), .next(blocks_in[4]), .Stop(stop[4]),.block_can_shift_right, .block_can_shift_left, .keycode, .can_rotate);
    Block block3( .clk(VGA_VS), .reset(Reset_h), .state, .prev(blocks[4]), .write(next_write[3]), .collision(rows[2]), .next(blocks_in[3]), .Stop(stop[3]),.block_can_shift_right, .block_can_shift_left, .keycode, .can_rotate);
    Block block2( .clk(VGA_VS), .reset(Reset_h), .state, .prev(blocks[3]), .write(next_write[2]), .collision(rows[1]), .next(blocks_in[2]), .Stop(stop[2]),.block_can_shift_right, .block_can_shift_left, .keycode, .can_rotate);
    Block block1( .clk(VGA_VS), .reset(Reset_h), .state, .prev(blocks[2]), .write(next_write[1]), .collision(rows[0]), .next(blocks_in[1]), .Stop(stop[1]),.block_can_shift_right, .block_can_shift_left, .keycode, .can_rotate);
    Block block0( .clk(VGA_VS), .reset(Reset_h), .state, .prev(blocks[1]), .write(next_write[0]), .collision(10'hFFFF), .next(blocks_in[0]), .Stop(stop[0]),.block_can_shift_right, .block_can_shift_left, .keycode, .can_rotate);
	
	
	 
	 color_mapper color_instance(
	 .*,
	 .is_block(is_block),
	 .is_grid,
	 .DrawX,
	 .DrawY
	 );
    
    // Display keycode on hex display
    HexDriver hex_inst_0 (keycode[3:0], HEX0);
    HexDriver hex_inst_1 (keycode[7:4], HEX1);
    
endmodule
