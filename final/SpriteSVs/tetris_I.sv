/*
 * ECE385-HelperTools/PNG-To-Txt
 * Author: Rishi Thakkar
 *
 */

module  frameRAM
(
		input [4:0] data_In,
		input [18:0] write_address, read_address,
		input we, Clk,

		output logic [4:0] data_Out
);

// mem has width of 3 bits and a total of 400 addresses
logic [2:0] mem [0:399];


endmodule