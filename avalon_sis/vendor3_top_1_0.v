// vendor3_top_1_0.v

// This file was auto-generated as part of a SOPC Builder generate operation.
// If you edit it your changes will probably be lost.

module vendor3_top_1_0 (
		input  wire        clk,        //    clock_reset.clk
		input  wire        reset_n,    //               .reset_n
		input  wire        chipselect, // avalon_slave_0.chipselect
		input  wire        write,      //               .write
		input  wire [31:0] writedata,  //               .writedata
		output wire [7:0]  LEDG,       //    conduit_end.export
		output wire [6:0]  HEX1,       //  conduit_end_1.export
		output wire [6:0]  HEX2,       //  conduit_end_2.export
		output wire [6:0]  HEX3,       //  conduit_end_3.export
		output wire [6:0]  HEX4,       //  conduit_end_4.export
		output wire [6:0]  HEX5,       //  conduit_end_5.export
		output wire [6:0]  HEX6,       //  conduit_end_6.export
		output wire [6:0]  HEX7        //  conduit_end_7.export
	);

	vendor3_top vendor3_top_1_0 (
		.clk        (clk),        //    clock_reset.clk
		.reset_n    (reset_n),    //               .reset_n
		.chipselect (chipselect), // avalon_slave_0.chipselect
		.write      (write),      //               .write
		.writedata  (writedata),  //               .writedata
		.LEDG       (LEDG),       //    conduit_end.export
		.HEX1       (HEX1),       //  conduit_end_1.export
		.HEX2       (HEX2),       //  conduit_end_2.export
		.HEX3       (HEX3),       //  conduit_end_3.export
		.HEX4       (HEX4),       //  conduit_end_4.export
		.HEX5       (HEX5),       //  conduit_end_5.export
		.HEX6       (HEX6),       //  conduit_end_6.export
		.HEX7       (HEX7)        //  conduit_end_7.export
	);

endmodule
