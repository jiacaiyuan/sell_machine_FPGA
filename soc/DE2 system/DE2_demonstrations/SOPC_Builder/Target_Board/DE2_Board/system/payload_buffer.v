//Legal Notice: (C)2005 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 100ps
// synthesis translate_on
module payload_buffer (
                        // inputs:
                         address,
                         byteenable,
                         chipselect,
                         clk,
                         clken,
                         write,
                         writedata,

                        // outputs:
                         readdata
                      )
;

  output  [ 15: 0] readdata;
  input   [ 12: 0] address;
  input   [  1: 0] byteenable;
  input            chipselect;
  input            clk;
  input            clken;
  input            write;
  input   [ 15: 0] writedata;

  wire    [ 15: 0] readdata;
  wire             wren;
  assign wren = chipselect & write;
  //s1, which is an e_avalon_slave
  //s2, which is an e_avalon_slave

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  altsyncram the_altsyncram
    (
      .address_a (address),
      .byteena_a (byteenable),
      .clock0 (clk),
      .clocken0 (clken),
      .data_a (writedata),
      .q_a (readdata),
      .wren_a (wren)
    );

  defparam the_altsyncram.byte_size = 8,
           the_altsyncram.lpm_type = "altsyncram",
           the_altsyncram.numwords_a = 8192,
           the_altsyncram.operation_mode = "SINGLE_PORT",
           the_altsyncram.outdata_reg_a = "UNREGISTERED",
           the_altsyncram.ram_block_type = "M4K",
           the_altsyncram.read_during_write_mode_mixed_ports = "DONT_CARE",
           the_altsyncram.width_a = 16,
           the_altsyncram.width_byteena_a = 2,
           the_altsyncram.widthad_a = 13;


//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  altsyncram the_altsyncram
//    (
//      .address_a (address),
//      .byteena_a (byteenable),
//      .clock0 (clk),
//      .clocken0 (clken),
//      .data_a (writedata),
//      .q_a (readdata),
//      .wren_a (wren)
//    );
//
//  defparam the_altsyncram.byte_size = 8,
//           the_altsyncram.init_file = "payload_buffer.hex",
//           the_altsyncram.lpm_type = "altsyncram",
//           the_altsyncram.numwords_a = 8192,
//           the_altsyncram.operation_mode = "SINGLE_PORT",
//           the_altsyncram.outdata_reg_a = "UNREGISTERED",
//           the_altsyncram.ram_block_type = "M4K",
//           the_altsyncram.read_during_write_mode_mixed_ports = "DONT_CARE",
//           the_altsyncram.width_a = 16,
//           the_altsyncram.width_byteena_a = 2,
//           the_altsyncram.widthad_a = 13;
//
//synthesis read_comments_as_HDL off

endmodule

