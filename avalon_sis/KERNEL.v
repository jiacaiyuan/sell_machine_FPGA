//megafunction wizard: %Altera SOPC Builder%
//GENERATION: STANDARD
//VERSION: WM1.0


//Legal Notice: (C)2018 Altera Corporation. All rights reserved.  Your
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

module cpu_jtag_debug_module_arbitrator (
                                          // inputs:
                                           clk,
                                           cpu_data_master_address_to_slave,
                                           cpu_data_master_byteenable,
                                           cpu_data_master_debugaccess,
                                           cpu_data_master_read,
                                           cpu_data_master_waitrequest,
                                           cpu_data_master_write,
                                           cpu_data_master_writedata,
                                           cpu_instruction_master_address_to_slave,
                                           cpu_instruction_master_latency_counter,
                                           cpu_instruction_master_read,
                                           cpu_jtag_debug_module_readdata,
                                           cpu_jtag_debug_module_resetrequest,
                                           reset_n,

                                          // outputs:
                                           cpu_data_master_granted_cpu_jtag_debug_module,
                                           cpu_data_master_qualified_request_cpu_jtag_debug_module,
                                           cpu_data_master_read_data_valid_cpu_jtag_debug_module,
                                           cpu_data_master_requests_cpu_jtag_debug_module,
                                           cpu_instruction_master_granted_cpu_jtag_debug_module,
                                           cpu_instruction_master_qualified_request_cpu_jtag_debug_module,
                                           cpu_instruction_master_read_data_valid_cpu_jtag_debug_module,
                                           cpu_instruction_master_requests_cpu_jtag_debug_module,
                                           cpu_jtag_debug_module_address,
                                           cpu_jtag_debug_module_begintransfer,
                                           cpu_jtag_debug_module_byteenable,
                                           cpu_jtag_debug_module_chipselect,
                                           cpu_jtag_debug_module_debugaccess,
                                           cpu_jtag_debug_module_readdata_from_sa,
                                           cpu_jtag_debug_module_reset,
                                           cpu_jtag_debug_module_reset_n,
                                           cpu_jtag_debug_module_resetrequest_from_sa,
                                           cpu_jtag_debug_module_write,
                                           cpu_jtag_debug_module_writedata,
                                           d1_cpu_jtag_debug_module_end_xfer
                                        )
