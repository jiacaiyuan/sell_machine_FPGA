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
module sysid (
               // inputs:
                address,

               // outputs:
                readdata
             )
;

  output  [ 31: 0] readdata;
  input            address;

  wire    [ 31: 0] readdata;
  //control_slave, which is an e_avalon_slave
  assign readdata = address ? 1132215552 : 2286174992;

endmodule

