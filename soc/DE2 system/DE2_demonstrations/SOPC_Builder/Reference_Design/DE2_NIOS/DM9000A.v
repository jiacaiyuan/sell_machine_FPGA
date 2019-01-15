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

module DM9000A (
                 // inputs:
                  ENET_INT,
                  iCLK,
                  iCMD,
                  iCS_N,
                  iDATA,
                  iOSC_50,
                  iRD_N,
                  iRST_N,
                  iWR_N,

                 // outputs:
                  ENET_CLK,
                  ENET_CMD,
                  ENET_CS_N,
                  ENET_DATA,
                  ENET_RD_N,
                  ENET_RST_N,
                  ENET_WR_N,
                  oDATA,
                  oINT
               )
;

  output           ENET_CLK;
  output           ENET_CMD;
  output           ENET_CS_N;
  inout   [ 15: 0] ENET_DATA;
  output           ENET_RD_N;
  output           ENET_RST_N;
  output           ENET_WR_N;
  output  [ 15: 0] oDATA;
  output           oINT;
  input            ENET_INT;
  input            iCLK;
  input            iCMD;
  input            iCS_N;
  input   [ 15: 0] iDATA;
  input            iOSC_50;
  input            iRD_N;
  input            iRST_N;
  input            iWR_N;

  wire             ENET_CLK;
  wire             ENET_CMD;
  wire             ENET_CS_N;
  wire    [ 15: 0] ENET_DATA;
  wire             ENET_RD_N;
  wire             ENET_RST_N;
  wire             ENET_WR_N;
  wire    [ 15: 0] oDATA;
  wire             oINT;
  DM9000A_IF the_DM9000A_IF
    (
      .ENET_CLK   (ENET_CLK),
      .ENET_CMD   (ENET_CMD),
      .ENET_CS_N  (ENET_CS_N),
      .ENET_DATA  (ENET_DATA),
      .ENET_INT   (ENET_INT),
      .ENET_RD_N  (ENET_RD_N),
      .ENET_RST_N (ENET_RST_N),
      .ENET_WR_N  (ENET_WR_N),
      .iCLK       (iCLK),
      .iCMD       (iCMD),
      .iCS_N      (iCS_N),
      .iDATA      (iDATA),
      .iOSC_50    (iOSC_50),
      .iRD_N      (iRD_N),
      .iRST_N     (iRST_N),
      .iWR_N      (iWR_N),
      .oDATA      (oDATA),
      .oINT       (oINT)
    );


endmodule