;

  output           cpu_data_master_granted_cpu_jtag_debug_module;
  output           cpu_data_master_qualified_request_cpu_jtag_debug_module;
  output           cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  output           cpu_data_master_requests_cpu_jtag_debug_module;
  output           cpu_instruction_master_granted_cpu_jtag_debug_module;
  output           cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  output           cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  output           cpu_instruction_master_requests_cpu_jtag_debug_module;
  output  [  8: 0] cpu_jtag_debug_module_address;
  output           cpu_jtag_debug_module_begintransfer;
  output  [  3: 0] cpu_jtag_debug_module_byteenable;
  output           cpu_jtag_debug_module_chipselect;
  output           cpu_jtag_debug_module_debugaccess;
  output  [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  output           cpu_jtag_debug_module_reset;
  output           cpu_jtag_debug_module_reset_n;
  output           cpu_jtag_debug_module_resetrequest_from_sa;
  output           cpu_jtag_debug_module_write;
  output  [ 31: 0] cpu_jtag_debug_module_writedata;
  output           d1_cpu_jtag_debug_module_end_xfer;
  input            clk;
  input   [ 15: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_debugaccess;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 15: 0] cpu_instruction_master_address_to_slave;
  input            cpu_instruction_master_latency_counter;
  input            cpu_instruction_master_read;
  input   [ 31: 0] cpu_jtag_debug_module_readdata;
  input            cpu_jtag_debug_module_resetrequest;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_cpu_jtag_debug_module;
  wire             cpu_data_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_data_master_requests_cpu_jtag_debug_module;
  wire             cpu_data_master_saved_grant_cpu_jtag_debug_module;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_cpu_jtag_debug_module;
  wire             cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_instruction_master_requests_cpu_jtag_debug_module;
  wire             cpu_instruction_master_saved_grant_cpu_jtag_debug_module;
  wire    [  8: 0] cpu_jtag_debug_module_address;
  wire             cpu_jtag_debug_module_allgrants;
  wire             cpu_jtag_debug_module_allow_new_arb_cycle;
  wire             cpu_jtag_debug_module_any_bursting_master_saved_grant;
  wire             cpu_jtag_debug_module_any_continuerequest;
  reg     [  1: 0] cpu_jtag_debug_module_arb_addend;
  wire             cpu_jtag_debug_module_arb_counter_enable;
  reg              cpu_jtag_debug_module_arb_share_counter;
  wire             cpu_jtag_debug_module_arb_share_counter_next_value;
  wire             cpu_jtag_debug_module_arb_share_set_values;
  wire    [  1: 0] cpu_jtag_debug_module_arb_winner;
  wire             cpu_jtag_debug_module_arbitration_holdoff_internal;
  wire             cpu_jtag_debug_module_beginbursttransfer_internal;
  wire             cpu_jtag_debug_module_begins_xfer;
  wire             cpu_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_jtag_debug_module_byteenable;
  wire             cpu_jtag_debug_module_chipselect;
  wire    [  3: 0] cpu_jtag_debug_module_chosen_master_double_vector;
  wire    [  1: 0] cpu_jtag_debug_module_chosen_master_rot_left;
  wire             cpu_jtag_debug_module_debugaccess;
  wire             cpu_jtag_debug_module_end_xfer;
  wire             cpu_jtag_debug_module_firsttransfer;
  wire    [  1: 0] cpu_jtag_debug_module_grant_vector;
  wire             cpu_jtag_debug_module_in_a_read_cycle;
  wire             cpu_jtag_debug_module_in_a_write_cycle;
  wire    [  1: 0] cpu_jtag_debug_module_master_qreq_vector;
  wire             cpu_jtag_debug_module_non_bursting_master_requests;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  reg              cpu_jtag_debug_module_reg_firsttransfer;
  wire             cpu_jtag_debug_module_reset;
  wire             cpu_jtag_debug_module_reset_n;
  wire             cpu_jtag_debug_module_resetrequest_from_sa;
  reg     [  1: 0] cpu_jtag_debug_module_saved_chosen_master_vector;
  reg              cpu_jtag_debug_module_slavearbiterlockenable;
  wire             cpu_jtag_debug_module_slavearbiterlockenable2;
  wire             cpu_jtag_debug_module_unreg_firsttransfer;
  wire             cpu_jtag_debug_module_waits_for_read;
  wire             cpu_jtag_debug_module_waits_for_write;
  wire             cpu_jtag_debug_module_write;
  wire    [ 31: 0] cpu_jtag_debug_module_writedata;
  reg              d1_cpu_jtag_debug_module_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_cpu_jtag_debug_module;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module;
  reg              last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module;
  wire    [ 15: 0] shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master;
  wire    [ 15: 0] shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master;
  wire             wait_for_cpu_jtag_debug_module_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~cpu_jtag_debug_module_end_xfer;
    end


  assign cpu_jtag_debug_module_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_cpu_jtag_debug_module | cpu_instruction_master_qualified_request_cpu_jtag_debug_module));
  //assign cpu_jtag_debug_module_readdata_from_sa = cpu_jtag_debug_module_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_jtag_debug_module_readdata_from_sa = cpu_jtag_debug_module_readdata;

  assign cpu_data_master_requests_cpu_jtag_debug_module = ({cpu_data_master_address_to_slave[15 : 11] , 11'b0} == 16'h8800) & (cpu_data_master_read | cpu_data_master_write);
  //cpu_jtag_debug_module_arb_share_counter set values, which is an e_mux
  assign cpu_jtag_debug_module_arb_share_set_values = 1;

  //cpu_jtag_debug_module_non_bursting_master_requests mux, which is an e_mux
  assign cpu_jtag_debug_module_non_bursting_master_requests = cpu_data_master_requests_cpu_jtag_debug_module |
    cpu_instruction_master_requests_cpu_jtag_debug_module |
    cpu_data_master_requests_cpu_jtag_debug_module |
    cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu_jtag_debug_module_any_bursting_master_saved_grant mux, which is an e_mux
  assign cpu_jtag_debug_module_any_bursting_master_saved_grant = 0;

  //cpu_jtag_debug_module_arb_share_counter_next_value assignment, which is an e_assign
  assign cpu_jtag_debug_module_arb_share_counter_next_value = cpu_jtag_debug_module_firsttransfer ? (cpu_jtag_debug_module_arb_share_set_values - 1) : |cpu_jtag_debug_module_arb_share_counter ? (cpu_jtag_debug_module_arb_share_counter - 1) : 0;

  //cpu_jtag_debug_module_allgrants all slave grants, which is an e_mux
  assign cpu_jtag_debug_module_allgrants = (|cpu_jtag_debug_module_grant_vector) |
    (|cpu_jtag_debug_module_grant_vector) |
    (|cpu_jtag_debug_module_grant_vector) |
    (|cpu_jtag_debug_module_grant_vector);

  //cpu_jtag_debug_module_end_xfer assignment, which is an e_assign
  assign cpu_jtag_debug_module_end_xfer = ~(cpu_jtag_debug_module_waits_for_read | cpu_jtag_debug_module_waits_for_write);

  //end_xfer_arb_share_counter_term_cpu_jtag_debug_module arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_cpu_jtag_debug_module = cpu_jtag_debug_module_end_xfer & (~cpu_jtag_debug_module_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //cpu_jtag_debug_module_arb_share_counter arbitration counter enable, which is an e_assign
  assign cpu_jtag_debug_module_arb_counter_enable = (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & cpu_jtag_debug_module_allgrants) | (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & ~cpu_jtag_debug_module_non_bursting_master_requests);

  //cpu_jtag_debug_module_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_arb_share_counter <= 0;
      else if (cpu_jtag_debug_module_arb_counter_enable)
          cpu_jtag_debug_module_arb_share_counter <= cpu_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu_jtag_debug_module_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_slavearbiterlockenable <= 0;
      else if ((|cpu_jtag_debug_module_master_qreq_vector & end_xfer_arb_share_counter_term_cpu_jtag_debug_module) | (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & ~cpu_jtag_debug_module_non_bursting_master_requests))
          cpu_jtag_debug_module_slavearbiterlockenable <= |cpu_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu/data_master cpu/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = cpu_jtag_debug_module_slavearbiterlockenable & cpu_data_master_continuerequest;

  //cpu_jtag_debug_module_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign cpu_jtag_debug_module_slavearbiterlockenable2 = |cpu_jtag_debug_module_arb_share_counter_next_value;

  //cpu/data_master cpu/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = cpu_jtag_debug_module_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master cpu/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = cpu_jtag_debug_module_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master cpu/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = cpu_jtag_debug_module_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted cpu/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module <= cpu_instruction_master_saved_grant_cpu_jtag_debug_module ? 1 : (cpu_jtag_debug_module_arbitration_holdoff_internal | ~cpu_instruction_master_requests_cpu_jtag_debug_module) ? 0 : last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module & cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu_jtag_debug_module_any_continuerequest at least one master continues requesting, which is an e_mux
  assign cpu_jtag_debug_module_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_cpu_jtag_debug_module = cpu_data_master_requests_cpu_jtag_debug_module & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write) | cpu_instruction_master_arbiterlock);
  //cpu_jtag_debug_module_writedata mux, which is an e_mux
  assign cpu_jtag_debug_module_writedata = cpu_data_master_writedata;

  assign cpu_instruction_master_requests_cpu_jtag_debug_module = (({cpu_instruction_master_address_to_slave[15 : 11] , 11'b0} == 16'h8800) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted cpu/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module <= cpu_data_master_saved_grant_cpu_jtag_debug_module ? 1 : (cpu_jtag_debug_module_arbitration_holdoff_internal | ~cpu_data_master_requests_cpu_jtag_debug_module) ? 0 : last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module & cpu_data_master_requests_cpu_jtag_debug_module;

  assign cpu_instruction_master_qualified_request_cpu_jtag_debug_module = cpu_instruction_master_requests_cpu_jtag_debug_module & ~((cpu_instruction_master_read & ((cpu_instruction_master_latency_counter != 0))) | cpu_data_master_arbiterlock);
  //local readdatavalid cpu_instruction_master_read_data_valid_cpu_jtag_debug_module, which is an e_mux
  assign cpu_instruction_master_read_data_valid_cpu_jtag_debug_module = cpu_instruction_master_granted_cpu_jtag_debug_module & cpu_instruction_master_read & ~cpu_jtag_debug_module_waits_for_read;

  //allow new arb cycle for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_master_qreq_vector[0] = cpu_instruction_master_qualified_request_cpu_jtag_debug_module;

  //cpu/instruction_master grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_instruction_master_granted_cpu_jtag_debug_module = cpu_jtag_debug_module_grant_vector[0];

  //cpu/instruction_master saved-grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_instruction_master_saved_grant_cpu_jtag_debug_module = cpu_jtag_debug_module_arb_winner[0] && cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu/data_master assignment into master qualified-requests vector for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_master_qreq_vector[1] = cpu_data_master_qualified_request_cpu_jtag_debug_module;

  //cpu/data_master grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_data_master_granted_cpu_jtag_debug_module = cpu_jtag_debug_module_grant_vector[1];

  //cpu/data_master saved-grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_data_master_saved_grant_cpu_jtag_debug_module = cpu_jtag_debug_module_arb_winner[1] && cpu_data_master_requests_cpu_jtag_debug_module;

  //cpu/jtag_debug_module chosen-master double-vector, which is an e_assign
  assign cpu_jtag_debug_module_chosen_master_double_vector = {cpu_jtag_debug_module_master_qreq_vector, cpu_jtag_debug_module_master_qreq_vector} & ({~cpu_jtag_debug_module_master_qreq_vector, ~cpu_jtag_debug_module_master_qreq_vector} + cpu_jtag_debug_module_arb_addend);

  //stable onehot encoding of arb winner
  assign cpu_jtag_debug_module_arb_winner = (cpu_jtag_debug_module_allow_new_arb_cycle & | cpu_jtag_debug_module_grant_vector) ? cpu_jtag_debug_module_grant_vector : cpu_jtag_debug_module_saved_chosen_master_vector;

  //saved cpu_jtag_debug_module_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_saved_chosen_master_vector <= 0;
      else if (cpu_jtag_debug_module_allow_new_arb_cycle)
          cpu_jtag_debug_module_saved_chosen_master_vector <= |cpu_jtag_debug_module_grant_vector ? cpu_jtag_debug_module_grant_vector : cpu_jtag_debug_module_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign cpu_jtag_debug_module_grant_vector = {(cpu_jtag_debug_module_chosen_master_double_vector[1] | cpu_jtag_debug_module_chosen_master_double_vector[3]),
    (cpu_jtag_debug_module_chosen_master_double_vector[0] | cpu_jtag_debug_module_chosen_master_double_vector[2])};

  //cpu/jtag_debug_module chosen master rotated left, which is an e_assign
  assign cpu_jtag_debug_module_chosen_master_rot_left = (cpu_jtag_debug_module_arb_winner << 1) ? (cpu_jtag_debug_module_arb_winner << 1) : 1;

  //cpu/jtag_debug_module's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_arb_addend <= 1;
      else if (|cpu_jtag_debug_module_grant_vector)
          cpu_jtag_debug_module_arb_addend <= cpu_jtag_debug_module_end_xfer? cpu_jtag_debug_module_chosen_master_rot_left : cpu_jtag_debug_module_grant_vector;
    end


  assign cpu_jtag_debug_module_begintransfer = cpu_jtag_debug_module_begins_xfer;
  //assign lhs ~cpu_jtag_debug_module_reset of type reset_n to cpu_jtag_debug_module_reset_n, which is an e_assign
  assign cpu_jtag_debug_module_reset = ~cpu_jtag_debug_module_reset_n;

  //cpu_jtag_debug_module_reset_n assignment, which is an e_assign
  assign cpu_jtag_debug_module_reset_n = reset_n;

  //assign cpu_jtag_debug_module_resetrequest_from_sa = cpu_jtag_debug_module_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_jtag_debug_module_resetrequest_from_sa = cpu_jtag_debug_module_resetrequest;

  assign cpu_jtag_debug_module_chipselect = cpu_data_master_granted_cpu_jtag_debug_module | cpu_instruction_master_granted_cpu_jtag_debug_module;
  //cpu_jtag_debug_module_firsttransfer first transaction, which is an e_assign
  assign cpu_jtag_debug_module_firsttransfer = cpu_jtag_debug_module_begins_xfer ? cpu_jtag_debug_module_unreg_firsttransfer : cpu_jtag_debug_module_reg_firsttransfer;

  //cpu_jtag_debug_module_unreg_firsttransfer first transaction, which is an e_assign
  assign cpu_jtag_debug_module_unreg_firsttransfer = ~(cpu_jtag_debug_module_slavearbiterlockenable & cpu_jtag_debug_module_any_continuerequest);

  //cpu_jtag_debug_module_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_reg_firsttransfer <= 1'b1;
      else if (cpu_jtag_debug_module_begins_xfer)
          cpu_jtag_debug_module_reg_firsttransfer <= cpu_jtag_debug_module_unreg_firsttransfer;
    end


  //cpu_jtag_debug_module_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign cpu_jtag_debug_module_beginbursttransfer_internal = cpu_jtag_debug_module_begins_xfer;

  //cpu_jtag_debug_module_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign cpu_jtag_debug_module_arbitration_holdoff_internal = cpu_jtag_debug_module_begins_xfer & cpu_jtag_debug_module_firsttransfer;

  //cpu_jtag_debug_module_write assignment, which is an e_mux
  assign cpu_jtag_debug_module_write = cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_write;

  assign shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master = cpu_data_master_address_to_slave;
  //cpu_jtag_debug_module_address mux, which is an e_mux
  assign cpu_jtag_debug_module_address = (cpu_data_master_granted_cpu_jtag_debug_module)? (shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master >> 2) :
    (shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master >> 2);

  assign shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master = cpu_instruction_master_address_to_slave;
  //d1_cpu_jtag_debug_module_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_cpu_jtag_debug_module_end_xfer <= 1;
      else 
        d1_cpu_jtag_debug_module_end_xfer <= cpu_jtag_debug_module_end_xfer;
    end


  //cpu_jtag_debug_module_waits_for_read in a cycle, which is an e_mux
  assign cpu_jtag_debug_module_waits_for_read = cpu_jtag_debug_module_in_a_read_cycle & cpu_jtag_debug_module_begins_xfer;

  //cpu_jtag_debug_module_in_a_read_cycle assignment, which is an e_assign
  assign cpu_jtag_debug_module_in_a_read_cycle = (cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_read) | (cpu_instruction_master_granted_cpu_jtag_debug_module & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cpu_jtag_debug_module_in_a_read_cycle;

  //cpu_jtag_debug_module_waits_for_write in a cycle, which is an e_mux
  assign cpu_jtag_debug_module_waits_for_write = cpu_jtag_debug_module_in_a_write_cycle & 0;

  //cpu_jtag_debug_module_in_a_write_cycle assignment, which is an e_assign
  assign cpu_jtag_debug_module_in_a_write_cycle = cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cpu_jtag_debug_module_in_a_write_cycle;

  assign wait_for_cpu_jtag_debug_module_counter = 0;
  //cpu_jtag_debug_module_byteenable byte enable port mux, which is an e_mux
  assign cpu_jtag_debug_module_byteenable = (cpu_data_master_granted_cpu_jtag_debug_module)? cpu_data_master_byteenable :
    -1;

  //debugaccess mux, which is an e_mux
  assign cpu_jtag_debug_module_debugaccess = (cpu_data_master_granted_cpu_jtag_debug_module)? cpu_data_master_debugaccess :
    0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu/jtag_debug_module enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_cpu_jtag_debug_module + cpu_instruction_master_granted_cpu_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_cpu_jtag_debug_module + cpu_instruction_master_saved_grant_cpu_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_data_master_arbitrator (
                                    // inputs:
                                     clk,
                                     cpu_data_master_address,
                                     cpu_data_master_granted_cpu_jtag_debug_module,
                                     cpu_data_master_granted_onchip_memory_s1,
                                     cpu_data_master_granted_sw_s1,
                                     cpu_data_master_granted_vendor3_top_3_0_avalon_slave_0,
                                     cpu_data_master_qualified_request_cpu_jtag_debug_module,
                                     cpu_data_master_qualified_request_onchip_memory_s1,
                                     cpu_data_master_qualified_request_sw_s1,
                                     cpu_data_master_qualified_request_vendor3_top_3_0_avalon_slave_0,
                                     cpu_data_master_read,
                                     cpu_data_master_read_data_valid_cpu_jtag_debug_module,
                                     cpu_data_master_read_data_valid_onchip_memory_s1,
                                     cpu_data_master_read_data_valid_sw_s1,
                                     cpu_data_master_read_data_valid_vendor3_top_3_0_avalon_slave_0,
                                     cpu_data_master_requests_cpu_jtag_debug_module,
                                     cpu_data_master_requests_onchip_memory_s1,
                                     cpu_data_master_requests_sw_s1,
                                     cpu_data_master_requests_vendor3_top_3_0_avalon_slave_0,
                                     cpu_data_master_write,
                                     cpu_jtag_debug_module_readdata_from_sa,
                                     d1_cpu_jtag_debug_module_end_xfer,
                                     d1_onchip_memory_s1_end_xfer,
                                     d1_sw_s1_end_xfer,
                                     d1_vendor3_top_3_0_avalon_slave_0_end_xfer,
                                     onchip_memory_s1_readdata_from_sa,
                                     registered_cpu_data_master_read_data_valid_onchip_memory_s1,
                                     reset_n,
                                     sw_s1_irq_from_sa,
                                     sw_s1_readdata_from_sa,

                                    // outputs:
                                     cpu_data_master_address_to_slave,
                                     cpu_data_master_irq,
                                     cpu_data_master_readdata,
                                     cpu_data_master_waitrequest
                                  )
;

  output  [ 15: 0] cpu_data_master_address_to_slave;
  output  [ 31: 0] cpu_data_master_irq;
  output  [ 31: 0] cpu_data_master_readdata;
  output           cpu_data_master_waitrequest;
  input            clk;
  input   [ 15: 0] cpu_data_master_address;
  input            cpu_data_master_granted_cpu_jtag_debug_module;
  input            cpu_data_master_granted_onchip_memory_s1;
  input            cpu_data_master_granted_sw_s1;
  input            cpu_data_master_granted_vendor3_top_3_0_avalon_slave_0;
  input            cpu_data_master_qualified_request_cpu_jtag_debug_module;
  input            cpu_data_master_qualified_request_onchip_memory_s1;
  input            cpu_data_master_qualified_request_sw_s1;
  input            cpu_data_master_qualified_request_vendor3_top_3_0_avalon_slave_0;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  input            cpu_data_master_read_data_valid_onchip_memory_s1;
  input            cpu_data_master_read_data_valid_sw_s1;
  input            cpu_data_master_read_data_valid_vendor3_top_3_0_avalon_slave_0;
  input            cpu_data_master_requests_cpu_jtag_debug_module;
  input            cpu_data_master_requests_onchip_memory_s1;
  input            cpu_data_master_requests_sw_s1;
  input            cpu_data_master_requests_vendor3_top_3_0_avalon_slave_0;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  input            d1_cpu_jtag_debug_module_end_xfer;
  input            d1_onchip_memory_s1_end_xfer;
  input            d1_sw_s1_end_xfer;
  input            d1_vendor3_top_3_0_avalon_slave_0_end_xfer;
  input   [ 31: 0] onchip_memory_s1_readdata_from_sa;
  input            registered_cpu_data_master_read_data_valid_onchip_memory_s1;
  input            reset_n;
  input            sw_s1_irq_from_sa;
  input   [ 17: 0] sw_s1_readdata_from_sa;

  wire    [ 15: 0] cpu_data_master_address_to_slave;
  wire    [ 31: 0] cpu_data_master_irq;
  wire    [ 31: 0] cpu_data_master_readdata;
  wire             cpu_data_master_run;
  reg              cpu_data_master_waitrequest;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_requests_cpu_jtag_debug_module) & (cpu_data_master_granted_cpu_jtag_debug_module | ~cpu_data_master_qualified_request_cpu_jtag_debug_module) & ((~cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_onchip_memory_s1 | registered_cpu_data_master_read_data_valid_onchip_memory_s1 | ~cpu_data_master_requests_onchip_memory_s1) & (cpu_data_master_granted_onchip_memory_s1 | ~cpu_data_master_qualified_request_onchip_memory_s1) & ((~cpu_data_master_qualified_request_onchip_memory_s1 | ~cpu_data_master_read | (registered_cpu_data_master_read_data_valid_onchip_memory_s1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_onchip_memory_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_sw_s1 | ~cpu_data_master_requests_sw_s1) & ((~cpu_data_master_qualified_request_sw_s1 | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_sw_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_vendor3_top_3_0_avalon_slave_0 | ~cpu_data_master_requests_vendor3_top_3_0_avalon_slave_0) & ((~cpu_data_master_qualified_request_vendor3_top_3_0_avalon_slave_0 | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_vendor3_top_3_0_avalon_slave_0 | ~cpu_data_master_write | (1 & cpu_data_master_write)));

  //cascaded wait assignment, which is an e_assign
  assign cpu_data_master_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_data_master_address_to_slave = cpu_data_master_address[15 : 0];

  //cpu/data_master readdata mux, which is an e_mux
  assign cpu_data_master_readdata = ({32 {~cpu_data_master_requests_cpu_jtag_debug_module}} | cpu_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_onchip_memory_s1}} | onchip_memory_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_sw_s1}} | sw_s1_readdata_from_sa);

  //actual waitrequest port, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_waitrequest <= ~0;
      else 
        cpu_data_master_waitrequest <= ~((~(cpu_data_master_read | cpu_data_master_write))? 0: (cpu_data_master_run & cpu_data_master_waitrequest));
    end


  //irq assign, which is an e_assign
  assign cpu_data_master_irq = {1'b0,
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
    1'b0,
    sw_s1_irq_from_sa};


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_instruction_master_arbitrator (
                                           // inputs:
                                            clk,
                                            cpu_instruction_master_address,
                                            cpu_instruction_master_granted_cpu_jtag_debug_module,
                                            cpu_instruction_master_granted_onchip_memory_s1,
                                            cpu_instruction_master_qualified_request_cpu_jtag_debug_module,
                                            cpu_instruction_master_qualified_request_onchip_memory_s1,
                                            cpu_instruction_master_read,
                                            cpu_instruction_master_read_data_valid_cpu_jtag_debug_module,
                                            cpu_instruction_master_read_data_valid_onchip_memory_s1,
                                            cpu_instruction_master_requests_cpu_jtag_debug_module,
                                            cpu_instruction_master_requests_onchip_memory_s1,
                                            cpu_jtag_debug_module_readdata_from_sa,
                                            d1_cpu_jtag_debug_module_end_xfer,
                                            d1_onchip_memory_s1_end_xfer,
                                            onchip_memory_s1_readdata_from_sa,
                                            reset_n,

                                           // outputs:
                                            cpu_instruction_master_address_to_slave,
                                            cpu_instruction_master_latency_counter,
                                            cpu_instruction_master_readdata,
                                            cpu_instruction_master_readdatavalid,
                                            cpu_instruction_master_waitrequest
                                         )
;

  output  [ 15: 0] cpu_instruction_master_address_to_slave;
  output           cpu_instruction_master_latency_counter;
  output  [ 31: 0] cpu_instruction_master_readdata;
  output           cpu_instruction_master_readdatavalid;
  output           cpu_instruction_master_waitrequest;
  input            clk;
  input   [ 15: 0] cpu_instruction_master_address;
  input            cpu_instruction_master_granted_cpu_jtag_debug_module;
  input            cpu_instruction_master_granted_onchip_memory_s1;
  input            cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  input            cpu_instruction_master_qualified_request_onchip_memory_s1;
  input            cpu_instruction_master_read;
  input            cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  input            cpu_instruction_master_read_data_valid_onchip_memory_s1;
  input            cpu_instruction_master_requests_cpu_jtag_debug_module;
  input            cpu_instruction_master_requests_onchip_memory_s1;
  input   [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  input            d1_cpu_jtag_debug_module_end_xfer;
  input            d1_onchip_memory_s1_end_xfer;
  input   [ 31: 0] onchip_memory_s1_readdata_from_sa;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [ 15: 0] cpu_instruction_master_address_last_time;
  wire    [ 15: 0] cpu_instruction_master_address_to_slave;
  wire             cpu_instruction_master_is_granted_some_slave;
  reg              cpu_instruction_master_latency_counter;
  reg              cpu_instruction_master_read_but_no_slave_selected;
  reg              cpu_instruction_master_read_last_time;
  wire    [ 31: 0] cpu_instruction_master_readdata;
  wire             cpu_instruction_master_readdatavalid;
  wire             cpu_instruction_master_run;
  wire             cpu_instruction_master_waitrequest;
  wire             latency_load_value;
  wire             p1_cpu_instruction_master_latency_counter;
  wire             pre_flush_cpu_instruction_master_readdatavalid;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_instruction_master_qualified_request_cpu_jtag_debug_module | ~cpu_instruction_master_requests_cpu_jtag_debug_module) & (cpu_instruction_master_granted_cpu_jtag_debug_module | ~cpu_instruction_master_qualified_request_cpu_jtag_debug_module) & ((~cpu_instruction_master_qualified_request_cpu_jtag_debug_module | ~cpu_instruction_master_read | (1 & ~d1_cpu_jtag_debug_module_end_xfer & cpu_instruction_master_read))) & 1 & (cpu_instruction_master_qualified_request_onchip_memory_s1 | ~cpu_instruction_master_requests_onchip_memory_s1) & (cpu_instruction_master_granted_onchip_memory_s1 | ~cpu_instruction_master_qualified_request_onchip_memory_s1) & ((~cpu_instruction_master_qualified_request_onchip_memory_s1 | ~cpu_instruction_master_read | (1 & cpu_instruction_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign cpu_instruction_master_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_instruction_master_address_to_slave = cpu_instruction_master_address[15 : 0];

  //cpu_instruction_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_but_no_slave_selected <= 0;
      else 
        cpu_instruction_master_read_but_no_slave_selected <= cpu_instruction_master_read & cpu_instruction_master_run & ~cpu_instruction_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign cpu_instruction_master_is_granted_some_slave = cpu_instruction_master_granted_cpu_jtag_debug_module |
    cpu_instruction_master_granted_onchip_memory_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_cpu_instruction_master_readdatavalid = cpu_instruction_master_read_data_valid_onchip_memory_s1;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign cpu_instruction_master_readdatavalid = cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid |
    cpu_instruction_master_read_data_valid_cpu_jtag_debug_module |
    cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid;

  //cpu/instruction_master readdata mux, which is an e_mux
  assign cpu_instruction_master_readdata = ({32 {~(cpu_instruction_master_qualified_request_cpu_jtag_debug_module & cpu_instruction_master_read)}} | cpu_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_instruction_master_read_data_valid_onchip_memory_s1}} | onchip_memory_s1_readdata_from_sa);

  //actual waitrequest port, which is an e_assign
  assign cpu_instruction_master_waitrequest = ~cpu_instruction_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_latency_counter <= 0;
      else 
        cpu_instruction_master_latency_counter <= p1_cpu_instruction_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_cpu_instruction_master_latency_counter = ((cpu_instruction_master_run & cpu_instruction_master_read))? latency_load_value :
    (cpu_instruction_master_latency_counter)? cpu_instruction_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = {1 {cpu_instruction_master_requests_onchip_memory_s1}} & 1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_instruction_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_address_last_time <= 0;
      else 
        cpu_instruction_master_address_last_time <= cpu_instruction_master_address;
    end


  //cpu/instruction_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= cpu_instruction_master_waitrequest & (cpu_instruction_master_read);
    end


  //cpu_instruction_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_instruction_master_address != cpu_instruction_master_address_last_time))
        begin
          $write("%0d ns: cpu_instruction_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_instruction_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_last_time <= 0;
      else 
        cpu_instruction_master_read_last_time <= cpu_instruction_master_read;
    end


  //cpu_instruction_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_instruction_master_read != cpu_instruction_master_read_last_time))
        begin
          $write("%0d ns: cpu_instruction_master_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module onchip_memory_s1_arbitrator (
                                     // inputs:
                                      clk,
                                      cpu_data_master_address_to_slave,
                                      cpu_data_master_byteenable,
                                      cpu_data_master_read,
                                      cpu_data_master_waitrequest,
                                      cpu_data_master_write,
                                      cpu_data_master_writedata,
                                      cpu_instruction_master_address_to_slave,
                                      cpu_instruction_master_latency_counter,
                                      cpu_instruction_master_read,
                                      onchip_memory_s1_readdata,
                                      reset_n,

                                     // outputs:
                                      cpu_data_master_granted_onchip_memory_s1,
                                      cpu_data_master_qualified_request_onchip_memory_s1,
                                      cpu_data_master_read_data_valid_onchip_memory_s1,
                                      cpu_data_master_requests_onchip_memory_s1,
                                      cpu_instruction_master_granted_onchip_memory_s1,
                                      cpu_instruction_master_qualified_request_onchip_memory_s1,
                                      cpu_instruction_master_read_data_valid_onchip_memory_s1,
                                      cpu_instruction_master_requests_onchip_memory_s1,
                                      d1_onchip_memory_s1_end_xfer,
                                      onchip_memory_s1_address,
                                      onchip_memory_s1_byteenable,
                                      onchip_memory_s1_chipselect,
                                      onchip_memory_s1_clken,
                                      onchip_memory_s1_readdata_from_sa,
                                      onchip_memory_s1_write,
                                      onchip_memory_s1_writedata,
                                      registered_cpu_data_master_read_data_valid_onchip_memory_s1
                                   )
;

  output           cpu_data_master_granted_onchip_memory_s1;
  output           cpu_data_master_qualified_request_onchip_memory_s1;
  output           cpu_data_master_read_data_valid_onchip_memory_s1;
  output           cpu_data_master_requests_onchip_memory_s1;
  output           cpu_instruction_master_granted_onchip_memory_s1;
  output           cpu_instruction_master_qualified_request_onchip_memory_s1;
  output           cpu_instruction_master_read_data_valid_onchip_memory_s1;
  output           cpu_instruction_master_requests_onchip_memory_s1;
  output           d1_onchip_memory_s1_end_xfer;
  output  [ 12: 0] onchip_memory_s1_address;
  output  [  3: 0] onchip_memory_s1_byteenable;
  output           onchip_memory_s1_chipselect;
  output           onchip_memory_s1_clken;
  output  [ 31: 0] onchip_memory_s1_readdata_from_sa;
  output           onchip_memory_s1_write;
  output  [ 31: 0] onchip_memory_s1_writedata;
  output           registered_cpu_data_master_read_data_valid_onchip_memory_s1;
  input            clk;
  input   [ 15: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 15: 0] cpu_instruction_master_address_to_slave;
  input            cpu_instruction_master_latency_counter;
  input            cpu_instruction_master_read;
  input   [ 31: 0] onchip_memory_s1_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_onchip_memory_s1;
  wire             cpu_data_master_qualified_request_onchip_memory_s1;
  wire             cpu_data_master_read_data_valid_onchip_memory_s1;
  reg              cpu_data_master_read_data_valid_onchip_memory_s1_shift_register;
  wire             cpu_data_master_read_data_valid_onchip_memory_s1_shift_register_in;
  wire             cpu_data_master_requests_onchip_memory_s1;
  wire             cpu_data_master_saved_grant_onchip_memory_s1;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_onchip_memory_s1;
  wire             cpu_instruction_master_qualified_request_onchip_memory_s1;
  wire             cpu_instruction_master_read_data_valid_onchip_memory_s1;
  reg              cpu_instruction_master_read_data_valid_onchip_memory_s1_shift_register;
  wire             cpu_instruction_master_read_data_valid_onchip_memory_s1_shift_register_in;
  wire             cpu_instruction_master_requests_onchip_memory_s1;
  wire             cpu_instruction_master_saved_grant_onchip_memory_s1;
  reg              d1_onchip_memory_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_onchip_memory_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_onchip_memory_s1;
  reg              last_cycle_cpu_instruction_master_granted_slave_onchip_memory_s1;
  wire    [ 12: 0] onchip_memory_s1_address;
  wire             onchip_memory_s1_allgrants;
  wire             onchip_memory_s1_allow_new_arb_cycle;
  wire             onchip_memory_s1_any_bursting_master_saved_grant;
  wire             onchip_memory_s1_any_continuerequest;
  reg     [  1: 0] onchip_memory_s1_arb_addend;
  wire             onchip_memory_s1_arb_counter_enable;
  reg              onchip_memory_s1_arb_share_counter;
  wire             onchip_memory_s1_arb_share_counter_next_value;
  wire             onchip_memory_s1_arb_share_set_values;
  wire    [  1: 0] onchip_memory_s1_arb_winner;
  wire             onchip_memory_s1_arbitration_holdoff_internal;
  wire             onchip_memory_s1_beginbursttransfer_internal;
  wire             onchip_memory_s1_begins_xfer;
  wire    [  3: 0] onchip_memory_s1_byteenable;
  wire             onchip_memory_s1_chipselect;
  wire    [  3: 0] onchip_memory_s1_chosen_master_double_vector;
  wire    [  1: 0] onchip_memory_s1_chosen_master_rot_left;
  wire             onchip_memory_s1_clken;
  wire             onchip_memory_s1_end_xfer;
  wire             onchip_memory_s1_firsttransfer;
  wire    [  1: 0] onchip_memory_s1_grant_vector;
  wire             onchip_memory_s1_in_a_read_cycle;
  wire             onchip_memory_s1_in_a_write_cycle;
  wire    [  1: 0] onchip_memory_s1_master_qreq_vector;
  wire             onchip_memory_s1_non_bursting_master_requests;
  wire    [ 31: 0] onchip_memory_s1_readdata_from_sa;
  reg              onchip_memory_s1_reg_firsttransfer;
  reg     [  1: 0] onchip_memory_s1_saved_chosen_master_vector;
  reg              onchip_memory_s1_slavearbiterlockenable;
  wire             onchip_memory_s1_slavearbiterlockenable2;
  wire             onchip_memory_s1_unreg_firsttransfer;
  wire             onchip_memory_s1_waits_for_read;
  wire             onchip_memory_s1_waits_for_write;
  wire             onchip_memory_s1_write;
  wire    [ 31: 0] onchip_memory_s1_writedata;
  wire             p1_cpu_data_master_read_data_valid_onchip_memory_s1_shift_register;
  wire             p1_cpu_instruction_master_read_data_valid_onchip_memory_s1_shift_register;
  wire             registered_cpu_data_master_read_data_valid_onchip_memory_s1;
  wire    [ 15: 0] shifted_address_to_onchip_memory_s1_from_cpu_data_master;
  wire    [ 15: 0] shifted_address_to_onchip_memory_s1_from_cpu_instruction_master;
  wire             wait_for_onchip_memory_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~onchip_memory_s1_end_xfer;
    end


  assign onchip_memory_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_onchip_memory_s1 | cpu_instruction_master_qualified_request_onchip_memory_s1));
  //assign onchip_memory_s1_readdata_from_sa = onchip_memory_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign onchip_memory_s1_readdata_from_sa = onchip_memory_s1_readdata;

  assign cpu_data_master_requests_onchip_memory_s1 = ({cpu_data_master_address_to_slave[15] , 15'b0} == 16'h0) & (cpu_data_master_read | cpu_data_master_write);
  //registered rdv signal_name registered_cpu_data_master_read_data_valid_onchip_memory_s1 assignment, which is an e_assign
  assign registered_cpu_data_master_read_data_valid_onchip_memory_s1 = cpu_data_master_read_data_valid_onchip_memory_s1_shift_register_in;

  //onchip_memory_s1_arb_share_counter set values, which is an e_mux
  assign onchip_memory_s1_arb_share_set_values = 1;

  //onchip_memory_s1_non_bursting_master_requests mux, which is an e_mux
  assign onchip_memory_s1_non_bursting_master_requests = cpu_data_master_requests_onchip_memory_s1 |
    cpu_instruction_master_requests_onchip_memory_s1 |
    cpu_data_master_requests_onchip_memory_s1 |
    cpu_instruction_master_requests_onchip_memory_s1;

  //onchip_memory_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign onchip_memory_s1_any_bursting_master_saved_grant = 0;

  //onchip_memory_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign onchip_memory_s1_arb_share_counter_next_value = onchip_memory_s1_firsttransfer ? (onchip_memory_s1_arb_share_set_values - 1) : |onchip_memory_s1_arb_share_counter ? (onchip_memory_s1_arb_share_counter - 1) : 0;

  //onchip_memory_s1_allgrants all slave grants, which is an e_mux
  assign onchip_memory_s1_allgrants = (|onchip_memory_s1_grant_vector) |
    (|onchip_memory_s1_grant_vector) |
    (|onchip_memory_s1_grant_vector) |
    (|onchip_memory_s1_grant_vector);

  //onchip_memory_s1_end_xfer assignment, which is an e_assign
  assign onchip_memory_s1_end_xfer = ~(onchip_memory_s1_waits_for_read | onchip_memory_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_onchip_memory_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_onchip_memory_s1 = onchip_memory_s1_end_xfer & (~onchip_memory_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //onchip_memory_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign onchip_memory_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_onchip_memory_s1 & onchip_memory_s1_allgrants) | (end_xfer_arb_share_counter_term_onchip_memory_s1 & ~onchip_memory_s1_non_bursting_master_requests);

  //onchip_memory_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_memory_s1_arb_share_counter <= 0;
      else if (onchip_memory_s1_arb_counter_enable)
          onchip_memory_s1_arb_share_counter <= onchip_memory_s1_arb_share_counter_next_value;
    end


  //onchip_memory_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_memory_s1_slavearbiterlockenable <= 0;
      else if ((|onchip_memory_s1_master_qreq_vector & end_xfer_arb_share_counter_term_onchip_memory_s1) | (end_xfer_arb_share_counter_term_onchip_memory_s1 & ~onchip_memory_s1_non_bursting_master_requests))
          onchip_memory_s1_slavearbiterlockenable <= |onchip_memory_s1_arb_share_counter_next_value;
    end


  //cpu/data_master onchip_memory/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = onchip_memory_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //onchip_memory_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign onchip_memory_s1_slavearbiterlockenable2 = |onchip_memory_s1_arb_share_counter_next_value;

  //cpu/data_master onchip_memory/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = onchip_memory_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master onchip_memory/s1 arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = onchip_memory_s1_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master onchip_memory/s1 arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = onchip_memory_s1_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted onchip_memory/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_onchip_memory_s1 <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_onchip_memory_s1 <= cpu_instruction_master_saved_grant_onchip_memory_s1 ? 1 : (onchip_memory_s1_arbitration_holdoff_internal | ~cpu_instruction_master_requests_onchip_memory_s1) ? 0 : last_cycle_cpu_instruction_master_granted_slave_onchip_memory_s1;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_onchip_memory_s1 & cpu_instruction_master_requests_onchip_memory_s1;

  //onchip_memory_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign onchip_memory_s1_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_onchip_memory_s1 = cpu_data_master_requests_onchip_memory_s1 & ~((cpu_data_master_read & ((|cpu_data_master_read_data_valid_onchip_memory_s1_shift_register))) | ((~cpu_data_master_waitrequest) & cpu_data_master_write) | cpu_instruction_master_arbiterlock);
  //cpu_data_master_read_data_valid_onchip_memory_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_data_master_read_data_valid_onchip_memory_s1_shift_register_in = cpu_data_master_granted_onchip_memory_s1 & cpu_data_master_read & ~onchip_memory_s1_waits_for_read & ~(|cpu_data_master_read_data_valid_onchip_memory_s1_shift_register);

  //shift register p1 cpu_data_master_read_data_valid_onchip_memory_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_data_master_read_data_valid_onchip_memory_s1_shift_register = {cpu_data_master_read_data_valid_onchip_memory_s1_shift_register, cpu_data_master_read_data_valid_onchip_memory_s1_shift_register_in};

  //cpu_data_master_read_data_valid_onchip_memory_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_data_valid_onchip_memory_s1_shift_register <= 0;
      else 
        cpu_data_master_read_data_valid_onchip_memory_s1_shift_register <= p1_cpu_data_master_read_data_valid_onchip_memory_s1_shift_register;
    end


  //local readdatavalid cpu_data_master_read_data_valid_onchip_memory_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_onchip_memory_s1 = cpu_data_master_read_data_valid_onchip_memory_s1_shift_register;

  //onchip_memory_s1_writedata mux, which is an e_mux
  assign onchip_memory_s1_writedata = cpu_data_master_writedata;

  //mux onchip_memory_s1_clken, which is an e_mux
  assign onchip_memory_s1_clken = 1'b1;

  assign cpu_instruction_master_requests_onchip_memory_s1 = (({cpu_instruction_master_address_to_slave[15] , 15'b0} == 16'h0) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted onchip_memory/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_onchip_memory_s1 <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_onchip_memory_s1 <= cpu_data_master_saved_grant_onchip_memory_s1 ? 1 : (onchip_memory_s1_arbitration_holdoff_internal | ~cpu_data_master_requests_onchip_memory_s1) ? 0 : last_cycle_cpu_data_master_granted_slave_onchip_memory_s1;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_onchip_memory_s1 & cpu_data_master_requests_onchip_memory_s1;

  assign cpu_instruction_master_qualified_request_onchip_memory_s1 = cpu_instruction_master_requests_onchip_memory_s1 & ~((cpu_instruction_master_read & ((1 < cpu_instruction_master_latency_counter))) | cpu_data_master_arbiterlock);
  //cpu_instruction_master_read_data_valid_onchip_memory_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_instruction_master_read_data_valid_onchip_memory_s1_shift_register_in = cpu_instruction_master_granted_onchip_memory_s1 & cpu_instruction_master_read & ~onchip_memory_s1_waits_for_read;

  //shift register p1 cpu_instruction_master_read_data_valid_onchip_memory_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_instruction_master_read_data_valid_onchip_memory_s1_shift_register = {cpu_instruction_master_read_data_valid_onchip_memory_s1_shift_register, cpu_instruction_master_read_data_valid_onchip_memory_s1_shift_register_in};

  //cpu_instruction_master_read_data_valid_onchip_memory_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_data_valid_onchip_memory_s1_shift_register <= 0;
      else 
        cpu_instruction_master_read_data_valid_onchip_memory_s1_shift_register <= p1_cpu_instruction_master_read_data_valid_onchip_memory_s1_shift_register;
    end


  //local readdatavalid cpu_instruction_master_read_data_valid_onchip_memory_s1, which is an e_mux
  assign cpu_instruction_master_read_data_valid_onchip_memory_s1 = cpu_instruction_master_read_data_valid_onchip_memory_s1_shift_register;

  //allow new arb cycle for onchip_memory/s1, which is an e_assign
  assign onchip_memory_s1_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for onchip_memory/s1, which is an e_assign
  assign onchip_memory_s1_master_qreq_vector[0] = cpu_instruction_master_qualified_request_onchip_memory_s1;

  //cpu/instruction_master grant onchip_memory/s1, which is an e_assign
  assign cpu_instruction_master_granted_onchip_memory_s1 = onchip_memory_s1_grant_vector[0];

  //cpu/instruction_master saved-grant onchip_memory/s1, which is an e_assign
  assign cpu_instruction_master_saved_grant_onchip_memory_s1 = onchip_memory_s1_arb_winner[0] && cpu_instruction_master_requests_onchip_memory_s1;

  //cpu/data_master assignment into master qualified-requests vector for onchip_memory/s1, which is an e_assign
  assign onchip_memory_s1_master_qreq_vector[1] = cpu_data_master_qualified_request_onchip_memory_s1;

  //cpu/data_master grant onchip_memory/s1, which is an e_assign
  assign cpu_data_master_granted_onchip_memory_s1 = onchip_memory_s1_grant_vector[1];

  //cpu/data_master saved-grant onchip_memory/s1, which is an e_assign
  assign cpu_data_master_saved_grant_onchip_memory_s1 = onchip_memory_s1_arb_winner[1] && cpu_data_master_requests_onchip_memory_s1;

  //onchip_memory/s1 chosen-master double-vector, which is an e_assign
  assign onchip_memory_s1_chosen_master_double_vector = {onchip_memory_s1_master_qreq_vector, onchip_memory_s1_master_qreq_vector} & ({~onchip_memory_s1_master_qreq_vector, ~onchip_memory_s1_master_qreq_vector} + onchip_memory_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign onchip_memory_s1_arb_winner = (onchip_memory_s1_allow_new_arb_cycle & | onchip_memory_s1_grant_vector) ? onchip_memory_s1_grant_vector : onchip_memory_s1_saved_chosen_master_vector;

  //saved onchip_memory_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_memory_s1_saved_chosen_master_vector <= 0;
      else if (onchip_memory_s1_allow_new_arb_cycle)
          onchip_memory_s1_saved_chosen_master_vector <= |onchip_memory_s1_grant_vector ? onchip_memory_s1_grant_vector : onchip_memory_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign onchip_memory_s1_grant_vector = {(onchip_memory_s1_chosen_master_double_vector[1] | onchip_memory_s1_chosen_master_double_vector[3]),
    (onchip_memory_s1_chosen_master_double_vector[0] | onchip_memory_s1_chosen_master_double_vector[2])};

  //onchip_memory/s1 chosen master rotated left, which is an e_assign
  assign onchip_memory_s1_chosen_master_rot_left = (onchip_memory_s1_arb_winner << 1) ? (onchip_memory_s1_arb_winner << 1) : 1;

  //onchip_memory/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_memory_s1_arb_addend <= 1;
      else if (|onchip_memory_s1_grant_vector)
          onchip_memory_s1_arb_addend <= onchip_memory_s1_end_xfer? onchip_memory_s1_chosen_master_rot_left : onchip_memory_s1_grant_vector;
    end


  assign onchip_memory_s1_chipselect = cpu_data_master_granted_onchip_memory_s1 | cpu_instruction_master_granted_onchip_memory_s1;
  //onchip_memory_s1_firsttransfer first transaction, which is an e_assign
  assign onchip_memory_s1_firsttransfer = onchip_memory_s1_begins_xfer ? onchip_memory_s1_unreg_firsttransfer : onchip_memory_s1_reg_firsttransfer;

  //onchip_memory_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign onchip_memory_s1_unreg_firsttransfer = ~(onchip_memory_s1_slavearbiterlockenable & onchip_memory_s1_any_continuerequest);

  //onchip_memory_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_memory_s1_reg_firsttransfer <= 1'b1;
      else if (onchip_memory_s1_begins_xfer)
          onchip_memory_s1_reg_firsttransfer <= onchip_memory_s1_unreg_firsttransfer;
    end


  //onchip_memory_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign onchip_memory_s1_beginbursttransfer_internal = onchip_memory_s1_begins_xfer;

  //onchip_memory_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign onchip_memory_s1_arbitration_holdoff_internal = onchip_memory_s1_begins_xfer & onchip_memory_s1_firsttransfer;

  //onchip_memory_s1_write assignment, which is an e_mux
  assign onchip_memory_s1_write = cpu_data_master_granted_onchip_memory_s1 & cpu_data_master_write;

  assign shifted_address_to_onchip_memory_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //onchip_memory_s1_address mux, which is an e_mux
  assign onchip_memory_s1_address = (cpu_data_master_granted_onchip_memory_s1)? (shifted_address_to_onchip_memory_s1_from_cpu_data_master >> 2) :
    (shifted_address_to_onchip_memory_s1_from_cpu_instruction_master >> 2);

  assign shifted_address_to_onchip_memory_s1_from_cpu_instruction_master = cpu_instruction_master_address_to_slave;
  //d1_onchip_memory_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_onchip_memory_s1_end_xfer <= 1;
      else 
        d1_onchip_memory_s1_end_xfer <= onchip_memory_s1_end_xfer;
    end


  //onchip_memory_s1_waits_for_read in a cycle, which is an e_mux
  assign onchip_memory_s1_waits_for_read = onchip_memory_s1_in_a_read_cycle & 0;

  //onchip_memory_s1_in_a_read_cycle assignment, which is an e_assign
  assign onchip_memory_s1_in_a_read_cycle = (cpu_data_master_granted_onchip_memory_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_onchip_memory_s1 & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = onchip_memory_s1_in_a_read_cycle;

  //onchip_memory_s1_waits_for_write in a cycle, which is an e_mux
  assign onchip_memory_s1_waits_for_write = onchip_memory_s1_in_a_write_cycle & 0;

  //onchip_memory_s1_in_a_write_cycle assignment, which is an e_assign
  assign onchip_memory_s1_in_a_write_cycle = cpu_data_master_granted_onchip_memory_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = onchip_memory_s1_in_a_write_cycle;

  assign wait_for_onchip_memory_s1_counter = 0;
  //onchip_memory_s1_byteenable byte enable port mux, which is an e_mux
  assign onchip_memory_s1_byteenable = (cpu_data_master_granted_onchip_memory_s1)? cpu_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //onchip_memory/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_onchip_memory_s1 + cpu_instruction_master_granted_onchip_memory_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_onchip_memory_s1 + cpu_instruction_master_saved_grant_onchip_memory_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sw_s1_arbitrator (
                          // inputs:
                           clk,
                           cpu_data_master_address_to_slave,
                           cpu_data_master_read,
                           cpu_data_master_waitrequest,
                           cpu_data_master_write,
                           cpu_data_master_writedata,
                           reset_n,
                           sw_s1_irq,
                           sw_s1_readdata,

                          // outputs:
                           cpu_data_master_granted_sw_s1,
                           cpu_data_master_qualified_request_sw_s1,
                           cpu_data_master_read_data_valid_sw_s1,
                           cpu_data_master_requests_sw_s1,
                           d1_sw_s1_end_xfer,
                           sw_s1_address,
                           sw_s1_chipselect,
                           sw_s1_irq_from_sa,
                           sw_s1_readdata_from_sa,
                           sw_s1_reset_n,
                           sw_s1_write_n,
                           sw_s1_writedata
                        )
;

  output           cpu_data_master_granted_sw_s1;
  output           cpu_data_master_qualified_request_sw_s1;
  output           cpu_data_master_read_data_valid_sw_s1;
  output           cpu_data_master_requests_sw_s1;
  output           d1_sw_s1_end_xfer;
  output  [  1: 0] sw_s1_address;
  output           sw_s1_chipselect;
  output           sw_s1_irq_from_sa;
  output  [ 17: 0] sw_s1_readdata_from_sa;
  output           sw_s1_reset_n;
  output           sw_s1_write_n;
  output  [ 17: 0] sw_s1_writedata;
  input            clk;
  input   [ 15: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;
  input            sw_s1_irq;
  input   [ 17: 0] sw_s1_readdata;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_sw_s1;
  wire             cpu_data_master_qualified_request_sw_s1;
  wire             cpu_data_master_read_data_valid_sw_s1;
  wire             cpu_data_master_requests_sw_s1;
  wire             cpu_data_master_saved_grant_sw_s1;
  reg              d1_reasons_to_wait;
  reg              d1_sw_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sw_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 15: 0] shifted_address_to_sw_s1_from_cpu_data_master;
  wire    [  1: 0] sw_s1_address;
  wire             sw_s1_allgrants;
  wire             sw_s1_allow_new_arb_cycle;
  wire             sw_s1_any_bursting_master_saved_grant;
  wire             sw_s1_any_continuerequest;
  wire             sw_s1_arb_counter_enable;
  reg              sw_s1_arb_share_counter;
  wire             sw_s1_arb_share_counter_next_value;
  wire             sw_s1_arb_share_set_values;
  wire             sw_s1_beginbursttransfer_internal;
  wire             sw_s1_begins_xfer;
  wire             sw_s1_chipselect;
  wire             sw_s1_end_xfer;
  wire             sw_s1_firsttransfer;
  wire             sw_s1_grant_vector;
  wire             sw_s1_in_a_read_cycle;
  wire             sw_s1_in_a_write_cycle;
  wire             sw_s1_irq_from_sa;
  wire             sw_s1_master_qreq_vector;
  wire             sw_s1_non_bursting_master_requests;
  wire    [ 17: 0] sw_s1_readdata_from_sa;
  reg              sw_s1_reg_firsttransfer;
  wire             sw_s1_reset_n;
  reg              sw_s1_slavearbiterlockenable;
  wire             sw_s1_slavearbiterlockenable2;
  wire             sw_s1_unreg_firsttransfer;
  wire             sw_s1_waits_for_read;
  wire             sw_s1_waits_for_write;
  wire             sw_s1_write_n;
  wire    [ 17: 0] sw_s1_writedata;
  wire             wait_for_sw_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sw_s1_end_xfer;
    end


  assign sw_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_sw_s1));
  //assign sw_s1_readdata_from_sa = sw_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sw_s1_readdata_from_sa = sw_s1_readdata;

  assign cpu_data_master_requests_sw_s1 = ({cpu_data_master_address_to_slave[15 : 4] , 4'b0} == 16'h9000) & (cpu_data_master_read | cpu_data_master_write);
  //sw_s1_arb_share_counter set values, which is an e_mux
  assign sw_s1_arb_share_set_values = 1;

  //sw_s1_non_bursting_master_requests mux, which is an e_mux
  assign sw_s1_non_bursting_master_requests = cpu_data_master_requests_sw_s1;

  //sw_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign sw_s1_any_bursting_master_saved_grant = 0;

  //sw_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign sw_s1_arb_share_counter_next_value = sw_s1_firsttransfer ? (sw_s1_arb_share_set_values - 1) : |sw_s1_arb_share_counter ? (sw_s1_arb_share_counter - 1) : 0;

  //sw_s1_allgrants all slave grants, which is an e_mux
  assign sw_s1_allgrants = |sw_s1_grant_vector;

  //sw_s1_end_xfer assignment, which is an e_assign
  assign sw_s1_end_xfer = ~(sw_s1_waits_for_read | sw_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_sw_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sw_s1 = sw_s1_end_xfer & (~sw_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sw_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign sw_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_sw_s1 & sw_s1_allgrants) | (end_xfer_arb_share_counter_term_sw_s1 & ~sw_s1_non_bursting_master_requests);

  //sw_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sw_s1_arb_share_counter <= 0;
      else if (sw_s1_arb_counter_enable)
          sw_s1_arb_share_counter <= sw_s1_arb_share_counter_next_value;
    end


  //sw_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sw_s1_slavearbiterlockenable <= 0;
      else if ((|sw_s1_master_qreq_vector & end_xfer_arb_share_counter_term_sw_s1) | (end_xfer_arb_share_counter_term_sw_s1 & ~sw_s1_non_bursting_master_requests))
          sw_s1_slavearbiterlockenable <= |sw_s1_arb_share_counter_next_value;
    end


  //cpu/data_master sw/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = sw_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //sw_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sw_s1_slavearbiterlockenable2 = |sw_s1_arb_share_counter_next_value;

  //cpu/data_master sw/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = sw_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //sw_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sw_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_sw_s1 = cpu_data_master_requests_sw_s1 & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //sw_s1_writedata mux, which is an e_mux
  assign sw_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_sw_s1 = cpu_data_master_qualified_request_sw_s1;

  //cpu/data_master saved-grant sw/s1, which is an e_assign
  assign cpu_data_master_saved_grant_sw_s1 = cpu_data_master_requests_sw_s1;

  //allow new arb cycle for sw/s1, which is an e_assign
  assign sw_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sw_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sw_s1_master_qreq_vector = 1;

  //sw_s1_reset_n assignment, which is an e_assign
  assign sw_s1_reset_n = reset_n;

  assign sw_s1_chipselect = cpu_data_master_granted_sw_s1;
  //sw_s1_firsttransfer first transaction, which is an e_assign
  assign sw_s1_firsttransfer = sw_s1_begins_xfer ? sw_s1_unreg_firsttransfer : sw_s1_reg_firsttransfer;

  //sw_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign sw_s1_unreg_firsttransfer = ~(sw_s1_slavearbiterlockenable & sw_s1_any_continuerequest);

  //sw_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sw_s1_reg_firsttransfer <= 1'b1;
      else if (sw_s1_begins_xfer)
          sw_s1_reg_firsttransfer <= sw_s1_unreg_firsttransfer;
    end


  //sw_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sw_s1_beginbursttransfer_internal = sw_s1_begins_xfer;

  //~sw_s1_write_n assignment, which is an e_mux
  assign sw_s1_write_n = ~(cpu_data_master_granted_sw_s1 & cpu_data_master_write);

  assign shifted_address_to_sw_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //sw_s1_address mux, which is an e_mux
  assign sw_s1_address = shifted_address_to_sw_s1_from_cpu_data_master >> 2;

  //d1_sw_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sw_s1_end_xfer <= 1;
      else 
        d1_sw_s1_end_xfer <= sw_s1_end_xfer;
    end


  //sw_s1_waits_for_read in a cycle, which is an e_mux
  assign sw_s1_waits_for_read = sw_s1_in_a_read_cycle & sw_s1_begins_xfer;

  //sw_s1_in_a_read_cycle assignment, which is an e_assign
  assign sw_s1_in_a_read_cycle = cpu_data_master_granted_sw_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sw_s1_in_a_read_cycle;

  //sw_s1_waits_for_write in a cycle, which is an e_mux
  assign sw_s1_waits_for_write = sw_s1_in_a_write_cycle & 0;

  //sw_s1_in_a_write_cycle assignment, which is an e_assign
  assign sw_s1_in_a_write_cycle = cpu_data_master_granted_sw_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sw_s1_in_a_write_cycle;

  assign wait_for_sw_s1_counter = 0;
  //assign sw_s1_irq_from_sa = sw_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sw_s1_irq_from_sa = sw_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sw/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module vendor3_top_3_0_avalon_slave_0_arbitrator (
                                                   // inputs:
                                                    clk,
                                                    cpu_data_master_address_to_slave,
                                                    cpu_data_master_read,
                                                    cpu_data_master_waitrequest,
                                                    cpu_data_master_write,
                                                    cpu_data_master_writedata,
                                                    reset_n,

                                                   // outputs:
                                                    cpu_data_master_granted_vendor3_top_3_0_avalon_slave_0,
                                                    cpu_data_master_qualified_request_vendor3_top_3_0_avalon_slave_0,
                                                    cpu_data_master_read_data_valid_vendor3_top_3_0_avalon_slave_0,
                                                    cpu_data_master_requests_vendor3_top_3_0_avalon_slave_0,
                                                    d1_vendor3_top_3_0_avalon_slave_0_end_xfer,
                                                    vendor3_top_3_0_avalon_slave_0_chipselect,
                                                    vendor3_top_3_0_avalon_slave_0_reset_n,
                                                    vendor3_top_3_0_avalon_slave_0_write,
                                                    vendor3_top_3_0_avalon_slave_0_writedata
                                                 )
;

  output           cpu_data_master_granted_vendor3_top_3_0_avalon_slave_0;
  output           cpu_data_master_qualified_request_vendor3_top_3_0_avalon_slave_0;
  output           cpu_data_master_read_data_valid_vendor3_top_3_0_avalon_slave_0;
  output           cpu_data_master_requests_vendor3_top_3_0_avalon_slave_0;
  output           d1_vendor3_top_3_0_avalon_slave_0_end_xfer;
  output           vendor3_top_3_0_avalon_slave_0_chipselect;
  output           vendor3_top_3_0_avalon_slave_0_reset_n;
  output           vendor3_top_3_0_avalon_slave_0_write;
  output  [ 31: 0] vendor3_top_3_0_avalon_slave_0_writedata;
  input            clk;
  input   [ 15: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_vendor3_top_3_0_avalon_slave_0;
  wire             cpu_data_master_qualified_request_vendor3_top_3_0_avalon_slave_0;
  wire             cpu_data_master_read_data_valid_vendor3_top_3_0_avalon_slave_0;
  wire             cpu_data_master_requests_vendor3_top_3_0_avalon_slave_0;
  wire             cpu_data_master_saved_grant_vendor3_top_3_0_avalon_slave_0;
  reg              d1_reasons_to_wait;
  reg              d1_vendor3_top_3_0_avalon_slave_0_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_vendor3_top_3_0_avalon_slave_0;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 15: 0] shifted_address_to_vendor3_top_3_0_avalon_slave_0_from_cpu_data_master;
  wire             vendor3_top_3_0_avalon_slave_0_allgrants;
  wire             vendor3_top_3_0_avalon_slave_0_allow_new_arb_cycle;
  wire             vendor3_top_3_0_avalon_slave_0_any_bursting_master_saved_grant;
  wire             vendor3_top_3_0_avalon_slave_0_any_continuerequest;
  wire             vendor3_top_3_0_avalon_slave_0_arb_counter_enable;
  reg              vendor3_top_3_0_avalon_slave_0_arb_share_counter;
  wire             vendor3_top_3_0_avalon_slave_0_arb_share_counter_next_value;
  wire             vendor3_top_3_0_avalon_slave_0_arb_share_set_values;
  wire             vendor3_top_3_0_avalon_slave_0_beginbursttransfer_internal;
  wire             vendor3_top_3_0_avalon_slave_0_begins_xfer;
  wire             vendor3_top_3_0_avalon_slave_0_chipselect;
  wire             vendor3_top_3_0_avalon_slave_0_end_xfer;
  wire             vendor3_top_3_0_avalon_slave_0_firsttransfer;
  wire             vendor3_top_3_0_avalon_slave_0_grant_vector;
  wire             vendor3_top_3_0_avalon_slave_0_in_a_read_cycle;
  wire             vendor3_top_3_0_avalon_slave_0_in_a_write_cycle;
  wire             vendor3_top_3_0_avalon_slave_0_master_qreq_vector;
  wire             vendor3_top_3_0_avalon_slave_0_non_bursting_master_requests;
  reg              vendor3_top_3_0_avalon_slave_0_reg_firsttransfer;
  wire             vendor3_top_3_0_avalon_slave_0_reset_n;
  reg              vendor3_top_3_0_avalon_slave_0_slavearbiterlockenable;
  wire             vendor3_top_3_0_avalon_slave_0_slavearbiterlockenable2;
  wire             vendor3_top_3_0_avalon_slave_0_unreg_firsttransfer;
  wire             vendor3_top_3_0_avalon_slave_0_waits_for_read;
  wire             vendor3_top_3_0_avalon_slave_0_waits_for_write;
  wire             vendor3_top_3_0_avalon_slave_0_write;
  wire    [ 31: 0] vendor3_top_3_0_avalon_slave_0_writedata;
  wire             wait_for_vendor3_top_3_0_avalon_slave_0_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~vendor3_top_3_0_avalon_slave_0_end_xfer;
    end


  assign vendor3_top_3_0_avalon_slave_0_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_vendor3_top_3_0_avalon_slave_0));
  assign cpu_data_master_requests_vendor3_top_3_0_avalon_slave_0 = (({cpu_data_master_address_to_slave[15 : 2] , 2'b0} == 16'h9010) & (cpu_data_master_read | cpu_data_master_write)) & cpu_data_master_write;
  //vendor3_top_3_0_avalon_slave_0_arb_share_counter set values, which is an e_mux
  assign vendor3_top_3_0_avalon_slave_0_arb_share_set_values = 1;

  //vendor3_top_3_0_avalon_slave_0_non_bursting_master_requests mux, which is an e_mux
  assign vendor3_top_3_0_avalon_slave_0_non_bursting_master_requests = cpu_data_master_requests_vendor3_top_3_0_avalon_slave_0;

  //vendor3_top_3_0_avalon_slave_0_any_bursting_master_saved_grant mux, which is an e_mux
  assign vendor3_top_3_0_avalon_slave_0_any_bursting_master_saved_grant = 0;

  //vendor3_top_3_0_avalon_slave_0_arb_share_counter_next_value assignment, which is an e_assign
  assign vendor3_top_3_0_avalon_slave_0_arb_share_counter_next_value = vendor3_top_3_0_avalon_slave_0_firsttransfer ? (vendor3_top_3_0_avalon_slave_0_arb_share_set_values - 1) : |vendor3_top_3_0_avalon_slave_0_arb_share_counter ? (vendor3_top_3_0_avalon_slave_0_arb_share_counter - 1) : 0;

  //vendor3_top_3_0_avalon_slave_0_allgrants all slave grants, which is an e_mux
  assign vendor3_top_3_0_avalon_slave_0_allgrants = |vendor3_top_3_0_avalon_slave_0_grant_vector;

  //vendor3_top_3_0_avalon_slave_0_end_xfer assignment, which is an e_assign
  assign vendor3_top_3_0_avalon_slave_0_end_xfer = ~(vendor3_top_3_0_avalon_slave_0_waits_for_read | vendor3_top_3_0_avalon_slave_0_waits_for_write);

  //end_xfer_arb_share_counter_term_vendor3_top_3_0_avalon_slave_0 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_vendor3_top_3_0_avalon_slave_0 = vendor3_top_3_0_avalon_slave_0_end_xfer & (~vendor3_top_3_0_avalon_slave_0_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //vendor3_top_3_0_avalon_slave_0_arb_share_counter arbitration counter enable, which is an e_assign
  assign vendor3_top_3_0_avalon_slave_0_arb_counter_enable = (end_xfer_arb_share_counter_term_vendor3_top_3_0_avalon_slave_0 & vendor3_top_3_0_avalon_slave_0_allgrants) | (end_xfer_arb_share_counter_term_vendor3_top_3_0_avalon_slave_0 & ~vendor3_top_3_0_avalon_slave_0_non_bursting_master_requests);

  //vendor3_top_3_0_avalon_slave_0_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          vendor3_top_3_0_avalon_slave_0_arb_share_counter <= 0;
      else if (vendor3_top_3_0_avalon_slave_0_arb_counter_enable)
          vendor3_top_3_0_avalon_slave_0_arb_share_counter <= vendor3_top_3_0_avalon_slave_0_arb_share_counter_next_value;
    end


  //vendor3_top_3_0_avalon_slave_0_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          vendor3_top_3_0_avalon_slave_0_slavearbiterlockenable <= 0;
      else if ((|vendor3_top_3_0_avalon_slave_0_master_qreq_vector & end_xfer_arb_share_counter_term_vendor3_top_3_0_avalon_slave_0) | (end_xfer_arb_share_counter_term_vendor3_top_3_0_avalon_slave_0 & ~vendor3_top_3_0_avalon_slave_0_non_bursting_master_requests))
          vendor3_top_3_0_avalon_slave_0_slavearbiterlockenable <= |vendor3_top_3_0_avalon_slave_0_arb_share_counter_next_value;
    end


  //cpu/data_master vendor3_top_3_0/avalon_slave_0 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = vendor3_top_3_0_avalon_slave_0_slavearbiterlockenable & cpu_data_master_continuerequest;

  //vendor3_top_3_0_avalon_slave_0_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign vendor3_top_3_0_avalon_slave_0_slavearbiterlockenable2 = |vendor3_top_3_0_avalon_slave_0_arb_share_counter_next_value;

  //cpu/data_master vendor3_top_3_0/avalon_slave_0 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = vendor3_top_3_0_avalon_slave_0_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //vendor3_top_3_0_avalon_slave_0_any_continuerequest at least one master continues requesting, which is an e_assign
  assign vendor3_top_3_0_avalon_slave_0_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_vendor3_top_3_0_avalon_slave_0 = cpu_data_master_requests_vendor3_top_3_0_avalon_slave_0 & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //vendor3_top_3_0_avalon_slave_0_writedata mux, which is an e_mux
  assign vendor3_top_3_0_avalon_slave_0_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_vendor3_top_3_0_avalon_slave_0 = cpu_data_master_qualified_request_vendor3_top_3_0_avalon_slave_0;

  //cpu/data_master saved-grant vendor3_top_3_0/avalon_slave_0, which is an e_assign
  assign cpu_data_master_saved_grant_vendor3_top_3_0_avalon_slave_0 = cpu_data_master_requests_vendor3_top_3_0_avalon_slave_0;

  //allow new arb cycle for vendor3_top_3_0/avalon_slave_0, which is an e_assign
  assign vendor3_top_3_0_avalon_slave_0_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign vendor3_top_3_0_avalon_slave_0_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign vendor3_top_3_0_avalon_slave_0_master_qreq_vector = 1;

  //vendor3_top_3_0_avalon_slave_0_reset_n assignment, which is an e_assign
  assign vendor3_top_3_0_avalon_slave_0_reset_n = reset_n;

  assign vendor3_top_3_0_avalon_slave_0_chipselect = cpu_data_master_granted_vendor3_top_3_0_avalon_slave_0;
  //vendor3_top_3_0_avalon_slave_0_firsttransfer first transaction, which is an e_assign
  assign vendor3_top_3_0_avalon_slave_0_firsttransfer = vendor3_top_3_0_avalon_slave_0_begins_xfer ? vendor3_top_3_0_avalon_slave_0_unreg_firsttransfer : vendor3_top_3_0_avalon_slave_0_reg_firsttransfer;

  //vendor3_top_3_0_avalon_slave_0_unreg_firsttransfer first transaction, which is an e_assign
  assign vendor3_top_3_0_avalon_slave_0_unreg_firsttransfer = ~(vendor3_top_3_0_avalon_slave_0_slavearbiterlockenable & vendor3_top_3_0_avalon_slave_0_any_continuerequest);

  //vendor3_top_3_0_avalon_slave_0_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          vendor3_top_3_0_avalon_slave_0_reg_firsttransfer <= 1'b1;
      else if (vendor3_top_3_0_avalon_slave_0_begins_xfer)
          vendor3_top_3_0_avalon_slave_0_reg_firsttransfer <= vendor3_top_3_0_avalon_slave_0_unreg_firsttransfer;
    end


  //vendor3_top_3_0_avalon_slave_0_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign vendor3_top_3_0_avalon_slave_0_beginbursttransfer_internal = vendor3_top_3_0_avalon_slave_0_begins_xfer;

  //vendor3_top_3_0_avalon_slave_0_write assignment, which is an e_mux
  assign vendor3_top_3_0_avalon_slave_0_write = cpu_data_master_granted_vendor3_top_3_0_avalon_slave_0 & cpu_data_master_write;

  assign shifted_address_to_vendor3_top_3_0_avalon_slave_0_from_cpu_data_master = cpu_data_master_address_to_slave;
  //d1_vendor3_top_3_0_avalon_slave_0_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_vendor3_top_3_0_avalon_slave_0_end_xfer <= 1;
      else 
        d1_vendor3_top_3_0_avalon_slave_0_end_xfer <= vendor3_top_3_0_avalon_slave_0_end_xfer;
    end


  //vendor3_top_3_0_avalon_slave_0_waits_for_read in a cycle, which is an e_mux
  assign vendor3_top_3_0_avalon_slave_0_waits_for_read = vendor3_top_3_0_avalon_slave_0_in_a_read_cycle & vendor3_top_3_0_avalon_slave_0_begins_xfer;

  //vendor3_top_3_0_avalon_slave_0_in_a_read_cycle assignment, which is an e_assign
  assign vendor3_top_3_0_avalon_slave_0_in_a_read_cycle = cpu_data_master_granted_vendor3_top_3_0_avalon_slave_0 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = vendor3_top_3_0_avalon_slave_0_in_a_read_cycle;

  //vendor3_top_3_0_avalon_slave_0_waits_for_write in a cycle, which is an e_mux
  assign vendor3_top_3_0_avalon_slave_0_waits_for_write = vendor3_top_3_0_avalon_slave_0_in_a_write_cycle & 0;

  //vendor3_top_3_0_avalon_slave_0_in_a_write_cycle assignment, which is an e_assign
  assign vendor3_top_3_0_avalon_slave_0_in_a_write_cycle = cpu_data_master_granted_vendor3_top_3_0_avalon_slave_0 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = vendor3_top_3_0_avalon_slave_0_in_a_write_cycle;

  assign wait_for_vendor3_top_3_0_avalon_slave_0_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //vendor3_top_3_0/avalon_slave_0 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module KERNEL_reset_clk_0_domain_synch_module (
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

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module KERNEL (
                // 1) global signals:
                 clk_0,
                 reset_n,

                // the_sw
                 in_port_to_the_sw,

                // the_vendor3_top_3_0
                 HEX0_from_the_vendor3_top_3_0,
                 HEX1_from_the_vendor3_top_3_0,
                 HEX2_from_the_vendor3_top_3_0,
                 HEX3_from_the_vendor3_top_3_0,
                 HEX4_from_the_vendor3_top_3_0,
                 HEX5_from_the_vendor3_top_3_0,
                 HEX6_from_the_vendor3_top_3_0,
                 HEX7_from_the_vendor3_top_3_0,
                 LEDG_from_the_vendor3_top_3_0
              )
;

  output  [  6: 0] HEX0_from_the_vendor3_top_3_0;
  output  [  6: 0] HEX1_from_the_vendor3_top_3_0;
  output  [  6: 0] HEX2_from_the_vendor3_top_3_0;
  output  [  6: 0] HEX3_from_the_vendor3_top_3_0;
  output  [  6: 0] HEX4_from_the_vendor3_top_3_0;
  output  [  6: 0] HEX5_from_the_vendor3_top_3_0;
  output  [  6: 0] HEX6_from_the_vendor3_top_3_0;
  output  [  6: 0] HEX7_from_the_vendor3_top_3_0;
  output  [  7: 0] LEDG_from_the_vendor3_top_3_0;
  input            clk_0;
  input   [ 17: 0] in_port_to_the_sw;
  input            reset_n;

  wire    [  6: 0] HEX0_from_the_vendor3_top_3_0;
  wire    [  6: 0] HEX1_from_the_vendor3_top_3_0;
  wire    [  6: 0] HEX2_from_the_vendor3_top_3_0;
  wire    [  6: 0] HEX3_from_the_vendor3_top_3_0;
  wire    [  6: 0] HEX4_from_the_vendor3_top_3_0;
  wire    [  6: 0] HEX5_from_the_vendor3_top_3_0;
  wire    [  6: 0] HEX6_from_the_vendor3_top_3_0;
  wire    [  6: 0] HEX7_from_the_vendor3_top_3_0;
  wire    [  7: 0] LEDG_from_the_vendor3_top_3_0;
  wire             clk_0_reset_n;
  wire    [ 15: 0] cpu_data_master_address;
  wire    [ 15: 0] cpu_data_master_address_to_slave;
  wire    [  3: 0] cpu_data_master_byteenable;
  wire             cpu_data_master_debugaccess;
  wire             cpu_data_master_granted_cpu_jtag_debug_module;
  wire             cpu_data_master_granted_onchip_memory_s1;
  wire             cpu_data_master_granted_sw_s1;
  wire             cpu_data_master_granted_vendor3_top_3_0_avalon_slave_0;
  wire    [ 31: 0] cpu_data_master_irq;
  wire             cpu_data_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_data_master_qualified_request_onchip_memory_s1;
  wire             cpu_data_master_qualified_request_sw_s1;
  wire             cpu_data_master_qualified_request_vendor3_top_3_0_avalon_slave_0;
  wire             cpu_data_master_read;
  wire             cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_data_master_read_data_valid_onchip_memory_s1;
  wire             cpu_data_master_read_data_valid_sw_s1;
  wire             cpu_data_master_read_data_valid_vendor3_top_3_0_avalon_slave_0;
  wire    [ 31: 0] cpu_data_master_readdata;
  wire             cpu_data_master_requests_cpu_jtag_debug_module;
  wire             cpu_data_master_requests_onchip_memory_s1;
  wire             cpu_data_master_requests_sw_s1;
  wire             cpu_data_master_requests_vendor3_top_3_0_avalon_slave_0;
  wire             cpu_data_master_waitrequest;
  wire             cpu_data_master_write;
  wire    [ 31: 0] cpu_data_master_writedata;
  wire    [ 15: 0] cpu_instruction_master_address;
  wire    [ 15: 0] cpu_instruction_master_address_to_slave;
  wire             cpu_instruction_master_granted_cpu_jtag_debug_module;
  wire             cpu_instruction_master_granted_onchip_memory_s1;
  wire             cpu_instruction_master_latency_counter;
  wire             cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_instruction_master_qualified_request_onchip_memory_s1;
  wire             cpu_instruction_master_read;
  wire             cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_instruction_master_read_data_valid_onchip_memory_s1;
  wire    [ 31: 0] cpu_instruction_master_readdata;
  wire             cpu_instruction_master_readdatavalid;
  wire             cpu_instruction_master_requests_cpu_jtag_debug_module;
  wire             cpu_instruction_master_requests_onchip_memory_s1;
  wire             cpu_instruction_master_waitrequest;
  wire    [  8: 0] cpu_jtag_debug_module_address;
  wire             cpu_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_jtag_debug_module_byteenable;
  wire             cpu_jtag_debug_module_chipselect;
  wire             cpu_jtag_debug_module_debugaccess;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  wire             cpu_jtag_debug_module_reset;
  wire             cpu_jtag_debug_module_reset_n;
  wire             cpu_jtag_debug_module_resetrequest;
  wire             cpu_jtag_debug_module_resetrequest_from_sa;
  wire             cpu_jtag_debug_module_write;
  wire    [ 31: 0] cpu_jtag_debug_module_writedata;
  wire             d1_cpu_jtag_debug_module_end_xfer;
  wire             d1_onchip_memory_s1_end_xfer;
  wire             d1_sw_s1_end_xfer;
  wire             d1_vendor3_top_3_0_avalon_slave_0_end_xfer;
  wire    [ 12: 0] onchip_memory_s1_address;
  wire    [  3: 0] onchip_memory_s1_byteenable;
  wire             onchip_memory_s1_chipselect;
  wire             onchip_memory_s1_clken;
  wire    [ 31: 0] onchip_memory_s1_readdata;
  wire    [ 31: 0] onchip_memory_s1_readdata_from_sa;
  wire             onchip_memory_s1_write;
  wire    [ 31: 0] onchip_memory_s1_writedata;
  wire             registered_cpu_data_master_read_data_valid_onchip_memory_s1;
  wire             reset_n_sources;
  wire    [  1: 0] sw_s1_address;
  wire             sw_s1_chipselect;
  wire             sw_s1_irq;
  wire             sw_s1_irq_from_sa;
  wire    [ 17: 0] sw_s1_readdata;
  wire    [ 17: 0] sw_s1_readdata_from_sa;
  wire             sw_s1_reset_n;
  wire             sw_s1_write_n;
  wire    [ 17: 0] sw_s1_writedata;
  wire             vendor3_top_3_0_avalon_slave_0_chipselect;
  wire             vendor3_top_3_0_avalon_slave_0_reset_n;
  wire             vendor3_top_3_0_avalon_slave_0_write;
  wire    [ 31: 0] vendor3_top_3_0_avalon_slave_0_writedata;
  cpu_jtag_debug_module_arbitrator the_cpu_jtag_debug_module
    (
      .clk                                                            (clk_0),
      .cpu_data_master_address_to_slave                               (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                     (cpu_data_master_byteenable),
      .cpu_data_master_debugaccess                                    (cpu_data_master_debugaccess),
      .cpu_data_master_granted_cpu_jtag_debug_module                  (cpu_data_master_granted_cpu_jtag_debug_module),
      .cpu_data_master_qualified_request_cpu_jtag_debug_module        (cpu_data_master_qualified_request_cpu_jtag_debug_module),
      .cpu_data_master_read                                           (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cpu_jtag_debug_module          (cpu_data_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_data_master_requests_cpu_jtag_debug_module                 (cpu_data_master_requests_cpu_jtag_debug_module),
      .cpu_data_master_waitrequest                                    (cpu_data_master_waitrequest),
      .cpu_data_master_write                                          (cpu_data_master_write),
      .cpu_data_master_writedata                                      (cpu_data_master_writedata),
      .cpu_instruction_master_address_to_slave                        (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_cpu_jtag_debug_module           (cpu_instruction_master_granted_cpu_jtag_debug_module),
      .cpu_instruction_master_latency_counter                         (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_cpu_jtag_debug_module (cpu_instruction_master_qualified_request_cpu_jtag_debug_module),
      .cpu_instruction_master_read                                    (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_cpu_jtag_debug_module   (cpu_instruction_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_instruction_master_requests_cpu_jtag_debug_module          (cpu_instruction_master_requests_cpu_jtag_debug_module),
      .cpu_jtag_debug_module_address                                  (cpu_jtag_debug_module_address),
      .cpu_jtag_debug_module_begintransfer                            (cpu_jtag_debug_module_begintransfer),
      .cpu_jtag_debug_module_byteenable                               (cpu_jtag_debug_module_byteenable),
      .cpu_jtag_debug_module_chipselect                               (cpu_jtag_debug_module_chipselect),
      .cpu_jtag_debug_module_debugaccess                              (cpu_jtag_debug_module_debugaccess),
      .cpu_jtag_debug_module_readdata                                 (cpu_jtag_debug_module_readdata),
      .cpu_jtag_debug_module_readdata_from_sa                         (cpu_jtag_debug_module_readdata_from_sa),
      .cpu_jtag_debug_module_reset                                    (cpu_jtag_debug_module_reset),
      .cpu_jtag_debug_module_reset_n                                  (cpu_jtag_debug_module_reset_n),
      .cpu_jtag_debug_module_resetrequest                             (cpu_jtag_debug_module_resetrequest),
      .cpu_jtag_debug_module_resetrequest_from_sa                     (cpu_jtag_debug_module_resetrequest_from_sa),
      .cpu_jtag_debug_module_write                                    (cpu_jtag_debug_module_write),
      .cpu_jtag_debug_module_writedata                                (cpu_jtag_debug_module_writedata),
      .d1_cpu_jtag_debug_module_end_xfer                              (d1_cpu_jtag_debug_module_end_xfer),
      .reset_n                                                        (clk_0_reset_n)
    );

  cpu_data_master_arbitrator the_cpu_data_master
    (
      .clk                                                              (clk_0),
      .cpu_data_master_address                                          (cpu_data_master_address),
      .cpu_data_master_address_to_slave                                 (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_cpu_jtag_debug_module                    (cpu_data_master_granted_cpu_jtag_debug_module),
      .cpu_data_master_granted_onchip_memory_s1                         (cpu_data_master_granted_onchip_memory_s1),
      .cpu_data_master_granted_sw_s1                                    (cpu_data_master_granted_sw_s1),
      .cpu_data_master_granted_vendor3_top_3_0_avalon_slave_0           (cpu_data_master_granted_vendor3_top_3_0_avalon_slave_0),
      .cpu_data_master_irq                                              (cpu_data_master_irq),
      .cpu_data_master_qualified_request_cpu_jtag_debug_module          (cpu_data_master_qualified_request_cpu_jtag_debug_module),
      .cpu_data_master_qualified_request_onchip_memory_s1               (cpu_data_master_qualified_request_onchip_memory_s1),
      .cpu_data_master_qualified_request_sw_s1                          (cpu_data_master_qualified_request_sw_s1),
      .cpu_data_master_qualified_request_vendor3_top_3_0_avalon_slave_0 (cpu_data_master_qualified_request_vendor3_top_3_0_avalon_slave_0),
      .cpu_data_master_read                                             (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cpu_jtag_debug_module            (cpu_data_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_data_master_read_data_valid_onchip_memory_s1                 (cpu_data_master_read_data_valid_onchip_memory_s1),
      .cpu_data_master_read_data_valid_sw_s1                            (cpu_data_master_read_data_valid_sw_s1),
      .cpu_data_master_read_data_valid_vendor3_top_3_0_avalon_slave_0   (cpu_data_master_read_data_valid_vendor3_top_3_0_avalon_slave_0),
      .cpu_data_master_readdata                                         (cpu_data_master_readdata),
      .cpu_data_master_requests_cpu_jtag_debug_module                   (cpu_data_master_requests_cpu_jtag_debug_module),
      .cpu_data_master_requests_onchip_memory_s1                        (cpu_data_master_requests_onchip_memory_s1),
      .cpu_data_master_requests_sw_s1                                   (cpu_data_master_requests_sw_s1),
      .cpu_data_master_requests_vendor3_top_3_0_avalon_slave_0          (cpu_data_master_requests_vendor3_top_3_0_avalon_slave_0),
      .cpu_data_master_waitrequest                                      (cpu_data_master_waitrequest),
      .cpu_data_master_write                                            (cpu_data_master_write),
      .cpu_jtag_debug_module_readdata_from_sa                           (cpu_jtag_debug_module_readdata_from_sa),
      .d1_cpu_jtag_debug_module_end_xfer                                (d1_cpu_jtag_debug_module_end_xfer),
      .d1_onchip_memory_s1_end_xfer                                     (d1_onchip_memory_s1_end_xfer),
      .d1_sw_s1_end_xfer                                                (d1_sw_s1_end_xfer),
      .d1_vendor3_top_3_0_avalon_slave_0_end_xfer                       (d1_vendor3_top_3_0_avalon_slave_0_end_xfer),
      .onchip_memory_s1_readdata_from_sa                                (onchip_memory_s1_readdata_from_sa),
      .registered_cpu_data_master_read_data_valid_onchip_memory_s1      (registered_cpu_data_master_read_data_valid_onchip_memory_s1),
      .reset_n                                                          (clk_0_reset_n),
      .sw_s1_irq_from_sa                                                (sw_s1_irq_from_sa),
      .sw_s1_readdata_from_sa                                           (sw_s1_readdata_from_sa)
    );

  cpu_instruction_master_arbitrator the_cpu_instruction_master
    (
      .clk                                                            (clk_0),
      .cpu_instruction_master_address                                 (cpu_instruction_master_address),
      .cpu_instruction_master_address_to_slave                        (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_cpu_jtag_debug_module           (cpu_instruction_master_granted_cpu_jtag_debug_module),
      .cpu_instruction_master_granted_onchip_memory_s1                (cpu_instruction_master_granted_onchip_memory_s1),
      .cpu_instruction_master_latency_counter                         (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_cpu_jtag_debug_module (cpu_instruction_master_qualified_request_cpu_jtag_debug_module),
      .cpu_instruction_master_qualified_request_onchip_memory_s1      (cpu_instruction_master_qualified_request_onchip_memory_s1),
      .cpu_instruction_master_read                                    (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_cpu_jtag_debug_module   (cpu_instruction_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_instruction_master_read_data_valid_onchip_memory_s1        (cpu_instruction_master_read_data_valid_onchip_memory_s1),
      .cpu_instruction_master_readdata                                (cpu_instruction_master_readdata),
      .cpu_instruction_master_readdatavalid                           (cpu_instruction_master_readdatavalid),
      .cpu_instruction_master_requests_cpu_jtag_debug_module          (cpu_instruction_master_requests_cpu_jtag_debug_module),
      .cpu_instruction_master_requests_onchip_memory_s1               (cpu_instruction_master_requests_onchip_memory_s1),
      .cpu_instruction_master_waitrequest                             (cpu_instruction_master_waitrequest),
      .cpu_jtag_debug_module_readdata_from_sa                         (cpu_jtag_debug_module_readdata_from_sa),
      .d1_cpu_jtag_debug_module_end_xfer                              (d1_cpu_jtag_debug_module_end_xfer),
      .d1_onchip_memory_s1_end_xfer                                   (d1_onchip_memory_s1_end_xfer),
      .onchip_memory_s1_readdata_from_sa                              (onchip_memory_s1_readdata_from_sa),
      .reset_n                                                        (clk_0_reset_n)
    );

  cpu the_cpu
    (
      .clk                                   (clk_0),
      .d_address                             (cpu_data_master_address),
      .d_byteenable                          (cpu_data_master_byteenable),
      .d_irq                                 (cpu_data_master_irq),
      .d_read                                (cpu_data_master_read),
      .d_readdata                            (cpu_data_master_readdata),
      .d_waitrequest                         (cpu_data_master_waitrequest),
      .d_write                               (cpu_data_master_write),
      .d_writedata                           (cpu_data_master_writedata),
      .i_address                             (cpu_instruction_master_address),
      .i_read                                (cpu_instruction_master_read),
      .i_readdata                            (cpu_instruction_master_readdata),
      .i_readdatavalid                       (cpu_instruction_master_readdatavalid),
      .i_waitrequest                         (cpu_instruction_master_waitrequest),
      .jtag_debug_module_address             (cpu_jtag_debug_module_address),
      .jtag_debug_module_begintransfer       (cpu_jtag_debug_module_begintransfer),
      .jtag_debug_module_byteenable          (cpu_jtag_debug_module_byteenable),
      .jtag_debug_module_clk                 (clk_0),
      .jtag_debug_module_debugaccess         (cpu_jtag_debug_module_debugaccess),
      .jtag_debug_module_debugaccess_to_roms (cpu_data_master_debugaccess),
      .jtag_debug_module_readdata            (cpu_jtag_debug_module_readdata),
      .jtag_debug_module_reset               (cpu_jtag_debug_module_reset),
      .jtag_debug_module_resetrequest        (cpu_jtag_debug_module_resetrequest),
      .jtag_debug_module_select              (cpu_jtag_debug_module_chipselect),
      .jtag_debug_module_write               (cpu_jtag_debug_module_write),
      .jtag_debug_module_writedata           (cpu_jtag_debug_module_writedata),
      .reset_n                               (cpu_jtag_debug_module_reset_n)
    );

  onchip_memory_s1_arbitrator the_onchip_memory_s1
    (
      .clk                                                         (clk_0),
      .cpu_data_master_address_to_slave                            (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                  (cpu_data_master_byteenable),
      .cpu_data_master_granted_onchip_memory_s1                    (cpu_data_master_granted_onchip_memory_s1),
      .cpu_data_master_qualified_request_onchip_memory_s1          (cpu_data_master_qualified_request_onchip_memory_s1),
      .cpu_data_master_read                                        (cpu_data_master_read),
      .cpu_data_master_read_data_valid_onchip_memory_s1            (cpu_data_master_read_data_valid_onchip_memory_s1),
      .cpu_data_master_requests_onchip_memory_s1                   (cpu_data_master_requests_onchip_memory_s1),
      .cpu_data_master_waitrequest                                 (cpu_data_master_waitrequest),
      .cpu_data_master_write                                       (cpu_data_master_write),
      .cpu_data_master_writedata                                   (cpu_data_master_writedata),
      .cpu_instruction_master_address_to_slave                     (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_onchip_memory_s1             (cpu_instruction_master_granted_onchip_memory_s1),
      .cpu_instruction_master_latency_counter                      (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_onchip_memory_s1   (cpu_instruction_master_qualified_request_onchip_memory_s1),
      .cpu_instruction_master_read                                 (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_onchip_memory_s1     (cpu_instruction_master_read_data_valid_onchip_memory_s1),
      .cpu_instruction_master_requests_onchip_memory_s1            (cpu_instruction_master_requests_onchip_memory_s1),
      .d1_onchip_memory_s1_end_xfer                                (d1_onchip_memory_s1_end_xfer),
      .onchip_memory_s1_address                                    (onchip_memory_s1_address),
      .onchip_memory_s1_byteenable                                 (onchip_memory_s1_byteenable),
      .onchip_memory_s1_chipselect                                 (onchip_memory_s1_chipselect),
      .onchip_memory_s1_clken                                      (onchip_memory_s1_clken),
      .onchip_memory_s1_readdata                                   (onchip_memory_s1_readdata),
      .onchip_memory_s1_readdata_from_sa                           (onchip_memory_s1_readdata_from_sa),
      .onchip_memory_s1_write                                      (onchip_memory_s1_write),
      .onchip_memory_s1_writedata                                  (onchip_memory_s1_writedata),
      .registered_cpu_data_master_read_data_valid_onchip_memory_s1 (registered_cpu_data_master_read_data_valid_onchip_memory_s1),
      .reset_n                                                     (clk_0_reset_n)
    );

  onchip_memory the_onchip_memory
    (
      .address    (onchip_memory_s1_address),
      .byteenable (onchip_memory_s1_byteenable),
      .chipselect (onchip_memory_s1_chipselect),
      .clk        (clk_0),
      .clken      (onchip_memory_s1_clken),
      .readdata   (onchip_memory_s1_readdata),
      .write      (onchip_memory_s1_write),
      .writedata  (onchip_memory_s1_writedata)
    );

  sw_s1_arbitrator the_sw_s1
    (
      .clk                                     (clk_0),
      .cpu_data_master_address_to_slave        (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_sw_s1           (cpu_data_master_granted_sw_s1),
      .cpu_data_master_qualified_request_sw_s1 (cpu_data_master_qualified_request_sw_s1),
      .cpu_data_master_read                    (cpu_data_master_read),
      .cpu_data_master_read_data_valid_sw_s1   (cpu_data_master_read_data_valid_sw_s1),
      .cpu_data_master_requests_sw_s1          (cpu_data_master_requests_sw_s1),
      .cpu_data_master_waitrequest             (cpu_data_master_waitrequest),
      .cpu_data_master_write                   (cpu_data_master_write),
      .cpu_data_master_writedata               (cpu_data_master_writedata),
      .d1_sw_s1_end_xfer                       (d1_sw_s1_end_xfer),
      .reset_n                                 (clk_0_reset_n),
      .sw_s1_address                           (sw_s1_address),
      .sw_s1_chipselect                        (sw_s1_chipselect),
      .sw_s1_irq                               (sw_s1_irq),
      .sw_s1_irq_from_sa                       (sw_s1_irq_from_sa),
      .sw_s1_readdata                          (sw_s1_readdata),
      .sw_s1_readdata_from_sa                  (sw_s1_readdata_from_sa),
      .sw_s1_reset_n                           (sw_s1_reset_n),
      .sw_s1_write_n                           (sw_s1_write_n),
      .sw_s1_writedata                         (sw_s1_writedata)
    );

  sw the_sw
    (
      .address    (sw_s1_address),
      .chipselect (sw_s1_chipselect),
      .clk        (clk_0),
      .in_port    (in_port_to_the_sw),
      .irq        (sw_s1_irq),
      .readdata   (sw_s1_readdata),
      .reset_n    (sw_s1_reset_n),
      .write_n    (sw_s1_write_n),
      .writedata  (sw_s1_writedata)
    );

  vendor3_top_3_0_avalon_slave_0_arbitrator the_vendor3_top_3_0_avalon_slave_0
    (
      .clk                                                              (clk_0),
      .cpu_data_master_address_to_slave                                 (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_vendor3_top_3_0_avalon_slave_0           (cpu_data_master_granted_vendor3_top_3_0_avalon_slave_0),
      .cpu_data_master_qualified_request_vendor3_top_3_0_avalon_slave_0 (cpu_data_master_qualified_request_vendor3_top_3_0_avalon_slave_0),
      .cpu_data_master_read                                             (cpu_data_master_read),
      .cpu_data_master_read_data_valid_vendor3_top_3_0_avalon_slave_0   (cpu_data_master_read_data_valid_vendor3_top_3_0_avalon_slave_0),
      .cpu_data_master_requests_vendor3_top_3_0_avalon_slave_0          (cpu_data_master_requests_vendor3_top_3_0_avalon_slave_0),
      .cpu_data_master_waitrequest                                      (cpu_data_master_waitrequest),
      .cpu_data_master_write                                            (cpu_data_master_write),
      .cpu_data_master_writedata                                        (cpu_data_master_writedata),
      .d1_vendor3_top_3_0_avalon_slave_0_end_xfer                       (d1_vendor3_top_3_0_avalon_slave_0_end_xfer),
      .reset_n                                                          (clk_0_reset_n),
      .vendor3_top_3_0_avalon_slave_0_chipselect                        (vendor3_top_3_0_avalon_slave_0_chipselect),
      .vendor3_top_3_0_avalon_slave_0_reset_n                           (vendor3_top_3_0_avalon_slave_0_reset_n),
      .vendor3_top_3_0_avalon_slave_0_write                             (vendor3_top_3_0_avalon_slave_0_write),
      .vendor3_top_3_0_avalon_slave_0_writedata                         (vendor3_top_3_0_avalon_slave_0_writedata)
    );

  vendor3_top_3_0 the_vendor3_top_3_0
    (
      .HEX0       (HEX0_from_the_vendor3_top_3_0),
      .HEX1       (HEX1_from_the_vendor3_top_3_0),
      .HEX2       (HEX2_from_the_vendor3_top_3_0),
      .HEX3       (HEX3_from_the_vendor3_top_3_0),
      .HEX4       (HEX4_from_the_vendor3_top_3_0),
      .HEX5       (HEX5_from_the_vendor3_top_3_0),
      .HEX6       (HEX6_from_the_vendor3_top_3_0),
      .HEX7       (HEX7_from_the_vendor3_top_3_0),
      .LEDG       (LEDG_from_the_vendor3_top_3_0),
      .chipselect (vendor3_top_3_0_avalon_slave_0_chipselect),
      .clk        (clk_0),
      .reset_n    (vendor3_top_3_0_avalon_slave_0_reset_n),
      .write      (vendor3_top_3_0_avalon_slave_0_write),
      .writedata  (vendor3_top_3_0_avalon_slave_0_writedata)
    );

  //reset is asserted asynchronously and deasserted synchronously
  KERNEL_reset_clk_0_domain_synch_module KERNEL_reset_clk_0_domain_synch
    (
      .clk      (clk_0),
      .data_in  (1'b1),
      .data_out (clk_0_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset sources mux, which is an e_mux
  assign reset_n_sources = ~(~reset_n |
    0 |
    cpu_jtag_debug_module_resetrequest_from_sa |
    cpu_jtag_debug_module_resetrequest_from_sa);


endmodule


//synthesis translate_off



// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE

// AND HERE WILL BE PRESERVED </ALTERA_NOTE>


// If user logic components use Altsync_Ram with convert_hex2ver.dll,
// set USE_convert_hex2ver in the user comments section above

// `ifdef USE_convert_hex2ver
// `else
// `define NO_PLI 1
// `endif

`include "f:/quartus/quartus/eda/sim_lib/altera_mf.v"
`include "f:/quartus/quartus/eda/sim_lib/220model.v"
`include "f:/quartus/quartus/eda/sim_lib/sgate.v"
`include "vendor3_top.v"
`include "vendor3.v"
`include "uppulsecheck.v"
`include "leddisplay.v"
`include "vendor3_top_3_0.v"
`include "onchip_memory.v"
`include "cpu_test_bench.v"
`include "cpu_mult_cell.v"
`include "cpu_oci_test_bench.v"
`include "cpu_jtag_debug_module_tck.v"
`include "cpu_jtag_debug_module_sysclk.v"
`include "cpu_jtag_debug_module_wrapper.v"
`include "cpu.v"
`include "sw.v"

`timescale 1ns / 1ps

module test_bench 
;


  wire    [  6: 0] HEX0_from_the_vendor3_top_3_0;
  wire    [  6: 0] HEX1_from_the_vendor3_top_3_0;
  wire    [  6: 0] HEX2_from_the_vendor3_top_3_0;
  wire    [  6: 0] HEX3_from_the_vendor3_top_3_0;
  wire    [  6: 0] HEX4_from_the_vendor3_top_3_0;
  wire    [  6: 0] HEX5_from_the_vendor3_top_3_0;
  wire    [  6: 0] HEX6_from_the_vendor3_top_3_0;
  wire    [  6: 0] HEX7_from_the_vendor3_top_3_0;
  wire    [  7: 0] LEDG_from_the_vendor3_top_3_0;
  wire             clk;
  reg              clk_0;
  wire    [ 17: 0] in_port_to_the_sw;
  reg              reset_n;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  KERNEL DUT
    (
      .HEX0_from_the_vendor3_top_3_0 (HEX0_from_the_vendor3_top_3_0),
      .HEX1_from_the_vendor3_top_3_0 (HEX1_from_the_vendor3_top_3_0),
      .HEX2_from_the_vendor3_top_3_0 (HEX2_from_the_vendor3_top_3_0),
      .HEX3_from_the_vendor3_top_3_0 (HEX3_from_the_vendor3_top_3_0),
      .HEX4_from_the_vendor3_top_3_0 (HEX4_from_the_vendor3_top_3_0),
      .HEX5_from_the_vendor3_top_3_0 (HEX5_from_the_vendor3_top_3_0),
      .HEX6_from_the_vendor3_top_3_0 (HEX6_from_the_vendor3_top_3_0),
      .HEX7_from_the_vendor3_top_3_0 (HEX7_from_the_vendor3_top_3_0),
      .LEDG_from_the_vendor3_top_3_0 (LEDG_from_the_vendor3_top_3_0),
      .clk_0                         (clk_0),
      .in_port_to_the_sw             (in_port_to_the_sw),
      .reset_n                       (reset_n)
    );

  initial
    clk_0 = 1'b0;
  always
    #10 clk_0 <= ~clk_0;
  
  initial 
    begin
      reset_n <= 0;
      #200 reset_n <= 1;
    end

endmodule


//synthesis translate_on