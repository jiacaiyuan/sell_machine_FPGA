//megafunction wizard: %Altera SOPC Builder%
//GENERATION: STANDARD
//VERSION: WM1.0


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
module asmi_asmi_control_port_arbitrator (
                                           // inputs:
                                            asmi_asmi_control_port_dataavailable,
                                            asmi_asmi_control_port_endofpacket,
                                            asmi_asmi_control_port_irq,
                                            asmi_asmi_control_port_readdata,
                                            asmi_asmi_control_port_readyfordata,
                                            clk,
                                            cpu_0_data_master_address_to_slave,
                                            cpu_0_data_master_read,
                                            cpu_0_data_master_write,
                                            cpu_0_data_master_writedata,
                                            reset_n,

                                           // outputs:
                                            asmi_asmi_control_port_address,
                                            asmi_asmi_control_port_chipselect,
                                            asmi_asmi_control_port_dataavailable_from_sa,
                                            asmi_asmi_control_port_endofpacket_from_sa,
                                            asmi_asmi_control_port_irq_from_sa,
                                            asmi_asmi_control_port_read_n,
                                            asmi_asmi_control_port_readdata_from_sa,
                                            asmi_asmi_control_port_readyfordata_from_sa,
                                            asmi_asmi_control_port_reset_n,
                                            asmi_asmi_control_port_write_n,
                                            asmi_asmi_control_port_writedata,
                                            cpu_0_data_master_granted_asmi_asmi_control_port,
                                            cpu_0_data_master_qualified_request_asmi_asmi_control_port,
                                            cpu_0_data_master_read_data_valid_asmi_asmi_control_port,
                                            cpu_0_data_master_requests_asmi_asmi_control_port,
                                            d1_asmi_asmi_control_port_end_xfer
                                         )
  /* synthesis auto_dissolve = "FALSE" */ ;

  output  [  2: 0] asmi_asmi_control_port_address;
  output           asmi_asmi_control_port_chipselect;
  output           asmi_asmi_control_port_dataavailable_from_sa;
  output           asmi_asmi_control_port_endofpacket_from_sa;
  output           asmi_asmi_control_port_irq_from_sa;
  output           asmi_asmi_control_port_read_n;
  output  [ 15: 0] asmi_asmi_control_port_readdata_from_sa;
  output           asmi_asmi_control_port_readyfordata_from_sa;
  output           asmi_asmi_control_port_reset_n;
  output           asmi_asmi_control_port_write_n;
  output  [ 15: 0] asmi_asmi_control_port_writedata;
  output           cpu_0_data_master_granted_asmi_asmi_control_port;
  output           cpu_0_data_master_qualified_request_asmi_asmi_control_port;
  output           cpu_0_data_master_read_data_valid_asmi_asmi_control_port;
  output           cpu_0_data_master_requests_asmi_asmi_control_port;
  output           d1_asmi_asmi_control_port_end_xfer;
  input            asmi_asmi_control_port_dataavailable;
  input            asmi_asmi_control_port_endofpacket;
  input            asmi_asmi_control_port_irq;
  input   [ 15: 0] asmi_asmi_control_port_readdata;
  input            asmi_asmi_control_port_readyfordata;
  input            clk;
  input   [ 22: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            reset_n;

  wire    [  2: 0] asmi_asmi_control_port_address;
  wire             asmi_asmi_control_port_allgrants;
  wire             asmi_asmi_control_port_allow_new_arb_cycle;
  wire             asmi_asmi_control_port_any_continuerequest;
  wire             asmi_asmi_control_port_arb_counter_enable;
  reg     [  2: 0] asmi_asmi_control_port_arb_share_counter;
  wire    [  2: 0] asmi_asmi_control_port_arb_share_counter_next_value;
  wire    [  2: 0] asmi_asmi_control_port_arb_share_set_values;
  wire             asmi_asmi_control_port_beginbursttransfer_internal;
  wire             asmi_asmi_control_port_begins_xfer;
  wire             asmi_asmi_control_port_chipselect;
  wire             asmi_asmi_control_port_dataavailable_from_sa;
  wire             asmi_asmi_control_port_end_xfer;
  wire             asmi_asmi_control_port_endofpacket_from_sa;
  wire             asmi_asmi_control_port_firsttransfer;
  wire             asmi_asmi_control_port_grant_vector;
  wire             asmi_asmi_control_port_in_a_read_cycle;
  wire             asmi_asmi_control_port_in_a_write_cycle;
  wire             asmi_asmi_control_port_irq_from_sa;
  wire             asmi_asmi_control_port_master_qreq_vector;
  wire             asmi_asmi_control_port_read_n;
  wire    [ 15: 0] asmi_asmi_control_port_readdata_from_sa;
  wire             asmi_asmi_control_port_readyfordata_from_sa;
  wire             asmi_asmi_control_port_reset_n;
  reg              asmi_asmi_control_port_slavearbiterlockenable;
  wire             asmi_asmi_control_port_waits_for_read;
  wire             asmi_asmi_control_port_waits_for_write;
  wire             asmi_asmi_control_port_write_n;
  wire    [ 15: 0] asmi_asmi_control_port_writedata;
  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_asmi_asmi_control_port;
  wire             cpu_0_data_master_qualified_request_asmi_asmi_control_port;
  wire             cpu_0_data_master_read_data_valid_asmi_asmi_control_port;
  wire             cpu_0_data_master_requests_asmi_asmi_control_port;
  wire             cpu_0_data_master_saved_grant_asmi_asmi_control_port;
  reg              d1_asmi_asmi_control_port_end_xfer;
  reg              d1_reasons_to_wait;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             wait_for_asmi_asmi_control_port_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~asmi_asmi_control_port_end_xfer;
    end


  assign asmi_asmi_control_port_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_asmi_asmi_control_port));
  //assign asmi_asmi_control_port_readdata_from_sa = asmi_asmi_control_port_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign asmi_asmi_control_port_readdata_from_sa = asmi_asmi_control_port_readdata;

  assign cpu_0_data_master_requests_asmi_asmi_control_port = ({cpu_0_data_master_address_to_slave[22 : 5] , 5'b0} == 23'h60000) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //assign asmi_asmi_control_port_dataavailable_from_sa = asmi_asmi_control_port_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign asmi_asmi_control_port_dataavailable_from_sa = asmi_asmi_control_port_dataavailable;

  //assign asmi_asmi_control_port_readyfordata_from_sa = asmi_asmi_control_port_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign asmi_asmi_control_port_readyfordata_from_sa = asmi_asmi_control_port_readyfordata;

  //asmi_asmi_control_port_arb_share_counter set values, which is an e_mux
  assign asmi_asmi_control_port_arb_share_set_values = 1;

  //asmi_asmi_control_port_arb_share_counter_next_value assignment, which is an e_assign
  assign asmi_asmi_control_port_arb_share_counter_next_value = asmi_asmi_control_port_firsttransfer ? (asmi_asmi_control_port_arb_share_set_values - 1) : |asmi_asmi_control_port_arb_share_counter ? (asmi_asmi_control_port_arb_share_counter - 1) : 0;

  //asmi_asmi_control_port_allgrants all slave grants, which is an e_mux
  assign asmi_asmi_control_port_allgrants = |asmi_asmi_control_port_grant_vector;

  //asmi_asmi_control_port_end_xfer assignment, which is an e_assign
  assign asmi_asmi_control_port_end_xfer = ~(asmi_asmi_control_port_waits_for_read | asmi_asmi_control_port_waits_for_write);

  //asmi_asmi_control_port_arb_share_counter arbitration counter enable, which is an e_assign
  assign asmi_asmi_control_port_arb_counter_enable = asmi_asmi_control_port_end_xfer & asmi_asmi_control_port_allgrants;

  //asmi_asmi_control_port_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          asmi_asmi_control_port_arb_share_counter <= 0;
      else if (asmi_asmi_control_port_arb_counter_enable)
          asmi_asmi_control_port_arb_share_counter <= asmi_asmi_control_port_arb_share_counter_next_value;
    end


  //asmi_asmi_control_port_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          asmi_asmi_control_port_slavearbiterlockenable <= 0;
      else if (|asmi_asmi_control_port_master_qreq_vector & asmi_asmi_control_port_end_xfer)
          asmi_asmi_control_port_slavearbiterlockenable <= |asmi_asmi_control_port_arb_share_counter_next_value;
    end


  //cpu_0/data_master asmi/asmi_control_port arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = asmi_asmi_control_port_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //asmi_asmi_control_port_any_continuerequest at least one master continues requesting, which is an e_assign
  assign asmi_asmi_control_port_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_asmi_asmi_control_port = cpu_0_data_master_requests_asmi_asmi_control_port;
  //asmi_asmi_control_port_writedata mux, which is an e_mux
  assign asmi_asmi_control_port_writedata = cpu_0_data_master_writedata;

  //assign asmi_asmi_control_port_endofpacket_from_sa = asmi_asmi_control_port_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign asmi_asmi_control_port_endofpacket_from_sa = asmi_asmi_control_port_endofpacket;

  //master is always granted when requested
  assign cpu_0_data_master_granted_asmi_asmi_control_port = cpu_0_data_master_qualified_request_asmi_asmi_control_port;

  //cpu_0/data_master saved-grant asmi/asmi_control_port, which is an e_assign
  assign cpu_0_data_master_saved_grant_asmi_asmi_control_port = cpu_0_data_master_requests_asmi_asmi_control_port;

  //allow new arb cycle for asmi/asmi_control_port, which is an e_assign
  assign asmi_asmi_control_port_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign asmi_asmi_control_port_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign asmi_asmi_control_port_master_qreq_vector = 1;

  //asmi_asmi_control_port_reset_n assignment, which is an e_assign
  assign asmi_asmi_control_port_reset_n = reset_n;

  assign asmi_asmi_control_port_chipselect = cpu_0_data_master_granted_asmi_asmi_control_port;
  //asmi_asmi_control_port_firsttransfer first transaction, which is an e_assign
  assign asmi_asmi_control_port_firsttransfer = ~(asmi_asmi_control_port_slavearbiterlockenable & asmi_asmi_control_port_any_continuerequest);

  //asmi_asmi_control_port_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign asmi_asmi_control_port_beginbursttransfer_internal = asmi_asmi_control_port_begins_xfer & asmi_asmi_control_port_firsttransfer;

  //~asmi_asmi_control_port_read_n assignment, which is an e_mux
  assign asmi_asmi_control_port_read_n = ~(cpu_0_data_master_granted_asmi_asmi_control_port & cpu_0_data_master_read);

  //~asmi_asmi_control_port_write_n assignment, which is an e_mux
  assign asmi_asmi_control_port_write_n = ~(cpu_0_data_master_granted_asmi_asmi_control_port & cpu_0_data_master_write);

  //asmi_asmi_control_port_address mux, which is an e_mux
  assign asmi_asmi_control_port_address = cpu_0_data_master_address_to_slave >> 2;

  //d1_asmi_asmi_control_port_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_asmi_asmi_control_port_end_xfer <= 1;
      else if (1)
          d1_asmi_asmi_control_port_end_xfer <= asmi_asmi_control_port_end_xfer;
    end


  //asmi_asmi_control_port_waits_for_read in a cycle, which is an e_mux
  assign asmi_asmi_control_port_waits_for_read = asmi_asmi_control_port_in_a_read_cycle & asmi_asmi_control_port_begins_xfer;

  //asmi_asmi_control_port_in_a_read_cycle assignment, which is an e_assign
  assign asmi_asmi_control_port_in_a_read_cycle = cpu_0_data_master_granted_asmi_asmi_control_port & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = asmi_asmi_control_port_in_a_read_cycle;

  //asmi_asmi_control_port_waits_for_write in a cycle, which is an e_mux
  assign asmi_asmi_control_port_waits_for_write = asmi_asmi_control_port_in_a_write_cycle & asmi_asmi_control_port_begins_xfer;

  //asmi_asmi_control_port_in_a_write_cycle assignment, which is an e_assign
  assign asmi_asmi_control_port_in_a_write_cycle = cpu_0_data_master_granted_asmi_asmi_control_port & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = asmi_asmi_control_port_in_a_write_cycle;

  assign wait_for_asmi_asmi_control_port_counter = 0;
  //assign asmi_asmi_control_port_irq_from_sa = asmi_asmi_control_port_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign asmi_asmi_control_port_irq_from_sa = asmi_asmi_control_port_irq;


endmodule


module cpu_0_data_master_arbitrator (
                                      // inputs:
                                       asmi_asmi_control_port_irq_from_sa,
                                       asmi_asmi_control_port_readdata_from_sa,
                                       cfi_flash_0_s1_wait_counter_eq_0,
                                       cfi_flash_0_s1_wait_counter_eq_1,
                                       clk,
                                       cpu_0_data_master_address,
                                       cpu_0_data_master_byteenable_cfi_flash_0_s1,
                                       cpu_0_data_master_byteenable_payload_buffer_s1,
                                       cpu_0_data_master_granted_asmi_asmi_control_port,
                                       cpu_0_data_master_granted_cfi_flash_0_s1,
                                       cpu_0_data_master_granted_data_RAM_s1,
                                       cpu_0_data_master_granted_firmware_ROM_s1,
                                       cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave,
                                       cpu_0_data_master_granted_payload_buffer_s1,
                                       cpu_0_data_master_granted_sysid_control_slave,
                                       cpu_0_data_master_qualified_request_asmi_asmi_control_port,
                                       cpu_0_data_master_qualified_request_cfi_flash_0_s1,
                                       cpu_0_data_master_qualified_request_data_RAM_s1,
                                       cpu_0_data_master_qualified_request_firmware_ROM_s1,
                                       cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave,
                                       cpu_0_data_master_qualified_request_payload_buffer_s1,
                                       cpu_0_data_master_qualified_request_sysid_control_slave,
                                       cpu_0_data_master_read,
                                       cpu_0_data_master_read_data_valid_asmi_asmi_control_port,
                                       cpu_0_data_master_read_data_valid_cfi_flash_0_s1,
                                       cpu_0_data_master_read_data_valid_data_RAM_s1,
                                       cpu_0_data_master_read_data_valid_firmware_ROM_s1,
                                       cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave,
                                       cpu_0_data_master_read_data_valid_payload_buffer_s1,
                                       cpu_0_data_master_read_data_valid_sysid_control_slave,
                                       cpu_0_data_master_requests_asmi_asmi_control_port,
                                       cpu_0_data_master_requests_cfi_flash_0_s1,
                                       cpu_0_data_master_requests_data_RAM_s1,
                                       cpu_0_data_master_requests_firmware_ROM_s1,
                                       cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave,
                                       cpu_0_data_master_requests_payload_buffer_s1,
                                       cpu_0_data_master_requests_sysid_control_slave,
                                       cpu_0_data_master_write,
                                       cpu_0_data_master_writedata,
                                       d1_asmi_asmi_control_port_end_xfer,
                                       d1_data_RAM_s1_end_xfer,
                                       d1_firmware_ROM_s1_end_xfer,
                                       d1_jtag_uart_0_avalon_jtag_slave_end_xfer,
                                       d1_payload_buffer_s1_end_xfer,
                                       d1_sysid_control_slave_end_xfer,
                                       d1_tri_state_bridge_0_avalon_slave_end_xfer,
                                       data_RAM_s1_readdata_from_sa,
                                       firmware_ROM_s1_readdata_from_sa,
                                       incoming_tri_state_bridge_0_data_with_Xs_converted_to_0,
                                       jtag_uart_0_avalon_jtag_slave_irq_from_sa,
                                       jtag_uart_0_avalon_jtag_slave_readdata_from_sa,
                                       jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa,
                                       payload_buffer_s1_readdata_from_sa,
                                       registered_cpu_0_data_master_read_data_valid_cfi_flash_0_s1,
                                       registered_cpu_0_data_master_read_data_valid_data_RAM_s1,
                                       registered_cpu_0_data_master_read_data_valid_firmware_ROM_s1,
                                       registered_cpu_0_data_master_read_data_valid_payload_buffer_s1,
                                       reset_n,
                                       sysid_control_slave_readdata_from_sa,

                                      // outputs:
                                       cpu_0_data_master_address_to_slave,
                                       cpu_0_data_master_dbs_address,
                                       cpu_0_data_master_dbs_write_16,
                                       cpu_0_data_master_dbs_write_8,
                                       cpu_0_data_master_irq,
                                       cpu_0_data_master_no_byte_enables_and_last_term,
                                       cpu_0_data_master_readdata,
                                       cpu_0_data_master_waitrequest
                                    )
  /* synthesis auto_dissolve = "FALSE" */ ;

  output  [ 22: 0] cpu_0_data_master_address_to_slave;
  output  [  1: 0] cpu_0_data_master_dbs_address;
  output  [ 15: 0] cpu_0_data_master_dbs_write_16;
  output  [  7: 0] cpu_0_data_master_dbs_write_8;
  output  [ 31: 0] cpu_0_data_master_irq;
  output           cpu_0_data_master_no_byte_enables_and_last_term;
  output  [ 31: 0] cpu_0_data_master_readdata;
  output           cpu_0_data_master_waitrequest;
  input            asmi_asmi_control_port_irq_from_sa;
  input   [ 15: 0] asmi_asmi_control_port_readdata_from_sa;
  input            cfi_flash_0_s1_wait_counter_eq_0;
  input            cfi_flash_0_s1_wait_counter_eq_1;
  input            clk;
  input   [ 22: 0] cpu_0_data_master_address;
  input            cpu_0_data_master_byteenable_cfi_flash_0_s1;
  input   [  1: 0] cpu_0_data_master_byteenable_payload_buffer_s1;
  input            cpu_0_data_master_granted_asmi_asmi_control_port;
  input            cpu_0_data_master_granted_cfi_flash_0_s1;
  input            cpu_0_data_master_granted_data_RAM_s1;
  input            cpu_0_data_master_granted_firmware_ROM_s1;
  input            cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  input            cpu_0_data_master_granted_payload_buffer_s1;
  input            cpu_0_data_master_granted_sysid_control_slave;
  input            cpu_0_data_master_qualified_request_asmi_asmi_control_port;
  input            cpu_0_data_master_qualified_request_cfi_flash_0_s1;
  input            cpu_0_data_master_qualified_request_data_RAM_s1;
  input            cpu_0_data_master_qualified_request_firmware_ROM_s1;
  input            cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;
  input            cpu_0_data_master_qualified_request_payload_buffer_s1;
  input            cpu_0_data_master_qualified_request_sysid_control_slave;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_asmi_asmi_control_port;
  input            cpu_0_data_master_read_data_valid_cfi_flash_0_s1;
  input            cpu_0_data_master_read_data_valid_data_RAM_s1;
  input            cpu_0_data_master_read_data_valid_firmware_ROM_s1;
  input            cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  input            cpu_0_data_master_read_data_valid_payload_buffer_s1;
  input            cpu_0_data_master_read_data_valid_sysid_control_slave;
  input            cpu_0_data_master_requests_asmi_asmi_control_port;
  input            cpu_0_data_master_requests_cfi_flash_0_s1;
  input            cpu_0_data_master_requests_data_RAM_s1;
  input            cpu_0_data_master_requests_firmware_ROM_s1;
  input            cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;
  input            cpu_0_data_master_requests_payload_buffer_s1;
  input            cpu_0_data_master_requests_sysid_control_slave;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            d1_asmi_asmi_control_port_end_xfer;
  input            d1_data_RAM_s1_end_xfer;
  input            d1_firmware_ROM_s1_end_xfer;
  input            d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  input            d1_payload_buffer_s1_end_xfer;
  input            d1_sysid_control_slave_end_xfer;
  input            d1_tri_state_bridge_0_avalon_slave_end_xfer;
  input   [ 31: 0] data_RAM_s1_readdata_from_sa;
  input   [ 31: 0] firmware_ROM_s1_readdata_from_sa;
  input   [  7: 0] incoming_tri_state_bridge_0_data_with_Xs_converted_to_0;
  input            jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  input   [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  input            jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  input   [ 15: 0] payload_buffer_s1_readdata_from_sa;
  input            registered_cpu_0_data_master_read_data_valid_cfi_flash_0_s1;
  input            registered_cpu_0_data_master_read_data_valid_data_RAM_s1;
  input            registered_cpu_0_data_master_read_data_valid_firmware_ROM_s1;
  input            registered_cpu_0_data_master_read_data_valid_payload_buffer_s1;
  input            reset_n;
  input   [ 31: 0] sysid_control_slave_readdata_from_sa;

  wire    [ 22: 0] cpu_0_data_master_address_to_slave;
  reg     [  1: 0] cpu_0_data_master_dbs_address;
  wire    [  1: 0] cpu_0_data_master_dbs_increment;
  wire    [ 15: 0] cpu_0_data_master_dbs_write_16;
  wire    [  7: 0] cpu_0_data_master_dbs_write_8;
  wire    [ 31: 0] cpu_0_data_master_irq;
  reg              cpu_0_data_master_no_byte_enables_and_last_term;
  wire    [ 31: 0] cpu_0_data_master_readdata;
  wire             cpu_0_data_master_run;
  reg              cpu_0_data_master_waitrequest;
  reg     [ 15: 0] dbs_16_reg_segment_0;
  reg     [  7: 0] dbs_8_reg_segment_0;
  reg     [  7: 0] dbs_8_reg_segment_1;
  reg     [  7: 0] dbs_8_reg_segment_2;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  wire             last_dbs_term_and_run;
  wire    [  1: 0] next_dbs_address;
  wire    [ 15: 0] p1_dbs_16_reg_segment_0;
  wire    [  7: 0] p1_dbs_8_reg_segment_0;
  wire    [  7: 0] p1_dbs_8_reg_segment_1;
  wire    [  7: 0] p1_dbs_8_reg_segment_2;
  wire    [ 31: 0] p1_registered_cpu_0_data_master_readdata;
  wire             pre_dbs_count_enable;
  wire             r_0;
  wire             r_1;
  reg     [ 31: 0] registered_cpu_0_data_master_readdata;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & ((~cpu_0_data_master_qualified_request_asmi_asmi_control_port | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & 1 & (cpu_0_data_master_read | cpu_0_data_master_write)))) & ((~cpu_0_data_master_qualified_request_asmi_asmi_control_port | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & 1 & (cpu_0_data_master_read | cpu_0_data_master_write)))) & 1 & (cpu_0_data_master_qualified_request_data_RAM_s1 | registered_cpu_0_data_master_read_data_valid_data_RAM_s1 | ~cpu_0_data_master_requests_data_RAM_s1) & (cpu_0_data_master_granted_data_RAM_s1 | ~cpu_0_data_master_qualified_request_data_RAM_s1) & ((~cpu_0_data_master_qualified_request_data_RAM_s1 | ~cpu_0_data_master_read | (registered_cpu_0_data_master_read_data_valid_data_RAM_s1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_data_RAM_s1 | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & (cpu_0_data_master_read | cpu_0_data_master_write)))) & 1 & (cpu_0_data_master_qualified_request_firmware_ROM_s1 | registered_cpu_0_data_master_read_data_valid_firmware_ROM_s1 | ~cpu_0_data_master_requests_firmware_ROM_s1) & (cpu_0_data_master_granted_firmware_ROM_s1 | ~cpu_0_data_master_qualified_request_firmware_ROM_s1) & ((~cpu_0_data_master_qualified_request_firmware_ROM_s1 | ~cpu_0_data_master_read | (registered_cpu_0_data_master_read_data_valid_firmware_ROM_s1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_firmware_ROM_s1 | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & (cpu_0_data_master_read | cpu_0_data_master_write)))) & 1 & (cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave | ~cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave) & ((~cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & ~jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa & (cpu_0_data_master_read | cpu_0_data_master_write)))) & ((~cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & ~jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa & (cpu_0_data_master_read | cpu_0_data_master_write)))) & 1 & (cpu_0_data_master_qualified_request_payload_buffer_s1 | (registered_cpu_0_data_master_read_data_valid_payload_buffer_s1 & cpu_0_data_master_dbs_address[1]) | (cpu_0_data_master_write & !cpu_0_data_master_byteenable_payload_buffer_s1 & cpu_0_data_master_dbs_address[1]) | ~cpu_0_data_master_requests_payload_buffer_s1) & (cpu_0_data_master_granted_payload_buffer_s1 | ~cpu_0_data_master_qualified_request_payload_buffer_s1);

  //cascaded wait assignment, which is an e_assign
  assign cpu_0_data_master_run = r_0 & r_1;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = ((~cpu_0_data_master_qualified_request_payload_buffer_s1 | ~cpu_0_data_master_read | (registered_cpu_0_data_master_read_data_valid_payload_buffer_s1 & (cpu_0_data_master_dbs_address[1]) & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_payload_buffer_s1 | ~cpu_0_data_master_write | (1 & (cpu_0_data_master_dbs_address[1]) & cpu_0_data_master_write))) & 1 & ((~cpu_0_data_master_qualified_request_sysid_control_slave | ~cpu_0_data_master_read | (1 & 1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_sysid_control_slave | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & ((cpu_0_data_master_qualified_request_cfi_flash_0_s1 | (registered_cpu_0_data_master_read_data_valid_cfi_flash_0_s1 & cpu_0_data_master_dbs_address[1] & cpu_0_data_master_dbs_address[0]) | ((cpu_0_data_master_write & !cpu_0_data_master_byteenable_cfi_flash_0_s1 & cpu_0_data_master_dbs_address[1] & cpu_0_data_master_dbs_address[0])) | ~cpu_0_data_master_requests_cfi_flash_0_s1)) & (cpu_0_data_master_granted_cfi_flash_0_s1 | ~cpu_0_data_master_qualified_request_cfi_flash_0_s1) & ((~cpu_0_data_master_qualified_request_cfi_flash_0_s1 | ~cpu_0_data_master_read | (registered_cpu_0_data_master_read_data_valid_cfi_flash_0_s1 & (cpu_0_data_master_dbs_address[1] & cpu_0_data_master_dbs_address[0]) & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_cfi_flash_0_s1 | ~cpu_0_data_master_write | (1 & cfi_flash_0_s1_wait_counter_eq_1 & (cpu_0_data_master_dbs_address[1] & cpu_0_data_master_dbs_address[0]) & cpu_0_data_master_write)));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_0_data_master_address_to_slave = cpu_0_data_master_address[22 : 0];

  //cpu_0/data_master readdata mux, which is an e_mux
  assign cpu_0_data_master_readdata = ({32 {~cpu_0_data_master_requests_asmi_asmi_control_port}} | asmi_asmi_control_port_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_data_RAM_s1}} | data_RAM_s1_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_firmware_ROM_s1}} | firmware_ROM_s1_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave}} | registered_cpu_0_data_master_readdata) &
    ({32 {~cpu_0_data_master_requests_payload_buffer_s1}} | {payload_buffer_s1_readdata_from_sa,
    dbs_16_reg_segment_0}) &
    ({32 {~cpu_0_data_master_requests_sysid_control_slave}} | sysid_control_slave_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_cfi_flash_0_s1}} | {incoming_tri_state_bridge_0_data_with_Xs_converted_to_0,
    dbs_8_reg_segment_2,
    dbs_8_reg_segment_1,
    dbs_8_reg_segment_0});

  //actual waitrequest port, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_waitrequest <= ~0;
      else if (1)
          cpu_0_data_master_waitrequest <= ~((~(cpu_0_data_master_read | cpu_0_data_master_write))? 0: (cpu_0_data_master_run & cpu_0_data_master_waitrequest));
    end


  //irq assign, which is an e_assign
  assign cpu_0_data_master_irq = {1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    asmi_asmi_control_port_irq_from_sa,
    jtag_uart_0_avalon_jtag_slave_irq_from_sa};

  //unpredictable registered wait state incoming data, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          registered_cpu_0_data_master_readdata <= 0;
      else if (1)
          registered_cpu_0_data_master_readdata <= p1_registered_cpu_0_data_master_readdata;
    end


  //registered readdata mux, which is an e_mux
  assign p1_registered_cpu_0_data_master_readdata = {32 {~cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave}} | jtag_uart_0_avalon_jtag_slave_readdata_from_sa;

  //no_byte_enables_and_last_term, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_no_byte_enables_and_last_term <= 0;
      else if (1)
          cpu_0_data_master_no_byte_enables_and_last_term <= last_dbs_term_and_run;
    end


  //compute the last dbs term, which is an e_mux
  assign last_dbs_term_and_run = (cpu_0_data_master_requests_payload_buffer_s1)? (((cpu_0_data_master_dbs_address == 2'b10) & cpu_0_data_master_write & !cpu_0_data_master_byteenable_payload_buffer_s1)) :
    (((cpu_0_data_master_dbs_address == 2'b11) & cpu_0_data_master_write & !cpu_0_data_master_byteenable_cfi_flash_0_s1));

  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = (((~cpu_0_data_master_no_byte_enables_and_last_term) & cpu_0_data_master_requests_payload_buffer_s1 & cpu_0_data_master_write & !cpu_0_data_master_byteenable_payload_buffer_s1)) |
    cpu_0_data_master_read_data_valid_payload_buffer_s1 |
    (cpu_0_data_master_granted_payload_buffer_s1 & cpu_0_data_master_write & 1 & 1) |
    (((~cpu_0_data_master_no_byte_enables_and_last_term) & cpu_0_data_master_requests_cfi_flash_0_s1 & cpu_0_data_master_write & !cpu_0_data_master_byteenable_cfi_flash_0_s1)) |
    cpu_0_data_master_read_data_valid_cfi_flash_0_s1 |
    ((cpu_0_data_master_granted_cfi_flash_0_s1 & cpu_0_data_master_write & 1 & 1 & ({cfi_flash_0_s1_wait_counter_eq_0 & ~d1_tri_state_bridge_0_avalon_slave_end_xfer})));

  //input to dbs-16 stored 0, which is an e_mux
  assign p1_dbs_16_reg_segment_0 = payload_buffer_s1_readdata_from_sa;

  //dbs register for dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_16_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((cpu_0_data_master_dbs_address[1]) == 0))
          dbs_16_reg_segment_0 <= p1_dbs_16_reg_segment_0;
    end


  //mux write dbs 1, which is an e_mux
  assign cpu_0_data_master_dbs_write_16 = (cpu_0_data_master_dbs_address[1])? cpu_0_data_master_writedata[31 : 16] :
    cpu_0_data_master_writedata[15 : 0];

  //dbs count increment, which is an e_mux
  assign cpu_0_data_master_dbs_increment = (cpu_0_data_master_requests_payload_buffer_s1)? 2 :
    (cpu_0_data_master_requests_cfi_flash_0_s1)? 1 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = cpu_0_data_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = cpu_0_data_master_dbs_address + cpu_0_data_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable &
    (~(cpu_0_data_master_requests_payload_buffer_s1 & ~cpu_0_data_master_waitrequest & cpu_0_data_master_write));

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_dbs_address <= 0;
      else if (dbs_count_enable)
          cpu_0_data_master_dbs_address <= next_dbs_address;
    end


  //input to dbs-8 stored 0, which is an e_mux
  assign p1_dbs_8_reg_segment_0 = incoming_tri_state_bridge_0_data_with_Xs_converted_to_0;

  //dbs register for dbs-8 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_8_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((cpu_0_data_master_dbs_address[1 : 0]) == 0))
          dbs_8_reg_segment_0 <= p1_dbs_8_reg_segment_0;
    end


  //input to dbs-8 stored 1, which is an e_mux
  assign p1_dbs_8_reg_segment_1 = incoming_tri_state_bridge_0_data_with_Xs_converted_to_0;

  //dbs register for dbs-8 segment 1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_8_reg_segment_1 <= 0;
      else if (dbs_count_enable & ((cpu_0_data_master_dbs_address[1 : 0]) == 1))
          dbs_8_reg_segment_1 <= p1_dbs_8_reg_segment_1;
    end


  //input to dbs-8 stored 2, which is an e_mux
  assign p1_dbs_8_reg_segment_2 = incoming_tri_state_bridge_0_data_with_Xs_converted_to_0;

  //dbs register for dbs-8 segment 2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_8_reg_segment_2 <= 0;
      else if (dbs_count_enable & ((cpu_0_data_master_dbs_address[1 : 0]) == 2))
          dbs_8_reg_segment_2 <= p1_dbs_8_reg_segment_2;
    end


  //mux write dbs 2, which is an e_mux
  assign cpu_0_data_master_dbs_write_8 = ((cpu_0_data_master_dbs_address[1 : 0] == 0))? cpu_0_data_master_writedata[7 : 0] :
    ((cpu_0_data_master_dbs_address[1 : 0] == 1))? cpu_0_data_master_writedata[15 : 8] :
    ((cpu_0_data_master_dbs_address[1 : 0] == 2))? cpu_0_data_master_writedata[23 : 16] :
    cpu_0_data_master_writedata[31 : 24];


endmodule


module cpu_0_instruction_master_arbitrator (
                                             // inputs:
                                              cfi_flash_0_s1_wait_counter_eq_0,
                                              cfi_flash_0_s1_wait_counter_eq_1,
                                              clk,
                                              cpu_0_instruction_master_address,
                                              cpu_0_instruction_master_granted_cfi_flash_0_s1,
                                              cpu_0_instruction_master_granted_data_RAM_s1,
                                              cpu_0_instruction_master_granted_firmware_ROM_s1,
                                              cpu_0_instruction_master_granted_payload_buffer_s1,
                                              cpu_0_instruction_master_qualified_request_cfi_flash_0_s1,
                                              cpu_0_instruction_master_qualified_request_data_RAM_s1,
                                              cpu_0_instruction_master_qualified_request_firmware_ROM_s1,
                                              cpu_0_instruction_master_qualified_request_payload_buffer_s1,
                                              cpu_0_instruction_master_read,
                                              cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1,
                                              cpu_0_instruction_master_read_data_valid_data_RAM_s1,
                                              cpu_0_instruction_master_read_data_valid_firmware_ROM_s1,
                                              cpu_0_instruction_master_read_data_valid_payload_buffer_s1,
                                              cpu_0_instruction_master_requests_cfi_flash_0_s1,
                                              cpu_0_instruction_master_requests_data_RAM_s1,
                                              cpu_0_instruction_master_requests_firmware_ROM_s1,
                                              cpu_0_instruction_master_requests_payload_buffer_s1,
                                              d1_data_RAM_s1_end_xfer,
                                              d1_firmware_ROM_s1_end_xfer,
                                              d1_payload_buffer_s1_end_xfer,
                                              d1_tri_state_bridge_0_avalon_slave_end_xfer,
                                              data_RAM_s1_readdata_from_sa,
                                              firmware_ROM_s1_readdata_from_sa,
                                              incoming_tri_state_bridge_0_data,
                                              payload_buffer_s1_readdata_from_sa,
                                              reset_n,

                                             // outputs:
                                              cpu_0_instruction_master_address_to_slave,
                                              cpu_0_instruction_master_dbs_address,
                                              cpu_0_instruction_master_readdata,
                                              cpu_0_instruction_master_reset_n,
                                              cpu_0_instruction_master_waitrequest
                                           )
  /* synthesis auto_dissolve = "FALSE" */ ;

  output  [ 22: 0] cpu_0_instruction_master_address_to_slave;
  output  [  1: 0] cpu_0_instruction_master_dbs_address;
  output  [ 31: 0] cpu_0_instruction_master_readdata;
  output           cpu_0_instruction_master_reset_n;
  output           cpu_0_instruction_master_waitrequest;
  input            cfi_flash_0_s1_wait_counter_eq_0;
  input            cfi_flash_0_s1_wait_counter_eq_1;
  input            clk;
  input   [ 22: 0] cpu_0_instruction_master_address;
  input            cpu_0_instruction_master_granted_cfi_flash_0_s1;
  input            cpu_0_instruction_master_granted_data_RAM_s1;
  input            cpu_0_instruction_master_granted_firmware_ROM_s1;
  input            cpu_0_instruction_master_granted_payload_buffer_s1;
  input            cpu_0_instruction_master_qualified_request_cfi_flash_0_s1;
  input            cpu_0_instruction_master_qualified_request_data_RAM_s1;
  input            cpu_0_instruction_master_qualified_request_firmware_ROM_s1;
  input            cpu_0_instruction_master_qualified_request_payload_buffer_s1;
  input            cpu_0_instruction_master_read;
  input            cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1;
  input            cpu_0_instruction_master_read_data_valid_data_RAM_s1;
  input            cpu_0_instruction_master_read_data_valid_firmware_ROM_s1;
  input            cpu_0_instruction_master_read_data_valid_payload_buffer_s1;
  input            cpu_0_instruction_master_requests_cfi_flash_0_s1;
  input            cpu_0_instruction_master_requests_data_RAM_s1;
  input            cpu_0_instruction_master_requests_firmware_ROM_s1;
  input            cpu_0_instruction_master_requests_payload_buffer_s1;
  input            d1_data_RAM_s1_end_xfer;
  input            d1_firmware_ROM_s1_end_xfer;
  input            d1_payload_buffer_s1_end_xfer;
  input            d1_tri_state_bridge_0_avalon_slave_end_xfer;
  input   [ 31: 0] data_RAM_s1_readdata_from_sa;
  input   [ 31: 0] firmware_ROM_s1_readdata_from_sa;
  input   [  7: 0] incoming_tri_state_bridge_0_data;
  input   [ 15: 0] payload_buffer_s1_readdata_from_sa;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [ 22: 0] cpu_0_instruction_master_address_last_time;
  wire    [ 22: 0] cpu_0_instruction_master_address_to_slave;
  reg     [  1: 0] cpu_0_instruction_master_dbs_address;
  wire    [  1: 0] cpu_0_instruction_master_dbs_increment;
  reg              cpu_0_instruction_master_read_last_time;
  wire    [ 31: 0] cpu_0_instruction_master_readdata;
  wire             cpu_0_instruction_master_reset_n;
  wire             cpu_0_instruction_master_run;
  wire             cpu_0_instruction_master_waitrequest;
  reg     [ 15: 0] dbs_16_reg_segment_0;
  reg     [  7: 0] dbs_8_reg_segment_0;
  reg     [  7: 0] dbs_8_reg_segment_1;
  reg     [  7: 0] dbs_8_reg_segment_2;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  wire    [  1: 0] next_dbs_address;
  wire    [ 15: 0] p1_dbs_16_reg_segment_0;
  wire    [  7: 0] p1_dbs_8_reg_segment_0;
  wire    [  7: 0] p1_dbs_8_reg_segment_1;
  wire    [  7: 0] p1_dbs_8_reg_segment_2;
  wire             pre_dbs_count_enable;
  wire             r_0;
  wire             r_1;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_0_instruction_master_qualified_request_data_RAM_s1 | cpu_0_instruction_master_read_data_valid_data_RAM_s1 | ~cpu_0_instruction_master_requests_data_RAM_s1) & (cpu_0_instruction_master_granted_data_RAM_s1 | ~cpu_0_instruction_master_qualified_request_data_RAM_s1) & ((~cpu_0_instruction_master_qualified_request_data_RAM_s1 | ~cpu_0_instruction_master_read | (cpu_0_instruction_master_read_data_valid_data_RAM_s1 & cpu_0_instruction_master_read))) & 1 & (cpu_0_instruction_master_qualified_request_firmware_ROM_s1 | cpu_0_instruction_master_read_data_valid_firmware_ROM_s1 | ~cpu_0_instruction_master_requests_firmware_ROM_s1) & (cpu_0_instruction_master_granted_firmware_ROM_s1 | ~cpu_0_instruction_master_qualified_request_firmware_ROM_s1) & ((~cpu_0_instruction_master_qualified_request_firmware_ROM_s1 | ~cpu_0_instruction_master_read | (cpu_0_instruction_master_read_data_valid_firmware_ROM_s1 & cpu_0_instruction_master_read))) & 1 & (cpu_0_instruction_master_qualified_request_payload_buffer_s1 | (cpu_0_instruction_master_read_data_valid_payload_buffer_s1 & cpu_0_instruction_master_dbs_address[1]) | ~cpu_0_instruction_master_requests_payload_buffer_s1);

  //cascaded wait assignment, which is an e_assign
  assign cpu_0_instruction_master_run = r_0 & r_1;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = (cpu_0_instruction_master_granted_payload_buffer_s1 | ~cpu_0_instruction_master_qualified_request_payload_buffer_s1) & ((~cpu_0_instruction_master_qualified_request_payload_buffer_s1 | ~cpu_0_instruction_master_read | (cpu_0_instruction_master_read_data_valid_payload_buffer_s1 & (cpu_0_instruction_master_dbs_address[1]) & cpu_0_instruction_master_read))) & 1 & ((cpu_0_instruction_master_qualified_request_cfi_flash_0_s1 | (cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1 & cpu_0_instruction_master_dbs_address[1] & cpu_0_instruction_master_dbs_address[0]) | ~cpu_0_instruction_master_requests_cfi_flash_0_s1)) & (cpu_0_instruction_master_granted_cfi_flash_0_s1 | ~cpu_0_instruction_master_qualified_request_cfi_flash_0_s1) & ((~cpu_0_instruction_master_qualified_request_cfi_flash_0_s1 | ~cpu_0_instruction_master_read | (cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1 & (cpu_0_instruction_master_dbs_address[1] & cpu_0_instruction_master_dbs_address[0]) & cpu_0_instruction_master_read)));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_0_instruction_master_address_to_slave = cpu_0_instruction_master_address[22 : 0];

  //cpu_0/instruction_master readdata mux, which is an e_mux
  assign cpu_0_instruction_master_readdata = ({32 {~cpu_0_instruction_master_requests_data_RAM_s1}} | data_RAM_s1_readdata_from_sa) &
    ({32 {~cpu_0_instruction_master_requests_firmware_ROM_s1}} | firmware_ROM_s1_readdata_from_sa) &
    ({32 {~cpu_0_instruction_master_requests_payload_buffer_s1}} | {payload_buffer_s1_readdata_from_sa,
    dbs_16_reg_segment_0}) &
    ({32 {~cpu_0_instruction_master_requests_cfi_flash_0_s1}} | {incoming_tri_state_bridge_0_data,
    dbs_8_reg_segment_2,
    dbs_8_reg_segment_1,
    dbs_8_reg_segment_0});

  //actual waitrequest port, which is an e_assign
  assign cpu_0_instruction_master_waitrequest = ~cpu_0_instruction_master_run;

  //cpu_0_instruction_master_reset_n assignment, which is an e_assign
  assign cpu_0_instruction_master_reset_n = reset_n;

  //input to dbs-16 stored 0, which is an e_mux
  assign p1_dbs_16_reg_segment_0 = payload_buffer_s1_readdata_from_sa;

  //dbs register for dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_16_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((cpu_0_instruction_master_dbs_address[1]) == 0))
          dbs_16_reg_segment_0 <= p1_dbs_16_reg_segment_0;
    end


  //dbs count increment, which is an e_mux
  assign cpu_0_instruction_master_dbs_increment = (cpu_0_instruction_master_requests_payload_buffer_s1)? 2 :
    (cpu_0_instruction_master_requests_cfi_flash_0_s1)? 1 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = cpu_0_instruction_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = cpu_0_instruction_master_dbs_address + cpu_0_instruction_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable;

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_dbs_address <= 0;
      else if (dbs_count_enable)
          cpu_0_instruction_master_dbs_address <= next_dbs_address;
    end


  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = cpu_0_instruction_master_read_data_valid_payload_buffer_s1 |
    cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1;

  //input to dbs-8 stored 0, which is an e_mux
  assign p1_dbs_8_reg_segment_0 = incoming_tri_state_bridge_0_data;

  //dbs register for dbs-8 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_8_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((cpu_0_instruction_master_dbs_address[1 : 0]) == 0))
          dbs_8_reg_segment_0 <= p1_dbs_8_reg_segment_0;
    end


  //input to dbs-8 stored 1, which is an e_mux
  assign p1_dbs_8_reg_segment_1 = incoming_tri_state_bridge_0_data;

  //dbs register for dbs-8 segment 1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_8_reg_segment_1 <= 0;
      else if (dbs_count_enable & ((cpu_0_instruction_master_dbs_address[1 : 0]) == 1))
          dbs_8_reg_segment_1 <= p1_dbs_8_reg_segment_1;
    end


  //input to dbs-8 stored 2, which is an e_mux
  assign p1_dbs_8_reg_segment_2 = incoming_tri_state_bridge_0_data;

  //dbs register for dbs-8 segment 2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_8_reg_segment_2 <= 0;
      else if (dbs_count_enable & ((cpu_0_instruction_master_dbs_address[1 : 0]) == 2))
          dbs_8_reg_segment_2 <= p1_dbs_8_reg_segment_2;
    end



//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_0_instruction_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_address_last_time <= 0;
      else if (1)
          cpu_0_instruction_master_address_last_time <= cpu_0_instruction_master_address;
    end


  //cpu_0/instruction_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else if (1)
          active_and_waiting_last_time <= cpu_0_instruction_master_waitrequest & (cpu_0_instruction_master_read);
    end


  //cpu_0_instruction_master_address matches last port_name, which is an e_process
  always @(active_and_waiting_last_time or cpu_0_instruction_master_address or cpu_0_instruction_master_address_last_time)
    begin
      if (active_and_waiting_last_time & (cpu_0_instruction_master_address != cpu_0_instruction_master_address_last_time))
        begin
          $write("%0d ns: cpu_0_instruction_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_0_instruction_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_read_last_time <= 0;
      else if (1)
          cpu_0_instruction_master_read_last_time <= cpu_0_instruction_master_read;
    end


  //cpu_0_instruction_master_read matches last port_name, which is an e_process
  always @(active_and_waiting_last_time or cpu_0_instruction_master_read or cpu_0_instruction_master_read_last_time)
    begin
      if (active_and_waiting_last_time & (cpu_0_instruction_master_read != cpu_0_instruction_master_read_last_time))
        begin
          $write("%0d ns: cpu_0_instruction_master_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


module data_RAM_s1_arbitrator (
                                // inputs:
                                 clk,
                                 cpu_0_data_master_address_to_slave,
                                 cpu_0_data_master_byteenable,
                                 cpu_0_data_master_read,
                                 cpu_0_data_master_waitrequest,
                                 cpu_0_data_master_write,
                                 cpu_0_data_master_writedata,
                                 cpu_0_instruction_master_address_to_slave,
                                 cpu_0_instruction_master_read,
                                 data_RAM_s1_readdata,
                                 reset_n,

                                // outputs:
                                 cpu_0_data_master_granted_data_RAM_s1,
                                 cpu_0_data_master_qualified_request_data_RAM_s1,
                                 cpu_0_data_master_read_data_valid_data_RAM_s1,
                                 cpu_0_data_master_requests_data_RAM_s1,
                                 cpu_0_instruction_master_granted_data_RAM_s1,
                                 cpu_0_instruction_master_qualified_request_data_RAM_s1,
                                 cpu_0_instruction_master_read_data_valid_data_RAM_s1,
                                 cpu_0_instruction_master_requests_data_RAM_s1,
                                 d1_data_RAM_s1_end_xfer,
                                 data_RAM_s1_address,
                                 data_RAM_s1_byteenable,
                                 data_RAM_s1_chipselect,
                                 data_RAM_s1_clken,
                                 data_RAM_s1_readdata_from_sa,
                                 data_RAM_s1_write,
                                 data_RAM_s1_writedata,
                                 registered_cpu_0_data_master_read_data_valid_data_RAM_s1
                              )
  /* synthesis auto_dissolve = "FALSE" */ ;

  output           cpu_0_data_master_granted_data_RAM_s1;
  output           cpu_0_data_master_qualified_request_data_RAM_s1;
  output           cpu_0_data_master_read_data_valid_data_RAM_s1;
  output           cpu_0_data_master_requests_data_RAM_s1;
  output           cpu_0_instruction_master_granted_data_RAM_s1;
  output           cpu_0_instruction_master_qualified_request_data_RAM_s1;
  output           cpu_0_instruction_master_read_data_valid_data_RAM_s1;
  output           cpu_0_instruction_master_requests_data_RAM_s1;
  output           d1_data_RAM_s1_end_xfer;
  output  [  7: 0] data_RAM_s1_address;
  output  [  3: 0] data_RAM_s1_byteenable;
  output           data_RAM_s1_chipselect;
  output           data_RAM_s1_clken;
  output  [ 31: 0] data_RAM_s1_readdata_from_sa;
  output           data_RAM_s1_write;
  output  [ 31: 0] data_RAM_s1_writedata;
  output           registered_cpu_0_data_master_read_data_valid_data_RAM_s1;
  input            clk;
  input   [ 22: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 22: 0] cpu_0_instruction_master_address_to_slave;
  input            cpu_0_instruction_master_read;
  input   [ 31: 0] data_RAM_s1_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_data_RAM_s1;
  wire             cpu_0_data_master_qualified_request_data_RAM_s1;
  wire             cpu_0_data_master_read_data_valid_data_RAM_s1;
  reg              cpu_0_data_master_read_data_valid_data_RAM_s1_shift_register;
  wire             cpu_0_data_master_read_data_valid_data_RAM_s1_shift_register_in;
  wire             cpu_0_data_master_requests_data_RAM_s1;
  wire             cpu_0_data_master_saved_grant_data_RAM_s1;
  wire             cpu_0_instruction_master_arbiterlock;
  wire             cpu_0_instruction_master_continuerequest;
  wire             cpu_0_instruction_master_granted_data_RAM_s1;
  wire             cpu_0_instruction_master_qualified_request_data_RAM_s1;
  wire             cpu_0_instruction_master_read_data_valid_data_RAM_s1;
  reg              cpu_0_instruction_master_read_data_valid_data_RAM_s1_shift_register;
  wire             cpu_0_instruction_master_read_data_valid_data_RAM_s1_shift_register_in;
  wire             cpu_0_instruction_master_requests_data_RAM_s1;
  wire             cpu_0_instruction_master_saved_grant_data_RAM_s1;
  reg              d1_data_RAM_s1_end_xfer;
  reg              d1_reasons_to_wait;
  wire    [  7: 0] data_RAM_s1_address;
  wire             data_RAM_s1_allgrants;
  wire             data_RAM_s1_allow_new_arb_cycle;
  wire             data_RAM_s1_any_continuerequest;
  reg     [  1: 0] data_RAM_s1_arb_addend;
  wire             data_RAM_s1_arb_counter_enable;
  reg     [  2: 0] data_RAM_s1_arb_share_counter;
  wire    [  2: 0] data_RAM_s1_arb_share_counter_next_value;
  wire    [  2: 0] data_RAM_s1_arb_share_set_values;
  wire    [  1: 0] data_RAM_s1_arb_winner;
  wire             data_RAM_s1_arbitration_holdoff_internal;
  wire             data_RAM_s1_beginbursttransfer_internal;
  wire             data_RAM_s1_begins_xfer;
  wire    [  3: 0] data_RAM_s1_byteenable;
  wire             data_RAM_s1_chipselect;
  wire    [  3: 0] data_RAM_s1_chosen_master_double_vector;
  wire    [  1: 0] data_RAM_s1_chosen_master_rot_left;
  wire             data_RAM_s1_clken;
  wire             data_RAM_s1_end_xfer;
  wire             data_RAM_s1_firsttransfer;
  wire    [  1: 0] data_RAM_s1_grant_vector;
  wire             data_RAM_s1_in_a_read_cycle;
  wire             data_RAM_s1_in_a_write_cycle;
  wire    [  1: 0] data_RAM_s1_master_qreq_vector;
  wire    [ 31: 0] data_RAM_s1_readdata_from_sa;
  reg     [  1: 0] data_RAM_s1_saved_chosen_master_vector;
  reg              data_RAM_s1_slavearbiterlockenable;
  wire             data_RAM_s1_waits_for_read;
  wire             data_RAM_s1_waits_for_write;
  wire             data_RAM_s1_write;
  wire    [ 31: 0] data_RAM_s1_writedata;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_0_data_master_granted_slave_data_RAM_s1;
  reg              last_cycle_cpu_0_instruction_master_granted_slave_data_RAM_s1;
  wire             p1_cpu_0_data_master_read_data_valid_data_RAM_s1_shift_register;
  wire             p1_cpu_0_instruction_master_read_data_valid_data_RAM_s1_shift_register;
  wire             registered_cpu_0_data_master_read_data_valid_data_RAM_s1;
  wire             wait_for_data_RAM_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~data_RAM_s1_end_xfer;
    end


  assign data_RAM_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_data_RAM_s1 | cpu_0_instruction_master_qualified_request_data_RAM_s1));
  //assign data_RAM_s1_readdata_from_sa = data_RAM_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign data_RAM_s1_readdata_from_sa = data_RAM_s1_readdata;

  assign cpu_0_data_master_requests_data_RAM_s1 = ({cpu_0_data_master_address_to_slave[22 : 10] , 10'b0} == 23'h10000) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //registered rdv signal_name registered_cpu_0_data_master_read_data_valid_data_RAM_s1 assignment, which is an e_assign
  assign registered_cpu_0_data_master_read_data_valid_data_RAM_s1 = cpu_0_data_master_read_data_valid_data_RAM_s1_shift_register_in;

  //data_RAM_s1_arb_share_counter set values, which is an e_mux
  assign data_RAM_s1_arb_share_set_values = 1;

  //data_RAM_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign data_RAM_s1_arb_share_counter_next_value = data_RAM_s1_firsttransfer ? (data_RAM_s1_arb_share_set_values - 1) : |data_RAM_s1_arb_share_counter ? (data_RAM_s1_arb_share_counter - 1) : 0;

  //data_RAM_s1_allgrants all slave grants, which is an e_mux
  assign data_RAM_s1_allgrants = |data_RAM_s1_grant_vector |
    |data_RAM_s1_grant_vector |
    |data_RAM_s1_grant_vector |
    |data_RAM_s1_grant_vector;

  //data_RAM_s1_end_xfer assignment, which is an e_assign
  assign data_RAM_s1_end_xfer = ~(data_RAM_s1_waits_for_read | data_RAM_s1_waits_for_write);

  //data_RAM_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign data_RAM_s1_arb_counter_enable = data_RAM_s1_end_xfer & data_RAM_s1_allgrants;

  //data_RAM_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_RAM_s1_arb_share_counter <= 0;
      else if (data_RAM_s1_arb_counter_enable)
          data_RAM_s1_arb_share_counter <= data_RAM_s1_arb_share_counter_next_value;
    end


  //data_RAM_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_RAM_s1_slavearbiterlockenable <= 0;
      else if (|data_RAM_s1_master_qreq_vector & data_RAM_s1_end_xfer)
          data_RAM_s1_slavearbiterlockenable <= |data_RAM_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master data_RAM/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = data_RAM_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //cpu_0/instruction_master data_RAM/s1 arbiterlock, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock = data_RAM_s1_slavearbiterlockenable & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master granted data_RAM/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_instruction_master_granted_slave_data_RAM_s1 <= 0;
      else if (1)
          last_cycle_cpu_0_instruction_master_granted_slave_data_RAM_s1 <= cpu_0_instruction_master_saved_grant_data_RAM_s1 ? 1 : (data_RAM_s1_arbitration_holdoff_internal | ~cpu_0_instruction_master_requests_data_RAM_s1) ? 0 : last_cycle_cpu_0_instruction_master_granted_slave_data_RAM_s1;
    end


  //cpu_0_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_0_instruction_master_continuerequest = last_cycle_cpu_0_instruction_master_granted_slave_data_RAM_s1 & cpu_0_instruction_master_requests_data_RAM_s1;

  //data_RAM_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign data_RAM_s1_any_continuerequest = cpu_0_instruction_master_continuerequest |
    cpu_0_data_master_continuerequest;

  assign cpu_0_data_master_qualified_request_data_RAM_s1 = cpu_0_data_master_requests_data_RAM_s1 & ~((cpu_0_data_master_read & ((|cpu_0_data_master_read_data_valid_data_RAM_s1_shift_register))) | ((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write) | cpu_0_instruction_master_arbiterlock);
  //cpu_0_data_master_read_data_valid_data_RAM_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_0_data_master_read_data_valid_data_RAM_s1_shift_register_in = cpu_0_data_master_granted_data_RAM_s1 & cpu_0_data_master_read & ~data_RAM_s1_waits_for_read & ~(|cpu_0_data_master_read_data_valid_data_RAM_s1_shift_register);

  //shift register p1 cpu_0_data_master_read_data_valid_data_RAM_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_0_data_master_read_data_valid_data_RAM_s1_shift_register = {cpu_0_data_master_read_data_valid_data_RAM_s1_shift_register, cpu_0_data_master_read_data_valid_data_RAM_s1_shift_register_in};

  //cpu_0_data_master_read_data_valid_data_RAM_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_read_data_valid_data_RAM_s1_shift_register <= 0;
      else if (1)
          cpu_0_data_master_read_data_valid_data_RAM_s1_shift_register <= p1_cpu_0_data_master_read_data_valid_data_RAM_s1_shift_register;
    end


  //local readdatavalid cpu_0_data_master_read_data_valid_data_RAM_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_data_RAM_s1 = cpu_0_data_master_read_data_valid_data_RAM_s1_shift_register;

  //data_RAM_s1_writedata mux, which is an e_mux
  assign data_RAM_s1_writedata = cpu_0_data_master_writedata;

  //mux data_RAM_s1_clken, which is an e_mux
  assign data_RAM_s1_clken = 1'b1;

  assign cpu_0_instruction_master_requests_data_RAM_s1 = (({cpu_0_instruction_master_address_to_slave[22 : 10] , 10'b0} == 23'h10000) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
  //cpu_0/data_master granted data_RAM/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_data_master_granted_slave_data_RAM_s1 <= 0;
      else if (1)
          last_cycle_cpu_0_data_master_granted_slave_data_RAM_s1 <= cpu_0_data_master_saved_grant_data_RAM_s1 ? 1 : (data_RAM_s1_arbitration_holdoff_internal | ~cpu_0_data_master_requests_data_RAM_s1) ? 0 : last_cycle_cpu_0_data_master_granted_slave_data_RAM_s1;
    end


  //cpu_0_data_master_continuerequest continued request, which is an e_mux
  assign cpu_0_data_master_continuerequest = last_cycle_cpu_0_data_master_granted_slave_data_RAM_s1 & cpu_0_data_master_requests_data_RAM_s1;

  assign cpu_0_instruction_master_qualified_request_data_RAM_s1 = cpu_0_instruction_master_requests_data_RAM_s1 & ~((cpu_0_instruction_master_read & ((|cpu_0_instruction_master_read_data_valid_data_RAM_s1_shift_register))) | cpu_0_data_master_arbiterlock);
  //cpu_0_instruction_master_read_data_valid_data_RAM_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_data_RAM_s1_shift_register_in = cpu_0_instruction_master_granted_data_RAM_s1 & cpu_0_instruction_master_read & ~data_RAM_s1_waits_for_read & ~(|cpu_0_instruction_master_read_data_valid_data_RAM_s1_shift_register);

  //shift register p1 cpu_0_instruction_master_read_data_valid_data_RAM_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_0_instruction_master_read_data_valid_data_RAM_s1_shift_register = {cpu_0_instruction_master_read_data_valid_data_RAM_s1_shift_register, cpu_0_instruction_master_read_data_valid_data_RAM_s1_shift_register_in};

  //cpu_0_instruction_master_read_data_valid_data_RAM_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_read_data_valid_data_RAM_s1_shift_register <= 0;
      else if (1)
          cpu_0_instruction_master_read_data_valid_data_RAM_s1_shift_register <= p1_cpu_0_instruction_master_read_data_valid_data_RAM_s1_shift_register;
    end


  //local readdatavalid cpu_0_instruction_master_read_data_valid_data_RAM_s1, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_data_RAM_s1 = cpu_0_instruction_master_read_data_valid_data_RAM_s1_shift_register;

  //allow new arb cycle for data_RAM/s1, which is an e_assign
  assign data_RAM_s1_allow_new_arb_cycle = ~cpu_0_data_master_arbiterlock & ~cpu_0_instruction_master_arbiterlock;

  //cpu_0/instruction_master assignment into master qualified-requests vector for data_RAM/s1, which is an e_assign
  assign data_RAM_s1_master_qreq_vector[0] = cpu_0_instruction_master_qualified_request_data_RAM_s1;

  //cpu_0/instruction_master grant data_RAM/s1, which is an e_assign
  assign cpu_0_instruction_master_granted_data_RAM_s1 = data_RAM_s1_grant_vector[0];

  //cpu_0/instruction_master saved-grant data_RAM/s1, which is an e_assign
  assign cpu_0_instruction_master_saved_grant_data_RAM_s1 = data_RAM_s1_arb_winner[0] && cpu_0_instruction_master_requests_data_RAM_s1;

  //cpu_0/data_master assignment into master qualified-requests vector for data_RAM/s1, which is an e_assign
  assign data_RAM_s1_master_qreq_vector[1] = cpu_0_data_master_qualified_request_data_RAM_s1;

  //cpu_0/data_master grant data_RAM/s1, which is an e_assign
  assign cpu_0_data_master_granted_data_RAM_s1 = data_RAM_s1_grant_vector[1];

  //cpu_0/data_master saved-grant data_RAM/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_data_RAM_s1 = data_RAM_s1_arb_winner[1] && cpu_0_data_master_requests_data_RAM_s1;

  //data_RAM/s1 chosen-master double-vector, which is an e_assign
  assign data_RAM_s1_chosen_master_double_vector = {data_RAM_s1_master_qreq_vector, data_RAM_s1_master_qreq_vector} & ({~data_RAM_s1_master_qreq_vector, ~data_RAM_s1_master_qreq_vector} + data_RAM_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign data_RAM_s1_arb_winner = (data_RAM_s1_allow_new_arb_cycle & | data_RAM_s1_grant_vector) ? data_RAM_s1_grant_vector : data_RAM_s1_saved_chosen_master_vector;

  //saved data_RAM_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_RAM_s1_saved_chosen_master_vector <= 0;
      else if (data_RAM_s1_allow_new_arb_cycle)
          data_RAM_s1_saved_chosen_master_vector <= |data_RAM_s1_grant_vector ? data_RAM_s1_grant_vector : data_RAM_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign data_RAM_s1_grant_vector = {(data_RAM_s1_chosen_master_double_vector[1] | data_RAM_s1_chosen_master_double_vector[3]),
    (data_RAM_s1_chosen_master_double_vector[0] | data_RAM_s1_chosen_master_double_vector[2])};

  //data_RAM/s1 chosen master rotated left, which is an e_assign
  assign data_RAM_s1_chosen_master_rot_left = (data_RAM_s1_arb_winner << 1) ? (data_RAM_s1_arb_winner << 1) : 1;

  //data_RAM/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_RAM_s1_arb_addend <= 1;
      else if (|data_RAM_s1_grant_vector)
          data_RAM_s1_arb_addend <= data_RAM_s1_end_xfer? data_RAM_s1_chosen_master_rot_left : data_RAM_s1_grant_vector;
    end


  assign data_RAM_s1_chipselect = cpu_0_data_master_granted_data_RAM_s1 | cpu_0_instruction_master_granted_data_RAM_s1;
  //data_RAM_s1_firsttransfer first transaction, which is an e_assign
  assign data_RAM_s1_firsttransfer = ~(data_RAM_s1_slavearbiterlockenable & data_RAM_s1_any_continuerequest);

  //data_RAM_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign data_RAM_s1_beginbursttransfer_internal = data_RAM_s1_begins_xfer & data_RAM_s1_firsttransfer;

  //data_RAM_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign data_RAM_s1_arbitration_holdoff_internal = data_RAM_s1_begins_xfer & data_RAM_s1_firsttransfer;

  //data_RAM_s1_write assignment, which is an e_mux
  assign data_RAM_s1_write = cpu_0_data_master_granted_data_RAM_s1 & cpu_0_data_master_write;

  //data_RAM_s1_address mux, which is an e_mux
  assign data_RAM_s1_address = (cpu_0_data_master_granted_data_RAM_s1)? (cpu_0_data_master_address_to_slave >> 2) :
    (cpu_0_instruction_master_address_to_slave >> 2);

  //d1_data_RAM_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_data_RAM_s1_end_xfer <= 1;
      else if (1)
          d1_data_RAM_s1_end_xfer <= data_RAM_s1_end_xfer;
    end


  //data_RAM_s1_waits_for_read in a cycle, which is an e_mux
  assign data_RAM_s1_waits_for_read = data_RAM_s1_in_a_read_cycle & 0;

  //data_RAM_s1_in_a_read_cycle assignment, which is an e_assign
  assign data_RAM_s1_in_a_read_cycle = (cpu_0_data_master_granted_data_RAM_s1 & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_data_RAM_s1 & cpu_0_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = data_RAM_s1_in_a_read_cycle;

  //data_RAM_s1_waits_for_write in a cycle, which is an e_mux
  assign data_RAM_s1_waits_for_write = data_RAM_s1_in_a_write_cycle & 0;

  //data_RAM_s1_in_a_write_cycle assignment, which is an e_assign
  assign data_RAM_s1_in_a_write_cycle = cpu_0_data_master_granted_data_RAM_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = data_RAM_s1_in_a_write_cycle;

  assign wait_for_data_RAM_s1_counter = 0;
  //data_RAM_s1_byteenable byte enable port mux, which is an e_mux
  assign data_RAM_s1_byteenable = (cpu_0_data_master_granted_data_RAM_s1)? cpu_0_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_granted_data_RAM_s1 + cpu_0_instruction_master_granted_data_RAM_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_saved_grant_data_RAM_s1 + cpu_0_instruction_master_saved_grant_data_RAM_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


module firmware_ROM_s1_arbitrator (
                                    // inputs:
                                     clk,
                                     cpu_0_data_master_address_to_slave,
                                     cpu_0_data_master_byteenable,
                                     cpu_0_data_master_read,
                                     cpu_0_data_master_waitrequest,
                                     cpu_0_data_master_write,
                                     cpu_0_data_master_writedata,
                                     cpu_0_instruction_master_address_to_slave,
                                     cpu_0_instruction_master_read,
                                     firmware_ROM_s1_readdata,
                                     reset_n,

                                    // outputs:
                                     cpu_0_data_master_granted_firmware_ROM_s1,
                                     cpu_0_data_master_qualified_request_firmware_ROM_s1,
                                     cpu_0_data_master_read_data_valid_firmware_ROM_s1,
                                     cpu_0_data_master_requests_firmware_ROM_s1,
                                     cpu_0_instruction_master_granted_firmware_ROM_s1,
                                     cpu_0_instruction_master_qualified_request_firmware_ROM_s1,
                                     cpu_0_instruction_master_read_data_valid_firmware_ROM_s1,
                                     cpu_0_instruction_master_requests_firmware_ROM_s1,
                                     d1_firmware_ROM_s1_end_xfer,
                                     firmware_ROM_s1_address,
                                     firmware_ROM_s1_byteenable,
                                     firmware_ROM_s1_chipselect,
                                     firmware_ROM_s1_clken,
                                     firmware_ROM_s1_readdata_from_sa,
                                     firmware_ROM_s1_write,
                                     firmware_ROM_s1_writedata,
                                     registered_cpu_0_data_master_read_data_valid_firmware_ROM_s1
                                  )
  /* synthesis auto_dissolve = "FALSE" */ ;

  output           cpu_0_data_master_granted_firmware_ROM_s1;
  output           cpu_0_data_master_qualified_request_firmware_ROM_s1;
  output           cpu_0_data_master_read_data_valid_firmware_ROM_s1;
  output           cpu_0_data_master_requests_firmware_ROM_s1;
  output           cpu_0_instruction_master_granted_firmware_ROM_s1;
  output           cpu_0_instruction_master_qualified_request_firmware_ROM_s1;
  output           cpu_0_instruction_master_read_data_valid_firmware_ROM_s1;
  output           cpu_0_instruction_master_requests_firmware_ROM_s1;
  output           d1_firmware_ROM_s1_end_xfer;
  output  [  9: 0] firmware_ROM_s1_address;
  output  [  3: 0] firmware_ROM_s1_byteenable;
  output           firmware_ROM_s1_chipselect;
  output           firmware_ROM_s1_clken;
  output  [ 31: 0] firmware_ROM_s1_readdata_from_sa;
  output           firmware_ROM_s1_write;
  output  [ 31: 0] firmware_ROM_s1_writedata;
  output           registered_cpu_0_data_master_read_data_valid_firmware_ROM_s1;
  input            clk;
  input   [ 22: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 22: 0] cpu_0_instruction_master_address_to_slave;
  input            cpu_0_instruction_master_read;
  input   [ 31: 0] firmware_ROM_s1_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_firmware_ROM_s1;
  wire             cpu_0_data_master_qualified_request_firmware_ROM_s1;
  wire             cpu_0_data_master_read_data_valid_firmware_ROM_s1;
  reg              cpu_0_data_master_read_data_valid_firmware_ROM_s1_shift_register;
  wire             cpu_0_data_master_read_data_valid_firmware_ROM_s1_shift_register_in;
  wire             cpu_0_data_master_requests_firmware_ROM_s1;
  wire             cpu_0_data_master_saved_grant_firmware_ROM_s1;
  wire             cpu_0_instruction_master_arbiterlock;
  wire             cpu_0_instruction_master_continuerequest;
  wire             cpu_0_instruction_master_granted_firmware_ROM_s1;
  wire             cpu_0_instruction_master_qualified_request_firmware_ROM_s1;
  wire             cpu_0_instruction_master_read_data_valid_firmware_ROM_s1;
  reg              cpu_0_instruction_master_read_data_valid_firmware_ROM_s1_shift_register;
  wire             cpu_0_instruction_master_read_data_valid_firmware_ROM_s1_shift_register_in;
  wire             cpu_0_instruction_master_requests_firmware_ROM_s1;
  wire             cpu_0_instruction_master_saved_grant_firmware_ROM_s1;
  reg              d1_firmware_ROM_s1_end_xfer;
  reg              d1_reasons_to_wait;
  wire    [  9: 0] firmware_ROM_s1_address;
  wire             firmware_ROM_s1_allgrants;
  wire             firmware_ROM_s1_allow_new_arb_cycle;
  wire             firmware_ROM_s1_any_continuerequest;
  reg     [  1: 0] firmware_ROM_s1_arb_addend;
  wire             firmware_ROM_s1_arb_counter_enable;
  reg     [  2: 0] firmware_ROM_s1_arb_share_counter;
  wire    [  2: 0] firmware_ROM_s1_arb_share_counter_next_value;
  wire    [  2: 0] firmware_ROM_s1_arb_share_set_values;
  wire    [  1: 0] firmware_ROM_s1_arb_winner;
  wire             firmware_ROM_s1_arbitration_holdoff_internal;
  wire             firmware_ROM_s1_beginbursttransfer_internal;
  wire             firmware_ROM_s1_begins_xfer;
  wire    [  3: 0] firmware_ROM_s1_byteenable;
  wire             firmware_ROM_s1_chipselect;
  wire    [  3: 0] firmware_ROM_s1_chosen_master_double_vector;
  wire    [  1: 0] firmware_ROM_s1_chosen_master_rot_left;
  wire             firmware_ROM_s1_clken;
  wire             firmware_ROM_s1_end_xfer;
  wire             firmware_ROM_s1_firsttransfer;
  wire    [  1: 0] firmware_ROM_s1_grant_vector;
  wire             firmware_ROM_s1_in_a_read_cycle;
  wire             firmware_ROM_s1_in_a_write_cycle;
  wire    [  1: 0] firmware_ROM_s1_master_qreq_vector;
  wire    [ 31: 0] firmware_ROM_s1_readdata_from_sa;
  reg     [  1: 0] firmware_ROM_s1_saved_chosen_master_vector;
  reg              firmware_ROM_s1_slavearbiterlockenable;
  wire             firmware_ROM_s1_waits_for_read;
  wire             firmware_ROM_s1_waits_for_write;
  wire             firmware_ROM_s1_write;
  wire    [ 31: 0] firmware_ROM_s1_writedata;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_0_data_master_granted_slave_firmware_ROM_s1;
  reg              last_cycle_cpu_0_instruction_master_granted_slave_firmware_ROM_s1;
  wire             p1_cpu_0_data_master_read_data_valid_firmware_ROM_s1_shift_register;
  wire             p1_cpu_0_instruction_master_read_data_valid_firmware_ROM_s1_shift_register;
  wire             registered_cpu_0_data_master_read_data_valid_firmware_ROM_s1;
  wire             wait_for_firmware_ROM_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~firmware_ROM_s1_end_xfer;
    end


  assign firmware_ROM_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_firmware_ROM_s1 | cpu_0_instruction_master_qualified_request_firmware_ROM_s1));
  //assign firmware_ROM_s1_readdata_from_sa = firmware_ROM_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign firmware_ROM_s1_readdata_from_sa = firmware_ROM_s1_readdata;

  assign cpu_0_data_master_requests_firmware_ROM_s1 = ({cpu_0_data_master_address_to_slave[22 : 12] , 12'b0} == 23'h0) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //registered rdv signal_name registered_cpu_0_data_master_read_data_valid_firmware_ROM_s1 assignment, which is an e_assign
  assign registered_cpu_0_data_master_read_data_valid_firmware_ROM_s1 = cpu_0_data_master_read_data_valid_firmware_ROM_s1_shift_register_in;

  //firmware_ROM_s1_arb_share_counter set values, which is an e_mux
  assign firmware_ROM_s1_arb_share_set_values = 1;

  //firmware_ROM_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign firmware_ROM_s1_arb_share_counter_next_value = firmware_ROM_s1_firsttransfer ? (firmware_ROM_s1_arb_share_set_values - 1) : |firmware_ROM_s1_arb_share_counter ? (firmware_ROM_s1_arb_share_counter - 1) : 0;

  //firmware_ROM_s1_allgrants all slave grants, which is an e_mux
  assign firmware_ROM_s1_allgrants = |firmware_ROM_s1_grant_vector |
    |firmware_ROM_s1_grant_vector |
    |firmware_ROM_s1_grant_vector |
    |firmware_ROM_s1_grant_vector;

  //firmware_ROM_s1_end_xfer assignment, which is an e_assign
  assign firmware_ROM_s1_end_xfer = ~(firmware_ROM_s1_waits_for_read | firmware_ROM_s1_waits_for_write);

  //firmware_ROM_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign firmware_ROM_s1_arb_counter_enable = firmware_ROM_s1_end_xfer & firmware_ROM_s1_allgrants;

  //firmware_ROM_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          firmware_ROM_s1_arb_share_counter <= 0;
      else if (firmware_ROM_s1_arb_counter_enable)
          firmware_ROM_s1_arb_share_counter <= firmware_ROM_s1_arb_share_counter_next_value;
    end


  //firmware_ROM_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          firmware_ROM_s1_slavearbiterlockenable <= 0;
      else if (|firmware_ROM_s1_master_qreq_vector & firmware_ROM_s1_end_xfer)
          firmware_ROM_s1_slavearbiterlockenable <= |firmware_ROM_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master firmware_ROM/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = firmware_ROM_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //cpu_0/instruction_master firmware_ROM/s1 arbiterlock, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock = firmware_ROM_s1_slavearbiterlockenable & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master granted firmware_ROM/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_instruction_master_granted_slave_firmware_ROM_s1 <= 0;
      else if (1)
          last_cycle_cpu_0_instruction_master_granted_slave_firmware_ROM_s1 <= cpu_0_instruction_master_saved_grant_firmware_ROM_s1 ? 1 : (firmware_ROM_s1_arbitration_holdoff_internal | ~cpu_0_instruction_master_requests_firmware_ROM_s1) ? 0 : last_cycle_cpu_0_instruction_master_granted_slave_firmware_ROM_s1;
    end


  //cpu_0_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_0_instruction_master_continuerequest = last_cycle_cpu_0_instruction_master_granted_slave_firmware_ROM_s1 & cpu_0_instruction_master_requests_firmware_ROM_s1;

  //firmware_ROM_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign firmware_ROM_s1_any_continuerequest = cpu_0_instruction_master_continuerequest |
    cpu_0_data_master_continuerequest;

  assign cpu_0_data_master_qualified_request_firmware_ROM_s1 = cpu_0_data_master_requests_firmware_ROM_s1 & ~((cpu_0_data_master_read & ((|cpu_0_data_master_read_data_valid_firmware_ROM_s1_shift_register))) | ((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write) | cpu_0_instruction_master_arbiterlock);
  //cpu_0_data_master_read_data_valid_firmware_ROM_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_0_data_master_read_data_valid_firmware_ROM_s1_shift_register_in = cpu_0_data_master_granted_firmware_ROM_s1 & cpu_0_data_master_read & ~firmware_ROM_s1_waits_for_read & ~(|cpu_0_data_master_read_data_valid_firmware_ROM_s1_shift_register);

  //shift register p1 cpu_0_data_master_read_data_valid_firmware_ROM_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_0_data_master_read_data_valid_firmware_ROM_s1_shift_register = {cpu_0_data_master_read_data_valid_firmware_ROM_s1_shift_register, cpu_0_data_master_read_data_valid_firmware_ROM_s1_shift_register_in};

  //cpu_0_data_master_read_data_valid_firmware_ROM_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_read_data_valid_firmware_ROM_s1_shift_register <= 0;
      else if (1)
          cpu_0_data_master_read_data_valid_firmware_ROM_s1_shift_register <= p1_cpu_0_data_master_read_data_valid_firmware_ROM_s1_shift_register;
    end


  //local readdatavalid cpu_0_data_master_read_data_valid_firmware_ROM_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_firmware_ROM_s1 = cpu_0_data_master_read_data_valid_firmware_ROM_s1_shift_register;

  //firmware_ROM_s1_writedata mux, which is an e_mux
  assign firmware_ROM_s1_writedata = cpu_0_data_master_writedata;

  //mux firmware_ROM_s1_clken, which is an e_mux
  assign firmware_ROM_s1_clken = 1'b1;

  assign cpu_0_instruction_master_requests_firmware_ROM_s1 = (({cpu_0_instruction_master_address_to_slave[22 : 12] , 12'b0} == 23'h0) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
  //cpu_0/data_master granted firmware_ROM/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_data_master_granted_slave_firmware_ROM_s1 <= 0;
      else if (1)
          last_cycle_cpu_0_data_master_granted_slave_firmware_ROM_s1 <= cpu_0_data_master_saved_grant_firmware_ROM_s1 ? 1 : (firmware_ROM_s1_arbitration_holdoff_internal | ~cpu_0_data_master_requests_firmware_ROM_s1) ? 0 : last_cycle_cpu_0_data_master_granted_slave_firmware_ROM_s1;
    end


  //cpu_0_data_master_continuerequest continued request, which is an e_mux
  assign cpu_0_data_master_continuerequest = last_cycle_cpu_0_data_master_granted_slave_firmware_ROM_s1 & cpu_0_data_master_requests_firmware_ROM_s1;

  assign cpu_0_instruction_master_qualified_request_firmware_ROM_s1 = cpu_0_instruction_master_requests_firmware_ROM_s1 & ~((cpu_0_instruction_master_read & ((|cpu_0_instruction_master_read_data_valid_firmware_ROM_s1_shift_register))) | cpu_0_data_master_arbiterlock);
  //cpu_0_instruction_master_read_data_valid_firmware_ROM_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_firmware_ROM_s1_shift_register_in = cpu_0_instruction_master_granted_firmware_ROM_s1 & cpu_0_instruction_master_read & ~firmware_ROM_s1_waits_for_read & ~(|cpu_0_instruction_master_read_data_valid_firmware_ROM_s1_shift_register);

  //shift register p1 cpu_0_instruction_master_read_data_valid_firmware_ROM_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_0_instruction_master_read_data_valid_firmware_ROM_s1_shift_register = {cpu_0_instruction_master_read_data_valid_firmware_ROM_s1_shift_register, cpu_0_instruction_master_read_data_valid_firmware_ROM_s1_shift_register_in};

  //cpu_0_instruction_master_read_data_valid_firmware_ROM_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_read_data_valid_firmware_ROM_s1_shift_register <= 0;
      else if (1)
          cpu_0_instruction_master_read_data_valid_firmware_ROM_s1_shift_register <= p1_cpu_0_instruction_master_read_data_valid_firmware_ROM_s1_shift_register;
    end


  //local readdatavalid cpu_0_instruction_master_read_data_valid_firmware_ROM_s1, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_firmware_ROM_s1 = cpu_0_instruction_master_read_data_valid_firmware_ROM_s1_shift_register;

  //allow new arb cycle for firmware_ROM/s1, which is an e_assign
  assign firmware_ROM_s1_allow_new_arb_cycle = ~cpu_0_data_master_arbiterlock & ~cpu_0_instruction_master_arbiterlock;

  //cpu_0/instruction_master assignment into master qualified-requests vector for firmware_ROM/s1, which is an e_assign
  assign firmware_ROM_s1_master_qreq_vector[0] = cpu_0_instruction_master_qualified_request_firmware_ROM_s1;

  //cpu_0/instruction_master grant firmware_ROM/s1, which is an e_assign
  assign cpu_0_instruction_master_granted_firmware_ROM_s1 = firmware_ROM_s1_grant_vector[0];

  //cpu_0/instruction_master saved-grant firmware_ROM/s1, which is an e_assign
  assign cpu_0_instruction_master_saved_grant_firmware_ROM_s1 = firmware_ROM_s1_arb_winner[0] && cpu_0_instruction_master_requests_firmware_ROM_s1;

  //cpu_0/data_master assignment into master qualified-requests vector for firmware_ROM/s1, which is an e_assign
  assign firmware_ROM_s1_master_qreq_vector[1] = cpu_0_data_master_qualified_request_firmware_ROM_s1;

  //cpu_0/data_master grant firmware_ROM/s1, which is an e_assign
  assign cpu_0_data_master_granted_firmware_ROM_s1 = firmware_ROM_s1_grant_vector[1];

  //cpu_0/data_master saved-grant firmware_ROM/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_firmware_ROM_s1 = firmware_ROM_s1_arb_winner[1] && cpu_0_data_master_requests_firmware_ROM_s1;

  //firmware_ROM/s1 chosen-master double-vector, which is an e_assign
  assign firmware_ROM_s1_chosen_master_double_vector = {firmware_ROM_s1_master_qreq_vector, firmware_ROM_s1_master_qreq_vector} & ({~firmware_ROM_s1_master_qreq_vector, ~firmware_ROM_s1_master_qreq_vector} + firmware_ROM_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign firmware_ROM_s1_arb_winner = (firmware_ROM_s1_allow_new_arb_cycle & | firmware_ROM_s1_grant_vector) ? firmware_ROM_s1_grant_vector : firmware_ROM_s1_saved_chosen_master_vector;

  //saved firmware_ROM_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          firmware_ROM_s1_saved_chosen_master_vector <= 0;
      else if (firmware_ROM_s1_allow_new_arb_cycle)
          firmware_ROM_s1_saved_chosen_master_vector <= |firmware_ROM_s1_grant_vector ? firmware_ROM_s1_grant_vector : firmware_ROM_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign firmware_ROM_s1_grant_vector = {(firmware_ROM_s1_chosen_master_double_vector[1] | firmware_ROM_s1_chosen_master_double_vector[3]),
    (firmware_ROM_s1_chosen_master_double_vector[0] | firmware_ROM_s1_chosen_master_double_vector[2])};

  //firmware_ROM/s1 chosen master rotated left, which is an e_assign
  assign firmware_ROM_s1_chosen_master_rot_left = (firmware_ROM_s1_arb_winner << 1) ? (firmware_ROM_s1_arb_winner << 1) : 1;

  //firmware_ROM/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          firmware_ROM_s1_arb_addend <= 1;
      else if (|firmware_ROM_s1_grant_vector)
          firmware_ROM_s1_arb_addend <= firmware_ROM_s1_end_xfer? firmware_ROM_s1_chosen_master_rot_left : firmware_ROM_s1_grant_vector;
    end


  assign firmware_ROM_s1_chipselect = cpu_0_data_master_granted_firmware_ROM_s1 | cpu_0_instruction_master_granted_firmware_ROM_s1;
  //firmware_ROM_s1_firsttransfer first transaction, which is an e_assign
  assign firmware_ROM_s1_firsttransfer = ~(firmware_ROM_s1_slavearbiterlockenable & firmware_ROM_s1_any_continuerequest);

  //firmware_ROM_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign firmware_ROM_s1_beginbursttransfer_internal = firmware_ROM_s1_begins_xfer & firmware_ROM_s1_firsttransfer;

  //firmware_ROM_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign firmware_ROM_s1_arbitration_holdoff_internal = firmware_ROM_s1_begins_xfer & firmware_ROM_s1_firsttransfer;

  //firmware_ROM_s1_write assignment, which is an e_mux
  assign firmware_ROM_s1_write = cpu_0_data_master_granted_firmware_ROM_s1 & cpu_0_data_master_write;

  //firmware_ROM_s1_address mux, which is an e_mux
  assign firmware_ROM_s1_address = (cpu_0_data_master_granted_firmware_ROM_s1)? (cpu_0_data_master_address_to_slave >> 2) :
    (cpu_0_instruction_master_address_to_slave >> 2);

  //d1_firmware_ROM_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_firmware_ROM_s1_end_xfer <= 1;
      else if (1)
          d1_firmware_ROM_s1_end_xfer <= firmware_ROM_s1_end_xfer;
    end


  //firmware_ROM_s1_waits_for_read in a cycle, which is an e_mux
  assign firmware_ROM_s1_waits_for_read = firmware_ROM_s1_in_a_read_cycle & 0;

  //firmware_ROM_s1_in_a_read_cycle assignment, which is an e_assign
  assign firmware_ROM_s1_in_a_read_cycle = (cpu_0_data_master_granted_firmware_ROM_s1 & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_firmware_ROM_s1 & cpu_0_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = firmware_ROM_s1_in_a_read_cycle;

  //firmware_ROM_s1_waits_for_write in a cycle, which is an e_mux
  assign firmware_ROM_s1_waits_for_write = firmware_ROM_s1_in_a_write_cycle & 0;

  //firmware_ROM_s1_in_a_write_cycle assignment, which is an e_assign
  assign firmware_ROM_s1_in_a_write_cycle = cpu_0_data_master_granted_firmware_ROM_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = firmware_ROM_s1_in_a_write_cycle;

  assign wait_for_firmware_ROM_s1_counter = 0;
  //firmware_ROM_s1_byteenable byte enable port mux, which is an e_mux
  assign firmware_ROM_s1_byteenable = (cpu_0_data_master_granted_firmware_ROM_s1)? cpu_0_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_granted_firmware_ROM_s1 + cpu_0_instruction_master_granted_firmware_ROM_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_saved_grant_firmware_ROM_s1 + cpu_0_instruction_master_saved_grant_firmware_ROM_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


module jtag_uart_0_avalon_jtag_slave_arbitrator (
                                                  // inputs:
                                                   clk,
                                                   cpu_0_data_master_address_to_slave,
                                                   cpu_0_data_master_read,
                                                   cpu_0_data_master_waitrequest,
                                                   cpu_0_data_master_write,
                                                   cpu_0_data_master_writedata,
                                                   jtag_uart_0_avalon_jtag_slave_dataavailable,
                                                   jtag_uart_0_avalon_jtag_slave_irq,
                                                   jtag_uart_0_avalon_jtag_slave_readdata,
                                                   jtag_uart_0_avalon_jtag_slave_readyfordata,
                                                   jtag_uart_0_avalon_jtag_slave_waitrequest,
                                                   reset_n,

                                                  // outputs:
                                                   cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave,
                                                   cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave,
                                                   cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave,
                                                   cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave,
                                                   d1_jtag_uart_0_avalon_jtag_slave_end_xfer,
                                                   jtag_uart_0_avalon_jtag_slave_address,
                                                   jtag_uart_0_avalon_jtag_slave_chipselect,
                                                   jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_irq_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_read_n,
                                                   jtag_uart_0_avalon_jtag_slave_readdata_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_reset_n,
                                                   jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_write_n,
                                                   jtag_uart_0_avalon_jtag_slave_writedata
                                                )
  /* synthesis auto_dissolve = "FALSE" */ ;

  output           cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  output           cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;
  output           cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  output           cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;
  output           d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  output           jtag_uart_0_avalon_jtag_slave_address;
  output           jtag_uart_0_avalon_jtag_slave_chipselect;
  output           jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_read_n;
  output  [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_reset_n;
  output           jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_write_n;
  output  [ 31: 0] jtag_uart_0_avalon_jtag_slave_writedata;
  input            clk;
  input   [ 22: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            jtag_uart_0_avalon_jtag_slave_dataavailable;
  input            jtag_uart_0_avalon_jtag_slave_irq;
  input   [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata;
  input            jtag_uart_0_avalon_jtag_slave_readyfordata;
  input            jtag_uart_0_avalon_jtag_slave_waitrequest;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_saved_grant_jtag_uart_0_avalon_jtag_slave;
  reg              d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  reg              d1_reasons_to_wait;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_address;
  wire             jtag_uart_0_avalon_jtag_slave_allgrants;
  wire             jtag_uart_0_avalon_jtag_slave_allow_new_arb_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_any_continuerequest;
  wire             jtag_uart_0_avalon_jtag_slave_arb_counter_enable;
  reg     [  2: 0] jtag_uart_0_avalon_jtag_slave_arb_share_counter;
  wire    [  2: 0] jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;
  wire    [  2: 0] jtag_uart_0_avalon_jtag_slave_arb_share_set_values;
  wire             jtag_uart_0_avalon_jtag_slave_beginbursttransfer_internal;
  wire             jtag_uart_0_avalon_jtag_slave_begins_xfer;
  wire             jtag_uart_0_avalon_jtag_slave_chipselect;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_end_xfer;
  wire             jtag_uart_0_avalon_jtag_slave_firsttransfer;
  wire             jtag_uart_0_avalon_jtag_slave_grant_vector;
  wire             jtag_uart_0_avalon_jtag_slave_in_a_read_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_in_a_write_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_master_qreq_vector;
  wire             jtag_uart_0_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_reset_n;
  reg              jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable;
  wire             jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_waits_for_read;
  wire             jtag_uart_0_avalon_jtag_slave_waits_for_write;
  wire             jtag_uart_0_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_writedata;
  wire             wait_for_jtag_uart_0_avalon_jtag_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~jtag_uart_0_avalon_jtag_slave_end_xfer;
    end


  assign jtag_uart_0_avalon_jtag_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave));
  //assign jtag_uart_0_avalon_jtag_slave_readdata_from_sa = jtag_uart_0_avalon_jtag_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_readdata_from_sa = jtag_uart_0_avalon_jtag_slave_readdata;

  assign cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave = ({cpu_0_data_master_address_to_slave[22 : 3] , 3'b0} == 23'h30000) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //assign jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_0_avalon_jtag_slave_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_0_avalon_jtag_slave_dataavailable;

  //assign jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_0_avalon_jtag_slave_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_0_avalon_jtag_slave_readyfordata;

  //assign jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_0_avalon_jtag_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_0_avalon_jtag_slave_waitrequest;

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter set values, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_arb_share_set_values = 1;

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value = jtag_uart_0_avalon_jtag_slave_firsttransfer ? (jtag_uart_0_avalon_jtag_slave_arb_share_set_values - 1) : |jtag_uart_0_avalon_jtag_slave_arb_share_counter ? (jtag_uart_0_avalon_jtag_slave_arb_share_counter - 1) : 0;

  //jtag_uart_0_avalon_jtag_slave_allgrants all slave grants, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_allgrants = |jtag_uart_0_avalon_jtag_slave_grant_vector;

  //jtag_uart_0_avalon_jtag_slave_end_xfer assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_end_xfer = ~(jtag_uart_0_avalon_jtag_slave_waits_for_read | jtag_uart_0_avalon_jtag_slave_waits_for_write);

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_arb_counter_enable = jtag_uart_0_avalon_jtag_slave_end_xfer & jtag_uart_0_avalon_jtag_slave_allgrants;

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_0_avalon_jtag_slave_arb_share_counter <= 0;
      else if (jtag_uart_0_avalon_jtag_slave_arb_counter_enable)
          jtag_uart_0_avalon_jtag_slave_arb_share_counter <= jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable <= 0;
      else if (|jtag_uart_0_avalon_jtag_slave_master_qreq_vector & jtag_uart_0_avalon_jtag_slave_end_xfer)
          jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable <= |jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //cpu_0/data_master jtag_uart_0/avalon_jtag_slave arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //jtag_uart_0_avalon_jtag_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave = cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave & ~((cpu_0_data_master_read & (~cpu_0_data_master_waitrequest)) | ((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write));
  //jtag_uart_0_avalon_jtag_slave_writedata mux, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave = cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;

  //cpu_0/data_master saved-grant jtag_uart_0/avalon_jtag_slave, which is an e_assign
  assign cpu_0_data_master_saved_grant_jtag_uart_0_avalon_jtag_slave = cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;

  //allow new arb cycle for jtag_uart_0/avalon_jtag_slave, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign jtag_uart_0_avalon_jtag_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign jtag_uart_0_avalon_jtag_slave_master_qreq_vector = 1;

  //jtag_uart_0_avalon_jtag_slave_reset_n assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_reset_n = reset_n;

  assign jtag_uart_0_avalon_jtag_slave_chipselect = cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  //jtag_uart_0_avalon_jtag_slave_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_firsttransfer = ~(jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable & jtag_uart_0_avalon_jtag_slave_any_continuerequest);

  //jtag_uart_0_avalon_jtag_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_beginbursttransfer_internal = jtag_uart_0_avalon_jtag_slave_begins_xfer & jtag_uart_0_avalon_jtag_slave_firsttransfer;

  //~jtag_uart_0_avalon_jtag_slave_read_n assignment, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_read_n = ~(cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave & cpu_0_data_master_read);

  //~jtag_uart_0_avalon_jtag_slave_write_n assignment, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_write_n = ~(cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave & cpu_0_data_master_write);

  //jtag_uart_0_avalon_jtag_slave_address mux, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_address = cpu_0_data_master_address_to_slave >> 2;

  //d1_jtag_uart_0_avalon_jtag_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_jtag_uart_0_avalon_jtag_slave_end_xfer <= 1;
      else if (1)
          d1_jtag_uart_0_avalon_jtag_slave_end_xfer <= jtag_uart_0_avalon_jtag_slave_end_xfer;
    end


  //jtag_uart_0_avalon_jtag_slave_waits_for_read in a cycle, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_waits_for_read = jtag_uart_0_avalon_jtag_slave_in_a_read_cycle & jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_0_avalon_jtag_slave_in_a_read_cycle assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_in_a_read_cycle = cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = jtag_uart_0_avalon_jtag_slave_in_a_read_cycle;

  //jtag_uart_0_avalon_jtag_slave_waits_for_write in a cycle, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_waits_for_write = jtag_uart_0_avalon_jtag_slave_in_a_write_cycle & jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_0_avalon_jtag_slave_in_a_write_cycle assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_in_a_write_cycle = cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = jtag_uart_0_avalon_jtag_slave_in_a_write_cycle;

  assign wait_for_jtag_uart_0_avalon_jtag_slave_counter = 0;
  //assign jtag_uart_0_avalon_jtag_slave_irq_from_sa = jtag_uart_0_avalon_jtag_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_irq_from_sa = jtag_uart_0_avalon_jtag_slave_irq;


endmodule


module payload_buffer_s1_arbitrator (
                                      // inputs:
                                       clk,
                                       cpu_0_data_master_address_to_slave,
                                       cpu_0_data_master_byteenable,
                                       cpu_0_data_master_dbs_address,
                                       cpu_0_data_master_dbs_write_16,
                                       cpu_0_data_master_no_byte_enables_and_last_term,
                                       cpu_0_data_master_read,
                                       cpu_0_data_master_waitrequest,
                                       cpu_0_data_master_write,
                                       cpu_0_instruction_master_address_to_slave,
                                       cpu_0_instruction_master_dbs_address,
                                       cpu_0_instruction_master_read,
                                       payload_buffer_s1_readdata,
                                       reset_n,

                                      // outputs:
                                       cpu_0_data_master_byteenable_payload_buffer_s1,
                                       cpu_0_data_master_granted_payload_buffer_s1,
                                       cpu_0_data_master_qualified_request_payload_buffer_s1,
                                       cpu_0_data_master_read_data_valid_payload_buffer_s1,
                                       cpu_0_data_master_requests_payload_buffer_s1,
                                       cpu_0_instruction_master_granted_payload_buffer_s1,
                                       cpu_0_instruction_master_qualified_request_payload_buffer_s1,
                                       cpu_0_instruction_master_read_data_valid_payload_buffer_s1,
                                       cpu_0_instruction_master_requests_payload_buffer_s1,
                                       d1_payload_buffer_s1_end_xfer,
                                       payload_buffer_s1_address,
                                       payload_buffer_s1_byteenable,
                                       payload_buffer_s1_chipselect,
                                       payload_buffer_s1_clken,
                                       payload_buffer_s1_readdata_from_sa,
                                       payload_buffer_s1_write,
                                       payload_buffer_s1_writedata,
                                       registered_cpu_0_data_master_read_data_valid_payload_buffer_s1
                                    )
  /* synthesis auto_dissolve = "FALSE" */ ;

  output  [  1: 0] cpu_0_data_master_byteenable_payload_buffer_s1;
  output           cpu_0_data_master_granted_payload_buffer_s1;
  output           cpu_0_data_master_qualified_request_payload_buffer_s1;
  output           cpu_0_data_master_read_data_valid_payload_buffer_s1;
  output           cpu_0_data_master_requests_payload_buffer_s1;
  output           cpu_0_instruction_master_granted_payload_buffer_s1;
  output           cpu_0_instruction_master_qualified_request_payload_buffer_s1;
  output           cpu_0_instruction_master_read_data_valid_payload_buffer_s1;
  output           cpu_0_instruction_master_requests_payload_buffer_s1;
  output           d1_payload_buffer_s1_end_xfer;
  output  [ 12: 0] payload_buffer_s1_address;
  output  [  1: 0] payload_buffer_s1_byteenable;
  output           payload_buffer_s1_chipselect;
  output           payload_buffer_s1_clken;
  output  [ 15: 0] payload_buffer_s1_readdata_from_sa;
  output           payload_buffer_s1_write;
  output  [ 15: 0] payload_buffer_s1_writedata;
  output           registered_cpu_0_data_master_read_data_valid_payload_buffer_s1;
  input            clk;
  input   [ 22: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input   [  1: 0] cpu_0_data_master_dbs_address;
  input   [ 15: 0] cpu_0_data_master_dbs_write_16;
  input            cpu_0_data_master_no_byte_enables_and_last_term;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 22: 0] cpu_0_instruction_master_address_to_slave;
  input   [  1: 0] cpu_0_instruction_master_dbs_address;
  input            cpu_0_instruction_master_read;
  input   [ 15: 0] payload_buffer_s1_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire    [  1: 0] cpu_0_data_master_byteenable_payload_buffer_s1;
  wire    [  1: 0] cpu_0_data_master_byteenable_payload_buffer_s1_segment_0;
  wire    [  1: 0] cpu_0_data_master_byteenable_payload_buffer_s1_segment_1;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_payload_buffer_s1;
  wire             cpu_0_data_master_qualified_request_payload_buffer_s1;
  wire             cpu_0_data_master_read_data_valid_payload_buffer_s1;
  reg              cpu_0_data_master_read_data_valid_payload_buffer_s1_shift_register;
  wire             cpu_0_data_master_read_data_valid_payload_buffer_s1_shift_register_in;
  wire             cpu_0_data_master_requests_payload_buffer_s1;
  wire             cpu_0_data_master_saved_grant_payload_buffer_s1;
  wire             cpu_0_instruction_master_arbiterlock;
  wire             cpu_0_instruction_master_continuerequest;
  wire             cpu_0_instruction_master_granted_payload_buffer_s1;
  wire             cpu_0_instruction_master_qualified_request_payload_buffer_s1;
  wire             cpu_0_instruction_master_read_data_valid_payload_buffer_s1;
  reg              cpu_0_instruction_master_read_data_valid_payload_buffer_s1_shift_register;
  wire             cpu_0_instruction_master_read_data_valid_payload_buffer_s1_shift_register_in;
  wire             cpu_0_instruction_master_requests_payload_buffer_s1;
  wire             cpu_0_instruction_master_saved_grant_payload_buffer_s1;
  reg              d1_payload_buffer_s1_end_xfer;
  reg              d1_reasons_to_wait;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_0_data_master_granted_slave_payload_buffer_s1;
  reg              last_cycle_cpu_0_instruction_master_granted_slave_payload_buffer_s1;
  wire             p1_cpu_0_data_master_read_data_valid_payload_buffer_s1_shift_register;
  wire             p1_cpu_0_instruction_master_read_data_valid_payload_buffer_s1_shift_register;
  wire    [ 12: 0] payload_buffer_s1_address;
  wire             payload_buffer_s1_allgrants;
  wire             payload_buffer_s1_allow_new_arb_cycle;
  wire             payload_buffer_s1_any_continuerequest;
  reg     [  1: 0] payload_buffer_s1_arb_addend;
  wire             payload_buffer_s1_arb_counter_enable;
  reg     [  2: 0] payload_buffer_s1_arb_share_counter;
  wire    [  2: 0] payload_buffer_s1_arb_share_counter_next_value;
  wire    [  2: 0] payload_buffer_s1_arb_share_set_values;
  wire    [  1: 0] payload_buffer_s1_arb_winner;
  wire             payload_buffer_s1_arbitration_holdoff_internal;
  wire             payload_buffer_s1_beginbursttransfer_internal;
  wire             payload_buffer_s1_begins_xfer;
  wire    [  1: 0] payload_buffer_s1_byteenable;
  wire             payload_buffer_s1_chipselect;
  wire    [  3: 0] payload_buffer_s1_chosen_master_double_vector;
  wire    [  1: 0] payload_buffer_s1_chosen_master_rot_left;
  wire             payload_buffer_s1_clken;
  wire             payload_buffer_s1_end_xfer;
  wire             payload_buffer_s1_firsttransfer;
  wire    [  1: 0] payload_buffer_s1_grant_vector;
  wire             payload_buffer_s1_in_a_read_cycle;
  wire             payload_buffer_s1_in_a_write_cycle;
  wire    [  1: 0] payload_buffer_s1_master_qreq_vector;
  wire    [ 15: 0] payload_buffer_s1_readdata_from_sa;
  reg     [  1: 0] payload_buffer_s1_saved_chosen_master_vector;
  reg              payload_buffer_s1_slavearbiterlockenable;
  wire             payload_buffer_s1_waits_for_read;
  wire             payload_buffer_s1_waits_for_write;
  wire             payload_buffer_s1_write;
  wire    [ 15: 0] payload_buffer_s1_writedata;
  wire             registered_cpu_0_data_master_read_data_valid_payload_buffer_s1;
  wire             wait_for_payload_buffer_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~payload_buffer_s1_end_xfer;
    end


  assign payload_buffer_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_payload_buffer_s1 | cpu_0_instruction_master_qualified_request_payload_buffer_s1));
  //assign payload_buffer_s1_readdata_from_sa = payload_buffer_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign payload_buffer_s1_readdata_from_sa = payload_buffer_s1_readdata;

  assign cpu_0_data_master_requests_payload_buffer_s1 = ({cpu_0_data_master_address_to_slave[22 : 14] , 14'b0} == 23'h20000) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //registered rdv signal_name registered_cpu_0_data_master_read_data_valid_payload_buffer_s1 assignment, which is an e_assign
  assign registered_cpu_0_data_master_read_data_valid_payload_buffer_s1 = cpu_0_data_master_read_data_valid_payload_buffer_s1_shift_register_in;

  //payload_buffer_s1_arb_share_counter set values, which is an e_mux
  assign payload_buffer_s1_arb_share_set_values = (cpu_0_data_master_granted_payload_buffer_s1)? 2 :
    (cpu_0_instruction_master_granted_payload_buffer_s1)? 2 :
    (cpu_0_data_master_granted_payload_buffer_s1)? 2 :
    (cpu_0_instruction_master_granted_payload_buffer_s1)? 2 :
    1;

  //payload_buffer_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign payload_buffer_s1_arb_share_counter_next_value = payload_buffer_s1_firsttransfer ? (payload_buffer_s1_arb_share_set_values - 1) : |payload_buffer_s1_arb_share_counter ? (payload_buffer_s1_arb_share_counter - 1) : 0;

  //payload_buffer_s1_allgrants all slave grants, which is an e_mux
  assign payload_buffer_s1_allgrants = |payload_buffer_s1_grant_vector |
    |payload_buffer_s1_grant_vector |
    |payload_buffer_s1_grant_vector |
    |payload_buffer_s1_grant_vector;

  //payload_buffer_s1_end_xfer assignment, which is an e_assign
  assign payload_buffer_s1_end_xfer = ~(payload_buffer_s1_waits_for_read | payload_buffer_s1_waits_for_write);

  //payload_buffer_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign payload_buffer_s1_arb_counter_enable = payload_buffer_s1_end_xfer & payload_buffer_s1_allgrants;

  //payload_buffer_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          payload_buffer_s1_arb_share_counter <= 0;
      else if (payload_buffer_s1_arb_counter_enable)
          payload_buffer_s1_arb_share_counter <= payload_buffer_s1_arb_share_counter_next_value;
    end


  //payload_buffer_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          payload_buffer_s1_slavearbiterlockenable <= 0;
      else if (|payload_buffer_s1_master_qreq_vector & payload_buffer_s1_end_xfer)
          payload_buffer_s1_slavearbiterlockenable <= |payload_buffer_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master payload_buffer/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = payload_buffer_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //cpu_0/instruction_master payload_buffer/s1 arbiterlock, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock = payload_buffer_s1_slavearbiterlockenable & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master granted payload_buffer/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_instruction_master_granted_slave_payload_buffer_s1 <= 0;
      else if (1)
          last_cycle_cpu_0_instruction_master_granted_slave_payload_buffer_s1 <= cpu_0_instruction_master_saved_grant_payload_buffer_s1 ? 1 : (payload_buffer_s1_arbitration_holdoff_internal | ~cpu_0_instruction_master_requests_payload_buffer_s1) ? 0 : last_cycle_cpu_0_instruction_master_granted_slave_payload_buffer_s1;
    end


  //cpu_0_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_0_instruction_master_continuerequest = last_cycle_cpu_0_instruction_master_granted_slave_payload_buffer_s1 & cpu_0_instruction_master_requests_payload_buffer_s1;

  //payload_buffer_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign payload_buffer_s1_any_continuerequest = cpu_0_instruction_master_continuerequest |
    cpu_0_data_master_continuerequest;

  assign cpu_0_data_master_qualified_request_payload_buffer_s1 = cpu_0_data_master_requests_payload_buffer_s1 & ~((cpu_0_data_master_read & ((|cpu_0_data_master_read_data_valid_payload_buffer_s1_shift_register))) | ((~cpu_0_data_master_waitrequest | cpu_0_data_master_no_byte_enables_and_last_term | !cpu_0_data_master_byteenable_payload_buffer_s1) & cpu_0_data_master_write) | cpu_0_instruction_master_arbiterlock);
  //cpu_0_data_master_read_data_valid_payload_buffer_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_0_data_master_read_data_valid_payload_buffer_s1_shift_register_in = cpu_0_data_master_granted_payload_buffer_s1 & cpu_0_data_master_read & ~payload_buffer_s1_waits_for_read & ~(|cpu_0_data_master_read_data_valid_payload_buffer_s1_shift_register);

  //shift register p1 cpu_0_data_master_read_data_valid_payload_buffer_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_0_data_master_read_data_valid_payload_buffer_s1_shift_register = {cpu_0_data_master_read_data_valid_payload_buffer_s1_shift_register, cpu_0_data_master_read_data_valid_payload_buffer_s1_shift_register_in};

  //cpu_0_data_master_read_data_valid_payload_buffer_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_read_data_valid_payload_buffer_s1_shift_register <= 0;
      else if (1)
          cpu_0_data_master_read_data_valid_payload_buffer_s1_shift_register <= p1_cpu_0_data_master_read_data_valid_payload_buffer_s1_shift_register;
    end


  //local readdatavalid cpu_0_data_master_read_data_valid_payload_buffer_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_payload_buffer_s1 = cpu_0_data_master_read_data_valid_payload_buffer_s1_shift_register;

  //payload_buffer_s1_writedata mux, which is an e_mux
  assign payload_buffer_s1_writedata = cpu_0_data_master_dbs_write_16;

  //mux payload_buffer_s1_clken, which is an e_mux
  assign payload_buffer_s1_clken = 1'b1;

  assign cpu_0_instruction_master_requests_payload_buffer_s1 = (({cpu_0_instruction_master_address_to_slave[22 : 14] , 14'b0} == 23'h20000) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
  //cpu_0/data_master granted payload_buffer/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_data_master_granted_slave_payload_buffer_s1 <= 0;
      else if (1)
          last_cycle_cpu_0_data_master_granted_slave_payload_buffer_s1 <= cpu_0_data_master_saved_grant_payload_buffer_s1 ? 1 : (payload_buffer_s1_arbitration_holdoff_internal | ~cpu_0_data_master_requests_payload_buffer_s1) ? 0 : last_cycle_cpu_0_data_master_granted_slave_payload_buffer_s1;
    end


  //cpu_0_data_master_continuerequest continued request, which is an e_mux
  assign cpu_0_data_master_continuerequest = last_cycle_cpu_0_data_master_granted_slave_payload_buffer_s1 & cpu_0_data_master_requests_payload_buffer_s1;

  assign cpu_0_instruction_master_qualified_request_payload_buffer_s1 = cpu_0_instruction_master_requests_payload_buffer_s1 & ~((cpu_0_instruction_master_read & ((|cpu_0_instruction_master_read_data_valid_payload_buffer_s1_shift_register))) | cpu_0_data_master_arbiterlock);
  //cpu_0_instruction_master_read_data_valid_payload_buffer_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_payload_buffer_s1_shift_register_in = cpu_0_instruction_master_granted_payload_buffer_s1 & cpu_0_instruction_master_read & ~payload_buffer_s1_waits_for_read & ~(|cpu_0_instruction_master_read_data_valid_payload_buffer_s1_shift_register);

  //shift register p1 cpu_0_instruction_master_read_data_valid_payload_buffer_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_0_instruction_master_read_data_valid_payload_buffer_s1_shift_register = {cpu_0_instruction_master_read_data_valid_payload_buffer_s1_shift_register, cpu_0_instruction_master_read_data_valid_payload_buffer_s1_shift_register_in};

  //cpu_0_instruction_master_read_data_valid_payload_buffer_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_read_data_valid_payload_buffer_s1_shift_register <= 0;
      else if (1)
          cpu_0_instruction_master_read_data_valid_payload_buffer_s1_shift_register <= p1_cpu_0_instruction_master_read_data_valid_payload_buffer_s1_shift_register;
    end


  //local readdatavalid cpu_0_instruction_master_read_data_valid_payload_buffer_s1, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_payload_buffer_s1 = cpu_0_instruction_master_read_data_valid_payload_buffer_s1_shift_register;

  //allow new arb cycle for payload_buffer/s1, which is an e_assign
  assign payload_buffer_s1_allow_new_arb_cycle = ~cpu_0_data_master_arbiterlock & ~cpu_0_instruction_master_arbiterlock;

  //cpu_0/instruction_master assignment into master qualified-requests vector for payload_buffer/s1, which is an e_assign
  assign payload_buffer_s1_master_qreq_vector[0] = cpu_0_instruction_master_qualified_request_payload_buffer_s1;

  //cpu_0/instruction_master grant payload_buffer/s1, which is an e_assign
  assign cpu_0_instruction_master_granted_payload_buffer_s1 = payload_buffer_s1_grant_vector[0];

  //cpu_0/instruction_master saved-grant payload_buffer/s1, which is an e_assign
  assign cpu_0_instruction_master_saved_grant_payload_buffer_s1 = payload_buffer_s1_arb_winner[0] && cpu_0_instruction_master_requests_payload_buffer_s1;

  //cpu_0/data_master assignment into master qualified-requests vector for payload_buffer/s1, which is an e_assign
  assign payload_buffer_s1_master_qreq_vector[1] = cpu_0_data_master_qualified_request_payload_buffer_s1;

  //cpu_0/data_master grant payload_buffer/s1, which is an e_assign
  assign cpu_0_data_master_granted_payload_buffer_s1 = payload_buffer_s1_grant_vector[1];

  //cpu_0/data_master saved-grant payload_buffer/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_payload_buffer_s1 = payload_buffer_s1_arb_winner[1] && cpu_0_data_master_requests_payload_buffer_s1;

  //payload_buffer/s1 chosen-master double-vector, which is an e_assign
  assign payload_buffer_s1_chosen_master_double_vector = {payload_buffer_s1_master_qreq_vector, payload_buffer_s1_master_qreq_vector} & ({~payload_buffer_s1_master_qreq_vector, ~payload_buffer_s1_master_qreq_vector} + payload_buffer_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign payload_buffer_s1_arb_winner = (payload_buffer_s1_allow_new_arb_cycle & | payload_buffer_s1_grant_vector) ? payload_buffer_s1_grant_vector : payload_buffer_s1_saved_chosen_master_vector;

  //saved payload_buffer_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          payload_buffer_s1_saved_chosen_master_vector <= 0;
      else if (payload_buffer_s1_allow_new_arb_cycle)
          payload_buffer_s1_saved_chosen_master_vector <= |payload_buffer_s1_grant_vector ? payload_buffer_s1_grant_vector : payload_buffer_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign payload_buffer_s1_grant_vector = {(payload_buffer_s1_chosen_master_double_vector[1] | payload_buffer_s1_chosen_master_double_vector[3]),
    (payload_buffer_s1_chosen_master_double_vector[0] | payload_buffer_s1_chosen_master_double_vector[2])};

  //payload_buffer/s1 chosen master rotated left, which is an e_assign
  assign payload_buffer_s1_chosen_master_rot_left = (payload_buffer_s1_arb_winner << 1) ? (payload_buffer_s1_arb_winner << 1) : 1;

  //payload_buffer/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          payload_buffer_s1_arb_addend <= 1;
      else if (|payload_buffer_s1_grant_vector)
          payload_buffer_s1_arb_addend <= payload_buffer_s1_end_xfer? payload_buffer_s1_chosen_master_rot_left : payload_buffer_s1_grant_vector;
    end


  assign payload_buffer_s1_chipselect = cpu_0_data_master_granted_payload_buffer_s1 | cpu_0_instruction_master_granted_payload_buffer_s1;
  //payload_buffer_s1_firsttransfer first transaction, which is an e_assign
  assign payload_buffer_s1_firsttransfer = ~(payload_buffer_s1_slavearbiterlockenable & payload_buffer_s1_any_continuerequest);

  //payload_buffer_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign payload_buffer_s1_beginbursttransfer_internal = payload_buffer_s1_begins_xfer & payload_buffer_s1_firsttransfer;

  //payload_buffer_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign payload_buffer_s1_arbitration_holdoff_internal = payload_buffer_s1_begins_xfer & payload_buffer_s1_firsttransfer;

  //payload_buffer_s1_write assignment, which is an e_mux
  assign payload_buffer_s1_write = cpu_0_data_master_granted_payload_buffer_s1 & cpu_0_data_master_write;

  //payload_buffer_s1_address mux, which is an e_mux
  assign payload_buffer_s1_address = (cpu_0_data_master_granted_payload_buffer_s1)? ({cpu_0_data_master_address_to_slave >> 2,
    cpu_0_data_master_dbs_address[1]}) :
    ({cpu_0_instruction_master_address_to_slave >> 2,
    cpu_0_instruction_master_dbs_address[1]});

  //d1_payload_buffer_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_payload_buffer_s1_end_xfer <= 1;
      else if (1)
          d1_payload_buffer_s1_end_xfer <= payload_buffer_s1_end_xfer;
    end


  //payload_buffer_s1_waits_for_read in a cycle, which is an e_mux
  assign payload_buffer_s1_waits_for_read = payload_buffer_s1_in_a_read_cycle & 0;

  //payload_buffer_s1_in_a_read_cycle assignment, which is an e_assign
  assign payload_buffer_s1_in_a_read_cycle = (cpu_0_data_master_granted_payload_buffer_s1 & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_payload_buffer_s1 & cpu_0_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = payload_buffer_s1_in_a_read_cycle;

  //payload_buffer_s1_waits_for_write in a cycle, which is an e_mux
  assign payload_buffer_s1_waits_for_write = payload_buffer_s1_in_a_write_cycle & 0;

  //payload_buffer_s1_in_a_write_cycle assignment, which is an e_assign
  assign payload_buffer_s1_in_a_write_cycle = cpu_0_data_master_granted_payload_buffer_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = payload_buffer_s1_in_a_write_cycle;

  assign wait_for_payload_buffer_s1_counter = 0;
  //payload_buffer_s1_byteenable byte enable port mux, which is an e_mux
  assign payload_buffer_s1_byteenable = (cpu_0_data_master_granted_payload_buffer_s1)? cpu_0_data_master_byteenable_payload_buffer_s1 :
    -1;

  assign {cpu_0_data_master_byteenable_payload_buffer_s1_segment_1,
cpu_0_data_master_byteenable_payload_buffer_s1_segment_0} = cpu_0_data_master_byteenable;
  assign cpu_0_data_master_byteenable_payload_buffer_s1 = ((cpu_0_data_master_dbs_address[1] == 0))? cpu_0_data_master_byteenable_payload_buffer_s1_segment_0 :
    cpu_0_data_master_byteenable_payload_buffer_s1_segment_1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_granted_payload_buffer_s1 + cpu_0_instruction_master_granted_payload_buffer_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_saved_grant_payload_buffer_s1 + cpu_0_instruction_master_saved_grant_payload_buffer_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


module sysid_control_slave_arbitrator (
                                        // inputs:
                                         clk,
                                         cpu_0_data_master_address_to_slave,
                                         cpu_0_data_master_read,
                                         cpu_0_data_master_write,
                                         reset_n,
                                         sysid_control_slave_readdata,

                                        // outputs:
                                         cpu_0_data_master_granted_sysid_control_slave,
                                         cpu_0_data_master_qualified_request_sysid_control_slave,
                                         cpu_0_data_master_read_data_valid_sysid_control_slave,
                                         cpu_0_data_master_requests_sysid_control_slave,
                                         d1_sysid_control_slave_end_xfer,
                                         sysid_control_slave_address,
                                         sysid_control_slave_readdata_from_sa
                                      )
  /* synthesis auto_dissolve = "FALSE" */ ;

  output           cpu_0_data_master_granted_sysid_control_slave;
  output           cpu_0_data_master_qualified_request_sysid_control_slave;
  output           cpu_0_data_master_read_data_valid_sysid_control_slave;
  output           cpu_0_data_master_requests_sysid_control_slave;
  output           d1_sysid_control_slave_end_xfer;
  output           sysid_control_slave_address;
  output  [ 31: 0] sysid_control_slave_readdata_from_sa;
  input            clk;
  input   [ 22: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input            reset_n;
  input   [ 31: 0] sysid_control_slave_readdata;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_sysid_control_slave;
  wire             cpu_0_data_master_qualified_request_sysid_control_slave;
  wire             cpu_0_data_master_read_data_valid_sysid_control_slave;
  wire             cpu_0_data_master_requests_sysid_control_slave;
  wire             cpu_0_data_master_saved_grant_sysid_control_slave;
  reg              d1_reasons_to_wait;
  reg              d1_sysid_control_slave_end_xfer;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             sysid_control_slave_address;
  wire             sysid_control_slave_allgrants;
  wire             sysid_control_slave_allow_new_arb_cycle;
  wire             sysid_control_slave_any_continuerequest;
  wire             sysid_control_slave_arb_counter_enable;
  reg     [  2: 0] sysid_control_slave_arb_share_counter;
  wire    [  2: 0] sysid_control_slave_arb_share_counter_next_value;
  wire    [  2: 0] sysid_control_slave_arb_share_set_values;
  wire             sysid_control_slave_beginbursttransfer_internal;
  wire             sysid_control_slave_begins_xfer;
  wire             sysid_control_slave_end_xfer;
  wire             sysid_control_slave_firsttransfer;
  wire             sysid_control_slave_grant_vector;
  wire             sysid_control_slave_in_a_read_cycle;
  wire             sysid_control_slave_in_a_write_cycle;
  wire             sysid_control_slave_master_qreq_vector;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  reg              sysid_control_slave_slavearbiterlockenable;
  wire             sysid_control_slave_waits_for_read;
  wire             sysid_control_slave_waits_for_write;
  wire             wait_for_sysid_control_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~sysid_control_slave_end_xfer;
    end


  assign sysid_control_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_sysid_control_slave));
  //assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata;

  assign cpu_0_data_master_requests_sysid_control_slave = (({cpu_0_data_master_address_to_slave[22 : 3] , 3'b0} == 23'h40000) & (cpu_0_data_master_read | cpu_0_data_master_write)) & cpu_0_data_master_read;
  //sysid_control_slave_arb_share_counter set values, which is an e_mux
  assign sysid_control_slave_arb_share_set_values = 1;

  //sysid_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign sysid_control_slave_arb_share_counter_next_value = sysid_control_slave_firsttransfer ? (sysid_control_slave_arb_share_set_values - 1) : |sysid_control_slave_arb_share_counter ? (sysid_control_slave_arb_share_counter - 1) : 0;

  //sysid_control_slave_allgrants all slave grants, which is an e_mux
  assign sysid_control_slave_allgrants = |sysid_control_slave_grant_vector;

  //sysid_control_slave_end_xfer assignment, which is an e_assign
  assign sysid_control_slave_end_xfer = ~(sysid_control_slave_waits_for_read | sysid_control_slave_waits_for_write);

  //sysid_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign sysid_control_slave_arb_counter_enable = sysid_control_slave_end_xfer & sysid_control_slave_allgrants;

  //sysid_control_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_arb_share_counter <= 0;
      else if (sysid_control_slave_arb_counter_enable)
          sysid_control_slave_arb_share_counter <= sysid_control_slave_arb_share_counter_next_value;
    end


  //sysid_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_slavearbiterlockenable <= 0;
      else if (|sysid_control_slave_master_qreq_vector & sysid_control_slave_end_xfer)
          sysid_control_slave_slavearbiterlockenable <= |sysid_control_slave_arb_share_counter_next_value;
    end


  //cpu_0/data_master sysid/control_slave arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = sysid_control_slave_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //sysid_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sysid_control_slave_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_sysid_control_slave = cpu_0_data_master_requests_sysid_control_slave;
  //master is always granted when requested
  assign cpu_0_data_master_granted_sysid_control_slave = cpu_0_data_master_qualified_request_sysid_control_slave;

  //cpu_0/data_master saved-grant sysid/control_slave, which is an e_assign
  assign cpu_0_data_master_saved_grant_sysid_control_slave = cpu_0_data_master_requests_sysid_control_slave;

  //allow new arb cycle for sysid/control_slave, which is an e_assign
  assign sysid_control_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sysid_control_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sysid_control_slave_master_qreq_vector = 1;

  //sysid_control_slave_firsttransfer first transaction, which is an e_assign
  assign sysid_control_slave_firsttransfer = ~(sysid_control_slave_slavearbiterlockenable & sysid_control_slave_any_continuerequest);

  //sysid_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sysid_control_slave_beginbursttransfer_internal = sysid_control_slave_begins_xfer & sysid_control_slave_firsttransfer;

  //sysid_control_slave_address mux, which is an e_mux
  assign sysid_control_slave_address = cpu_0_data_master_address_to_slave >> 2;

  //d1_sysid_control_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sysid_control_slave_end_xfer <= 1;
      else if (1)
          d1_sysid_control_slave_end_xfer <= sysid_control_slave_end_xfer;
    end


  //sysid_control_slave_waits_for_read in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_read = sysid_control_slave_in_a_read_cycle & sysid_control_slave_begins_xfer;

  //sysid_control_slave_in_a_read_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_read_cycle = cpu_0_data_master_granted_sysid_control_slave & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sysid_control_slave_in_a_read_cycle;

  //sysid_control_slave_waits_for_write in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_write = sysid_control_slave_in_a_write_cycle & 0;

  //sysid_control_slave_in_a_write_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_write_cycle = cpu_0_data_master_granted_sysid_control_slave & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sysid_control_slave_in_a_write_cycle;

  assign wait_for_sysid_control_slave_counter = 0;

endmodule


module tri_state_bridge_0_avalon_slave_arbitrator (
                                                    // inputs:
                                                     clk,
                                                     cpu_0_data_master_address_to_slave,
                                                     cpu_0_data_master_byteenable,
                                                     cpu_0_data_master_dbs_address,
                                                     cpu_0_data_master_dbs_write_8,
                                                     cpu_0_data_master_no_byte_enables_and_last_term,
                                                     cpu_0_data_master_read,
                                                     cpu_0_data_master_write,
                                                     cpu_0_instruction_master_address_to_slave,
                                                     cpu_0_instruction_master_dbs_address,
                                                     cpu_0_instruction_master_read,
                                                     reset_n,

                                                    // outputs:
                                                     cfi_flash_0_s1_wait_counter_eq_0,
                                                     cfi_flash_0_s1_wait_counter_eq_1,
                                                     cpu_0_data_master_byteenable_cfi_flash_0_s1,
                                                     cpu_0_data_master_granted_cfi_flash_0_s1,
                                                     cpu_0_data_master_qualified_request_cfi_flash_0_s1,
                                                     cpu_0_data_master_read_data_valid_cfi_flash_0_s1,
                                                     cpu_0_data_master_requests_cfi_flash_0_s1,
                                                     cpu_0_instruction_master_granted_cfi_flash_0_s1,
                                                     cpu_0_instruction_master_qualified_request_cfi_flash_0_s1,
                                                     cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1,
                                                     cpu_0_instruction_master_requests_cfi_flash_0_s1,
                                                     d1_tri_state_bridge_0_avalon_slave_end_xfer,
                                                     incoming_tri_state_bridge_0_data,
                                                     incoming_tri_state_bridge_0_data_with_Xs_converted_to_0,
                                                     registered_cpu_0_data_master_read_data_valid_cfi_flash_0_s1,
                                                     select_n_to_the_cfi_flash_0,
                                                     tri_state_bridge_0_address,
                                                     tri_state_bridge_0_data,
                                                     tri_state_bridge_0_readn,
                                                     write_n_to_the_cfi_flash_0
                                                  )
  /* synthesis auto_dissolve = "FALSE" */ ;

  output           cfi_flash_0_s1_wait_counter_eq_0;
  output           cfi_flash_0_s1_wait_counter_eq_1;
  output           cpu_0_data_master_byteenable_cfi_flash_0_s1;
  output           cpu_0_data_master_granted_cfi_flash_0_s1;
  output           cpu_0_data_master_qualified_request_cfi_flash_0_s1;
  output           cpu_0_data_master_read_data_valid_cfi_flash_0_s1;
  output           cpu_0_data_master_requests_cfi_flash_0_s1;
  output           cpu_0_instruction_master_granted_cfi_flash_0_s1;
  output           cpu_0_instruction_master_qualified_request_cfi_flash_0_s1;
  output           cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1;
  output           cpu_0_instruction_master_requests_cfi_flash_0_s1;
  output           d1_tri_state_bridge_0_avalon_slave_end_xfer;
  output  [  7: 0] incoming_tri_state_bridge_0_data;
  output  [  7: 0] incoming_tri_state_bridge_0_data_with_Xs_converted_to_0;
  output           registered_cpu_0_data_master_read_data_valid_cfi_flash_0_s1;
  output           select_n_to_the_cfi_flash_0;
  output  [ 21: 0] tri_state_bridge_0_address;
  inout   [  7: 0] tri_state_bridge_0_data;
  output           tri_state_bridge_0_readn;
  output           write_n_to_the_cfi_flash_0;
  input            clk;
  input   [ 22: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input   [  1: 0] cpu_0_data_master_dbs_address;
  input   [  7: 0] cpu_0_data_master_dbs_write_8;
  input            cpu_0_data_master_no_byte_enables_and_last_term;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input   [ 22: 0] cpu_0_instruction_master_address_to_slave;
  input   [  1: 0] cpu_0_instruction_master_dbs_address;
  input            cpu_0_instruction_master_read;
  input            reset_n;

  wire    [  3: 0] cfi_flash_0_s1_counter_load_value;
  wire             cfi_flash_0_s1_in_a_read_cycle;
  wire             cfi_flash_0_s1_in_a_write_cycle;
  wire             cfi_flash_0_s1_pretend_byte_enable;
  reg     [  3: 0] cfi_flash_0_s1_wait_counter;
  wire             cfi_flash_0_s1_wait_counter_eq_0;
  wire             cfi_flash_0_s1_wait_counter_eq_1;
  wire             cfi_flash_0_s1_waits_for_read;
  wire             cfi_flash_0_s1_waits_for_write;
  wire             cfi_flash_0_s1_with_write_latency;
  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_byteenable_cfi_flash_0_s1;
  wire             cpu_0_data_master_byteenable_cfi_flash_0_s1_segment_0;
  wire             cpu_0_data_master_byteenable_cfi_flash_0_s1_segment_1;
  wire             cpu_0_data_master_byteenable_cfi_flash_0_s1_segment_2;
  wire             cpu_0_data_master_byteenable_cfi_flash_0_s1_segment_3;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_cfi_flash_0_s1;
  wire             cpu_0_data_master_qualified_request_cfi_flash_0_s1;
  wire             cpu_0_data_master_read_data_valid_cfi_flash_0_s1;
  reg     [  1: 0] cpu_0_data_master_read_data_valid_cfi_flash_0_s1_shift_register;
  wire             cpu_0_data_master_read_data_valid_cfi_flash_0_s1_shift_register_in;
  wire             cpu_0_data_master_requests_cfi_flash_0_s1;
  wire             cpu_0_data_master_saved_grant_cfi_flash_0_s1;
  wire             cpu_0_instruction_master_arbiterlock;
  wire             cpu_0_instruction_master_continuerequest;
  wire             cpu_0_instruction_master_granted_cfi_flash_0_s1;
  wire             cpu_0_instruction_master_qualified_request_cfi_flash_0_s1;
  wire             cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1;
  reg     [  1: 0] cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1_shift_register;
  wire             cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1_shift_register_in;
  wire             cpu_0_instruction_master_requests_cfi_flash_0_s1;
  wire             cpu_0_instruction_master_saved_grant_cfi_flash_0_s1;
  reg              d1_in_a_write_cycle /* synthesis ALTERA_ATTRIBUTE =  "FAST_OUTPUT_ENABLE_REGISTER=ON" */;
  reg     [  7: 0] d1_outgoing_tri_state_bridge_0_data /* synthesis ALTERA_ATTRIBUTE =  "FAST_OUTPUT_REGISTER=ON" */;
  reg              d1_reasons_to_wait;
  reg              d1_tri_state_bridge_0_avalon_slave_end_xfer;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg     [  7: 0] incoming_tri_state_bridge_0_data /* synthesis ALTERA_ATTRIBUTE =  "FAST_INPUT_REGISTER=ON" */;
  wire             incoming_tri_state_bridge_0_data_bit_0_is_x;
  wire             incoming_tri_state_bridge_0_data_bit_1_is_x;
  wire             incoming_tri_state_bridge_0_data_bit_2_is_x;
  wire             incoming_tri_state_bridge_0_data_bit_3_is_x;
  wire             incoming_tri_state_bridge_0_data_bit_4_is_x;
  wire             incoming_tri_state_bridge_0_data_bit_5_is_x;
  wire             incoming_tri_state_bridge_0_data_bit_6_is_x;
  wire             incoming_tri_state_bridge_0_data_bit_7_is_x;
  wire    [  7: 0] incoming_tri_state_bridge_0_data_with_Xs_converted_to_0;
  reg              last_cycle_cpu_0_data_master_granted_slave_cfi_flash_0_s1;
  reg              last_cycle_cpu_0_instruction_master_granted_slave_cfi_flash_0_s1;
  wire    [  7: 0] outgoing_tri_state_bridge_0_data;
  wire    [  1: 0] p1_cpu_0_data_master_read_data_valid_cfi_flash_0_s1_shift_register;
  wire    [  1: 0] p1_cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1_shift_register;
  wire             p1_select_n_to_the_cfi_flash_0;
  wire    [ 21: 0] p1_tri_state_bridge_0_address;
  wire             p1_tri_state_bridge_0_readn;
  wire             p1_write_n_to_the_cfi_flash_0;
  wire             registered_cpu_0_data_master_read_data_valid_cfi_flash_0_s1;
  reg              select_n_to_the_cfi_flash_0 /* synthesis ALTERA_ATTRIBUTE =  "FAST_OUTPUT_REGISTER=ON" */;
  wire             time_to_write;
  reg     [ 21: 0] tri_state_bridge_0_address /* synthesis ALTERA_ATTRIBUTE =  "FAST_OUTPUT_REGISTER=ON" */;
  wire             tri_state_bridge_0_avalon_slave_allgrants;
  wire             tri_state_bridge_0_avalon_slave_allow_new_arb_cycle;
  wire             tri_state_bridge_0_avalon_slave_any_continuerequest;
  reg     [  1: 0] tri_state_bridge_0_avalon_slave_arb_addend;
  wire             tri_state_bridge_0_avalon_slave_arb_counter_enable;
  reg     [  2: 0] tri_state_bridge_0_avalon_slave_arb_share_counter;
  wire    [  2: 0] tri_state_bridge_0_avalon_slave_arb_share_counter_next_value;
  wire    [  2: 0] tri_state_bridge_0_avalon_slave_arb_share_set_values;
  wire    [  1: 0] tri_state_bridge_0_avalon_slave_arb_winner;
  wire             tri_state_bridge_0_avalon_slave_arbitration_holdoff_internal;
  wire             tri_state_bridge_0_avalon_slave_beginbursttransfer_internal;
  wire             tri_state_bridge_0_avalon_slave_begins_xfer;
  wire    [  3: 0] tri_state_bridge_0_avalon_slave_chosen_master_double_vector;
  wire    [  1: 0] tri_state_bridge_0_avalon_slave_chosen_master_rot_left;
  wire             tri_state_bridge_0_avalon_slave_end_xfer;
  wire             tri_state_bridge_0_avalon_slave_firsttransfer;
  wire    [  1: 0] tri_state_bridge_0_avalon_slave_grant_vector;
  wire    [  1: 0] tri_state_bridge_0_avalon_slave_master_qreq_vector;
  wire             tri_state_bridge_0_avalon_slave_read_pending;
  reg     [  1: 0] tri_state_bridge_0_avalon_slave_saved_chosen_master_vector;
  reg              tri_state_bridge_0_avalon_slave_slavearbiterlockenable;
  wire             tri_state_bridge_0_avalon_slave_write_pending;
  wire    [  7: 0] tri_state_bridge_0_data;
  reg              tri_state_bridge_0_readn /* synthesis ALTERA_ATTRIBUTE =  "FAST_OUTPUT_REGISTER=ON" */;
  wire             wait_for_cfi_flash_0_s1_counter;
  reg              write_n_to_the_cfi_flash_0 /* synthesis ALTERA_ATTRIBUTE =  "FAST_OUTPUT_REGISTER=ON" */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~tri_state_bridge_0_avalon_slave_end_xfer;
    end


  assign tri_state_bridge_0_avalon_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_cfi_flash_0_s1 | cpu_0_instruction_master_qualified_request_cfi_flash_0_s1));
  assign cpu_0_data_master_requests_cfi_flash_0_s1 = ({cpu_0_data_master_address_to_slave[22] , 22'b0} == 23'h400000) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //~select_n_to_the_cfi_flash_0 of type chipselect to ~p1_select_n_to_the_cfi_flash_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          select_n_to_the_cfi_flash_0 <= ~0;
      else if (1)
          select_n_to_the_cfi_flash_0 <= p1_select_n_to_the_cfi_flash_0;
    end


  assign tri_state_bridge_0_avalon_slave_write_pending = 0;
  //tri_state_bridge_0/avalon_slave read pending calc, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_read_pending = 0;

  //registered rdv signal_name registered_cpu_0_data_master_read_data_valid_cfi_flash_0_s1 assignment, which is an e_assign
  assign registered_cpu_0_data_master_read_data_valid_cfi_flash_0_s1 = cpu_0_data_master_read_data_valid_cfi_flash_0_s1_shift_register[0];

  //tri_state_bridge_0_avalon_slave_arb_share_counter set values, which is an e_mux
  assign tri_state_bridge_0_avalon_slave_arb_share_set_values = (cpu_0_data_master_granted_cfi_flash_0_s1)? 4 :
    (cpu_0_instruction_master_granted_cfi_flash_0_s1)? 4 :
    (cpu_0_data_master_granted_cfi_flash_0_s1)? 4 :
    (cpu_0_instruction_master_granted_cfi_flash_0_s1)? 4 :
    1;

  //tri_state_bridge_0_avalon_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_arb_share_counter_next_value = tri_state_bridge_0_avalon_slave_firsttransfer ? (tri_state_bridge_0_avalon_slave_arb_share_set_values - 1) : |tri_state_bridge_0_avalon_slave_arb_share_counter ? (tri_state_bridge_0_avalon_slave_arb_share_counter - 1) : 0;

  //tri_state_bridge_0_avalon_slave_allgrants all slave grants, which is an e_mux
  assign tri_state_bridge_0_avalon_slave_allgrants = |tri_state_bridge_0_avalon_slave_grant_vector |
    |tri_state_bridge_0_avalon_slave_grant_vector |
    |tri_state_bridge_0_avalon_slave_grant_vector |
    |tri_state_bridge_0_avalon_slave_grant_vector;

  //tri_state_bridge_0_avalon_slave_end_xfer assignment, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_end_xfer = ~(cfi_flash_0_s1_waits_for_read | cfi_flash_0_s1_waits_for_write);

  //tri_state_bridge_0_avalon_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_arb_counter_enable = tri_state_bridge_0_avalon_slave_end_xfer & tri_state_bridge_0_avalon_slave_allgrants;

  //tri_state_bridge_0_avalon_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_0_avalon_slave_arb_share_counter <= 0;
      else if (tri_state_bridge_0_avalon_slave_arb_counter_enable)
          tri_state_bridge_0_avalon_slave_arb_share_counter <= tri_state_bridge_0_avalon_slave_arb_share_counter_next_value;
    end


  //tri_state_bridge_0_avalon_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_0_avalon_slave_slavearbiterlockenable <= 0;
      else if (|tri_state_bridge_0_avalon_slave_master_qreq_vector & tri_state_bridge_0_avalon_slave_end_xfer)
          tri_state_bridge_0_avalon_slave_slavearbiterlockenable <= |tri_state_bridge_0_avalon_slave_arb_share_counter_next_value;
    end


  //cpu_0/data_master tri_state_bridge_0/avalon_slave arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = tri_state_bridge_0_avalon_slave_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //cpu_0/instruction_master tri_state_bridge_0/avalon_slave arbiterlock, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock = tri_state_bridge_0_avalon_slave_slavearbiterlockenable & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master granted cfi_flash_0/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_instruction_master_granted_slave_cfi_flash_0_s1 <= 0;
      else if (1)
          last_cycle_cpu_0_instruction_master_granted_slave_cfi_flash_0_s1 <= cpu_0_instruction_master_saved_grant_cfi_flash_0_s1 ? 1 : (tri_state_bridge_0_avalon_slave_arbitration_holdoff_internal | ~cpu_0_instruction_master_requests_cfi_flash_0_s1) ? 0 : last_cycle_cpu_0_instruction_master_granted_slave_cfi_flash_0_s1;
    end


  //cpu_0_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_0_instruction_master_continuerequest = last_cycle_cpu_0_instruction_master_granted_slave_cfi_flash_0_s1 & cpu_0_instruction_master_requests_cfi_flash_0_s1;

  //tri_state_bridge_0_avalon_slave_any_continuerequest at least one master continues requesting, which is an e_mux
  assign tri_state_bridge_0_avalon_slave_any_continuerequest = cpu_0_instruction_master_continuerequest |
    cpu_0_data_master_continuerequest;

  assign cpu_0_data_master_qualified_request_cfi_flash_0_s1 = cpu_0_data_master_requests_cfi_flash_0_s1 & ~((cpu_0_data_master_read & (tri_state_bridge_0_avalon_slave_write_pending | (tri_state_bridge_0_avalon_slave_read_pending) | (|cpu_0_data_master_read_data_valid_cfi_flash_0_s1_shift_register))) | ((tri_state_bridge_0_avalon_slave_read_pending | cpu_0_data_master_no_byte_enables_and_last_term | !cpu_0_data_master_byteenable_cfi_flash_0_s1) & cpu_0_data_master_write) | cpu_0_instruction_master_arbiterlock);
  //cpu_0_data_master_read_data_valid_cfi_flash_0_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_0_data_master_read_data_valid_cfi_flash_0_s1_shift_register_in = cpu_0_data_master_granted_cfi_flash_0_s1 & cpu_0_data_master_read & ~cfi_flash_0_s1_waits_for_read & ~(|cpu_0_data_master_read_data_valid_cfi_flash_0_s1_shift_register);

  //shift register p1 cpu_0_data_master_read_data_valid_cfi_flash_0_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_0_data_master_read_data_valid_cfi_flash_0_s1_shift_register = {cpu_0_data_master_read_data_valid_cfi_flash_0_s1_shift_register, cpu_0_data_master_read_data_valid_cfi_flash_0_s1_shift_register_in};

  //cpu_0_data_master_read_data_valid_cfi_flash_0_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_read_data_valid_cfi_flash_0_s1_shift_register <= 0;
      else if (1)
          cpu_0_data_master_read_data_valid_cfi_flash_0_s1_shift_register <= p1_cpu_0_data_master_read_data_valid_cfi_flash_0_s1_shift_register;
    end


  //local readdatavalid cpu_0_data_master_read_data_valid_cfi_flash_0_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_cfi_flash_0_s1 = cpu_0_data_master_read_data_valid_cfi_flash_0_s1_shift_register[1];

  //tri_state_bridge_0_data register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          incoming_tri_state_bridge_0_data <= 0;
      else if (1)
          incoming_tri_state_bridge_0_data <= tri_state_bridge_0_data;
    end


  //cfi_flash_0_s1_with_write_latency assignment, which is an e_assign
  assign cfi_flash_0_s1_with_write_latency = in_a_write_cycle & (cpu_0_data_master_qualified_request_cfi_flash_0_s1 | cpu_0_instruction_master_qualified_request_cfi_flash_0_s1);

  //time to write the data, which is an e_mux
  assign time_to_write = (cfi_flash_0_s1_with_write_latency)? 1 :
    0;

  //d1_outgoing_tri_state_bridge_0_data register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_outgoing_tri_state_bridge_0_data <= 0;
      else if (1)
          d1_outgoing_tri_state_bridge_0_data <= outgoing_tri_state_bridge_0_data;
    end


  //write cycle delayed by 1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_in_a_write_cycle <= 1;
      else if (1)
          d1_in_a_write_cycle <= time_to_write;
    end


  //d1_outgoing_tri_state_bridge_0_data tristate driver, which is an e_assign
  assign tri_state_bridge_0_data = (d1_in_a_write_cycle)? d1_outgoing_tri_state_bridge_0_data:{8{1'bz}};

  //outgoing_tri_state_bridge_0_data mux, which is an e_mux
  assign outgoing_tri_state_bridge_0_data = cpu_0_data_master_dbs_write_8;

  assign cpu_0_instruction_master_requests_cfi_flash_0_s1 = (({cpu_0_instruction_master_address_to_slave[22] , 22'b0} == 23'h400000) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
  //cpu_0/data_master granted cfi_flash_0/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_data_master_granted_slave_cfi_flash_0_s1 <= 0;
      else if (1)
          last_cycle_cpu_0_data_master_granted_slave_cfi_flash_0_s1 <= cpu_0_data_master_saved_grant_cfi_flash_0_s1 ? 1 : (tri_state_bridge_0_avalon_slave_arbitration_holdoff_internal | ~cpu_0_data_master_requests_cfi_flash_0_s1) ? 0 : last_cycle_cpu_0_data_master_granted_slave_cfi_flash_0_s1;
    end


  //cpu_0_data_master_continuerequest continued request, which is an e_mux
  assign cpu_0_data_master_continuerequest = last_cycle_cpu_0_data_master_granted_slave_cfi_flash_0_s1 & cpu_0_data_master_requests_cfi_flash_0_s1;

  assign cpu_0_instruction_master_qualified_request_cfi_flash_0_s1 = cpu_0_instruction_master_requests_cfi_flash_0_s1 & ~((cpu_0_instruction_master_read & (tri_state_bridge_0_avalon_slave_write_pending | (tri_state_bridge_0_avalon_slave_read_pending) | (|cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1_shift_register))) | cpu_0_data_master_arbiterlock);
  //cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1_shift_register_in = cpu_0_instruction_master_granted_cfi_flash_0_s1 & cpu_0_instruction_master_read & ~cfi_flash_0_s1_waits_for_read & ~(|cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1_shift_register);

  //shift register p1 cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1_shift_register = {cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1_shift_register, cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1_shift_register_in};

  //cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1_shift_register <= 0;
      else if (1)
          cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1_shift_register <= p1_cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1_shift_register;
    end


  //local readdatavalid cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1 = cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1_shift_register[1];

  //allow new arb cycle for tri_state_bridge_0/avalon_slave, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_allow_new_arb_cycle = ~cpu_0_data_master_arbiterlock & ~cpu_0_instruction_master_arbiterlock;

  //cpu_0/instruction_master assignment into master qualified-requests vector for cfi_flash_0/s1, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_master_qreq_vector[0] = cpu_0_instruction_master_qualified_request_cfi_flash_0_s1;

  //cpu_0/instruction_master grant cfi_flash_0/s1, which is an e_assign
  assign cpu_0_instruction_master_granted_cfi_flash_0_s1 = tri_state_bridge_0_avalon_slave_grant_vector[0];

  //cpu_0/instruction_master saved-grant cfi_flash_0/s1, which is an e_assign
  assign cpu_0_instruction_master_saved_grant_cfi_flash_0_s1 = tri_state_bridge_0_avalon_slave_arb_winner[0] && cpu_0_instruction_master_requests_cfi_flash_0_s1;

  //cpu_0/data_master assignment into master qualified-requests vector for cfi_flash_0/s1, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_master_qreq_vector[1] = cpu_0_data_master_qualified_request_cfi_flash_0_s1;

  //cpu_0/data_master grant cfi_flash_0/s1, which is an e_assign
  assign cpu_0_data_master_granted_cfi_flash_0_s1 = tri_state_bridge_0_avalon_slave_grant_vector[1];

  //cpu_0/data_master saved-grant cfi_flash_0/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_cfi_flash_0_s1 = tri_state_bridge_0_avalon_slave_arb_winner[1] && cpu_0_data_master_requests_cfi_flash_0_s1;

  //tri_state_bridge_0/avalon_slave chosen-master double-vector, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_chosen_master_double_vector = {tri_state_bridge_0_avalon_slave_master_qreq_vector, tri_state_bridge_0_avalon_slave_master_qreq_vector} & ({~tri_state_bridge_0_avalon_slave_master_qreq_vector, ~tri_state_bridge_0_avalon_slave_master_qreq_vector} + tri_state_bridge_0_avalon_slave_arb_addend);

  //stable onehot encoding of arb winner
  assign tri_state_bridge_0_avalon_slave_arb_winner = (tri_state_bridge_0_avalon_slave_allow_new_arb_cycle & | tri_state_bridge_0_avalon_slave_grant_vector) ? tri_state_bridge_0_avalon_slave_grant_vector : tri_state_bridge_0_avalon_slave_saved_chosen_master_vector;

  //saved tri_state_bridge_0_avalon_slave_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_0_avalon_slave_saved_chosen_master_vector <= 0;
      else if (tri_state_bridge_0_avalon_slave_allow_new_arb_cycle)
          tri_state_bridge_0_avalon_slave_saved_chosen_master_vector <= |tri_state_bridge_0_avalon_slave_grant_vector ? tri_state_bridge_0_avalon_slave_grant_vector : tri_state_bridge_0_avalon_slave_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign tri_state_bridge_0_avalon_slave_grant_vector = {(tri_state_bridge_0_avalon_slave_chosen_master_double_vector[1] | tri_state_bridge_0_avalon_slave_chosen_master_double_vector[3]),
    (tri_state_bridge_0_avalon_slave_chosen_master_double_vector[0] | tri_state_bridge_0_avalon_slave_chosen_master_double_vector[2])};

  //tri_state_bridge_0/avalon_slave chosen master rotated left, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_chosen_master_rot_left = (tri_state_bridge_0_avalon_slave_arb_winner << 1) ? (tri_state_bridge_0_avalon_slave_arb_winner << 1) : 1;

  //tri_state_bridge_0/avalon_slave's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_0_avalon_slave_arb_addend <= 1;
      else if (|tri_state_bridge_0_avalon_slave_grant_vector)
          tri_state_bridge_0_avalon_slave_arb_addend <= tri_state_bridge_0_avalon_slave_end_xfer? tri_state_bridge_0_avalon_slave_chosen_master_rot_left : tri_state_bridge_0_avalon_slave_grant_vector;
    end


  assign p1_select_n_to_the_cfi_flash_0 = ~(cpu_0_data_master_granted_cfi_flash_0_s1 | cpu_0_instruction_master_granted_cfi_flash_0_s1);
  //tri_state_bridge_0_avalon_slave_firsttransfer first transaction, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_firsttransfer = ~(tri_state_bridge_0_avalon_slave_slavearbiterlockenable & tri_state_bridge_0_avalon_slave_any_continuerequest);

  //tri_state_bridge_0_avalon_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_beginbursttransfer_internal = tri_state_bridge_0_avalon_slave_begins_xfer & tri_state_bridge_0_avalon_slave_firsttransfer;

  //tri_state_bridge_0_avalon_slave_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_arbitration_holdoff_internal = tri_state_bridge_0_avalon_slave_begins_xfer & tri_state_bridge_0_avalon_slave_firsttransfer;

  //~tri_state_bridge_0_readn of type read to ~p1_tri_state_bridge_0_readn, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_0_readn <= ~0;
      else if (1)
          tri_state_bridge_0_readn <= p1_tri_state_bridge_0_readn;
    end


  //~write_n_to_the_cfi_flash_0 of type write to ~p1_write_n_to_the_cfi_flash_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          write_n_to_the_cfi_flash_0 <= ~0;
      else if (1)
          write_n_to_the_cfi_flash_0 <= p1_write_n_to_the_cfi_flash_0;
    end


  //~p1_tri_state_bridge_0_readn assignment, which is an e_mux
  assign p1_tri_state_bridge_0_readn = ~(((cpu_0_data_master_granted_cfi_flash_0_s1 & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_cfi_flash_0_s1 & cpu_0_instruction_master_read))& ~tri_state_bridge_0_avalon_slave_begins_xfer & (cfi_flash_0_s1_wait_counter < 8));

  //~p1_write_n_to_the_cfi_flash_0 assignment, which is an e_mux
  assign p1_write_n_to_the_cfi_flash_0 = ~(((cpu_0_data_master_granted_cfi_flash_0_s1 & cpu_0_data_master_write)) & ~tri_state_bridge_0_avalon_slave_begins_xfer & (cfi_flash_0_s1_wait_counter >= 2) & (cfi_flash_0_s1_wait_counter < 10) & cfi_flash_0_s1_pretend_byte_enable);

  //tri_state_bridge_0_address of type address to p1_tri_state_bridge_0_address, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_0_address <= 0;
      else if (1)
          tri_state_bridge_0_address <= p1_tri_state_bridge_0_address;
    end


  //p1_tri_state_bridge_0_address mux, which is an e_mux
  assign p1_tri_state_bridge_0_address = (cpu_0_data_master_granted_cfi_flash_0_s1)? ({cpu_0_data_master_address_to_slave >> 2,
    cpu_0_data_master_dbs_address[1 : 0]}) :
    ({cpu_0_instruction_master_address_to_slave >> 2,
    cpu_0_instruction_master_dbs_address[1 : 0]});

  //d1_tri_state_bridge_0_avalon_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_tri_state_bridge_0_avalon_slave_end_xfer <= 1;
      else if (1)
          d1_tri_state_bridge_0_avalon_slave_end_xfer <= tri_state_bridge_0_avalon_slave_end_xfer;
    end


  //cfi_flash_0_s1_wait_counter_eq_1 assignment, which is an e_assign
  assign cfi_flash_0_s1_wait_counter_eq_1 = cfi_flash_0_s1_wait_counter == 1;

  //cfi_flash_0_s1_waits_for_read in a cycle, which is an e_mux
  assign cfi_flash_0_s1_waits_for_read = cfi_flash_0_s1_in_a_read_cycle & wait_for_cfi_flash_0_s1_counter;

  //cfi_flash_0_s1_in_a_read_cycle assignment, which is an e_assign
  assign cfi_flash_0_s1_in_a_read_cycle = (cpu_0_data_master_granted_cfi_flash_0_s1 & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_cfi_flash_0_s1 & cpu_0_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cfi_flash_0_s1_in_a_read_cycle;

  //cfi_flash_0_s1_waits_for_write in a cycle, which is an e_mux
  assign cfi_flash_0_s1_waits_for_write = cfi_flash_0_s1_in_a_write_cycle & wait_for_cfi_flash_0_s1_counter;

  //cfi_flash_0_s1_in_a_write_cycle assignment, which is an e_assign
  assign cfi_flash_0_s1_in_a_write_cycle = cpu_0_data_master_granted_cfi_flash_0_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cfi_flash_0_s1_in_a_write_cycle;

  assign cfi_flash_0_s1_wait_counter_eq_0 = cfi_flash_0_s1_wait_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cfi_flash_0_s1_wait_counter <= 0;
      else if (1)
          cfi_flash_0_s1_wait_counter <= cfi_flash_0_s1_counter_load_value;
    end


  assign cfi_flash_0_s1_counter_load_value = ((cfi_flash_0_s1_in_a_read_cycle & tri_state_bridge_0_avalon_slave_begins_xfer))? 8 :
    ((cfi_flash_0_s1_in_a_write_cycle & tri_state_bridge_0_avalon_slave_begins_xfer))? 10 :
    (~cfi_flash_0_s1_wait_counter_eq_0)? cfi_flash_0_s1_wait_counter - 1 :
    0;

  assign wait_for_cfi_flash_0_s1_counter = tri_state_bridge_0_avalon_slave_begins_xfer | ~cfi_flash_0_s1_wait_counter_eq_0;
  //cfi_flash_0_s1_pretend_byte_enable byte enable port mux, which is an e_mux
  assign cfi_flash_0_s1_pretend_byte_enable = (cpu_0_data_master_granted_cfi_flash_0_s1)? cpu_0_data_master_byteenable_cfi_flash_0_s1 :
    -1;

  assign {cpu_0_data_master_byteenable_cfi_flash_0_s1_segment_3,
cpu_0_data_master_byteenable_cfi_flash_0_s1_segment_2,
cpu_0_data_master_byteenable_cfi_flash_0_s1_segment_1,
cpu_0_data_master_byteenable_cfi_flash_0_s1_segment_0} = cpu_0_data_master_byteenable;
  assign cpu_0_data_master_byteenable_cfi_flash_0_s1 = ((cpu_0_data_master_dbs_address[1 : 0] == 0))? cpu_0_data_master_byteenable_cfi_flash_0_s1_segment_0 :
    ((cpu_0_data_master_dbs_address[1 : 0] == 1))? cpu_0_data_master_byteenable_cfi_flash_0_s1_segment_1 :
    ((cpu_0_data_master_dbs_address[1 : 0] == 2))? cpu_0_data_master_byteenable_cfi_flash_0_s1_segment_2 :
    cpu_0_data_master_byteenable_cfi_flash_0_s1_segment_3;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //incoming_tri_state_bridge_0_data_bit_0_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_0_data_bit_0_is_x = ^(incoming_tri_state_bridge_0_data[0]) === 1'bx;

  //Crush incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[0] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[0] = incoming_tri_state_bridge_0_data_bit_0_is_x ? 1'b0 : incoming_tri_state_bridge_0_data[0];

  //incoming_tri_state_bridge_0_data_bit_1_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_0_data_bit_1_is_x = ^(incoming_tri_state_bridge_0_data[1]) === 1'bx;

  //Crush incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[1] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[1] = incoming_tri_state_bridge_0_data_bit_1_is_x ? 1'b0 : incoming_tri_state_bridge_0_data[1];

  //incoming_tri_state_bridge_0_data_bit_2_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_0_data_bit_2_is_x = ^(incoming_tri_state_bridge_0_data[2]) === 1'bx;

  //Crush incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[2] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[2] = incoming_tri_state_bridge_0_data_bit_2_is_x ? 1'b0 : incoming_tri_state_bridge_0_data[2];

  //incoming_tri_state_bridge_0_data_bit_3_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_0_data_bit_3_is_x = ^(incoming_tri_state_bridge_0_data[3]) === 1'bx;

  //Crush incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[3] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[3] = incoming_tri_state_bridge_0_data_bit_3_is_x ? 1'b0 : incoming_tri_state_bridge_0_data[3];

  //incoming_tri_state_bridge_0_data_bit_4_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_0_data_bit_4_is_x = ^(incoming_tri_state_bridge_0_data[4]) === 1'bx;

  //Crush incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[4] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[4] = incoming_tri_state_bridge_0_data_bit_4_is_x ? 1'b0 : incoming_tri_state_bridge_0_data[4];

  //incoming_tri_state_bridge_0_data_bit_5_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_0_data_bit_5_is_x = ^(incoming_tri_state_bridge_0_data[5]) === 1'bx;

  //Crush incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[5] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[5] = incoming_tri_state_bridge_0_data_bit_5_is_x ? 1'b0 : incoming_tri_state_bridge_0_data[5];

  //incoming_tri_state_bridge_0_data_bit_6_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_0_data_bit_6_is_x = ^(incoming_tri_state_bridge_0_data[6]) === 1'bx;

  //Crush incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[6] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[6] = incoming_tri_state_bridge_0_data_bit_6_is_x ? 1'b0 : incoming_tri_state_bridge_0_data[6];

  //incoming_tri_state_bridge_0_data_bit_7_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_0_data_bit_7_is_x = ^(incoming_tri_state_bridge_0_data[7]) === 1'bx;

  //Crush incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[7] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[7] = incoming_tri_state_bridge_0_data_bit_7_is_x ? 1'b0 : incoming_tri_state_bridge_0_data[7];

  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_granted_cfi_flash_0_s1 + cpu_0_instruction_master_granted_cfi_flash_0_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_saved_grant_cfi_flash_0_s1 + cpu_0_instruction_master_saved_grant_cfi_flash_0_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  
//  assign incoming_tri_state_bridge_0_data_with_Xs_converted_to_0 = incoming_tri_state_bridge_0_data;
//
//synthesis read_comments_as_HDL off

endmodule


module tri_state_bridge_0_bridge_arbitrator 
;



endmodule


module DE2_Board_reset_clk_domain_synch_module (
                                                 // inputs:
                                                  clk,
                                                  data_in,
                                                  reset_n,

                                                 // outputs:
                                                  data_out
                                               )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE =  "MAX_DELAY=\"100ns\" ; PRESERVE_REGISTER=ON" */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE =  "PRESERVE_REGISTER=ON" */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else if (1)
          data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else if (1)
          data_out <= data_in_d1;
    end



endmodule


module DE2_Board (
                   // 1) global signals:
                    clk,
                    reset_n,

                   // the_tri_state_bridge_0_avalon_slave
                    select_n_to_the_cfi_flash_0,
                    tri_state_bridge_0_address,
                    tri_state_bridge_0_data,
                    tri_state_bridge_0_readn,
                    write_n_to_the_cfi_flash_0
                 )
;

  output           select_n_to_the_cfi_flash_0;
  output  [ 21: 0] tri_state_bridge_0_address;
  inout   [  7: 0] tri_state_bridge_0_data;
  output           tri_state_bridge_0_readn;
  output           write_n_to_the_cfi_flash_0;
  input            clk;
  input            reset_n;

  wire    [  2: 0] asmi_asmi_control_port_address;
  wire             asmi_asmi_control_port_chipselect;
  wire             asmi_asmi_control_port_dataavailable;
  wire             asmi_asmi_control_port_dataavailable_from_sa;
  wire             asmi_asmi_control_port_endofpacket;
  wire             asmi_asmi_control_port_endofpacket_from_sa;
  wire             asmi_asmi_control_port_irq;
  wire             asmi_asmi_control_port_irq_from_sa;
  wire             asmi_asmi_control_port_read_n;
  wire    [ 15: 0] asmi_asmi_control_port_readdata;
  wire    [ 15: 0] asmi_asmi_control_port_readdata_from_sa;
  wire             asmi_asmi_control_port_readyfordata;
  wire             asmi_asmi_control_port_readyfordata_from_sa;
  wire             asmi_asmi_control_port_reset_n;
  wire             asmi_asmi_control_port_write_n;
  wire    [ 15: 0] asmi_asmi_control_port_writedata;
  wire             cfi_flash_0_s1_wait_counter_eq_0;
  wire             cfi_flash_0_s1_wait_counter_eq_1;
  wire             clk_reset_n;
  wire    [ 22: 0] cpu_0_data_master_address;
  wire    [ 22: 0] cpu_0_data_master_address_to_slave;
  wire    [  3: 0] cpu_0_data_master_byteenable;
  wire             cpu_0_data_master_byteenable_cfi_flash_0_s1;
  wire    [  1: 0] cpu_0_data_master_byteenable_payload_buffer_s1;
  wire    [  1: 0] cpu_0_data_master_dbs_address;
  wire    [ 15: 0] cpu_0_data_master_dbs_write_16;
  wire    [  7: 0] cpu_0_data_master_dbs_write_8;
  wire             cpu_0_data_master_granted_asmi_asmi_control_port;
  wire             cpu_0_data_master_granted_cfi_flash_0_s1;
  wire             cpu_0_data_master_granted_data_RAM_s1;
  wire             cpu_0_data_master_granted_firmware_ROM_s1;
  wire             cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_granted_payload_buffer_s1;
  wire             cpu_0_data_master_granted_sysid_control_slave;
  wire    [ 31: 0] cpu_0_data_master_irq;
  wire             cpu_0_data_master_no_byte_enables_and_last_term;
  wire             cpu_0_data_master_qualified_request_asmi_asmi_control_port;
  wire             cpu_0_data_master_qualified_request_cfi_flash_0_s1;
  wire             cpu_0_data_master_qualified_request_data_RAM_s1;
  wire             cpu_0_data_master_qualified_request_firmware_ROM_s1;
  wire             cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_qualified_request_payload_buffer_s1;
  wire             cpu_0_data_master_qualified_request_sysid_control_slave;
  wire             cpu_0_data_master_read;
  wire             cpu_0_data_master_read_data_valid_asmi_asmi_control_port;
  wire             cpu_0_data_master_read_data_valid_cfi_flash_0_s1;
  wire             cpu_0_data_master_read_data_valid_data_RAM_s1;
  wire             cpu_0_data_master_read_data_valid_firmware_ROM_s1;
  wire             cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_read_data_valid_payload_buffer_s1;
  wire             cpu_0_data_master_read_data_valid_sysid_control_slave;
  wire    [ 31: 0] cpu_0_data_master_readdata;
  wire             cpu_0_data_master_requests_asmi_asmi_control_port;
  wire             cpu_0_data_master_requests_cfi_flash_0_s1;
  wire             cpu_0_data_master_requests_data_RAM_s1;
  wire             cpu_0_data_master_requests_firmware_ROM_s1;
  wire             cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_requests_payload_buffer_s1;
  wire             cpu_0_data_master_requests_sysid_control_slave;
  wire             cpu_0_data_master_waitrequest;
  wire             cpu_0_data_master_write;
  wire    [ 31: 0] cpu_0_data_master_writedata;
  wire    [ 22: 0] cpu_0_instruction_master_address;
  wire    [ 22: 0] cpu_0_instruction_master_address_to_slave;
  wire    [  1: 0] cpu_0_instruction_master_dbs_address;
  wire             cpu_0_instruction_master_granted_cfi_flash_0_s1;
  wire             cpu_0_instruction_master_granted_data_RAM_s1;
  wire             cpu_0_instruction_master_granted_firmware_ROM_s1;
  wire             cpu_0_instruction_master_granted_payload_buffer_s1;
  wire             cpu_0_instruction_master_qualified_request_cfi_flash_0_s1;
  wire             cpu_0_instruction_master_qualified_request_data_RAM_s1;
  wire             cpu_0_instruction_master_qualified_request_firmware_ROM_s1;
  wire             cpu_0_instruction_master_qualified_request_payload_buffer_s1;
  wire             cpu_0_instruction_master_read;
  wire             cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1;
  wire             cpu_0_instruction_master_read_data_valid_data_RAM_s1;
  wire             cpu_0_instruction_master_read_data_valid_firmware_ROM_s1;
  wire             cpu_0_instruction_master_read_data_valid_payload_buffer_s1;
  wire    [ 31: 0] cpu_0_instruction_master_readdata;
  wire             cpu_0_instruction_master_requests_cfi_flash_0_s1;
  wire             cpu_0_instruction_master_requests_data_RAM_s1;
  wire             cpu_0_instruction_master_requests_firmware_ROM_s1;
  wire             cpu_0_instruction_master_requests_payload_buffer_s1;
  wire             cpu_0_instruction_master_reset_n;
  wire             cpu_0_instruction_master_waitrequest;
  wire             d1_asmi_asmi_control_port_end_xfer;
  wire             d1_data_RAM_s1_end_xfer;
  wire             d1_firmware_ROM_s1_end_xfer;
  wire             d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  wire             d1_payload_buffer_s1_end_xfer;
  wire             d1_sysid_control_slave_end_xfer;
  wire             d1_tri_state_bridge_0_avalon_slave_end_xfer;
  wire    [  7: 0] data_RAM_s1_address;
  wire    [  3: 0] data_RAM_s1_byteenable;
  wire             data_RAM_s1_chipselect;
  wire             data_RAM_s1_clken;
  wire    [ 31: 0] data_RAM_s1_readdata;
  wire    [ 31: 0] data_RAM_s1_readdata_from_sa;
  wire             data_RAM_s1_write;
  wire    [ 31: 0] data_RAM_s1_writedata;
  wire    [  9: 0] firmware_ROM_s1_address;
  wire    [  3: 0] firmware_ROM_s1_byteenable;
  wire             firmware_ROM_s1_chipselect;
  wire             firmware_ROM_s1_clken;
  wire             firmware_ROM_s1_debugaccess;
  wire    [ 31: 0] firmware_ROM_s1_readdata;
  wire    [ 31: 0] firmware_ROM_s1_readdata_from_sa;
  wire             firmware_ROM_s1_write;
  wire    [ 31: 0] firmware_ROM_s1_writedata;
  wire    [  7: 0] incoming_tri_state_bridge_0_data;
  wire    [  7: 0] incoming_tri_state_bridge_0_data_with_Xs_converted_to_0;
  wire             jtag_uart_0_avalon_jtag_slave_address;
  wire             jtag_uart_0_avalon_jtag_slave_chipselect;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_irq;
  wire             jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_reset_n;
  wire             jtag_uart_0_avalon_jtag_slave_waitrequest;
  wire             jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_writedata;
  wire    [ 12: 0] payload_buffer_s1_address;
  wire    [  1: 0] payload_buffer_s1_byteenable;
  wire             payload_buffer_s1_chipselect;
  wire             payload_buffer_s1_clken;
  wire    [ 15: 0] payload_buffer_s1_readdata;
  wire    [ 15: 0] payload_buffer_s1_readdata_from_sa;
  wire             payload_buffer_s1_write;
  wire    [ 15: 0] payload_buffer_s1_writedata;
  wire             registered_cpu_0_data_master_read_data_valid_cfi_flash_0_s1;
  wire             registered_cpu_0_data_master_read_data_valid_data_RAM_s1;
  wire             registered_cpu_0_data_master_read_data_valid_firmware_ROM_s1;
  wire             registered_cpu_0_data_master_read_data_valid_payload_buffer_s1;
  wire             reset_n_sources;
  wire             select_n_to_the_cfi_flash_0;
  wire             sysid_control_slave_address;
  wire    [ 31: 0] sysid_control_slave_readdata;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  wire    [ 21: 0] tri_state_bridge_0_address;
  wire    [  7: 0] tri_state_bridge_0_data;
  wire             tri_state_bridge_0_readn;
  wire             write_n_to_the_cfi_flash_0;
  asmi_asmi_control_port_arbitrator the_asmi_asmi_control_port
    (
      .asmi_asmi_control_port_address                             (asmi_asmi_control_port_address),
      .asmi_asmi_control_port_chipselect                          (asmi_asmi_control_port_chipselect),
      .asmi_asmi_control_port_dataavailable                       (asmi_asmi_control_port_dataavailable),
      .asmi_asmi_control_port_dataavailable_from_sa               (asmi_asmi_control_port_dataavailable_from_sa),
      .asmi_asmi_control_port_endofpacket                         (asmi_asmi_control_port_endofpacket),
      .asmi_asmi_control_port_endofpacket_from_sa                 (asmi_asmi_control_port_endofpacket_from_sa),
      .asmi_asmi_control_port_irq                                 (asmi_asmi_control_port_irq),
      .asmi_asmi_control_port_irq_from_sa                         (asmi_asmi_control_port_irq_from_sa),
      .asmi_asmi_control_port_read_n                              (asmi_asmi_control_port_read_n),
      .asmi_asmi_control_port_readdata                            (asmi_asmi_control_port_readdata),
      .asmi_asmi_control_port_readdata_from_sa                    (asmi_asmi_control_port_readdata_from_sa),
      .asmi_asmi_control_port_readyfordata                        (asmi_asmi_control_port_readyfordata),
      .asmi_asmi_control_port_readyfordata_from_sa                (asmi_asmi_control_port_readyfordata_from_sa),
      .asmi_asmi_control_port_reset_n                             (asmi_asmi_control_port_reset_n),
      .asmi_asmi_control_port_write_n                             (asmi_asmi_control_port_write_n),
      .asmi_asmi_control_port_writedata                           (asmi_asmi_control_port_writedata),
      .clk                                                        (clk),
      .cpu_0_data_master_address_to_slave                         (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_asmi_asmi_control_port           (cpu_0_data_master_granted_asmi_asmi_control_port),
      .cpu_0_data_master_qualified_request_asmi_asmi_control_port (cpu_0_data_master_qualified_request_asmi_asmi_control_port),
      .cpu_0_data_master_read                                     (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_asmi_asmi_control_port   (cpu_0_data_master_read_data_valid_asmi_asmi_control_port),
      .cpu_0_data_master_requests_asmi_asmi_control_port          (cpu_0_data_master_requests_asmi_asmi_control_port),
      .cpu_0_data_master_write                                    (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                (cpu_0_data_master_writedata),
      .d1_asmi_asmi_control_port_end_xfer                         (d1_asmi_asmi_control_port_end_xfer),
      .reset_n                                                    (clk_reset_n)
    );

  asmi the_asmi
    (
      .asmi_select   (asmi_asmi_control_port_chipselect),
      .clk           (clk),
      .data_from_cpu (asmi_asmi_control_port_writedata),
      .data_to_cpu   (asmi_asmi_control_port_readdata),
      .dataavailable (asmi_asmi_control_port_dataavailable),
      .endofpacket   (asmi_asmi_control_port_endofpacket),
      .irq           (asmi_asmi_control_port_irq),
      .mem_addr      (asmi_asmi_control_port_address),
      .read_n        (asmi_asmi_control_port_read_n),
      .readyfordata  (asmi_asmi_control_port_readyfordata),
      .reset_n       (asmi_asmi_control_port_reset_n),
      .write_n       (asmi_asmi_control_port_write_n)
    );

  cpu_0_data_master_arbitrator the_cpu_0_data_master
    (
      .asmi_asmi_control_port_irq_from_sa                                (asmi_asmi_control_port_irq_from_sa),
      .asmi_asmi_control_port_readdata_from_sa                           (asmi_asmi_control_port_readdata_from_sa),
      .cfi_flash_0_s1_wait_counter_eq_0                                  (cfi_flash_0_s1_wait_counter_eq_0),
      .cfi_flash_0_s1_wait_counter_eq_1                                  (cfi_flash_0_s1_wait_counter_eq_1),
      .clk                                                               (clk),
      .cpu_0_data_master_address                                         (cpu_0_data_master_address),
      .cpu_0_data_master_address_to_slave                                (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable_cfi_flash_0_s1                       (cpu_0_data_master_byteenable_cfi_flash_0_s1),
      .cpu_0_data_master_byteenable_payload_buffer_s1                    (cpu_0_data_master_byteenable_payload_buffer_s1),
      .cpu_0_data_master_dbs_address                                     (cpu_0_data_master_dbs_address),
      .cpu_0_data_master_dbs_write_16                                    (cpu_0_data_master_dbs_write_16),
      .cpu_0_data_master_dbs_write_8                                     (cpu_0_data_master_dbs_write_8),
      .cpu_0_data_master_granted_asmi_asmi_control_port                  (cpu_0_data_master_granted_asmi_asmi_control_port),
      .cpu_0_data_master_granted_cfi_flash_0_s1                          (cpu_0_data_master_granted_cfi_flash_0_s1),
      .cpu_0_data_master_granted_data_RAM_s1                             (cpu_0_data_master_granted_data_RAM_s1),
      .cpu_0_data_master_granted_firmware_ROM_s1                         (cpu_0_data_master_granted_firmware_ROM_s1),
      .cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave           (cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_granted_payload_buffer_s1                       (cpu_0_data_master_granted_payload_buffer_s1),
      .cpu_0_data_master_granted_sysid_control_slave                     (cpu_0_data_master_granted_sysid_control_slave),
      .cpu_0_data_master_irq                                             (cpu_0_data_master_irq),
      .cpu_0_data_master_no_byte_enables_and_last_term                   (cpu_0_data_master_no_byte_enables_and_last_term),
      .cpu_0_data_master_qualified_request_asmi_asmi_control_port        (cpu_0_data_master_qualified_request_asmi_asmi_control_port),
      .cpu_0_data_master_qualified_request_cfi_flash_0_s1                (cpu_0_data_master_qualified_request_cfi_flash_0_s1),
      .cpu_0_data_master_qualified_request_data_RAM_s1                   (cpu_0_data_master_qualified_request_data_RAM_s1),
      .cpu_0_data_master_qualified_request_firmware_ROM_s1               (cpu_0_data_master_qualified_request_firmware_ROM_s1),
      .cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave (cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_qualified_request_payload_buffer_s1             (cpu_0_data_master_qualified_request_payload_buffer_s1),
      .cpu_0_data_master_qualified_request_sysid_control_slave           (cpu_0_data_master_qualified_request_sysid_control_slave),
      .cpu_0_data_master_read                                            (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_asmi_asmi_control_port          (cpu_0_data_master_read_data_valid_asmi_asmi_control_port),
      .cpu_0_data_master_read_data_valid_cfi_flash_0_s1                  (cpu_0_data_master_read_data_valid_cfi_flash_0_s1),
      .cpu_0_data_master_read_data_valid_data_RAM_s1                     (cpu_0_data_master_read_data_valid_data_RAM_s1),
      .cpu_0_data_master_read_data_valid_firmware_ROM_s1                 (cpu_0_data_master_read_data_valid_firmware_ROM_s1),
      .cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave   (cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_read_data_valid_payload_buffer_s1               (cpu_0_data_master_read_data_valid_payload_buffer_s1),
      .cpu_0_data_master_read_data_valid_sysid_control_slave             (cpu_0_data_master_read_data_valid_sysid_control_slave),
      .cpu_0_data_master_readdata                                        (cpu_0_data_master_readdata),
      .cpu_0_data_master_requests_asmi_asmi_control_port                 (cpu_0_data_master_requests_asmi_asmi_control_port),
      .cpu_0_data_master_requests_cfi_flash_0_s1                         (cpu_0_data_master_requests_cfi_flash_0_s1),
      .cpu_0_data_master_requests_data_RAM_s1                            (cpu_0_data_master_requests_data_RAM_s1),
      .cpu_0_data_master_requests_firmware_ROM_s1                        (cpu_0_data_master_requests_firmware_ROM_s1),
      .cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave          (cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_requests_payload_buffer_s1                      (cpu_0_data_master_requests_payload_buffer_s1),
      .cpu_0_data_master_requests_sysid_control_slave                    (cpu_0_data_master_requests_sysid_control_slave),
      .cpu_0_data_master_waitrequest                                     (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                           (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                       (cpu_0_data_master_writedata),
      .d1_asmi_asmi_control_port_end_xfer                                (d1_asmi_asmi_control_port_end_xfer),
      .d1_data_RAM_s1_end_xfer                                           (d1_data_RAM_s1_end_xfer),
      .d1_firmware_ROM_s1_end_xfer                                       (d1_firmware_ROM_s1_end_xfer),
      .d1_jtag_uart_0_avalon_jtag_slave_end_xfer                         (d1_jtag_uart_0_avalon_jtag_slave_end_xfer),
      .d1_payload_buffer_s1_end_xfer                                     (d1_payload_buffer_s1_end_xfer),
      .d1_sysid_control_slave_end_xfer                                   (d1_sysid_control_slave_end_xfer),
      .d1_tri_state_bridge_0_avalon_slave_end_xfer                       (d1_tri_state_bridge_0_avalon_slave_end_xfer),
      .data_RAM_s1_readdata_from_sa                                      (data_RAM_s1_readdata_from_sa),
      .firmware_ROM_s1_readdata_from_sa                                  (firmware_ROM_s1_readdata_from_sa),
      .incoming_tri_state_bridge_0_data_with_Xs_converted_to_0           (incoming_tri_state_bridge_0_data_with_Xs_converted_to_0),
      .jtag_uart_0_avalon_jtag_slave_irq_from_sa                         (jtag_uart_0_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_0_avalon_jtag_slave_readdata_from_sa                    (jtag_uart_0_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa                 (jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa),
      .payload_buffer_s1_readdata_from_sa                                (payload_buffer_s1_readdata_from_sa),
      .registered_cpu_0_data_master_read_data_valid_cfi_flash_0_s1       (registered_cpu_0_data_master_read_data_valid_cfi_flash_0_s1),
      .registered_cpu_0_data_master_read_data_valid_data_RAM_s1          (registered_cpu_0_data_master_read_data_valid_data_RAM_s1),
      .registered_cpu_0_data_master_read_data_valid_firmware_ROM_s1      (registered_cpu_0_data_master_read_data_valid_firmware_ROM_s1),
      .registered_cpu_0_data_master_read_data_valid_payload_buffer_s1    (registered_cpu_0_data_master_read_data_valid_payload_buffer_s1),
      .reset_n                                                           (clk_reset_n),
      .sysid_control_slave_readdata_from_sa                              (sysid_control_slave_readdata_from_sa)
    );

  cpu_0_instruction_master_arbitrator the_cpu_0_instruction_master
    (
      .cfi_flash_0_s1_wait_counter_eq_0                             (cfi_flash_0_s1_wait_counter_eq_0),
      .cfi_flash_0_s1_wait_counter_eq_1                             (cfi_flash_0_s1_wait_counter_eq_1),
      .clk                                                          (clk),
      .cpu_0_instruction_master_address                             (cpu_0_instruction_master_address),
      .cpu_0_instruction_master_address_to_slave                    (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_dbs_address                         (cpu_0_instruction_master_dbs_address),
      .cpu_0_instruction_master_granted_cfi_flash_0_s1              (cpu_0_instruction_master_granted_cfi_flash_0_s1),
      .cpu_0_instruction_master_granted_data_RAM_s1                 (cpu_0_instruction_master_granted_data_RAM_s1),
      .cpu_0_instruction_master_granted_firmware_ROM_s1             (cpu_0_instruction_master_granted_firmware_ROM_s1),
      .cpu_0_instruction_master_granted_payload_buffer_s1           (cpu_0_instruction_master_granted_payload_buffer_s1),
      .cpu_0_instruction_master_qualified_request_cfi_flash_0_s1    (cpu_0_instruction_master_qualified_request_cfi_flash_0_s1),
      .cpu_0_instruction_master_qualified_request_data_RAM_s1       (cpu_0_instruction_master_qualified_request_data_RAM_s1),
      .cpu_0_instruction_master_qualified_request_firmware_ROM_s1   (cpu_0_instruction_master_qualified_request_firmware_ROM_s1),
      .cpu_0_instruction_master_qualified_request_payload_buffer_s1 (cpu_0_instruction_master_qualified_request_payload_buffer_s1),
      .cpu_0_instruction_master_read                                (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1      (cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1),
      .cpu_0_instruction_master_read_data_valid_data_RAM_s1         (cpu_0_instruction_master_read_data_valid_data_RAM_s1),
      .cpu_0_instruction_master_read_data_valid_firmware_ROM_s1     (cpu_0_instruction_master_read_data_valid_firmware_ROM_s1),
      .cpu_0_instruction_master_read_data_valid_payload_buffer_s1   (cpu_0_instruction_master_read_data_valid_payload_buffer_s1),
      .cpu_0_instruction_master_readdata                            (cpu_0_instruction_master_readdata),
      .cpu_0_instruction_master_requests_cfi_flash_0_s1             (cpu_0_instruction_master_requests_cfi_flash_0_s1),
      .cpu_0_instruction_master_requests_data_RAM_s1                (cpu_0_instruction_master_requests_data_RAM_s1),
      .cpu_0_instruction_master_requests_firmware_ROM_s1            (cpu_0_instruction_master_requests_firmware_ROM_s1),
      .cpu_0_instruction_master_requests_payload_buffer_s1          (cpu_0_instruction_master_requests_payload_buffer_s1),
      .cpu_0_instruction_master_reset_n                             (cpu_0_instruction_master_reset_n),
      .cpu_0_instruction_master_waitrequest                         (cpu_0_instruction_master_waitrequest),
      .d1_data_RAM_s1_end_xfer                                      (d1_data_RAM_s1_end_xfer),
      .d1_firmware_ROM_s1_end_xfer                                  (d1_firmware_ROM_s1_end_xfer),
      .d1_payload_buffer_s1_end_xfer                                (d1_payload_buffer_s1_end_xfer),
      .d1_tri_state_bridge_0_avalon_slave_end_xfer                  (d1_tri_state_bridge_0_avalon_slave_end_xfer),
      .data_RAM_s1_readdata_from_sa                                 (data_RAM_s1_readdata_from_sa),
      .firmware_ROM_s1_readdata_from_sa                             (firmware_ROM_s1_readdata_from_sa),
      .incoming_tri_state_bridge_0_data                             (incoming_tri_state_bridge_0_data),
      .payload_buffer_s1_readdata_from_sa                           (payload_buffer_s1_readdata_from_sa),
      .reset_n                                                      (clk_reset_n)
    );

  cpu_0 the_cpu_0
    (
      .clk           (clk),
      .d_address     (cpu_0_data_master_address),
      .d_byteenable  (cpu_0_data_master_byteenable),
      .d_irq         (cpu_0_data_master_irq),
      .d_read        (cpu_0_data_master_read),
      .d_readdata    (cpu_0_data_master_readdata),
      .d_waitrequest (cpu_0_data_master_waitrequest),
      .d_write       (cpu_0_data_master_write),
      .d_writedata   (cpu_0_data_master_writedata),
      .i_address     (cpu_0_instruction_master_address),
      .i_read        (cpu_0_instruction_master_read),
      .i_readdata    (cpu_0_instruction_master_readdata),
      .i_waitrequest (cpu_0_instruction_master_waitrequest),
      .reset_n       (cpu_0_instruction_master_reset_n)
    );

  data_RAM_s1_arbitrator the_data_RAM_s1
    (
      .clk                                                      (clk),
      .cpu_0_data_master_address_to_slave                       (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                             (cpu_0_data_master_byteenable),
      .cpu_0_data_master_granted_data_RAM_s1                    (cpu_0_data_master_granted_data_RAM_s1),
      .cpu_0_data_master_qualified_request_data_RAM_s1          (cpu_0_data_master_qualified_request_data_RAM_s1),
      .cpu_0_data_master_read                                   (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_data_RAM_s1            (cpu_0_data_master_read_data_valid_data_RAM_s1),
      .cpu_0_data_master_requests_data_RAM_s1                   (cpu_0_data_master_requests_data_RAM_s1),
      .cpu_0_data_master_waitrequest                            (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                  (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                              (cpu_0_data_master_writedata),
      .cpu_0_instruction_master_address_to_slave                (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_granted_data_RAM_s1             (cpu_0_instruction_master_granted_data_RAM_s1),
      .cpu_0_instruction_master_qualified_request_data_RAM_s1   (cpu_0_instruction_master_qualified_request_data_RAM_s1),
      .cpu_0_instruction_master_read                            (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_data_RAM_s1     (cpu_0_instruction_master_read_data_valid_data_RAM_s1),
      .cpu_0_instruction_master_requests_data_RAM_s1            (cpu_0_instruction_master_requests_data_RAM_s1),
      .d1_data_RAM_s1_end_xfer                                  (d1_data_RAM_s1_end_xfer),
      .data_RAM_s1_address                                      (data_RAM_s1_address),
      .data_RAM_s1_byteenable                                   (data_RAM_s1_byteenable),
      .data_RAM_s1_chipselect                                   (data_RAM_s1_chipselect),
      .data_RAM_s1_clken                                        (data_RAM_s1_clken),
      .data_RAM_s1_readdata                                     (data_RAM_s1_readdata),
      .data_RAM_s1_readdata_from_sa                             (data_RAM_s1_readdata_from_sa),
      .data_RAM_s1_write                                        (data_RAM_s1_write),
      .data_RAM_s1_writedata                                    (data_RAM_s1_writedata),
      .registered_cpu_0_data_master_read_data_valid_data_RAM_s1 (registered_cpu_0_data_master_read_data_valid_data_RAM_s1),
      .reset_n                                                  (clk_reset_n)
    );

  data_RAM the_data_RAM
    (
      .address    (data_RAM_s1_address),
      .byteenable (data_RAM_s1_byteenable),
      .chipselect (data_RAM_s1_chipselect),
      .clk        (clk),
      .clken      (data_RAM_s1_clken),
      .readdata   (data_RAM_s1_readdata),
      .write      (data_RAM_s1_write),
      .writedata  (data_RAM_s1_writedata)
    );

  firmware_ROM_s1_arbitrator the_firmware_ROM_s1
    (
      .clk                                                          (clk),
      .cpu_0_data_master_address_to_slave                           (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                                 (cpu_0_data_master_byteenable),
      .cpu_0_data_master_granted_firmware_ROM_s1                    (cpu_0_data_master_granted_firmware_ROM_s1),
      .cpu_0_data_master_qualified_request_firmware_ROM_s1          (cpu_0_data_master_qualified_request_firmware_ROM_s1),
      .cpu_0_data_master_read                                       (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_firmware_ROM_s1            (cpu_0_data_master_read_data_valid_firmware_ROM_s1),
      .cpu_0_data_master_requests_firmware_ROM_s1                   (cpu_0_data_master_requests_firmware_ROM_s1),
      .cpu_0_data_master_waitrequest                                (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                      (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                  (cpu_0_data_master_writedata),
      .cpu_0_instruction_master_address_to_slave                    (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_granted_firmware_ROM_s1             (cpu_0_instruction_master_granted_firmware_ROM_s1),
      .cpu_0_instruction_master_qualified_request_firmware_ROM_s1   (cpu_0_instruction_master_qualified_request_firmware_ROM_s1),
      .cpu_0_instruction_master_read                                (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_firmware_ROM_s1     (cpu_0_instruction_master_read_data_valid_firmware_ROM_s1),
      .cpu_0_instruction_master_requests_firmware_ROM_s1            (cpu_0_instruction_master_requests_firmware_ROM_s1),
      .d1_firmware_ROM_s1_end_xfer                                  (d1_firmware_ROM_s1_end_xfer),
      .firmware_ROM_s1_address                                      (firmware_ROM_s1_address),
      .firmware_ROM_s1_byteenable                                   (firmware_ROM_s1_byteenable),
      .firmware_ROM_s1_chipselect                                   (firmware_ROM_s1_chipselect),
      .firmware_ROM_s1_clken                                        (firmware_ROM_s1_clken),
      .firmware_ROM_s1_readdata                                     (firmware_ROM_s1_readdata),
      .firmware_ROM_s1_readdata_from_sa                             (firmware_ROM_s1_readdata_from_sa),
      .firmware_ROM_s1_write                                        (firmware_ROM_s1_write),
      .firmware_ROM_s1_writedata                                    (firmware_ROM_s1_writedata),
      .registered_cpu_0_data_master_read_data_valid_firmware_ROM_s1 (registered_cpu_0_data_master_read_data_valid_firmware_ROM_s1),
      .reset_n                                                      (clk_reset_n)
    );

  firmware_ROM the_firmware_ROM
    (
      .address     (firmware_ROM_s1_address),
      .byteenable  (firmware_ROM_s1_byteenable),
      .chipselect  (firmware_ROM_s1_chipselect),
      .clk         (clk),
      .clken       (firmware_ROM_s1_clken),
      .debugaccess (firmware_ROM_s1_debugaccess),
      .readdata    (firmware_ROM_s1_readdata),
      .write       (firmware_ROM_s1_write),
      .writedata   (firmware_ROM_s1_writedata)
    );

  jtag_uart_0_avalon_jtag_slave_arbitrator the_jtag_uart_0_avalon_jtag_slave
    (
      .clk                                                               (clk),
      .cpu_0_data_master_address_to_slave                                (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave           (cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave (cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_read                                            (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave   (cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave          (cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_waitrequest                                     (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                           (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                       (cpu_0_data_master_writedata),
      .d1_jtag_uart_0_avalon_jtag_slave_end_xfer                         (d1_jtag_uart_0_avalon_jtag_slave_end_xfer),
      .jtag_uart_0_avalon_jtag_slave_address                             (jtag_uart_0_avalon_jtag_slave_address),
      .jtag_uart_0_avalon_jtag_slave_chipselect                          (jtag_uart_0_avalon_jtag_slave_chipselect),
      .jtag_uart_0_avalon_jtag_slave_dataavailable                       (jtag_uart_0_avalon_jtag_slave_dataavailable),
      .jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa               (jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa),
      .jtag_uart_0_avalon_jtag_slave_irq                                 (jtag_uart_0_avalon_jtag_slave_irq),
      .jtag_uart_0_avalon_jtag_slave_irq_from_sa                         (jtag_uart_0_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_0_avalon_jtag_slave_read_n                              (jtag_uart_0_avalon_jtag_slave_read_n),
      .jtag_uart_0_avalon_jtag_slave_readdata                            (jtag_uart_0_avalon_jtag_slave_readdata),
      .jtag_uart_0_avalon_jtag_slave_readdata_from_sa                    (jtag_uart_0_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_0_avalon_jtag_slave_readyfordata                        (jtag_uart_0_avalon_jtag_slave_readyfordata),
      .jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa                (jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa),
      .jtag_uart_0_avalon_jtag_slave_reset_n                             (jtag_uart_0_avalon_jtag_slave_reset_n),
      .jtag_uart_0_avalon_jtag_slave_waitrequest                         (jtag_uart_0_avalon_jtag_slave_waitrequest),
      .jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa                 (jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa),
      .jtag_uart_0_avalon_jtag_slave_write_n                             (jtag_uart_0_avalon_jtag_slave_write_n),
      .jtag_uart_0_avalon_jtag_slave_writedata                           (jtag_uart_0_avalon_jtag_slave_writedata),
      .reset_n                                                           (clk_reset_n)
    );

  jtag_uart_0 the_jtag_uart_0
    (
      .av_address     (jtag_uart_0_avalon_jtag_slave_address),
      .av_chipselect  (jtag_uart_0_avalon_jtag_slave_chipselect),
      .av_irq         (jtag_uart_0_avalon_jtag_slave_irq),
      .av_read_n      (jtag_uart_0_avalon_jtag_slave_read_n),
      .av_readdata    (jtag_uart_0_avalon_jtag_slave_readdata),
      .av_waitrequest (jtag_uart_0_avalon_jtag_slave_waitrequest),
      .av_write_n     (jtag_uart_0_avalon_jtag_slave_write_n),
      .av_writedata   (jtag_uart_0_avalon_jtag_slave_writedata),
      .clk            (clk),
      .dataavailable  (jtag_uart_0_avalon_jtag_slave_dataavailable),
      .readyfordata   (jtag_uart_0_avalon_jtag_slave_readyfordata),
      .rst_n          (jtag_uart_0_avalon_jtag_slave_reset_n)
    );

  payload_buffer_s1_arbitrator the_payload_buffer_s1
    (
      .clk                                                            (clk),
      .cpu_0_data_master_address_to_slave                             (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                                   (cpu_0_data_master_byteenable),
      .cpu_0_data_master_byteenable_payload_buffer_s1                 (cpu_0_data_master_byteenable_payload_buffer_s1),
      .cpu_0_data_master_dbs_address                                  (cpu_0_data_master_dbs_address),
      .cpu_0_data_master_dbs_write_16                                 (cpu_0_data_master_dbs_write_16),
      .cpu_0_data_master_granted_payload_buffer_s1                    (cpu_0_data_master_granted_payload_buffer_s1),
      .cpu_0_data_master_no_byte_enables_and_last_term                (cpu_0_data_master_no_byte_enables_and_last_term),
      .cpu_0_data_master_qualified_request_payload_buffer_s1          (cpu_0_data_master_qualified_request_payload_buffer_s1),
      .cpu_0_data_master_read                                         (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_payload_buffer_s1            (cpu_0_data_master_read_data_valid_payload_buffer_s1),
      .cpu_0_data_master_requests_payload_buffer_s1                   (cpu_0_data_master_requests_payload_buffer_s1),
      .cpu_0_data_master_waitrequest                                  (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                        (cpu_0_data_master_write),
      .cpu_0_instruction_master_address_to_slave                      (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_dbs_address                           (cpu_0_instruction_master_dbs_address),
      .cpu_0_instruction_master_granted_payload_buffer_s1             (cpu_0_instruction_master_granted_payload_buffer_s1),
      .cpu_0_instruction_master_qualified_request_payload_buffer_s1   (cpu_0_instruction_master_qualified_request_payload_buffer_s1),
      .cpu_0_instruction_master_read                                  (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_payload_buffer_s1     (cpu_0_instruction_master_read_data_valid_payload_buffer_s1),
      .cpu_0_instruction_master_requests_payload_buffer_s1            (cpu_0_instruction_master_requests_payload_buffer_s1),
      .d1_payload_buffer_s1_end_xfer                                  (d1_payload_buffer_s1_end_xfer),
      .payload_buffer_s1_address                                      (payload_buffer_s1_address),
      .payload_buffer_s1_byteenable                                   (payload_buffer_s1_byteenable),
      .payload_buffer_s1_chipselect                                   (payload_buffer_s1_chipselect),
      .payload_buffer_s1_clken                                        (payload_buffer_s1_clken),
      .payload_buffer_s1_readdata                                     (payload_buffer_s1_readdata),
      .payload_buffer_s1_readdata_from_sa                             (payload_buffer_s1_readdata_from_sa),
      .payload_buffer_s1_write                                        (payload_buffer_s1_write),
      .payload_buffer_s1_writedata                                    (payload_buffer_s1_writedata),
      .registered_cpu_0_data_master_read_data_valid_payload_buffer_s1 (registered_cpu_0_data_master_read_data_valid_payload_buffer_s1),
      .reset_n                                                        (clk_reset_n)
    );

  payload_buffer the_payload_buffer
    (
      .address    (payload_buffer_s1_address),
      .byteenable (payload_buffer_s1_byteenable),
      .chipselect (payload_buffer_s1_chipselect),
      .clk        (clk),
      .clken      (payload_buffer_s1_clken),
      .readdata   (payload_buffer_s1_readdata),
      .write      (payload_buffer_s1_write),
      .writedata  (payload_buffer_s1_writedata)
    );

  sysid_control_slave_arbitrator the_sysid_control_slave
    (
      .clk                                                     (clk),
      .cpu_0_data_master_address_to_slave                      (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_sysid_control_slave           (cpu_0_data_master_granted_sysid_control_slave),
      .cpu_0_data_master_qualified_request_sysid_control_slave (cpu_0_data_master_qualified_request_sysid_control_slave),
      .cpu_0_data_master_read                                  (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_sysid_control_slave   (cpu_0_data_master_read_data_valid_sysid_control_slave),
      .cpu_0_data_master_requests_sysid_control_slave          (cpu_0_data_master_requests_sysid_control_slave),
      .cpu_0_data_master_write                                 (cpu_0_data_master_write),
      .d1_sysid_control_slave_end_xfer                         (d1_sysid_control_slave_end_xfer),
      .reset_n                                                 (clk_reset_n),
      .sysid_control_slave_address                             (sysid_control_slave_address),
      .sysid_control_slave_readdata                            (sysid_control_slave_readdata),
      .sysid_control_slave_readdata_from_sa                    (sysid_control_slave_readdata_from_sa)
    );

  sysid the_sysid
    (
      .address  (sysid_control_slave_address),
      .readdata (sysid_control_slave_readdata)
    );

  tri_state_bridge_0_avalon_slave_arbitrator the_tri_state_bridge_0_avalon_slave
    (
      .cfi_flash_0_s1_wait_counter_eq_0                            (cfi_flash_0_s1_wait_counter_eq_0),
      .cfi_flash_0_s1_wait_counter_eq_1                            (cfi_flash_0_s1_wait_counter_eq_1),
      .clk                                                         (clk),
      .cpu_0_data_master_address_to_slave                          (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                                (cpu_0_data_master_byteenable),
      .cpu_0_data_master_byteenable_cfi_flash_0_s1                 (cpu_0_data_master_byteenable_cfi_flash_0_s1),
      .cpu_0_data_master_dbs_address                               (cpu_0_data_master_dbs_address),
      .cpu_0_data_master_dbs_write_8                               (cpu_0_data_master_dbs_write_8),
      .cpu_0_data_master_granted_cfi_flash_0_s1                    (cpu_0_data_master_granted_cfi_flash_0_s1),
      .cpu_0_data_master_no_byte_enables_and_last_term             (cpu_0_data_master_no_byte_enables_and_last_term),
      .cpu_0_data_master_qualified_request_cfi_flash_0_s1          (cpu_0_data_master_qualified_request_cfi_flash_0_s1),
      .cpu_0_data_master_read                                      (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_cfi_flash_0_s1            (cpu_0_data_master_read_data_valid_cfi_flash_0_s1),
      .cpu_0_data_master_requests_cfi_flash_0_s1                   (cpu_0_data_master_requests_cfi_flash_0_s1),
      .cpu_0_data_master_write                                     (cpu_0_data_master_write),
      .cpu_0_instruction_master_address_to_slave                   (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_dbs_address                        (cpu_0_instruction_master_dbs_address),
      .cpu_0_instruction_master_granted_cfi_flash_0_s1             (cpu_0_instruction_master_granted_cfi_flash_0_s1),
      .cpu_0_instruction_master_qualified_request_cfi_flash_0_s1   (cpu_0_instruction_master_qualified_request_cfi_flash_0_s1),
      .cpu_0_instruction_master_read                               (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1     (cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1),
      .cpu_0_instruction_master_requests_cfi_flash_0_s1            (cpu_0_instruction_master_requests_cfi_flash_0_s1),
      .d1_tri_state_bridge_0_avalon_slave_end_xfer                 (d1_tri_state_bridge_0_avalon_slave_end_xfer),
      .incoming_tri_state_bridge_0_data                            (incoming_tri_state_bridge_0_data),
      .incoming_tri_state_bridge_0_data_with_Xs_converted_to_0     (incoming_tri_state_bridge_0_data_with_Xs_converted_to_0),
      .registered_cpu_0_data_master_read_data_valid_cfi_flash_0_s1 (registered_cpu_0_data_master_read_data_valid_cfi_flash_0_s1),
      .reset_n                                                     (clk_reset_n),
      .select_n_to_the_cfi_flash_0                                 (select_n_to_the_cfi_flash_0),
      .tri_state_bridge_0_address                                  (tri_state_bridge_0_address),
      .tri_state_bridge_0_data                                     (tri_state_bridge_0_data),
      .tri_state_bridge_0_readn                                    (tri_state_bridge_0_readn),
      .write_n_to_the_cfi_flash_0                                  (write_n_to_the_cfi_flash_0)
    );

  //reset is asserted asynchronously and deasserted synchronously
  DE2_Board_reset_clk_domain_synch_module DE2_Board_reset_clk_domain_synch
    (
      .clk      (clk),
      .data_in  (1'b1),
      .data_out (clk_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset sources mux, which is an e_mux
  assign reset_n_sources = ~(~reset_n |
    0);

  //firmware_ROM_s1_debugaccess of type debugaccess does not connect to anything so wire it to default (0)
  assign firmware_ROM_s1_debugaccess = 0;


endmodule


module cfi_flash_0_lane0_module (
                                  // inputs:
                                   data,
                                   rdaddress,
                                   rdclken,
                                   wraddress,
                                   wrclock,
                                   wren,

                                  // outputs:
                                   q
                                )
;

  output  [  7: 0] q;
  input   [  7: 0] data;
  input   [ 21: 0] rdaddress;
  input            rdclken;
  input   [ 21: 0] wraddress;
  input            wrclock;
  input            wren;

  reg     [  7: 0] mem_array [4194303: 0];
  wire    [  7: 0] q;
  reg     [ 21: 0] read_address;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  always @(rdaddress)
    begin
      if (1)
          read_address <= rdaddress;
    end


  // Data read is asynchronous.
  assign q = mem_array[read_address];

initial
    $readmemh("cfi_flash_0.dat", mem_array);
  always @(posedge wrclock)
    begin
      // Write data
      if (wren)
          mem_array[wraddress] <= data;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  always @(rdaddress)
//    begin
//      if (1)
//          read_address <= rdaddress;
//    end
//
//
//  lpm_ram_dp lpm_ram_dp_component
//    (
//      .data (data),
//      .q (q),
//      .rdaddress (read_address),
//      .rdclken (rdclken),
//      .wraddress (wraddress),
//      .wrclock (wrclock),
//      .wren (wren)
//    );
//
//  defparam lpm_ram_dp_component.lpm_file = "cfi_flash_0.mif",
//           lpm_ram_dp_component.lpm_hint = "USE_EAB=ON",
//           lpm_ram_dp_component.lpm_indata = "REGISTERED",
//           lpm_ram_dp_component.lpm_outdata = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_rdaddress_control = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_width = 8,
//           lpm_ram_dp_component.lpm_widthad = 22,
//           lpm_ram_dp_component.lpm_wraddress_control = "REGISTERED",
//           lpm_ram_dp_component.suppress_memory_conversion_warnings = "ON";
//
//synthesis read_comments_as_HDL off

endmodule


module cfi_flash_0 (
                     // inputs:
                      address,
                      read_n,
                      select_n,
                      write_n,

                     // outputs:
                      data
                   )
;

  inout   [  7: 0] data;
  input   [ 21: 0] address;
  input            read_n;
  input            select_n;
  input            write_n;

  wire    [  7: 0] data;
  wire    [  7: 0] data_0;
  wire    [  7: 0] logic_vector_gasket;
  wire    [  7: 0] q_0;
  //s1, which is an e_ptf_slave

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  assign logic_vector_gasket = data;
  assign data_0 = logic_vector_gasket[7 : 0];
  //cfi_flash_0_lane0, which is an e_ram
  cfi_flash_0_lane0_module cfi_flash_0_lane0
    (
      .data      (data_0),
      .q         (q_0),
      .rdaddress (address),
      .rdclken   (1'b1),
      .wraddress (address),
      .wrclock   (write_n),
      .wren      (~select_n)
    );

  assign data = (~select_n & ~read_n)? q_0: {8{1'bz}};

//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


//synthesis translate_off



// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE

// AND HERE WILL BE PRESERVED </ALTERA_NOTE>


// If user logic components use Altsync_Ram with convert_hex2ver.dll,
// set USE_convert_hex2ver in the user comments section above

`ifdef USE_convert_hex2ver
`else
`define NO_PLI 1
`endif

`include "c:/altera/quartus51/eda/sim_lib/altera_mf.v"
`include "c:/altera/quartus51/eda/sim_lib/220model.v"
`include "c:/altera/quartus51/eda/sim_lib/sgate.v"
`include "sysid.v"
`include "jtag_uart_0.v"
`include "cpu_0_test_bench.v"
`include "cpu_0.v"
`include "firmware_ROM.v"
`include "data_RAM.v"
`include "asmi.v"
`include "payload_buffer.v"

`timescale 1ns / 100ps

module test_bench 
;


  wire             asmi_asmi_control_port_dataavailable_from_sa;
  wire             asmi_asmi_control_port_endofpacket_from_sa;
  wire             asmi_asmi_control_port_readyfordata_from_sa;
  reg              clk;
  wire             firmware_ROM_s1_debugaccess;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  reg              reset_n;
  wire             select_n_to_the_cfi_flash_0;
  wire    [ 21: 0] tri_state_bridge_0_address;
  wire    [  7: 0] tri_state_bridge_0_data;
  wire             tri_state_bridge_0_readn;
  wire             write_n_to_the_cfi_flash_0;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  DE2_Board DUT
    (
      .clk                         (clk),
      .reset_n                     (reset_n),
      .select_n_to_the_cfi_flash_0 (select_n_to_the_cfi_flash_0),
      .tri_state_bridge_0_address  (tri_state_bridge_0_address),
      .tri_state_bridge_0_data     (tri_state_bridge_0_data),
      .tri_state_bridge_0_readn    (tri_state_bridge_0_readn),
      .write_n_to_the_cfi_flash_0  (write_n_to_the_cfi_flash_0)
    );

  cfi_flash_0 the_cfi_flash_0
    (
      .address  (tri_state_bridge_0_address),
      .data     (tri_state_bridge_0_data),
      .read_n   (tri_state_bridge_0_readn),
      .select_n (select_n_to_the_cfi_flash_0),
      .write_n  (write_n_to_the_cfi_flash_0)
    );

  initial
    clk = 1'b0;
  always
    #10 clk <= ~clk;
  
  initial 
    begin
      reset_n <= 0;
      #200 reset_n <= 1;
    end

endmodule


//synthesis translate_on