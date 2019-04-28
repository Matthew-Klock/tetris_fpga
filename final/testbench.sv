module testbench();

timeunit 10ns; // Half clock cycle at 50 MHz
// This is the amount of time represented by #1
timeprecision 1ns;


	

						  logic RESET;
						  logic Clk;
						   logic [6:0]  HEX0, HEX1;
             // VGA Interface 
              logic [7:0]  VGA_R, VGA_G,VGA_B;        //VGA Blue
					logic        VGA_CLK,      //VGA Clock
                                 VGA_SYNC_N,   //VGA Sync signal
                                 VGA_BLANK_N,  //VGA Blank signal
                                 VGA_VS,       //VGA virtical sync signal
                                 VGA_HS;       //VGA horizontal sync signal
             // CY7C67200 Interface
             wire  [15:0] OTG_DATA;    //CY7C67200 Data bus 16 Bits
             logic [1:0]  OTG_ADDR;     //CY7C67200 Address 2 Bits
             logic        OTG_CS_N,     //CY7C67200 Chip Select
                                 OTG_RD_N,     //CY7C67200 Write
                                 OTG_WR_N,     //CY7C67200 Read
                                 OTG_RST_N;    //CY7C67200 Reset
              logic              OTG_INT;     //CY7C67200 Interrupt
             // SDRAM Interface for Nios II Software
              logic [12:0] DRAM_ADDR;   //SDRAM Address 13 Bits
              wire  [31:0] DRAM_DQ;    //SDRAM Data 32 Bits
              logic [1:0]  DRAM_BA;      //SDRAM Bank Address 2 Bits
              logic [3:0]  DRAM_DQM;     //SDRAM Data Mast 4 Bits
              logic        DRAM_RAS_N,   //SDRAM Row Address Strobe
                                 DRAM_CAS_N,   //SDRAM Column Address Strobe
                                 DRAM_CKE,     //SDRAM Clock Enable
                                 DRAM_WE_N,    //SDRAM Write Enable
                                 DRAM_CS_N,    //SDRAM Chip Select
                                 DRAM_CLK  ;    //SDRAM Clock

 lab8 lab(                .CLOCK_50(Clk),
								.KEY({1'b1,1'b1,RESET, 1'b1}),
								.* );
				 
				 
				 
				 
				
                  
    

always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end
initial begin: CLOCK_INITIALIZATION
Clk = 0;
end
initial begin: TEST_VECTORS
RESET = 0;
#15 
RESET = 1;
#150 
RESET = 0;
#15 
RESET = 1;

end

endmodule