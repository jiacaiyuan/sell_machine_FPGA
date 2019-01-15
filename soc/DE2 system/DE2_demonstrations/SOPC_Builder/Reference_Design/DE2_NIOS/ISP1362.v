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

module ISP1362 (
                 // inputs:
                  OTG_INT0,
                  OTG_INT1,
                  iADDR,
                  iCLK,
                  iCS_N,
                  iDATA,
                  iRD_N,
                  iRST_N,
                  iWR_N,

                 // outputs:
                  OTG_ADDR,
                  OTG_CS_N,
                  OTG_DATA,
                  OTG_RD_N,
                  OTG_RST_N,
                  OTG_WR_N,
                  oDATA,
                  oINT0_N,
                  oINT1_N
               )
;

  output  [  1: 0] OTG_ADDR;
  output           OTG_CS_N;
  inout   [ 15: 0] OTG_DATA;
  output           OTG_RD_N;
  output           OTG_RST_N;
  output           OTG_WR_N;
  output  [ 15: 0] oDATA;
  output           oINT0_N;
  output           oINT1_N;
  input            OTG_INT0;
  input            OTG_INT1;
  input   [  1: 0] iADDR;
  input            iCLK;
  input            iCS_N;
  input   [ 15: 0] iDATA;
  input            iRD_N;
  input            iRST_N;
  input            iWR_N;

  wire    [  1: 0] OTG_ADDR;
  wire             OTG_CS_N;
  wire    [ 15: 0] OTG_DATA;
  wire             OTG_RD_N;
  wire             OTG_RST_N;
  wire             OTG_WR_N;
  wire    [ 15: 0] oDATA;
  wire             oINT0_N;
  wire             oINT1_N;
  ISP1362_IF the_ISP1362_IF
    (
      .OTG_ADDR  (OTG_ADDR),
      .OTG_CS_N  (OTG_CS_N),
      .OTG_DATA  (OTG_DATA),
      .OTG_INT0  (OTG_INT0),
      .OTG_INT1  (OTG_INT1),
      .OTG_RD_N  (OTG_RD_N),
      .OTG_RST_N (OTG_RST_N),
      .OTG_WR_N  (OTG_WR_N),
      .iADDR     (iADDR),
      .iCLK      (iCLK),
      .iCS_N     (iCS_N),
      .iDATA     (iDATA),
      .iRD_N     (iRD_N),
      .iRST_N    (iRST_N),
      .iWR_N     (iWR_N),
      .oDATA     (oDATA),
      .oINT0_N   (oINT0_N),
      .oINT1_N   (oINT1_N)
    );


endmodule

