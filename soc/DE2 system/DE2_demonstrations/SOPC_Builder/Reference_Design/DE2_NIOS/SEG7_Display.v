//Legal Notice: (C)2006 Altera Corporation. All rights reserved.  Your
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
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module SEG7_Display (
                      // inputs:
                       iCLK,
                       iDIG,
                       iRST_N,
                       iWR,

                      // outputs:
                       oSEG0,
                       oSEG1,
                       oSEG2,
                       oSEG3,
                       oSEG4,
                       oSEG5,
                       oSEG6,
                       oSEG7
                    )
;

  output  [  6: 0] oSEG0;
  output  [  6: 0] oSEG1;
  output  [  6: 0] oSEG2;
  output  [  6: 0] oSEG3;
  output  [  6: 0] oSEG4;
  output  [  6: 0] oSEG5;
  output  [  6: 0] oSEG6;
  output  [  6: 0] oSEG7;
  input            iCLK;
  input   [ 31: 0] iDIG;
  input            iRST_N;
  input            iWR;

  wire    [  6: 0] oSEG0;
  wire    [  6: 0] oSEG1;
  wire    [  6: 0] oSEG2;
  wire    [  6: 0] oSEG3;
  wire    [  6: 0] oSEG4;
  wire    [  6: 0] oSEG5;
  wire    [  6: 0] oSEG6;
  wire    [  6: 0] oSEG7;
  SEG7_LUT_8 the_SEG7_LUT_8
    (
      .iCLK   (iCLK),
      .iDIG   (iDIG),
      .iRST_N (iRST_N),
      .iWR    (iWR),
      .oSEG0  (oSEG0),
      .oSEG1  (oSEG1),
      .oSEG2  (oSEG2),
      .oSEG3  (oSEG3),
      .oSEG4  (oSEG4),
      .oSEG5  (oSEG5),
      .oSEG6  (oSEG6),
      .oSEG7  (oSEG7)
    );


endmodule

