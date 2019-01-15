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
                                     cpu_data_master_granted_inp_buy_finish_s1,
                                     cpu_data_master_granted_inp_cancel_buy_s1,
                                     cpu_data_master_granted_inp_confirm_buy_s1,
                                     cpu_data_master_granted_inp_the_goods_s1,
                                     cpu_data_master_granted_inp_the_money_s1,
                                     cpu_data_master_granted_onchip_memory_s1,
                                     cpu_data_master_granted_out_buy_success_s1,
                                     cpu_data_master_granted_out_enough_money_s1,
                                     cpu_data_master_granted_out_hex0_s1,
                                     cpu_data_master_granted_out_hex1_s1,
                                     cpu_data_master_granted_out_hex2_s1,
                                     cpu_data_master_granted_out_hex4_s1,
                                     cpu_data_master_granted_out_hex5_s1,
                                     cpu_data_master_granted_out_hex6_s1,
                                     cpu_data_master_granted_out_hex7_s1,
                                     cpu_data_master_qualified_request_cpu_jtag_debug_module,
                                     cpu_data_master_qualified_request_inp_buy_finish_s1,
                                     cpu_data_master_qualified_request_inp_cancel_buy_s1,
                                     cpu_data_master_qualified_request_inp_confirm_buy_s1,
                                     cpu_data_master_qualified_request_inp_the_goods_s1,
                                     cpu_data_master_qualified_request_inp_the_money_s1,
                                     cpu_data_master_qualified_request_onchip_memory_s1,
                                     cpu_data_master_qualified_request_out_buy_success_s1,
                                     cpu_data_master_qualified_request_out_enough_money_s1,
                                     cpu_data_master_qualified_request_out_hex0_s1,
                                     cpu_data_master_qualified_request_out_hex1_s1,
                                     cpu_data_master_qualified_request_out_hex2_s1,
                                     cpu_data_master_qualified_request_out_hex4_s1,
                                     cpu_data_master_qualified_request_out_hex5_s1,
                                     cpu_data_master_qualified_request_out_hex6_s1,
                                     cpu_data_master_qualified_request_out_hex7_s1,
                                     cpu_data_master_read,
                                     cpu_data_master_read_data_valid_cpu_jtag_debug_module,
                                     cpu_data_master_read_data_valid_inp_buy_finish_s1,
                                     cpu_data_master_read_data_valid_inp_cancel_buy_s1,
                                     cpu_data_master_read_data_valid_inp_confirm_buy_s1,
                                     cpu_data_master_read_data_valid_inp_the_goods_s1,
                                     cpu_data_master_read_data_valid_inp_the_money_s1,
                                     cpu_data_master_read_data_valid_onchip_memory_s1,
                                     cpu_data_master_read_data_valid_out_buy_success_s1,
                                     cpu_data_master_read_data_valid_out_enough_money_s1,
                                     cpu_data_master_read_data_valid_out_hex0_s1,
                                     cpu_data_master_read_data_valid_out_hex1_s1,
                                     cpu_data_master_read_data_valid_out_hex2_s1,
                                     cpu_data_master_read_data_valid_out_hex4_s1,
                                     cpu_data_master_read_data_valid_out_hex5_s1,
                                     cpu_data_master_read_data_valid_out_hex6_s1,
                                     cpu_data_master_read_data_valid_out_hex7_s1,
                                     cpu_data_master_requests_cpu_jtag_debug_module,
                                     cpu_data_master_requests_inp_buy_finish_s1,
                                     cpu_data_master_requests_inp_cancel_buy_s1,
                                     cpu_data_master_requests_inp_confirm_buy_s1,
                                     cpu_data_master_requests_inp_the_goods_s1,
                                     cpu_data_master_requests_inp_the_money_s1,
                                     cpu_data_master_requests_onchip_memory_s1,
                                     cpu_data_master_requests_out_buy_success_s1,
                                     cpu_data_master_requests_out_enough_money_s1,
                                     cpu_data_master_requests_out_hex0_s1,
                                     cpu_data_master_requests_out_hex1_s1,
                                     cpu_data_master_requests_out_hex2_s1,
                                     cpu_data_master_requests_out_hex4_s1,
                                     cpu_data_master_requests_out_hex5_s1,
                                     cpu_data_master_requests_out_hex6_s1,
                                     cpu_data_master_requests_out_hex7_s1,
                                     cpu_data_master_write,
                                     cpu_jtag_debug_module_readdata_from_sa,
                                     d1_cpu_jtag_debug_module_end_xfer,
                                     d1_inp_buy_finish_s1_end_xfer,
                                     d1_inp_cancel_buy_s1_end_xfer,
                                     d1_inp_confirm_buy_s1_end_xfer,
                                     d1_inp_the_goods_s1_end_xfer,
                                     d1_inp_the_money_s1_end_xfer,
                                     d1_onchip_memory_s1_end_xfer,
                                     d1_out_buy_success_s1_end_xfer,
                                     d1_out_enough_money_s1_end_xfer,
                                     d1_out_hex0_s1_end_xfer,
                                     d1_out_hex1_s1_end_xfer,
                                     d1_out_hex2_s1_end_xfer,
                                     d1_out_hex4_s1_end_xfer,
                                     d1_out_hex5_s1_end_xfer,
                                     d1_out_hex6_s1_end_xfer,
                                     d1_out_hex7_s1_end_xfer,
                                     inp_buy_finish_s1_irq_from_sa,
                                     inp_buy_finish_s1_readdata_from_sa,
                                     inp_cancel_buy_s1_irq_from_sa,
                                     inp_cancel_buy_s1_readdata_from_sa,
                                     inp_confirm_buy_s1_irq_from_sa,
                                     inp_confirm_buy_s1_readdata_from_sa,
                                     inp_the_goods_s1_irq_from_sa,
                                     inp_the_goods_s1_readdata_from_sa,
                                     inp_the_money_s1_irq_from_sa,
                                     inp_the_money_s1_readdata_from_sa,
                                     onchip_memory_s1_readdata_from_sa,
                                     out_buy_success_s1_readdata_from_sa,
                                     out_enough_money_s1_readdata_from_sa,
                                     out_hex0_s1_readdata_from_sa,
                                     out_hex1_s1_readdata_from_sa,
                                     out_hex2_s1_readdata_from_sa,
                                     out_hex4_s1_readdata_from_sa,
                                     out_hex5_s1_readdata_from_sa,
                                     out_hex6_s1_readdata_from_sa,
                                     out_hex7_s1_readdata_from_sa,
                                     registered_cpu_data_master_read_data_valid_onchip_memory_s1,
                                     reset_n,

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
  input            cpu_data_master_granted_inp_buy_finish_s1;
  input            cpu_data_master_granted_inp_cancel_buy_s1;
  input            cpu_data_master_granted_inp_confirm_buy_s1;
  input            cpu_data_master_granted_inp_the_goods_s1;
  input            cpu_data_master_granted_inp_the_money_s1;
  input            cpu_data_master_granted_onchip_memory_s1;
  input            cpu_data_master_granted_out_buy_success_s1;
  input            cpu_data_master_granted_out_enough_money_s1;
  input            cpu_data_master_granted_out_hex0_s1;
  input            cpu_data_master_granted_out_hex1_s1;
  input            cpu_data_master_granted_out_hex2_s1;
  input            cpu_data_master_granted_out_hex4_s1;
  input            cpu_data_master_granted_out_hex5_s1;
  input            cpu_data_master_granted_out_hex6_s1;
  input            cpu_data_master_granted_out_hex7_s1;
  input            cpu_data_master_qualified_request_cpu_jtag_debug_module;
  input            cpu_data_master_qualified_request_inp_buy_finish_s1;
  input            cpu_data_master_qualified_request_inp_cancel_buy_s1;
  input            cpu_data_master_qualified_request_inp_confirm_buy_s1;
  input            cpu_data_master_qualified_request_inp_the_goods_s1;
  input            cpu_data_master_qualified_request_inp_the_money_s1;
  input            cpu_data_master_qualified_request_onchip_memory_s1;
  input            cpu_data_master_qualified_request_out_buy_success_s1;
  input            cpu_data_master_qualified_request_out_enough_money_s1;
  input            cpu_data_master_qualified_request_out_hex0_s1;
  input            cpu_data_master_qualified_request_out_hex1_s1;
  input            cpu_data_master_qualified_request_out_hex2_s1;
  input            cpu_data_master_qualified_request_out_hex4_s1;
  input            cpu_data_master_qualified_request_out_hex5_s1;
  input            cpu_data_master_qualified_request_out_hex6_s1;
  input            cpu_data_master_qualified_request_out_hex7_s1;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  input            cpu_data_master_read_data_valid_inp_buy_finish_s1;
  input            cpu_data_master_read_data_valid_inp_cancel_buy_s1;
  input            cpu_data_master_read_data_valid_inp_confirm_buy_s1;
  input            cpu_data_master_read_data_valid_inp_the_goods_s1;
  input            cpu_data_master_read_data_valid_inp_the_money_s1;
  input            cpu_data_master_read_data_valid_onchip_memory_s1;
  input            cpu_data_master_read_data_valid_out_buy_success_s1;
  input            cpu_data_master_read_data_valid_out_enough_money_s1;
  input            cpu_data_master_read_data_valid_out_hex0_s1;
  input            cpu_data_master_read_data_valid_out_hex1_s1;
  input            cpu_data_master_read_data_valid_out_hex2_s1;
  input            cpu_data_master_read_data_valid_out_hex4_s1;
  input            cpu_data_master_read_data_valid_out_hex5_s1;
  input            cpu_data_master_read_data_valid_out_hex6_s1;
  input            cpu_data_master_read_data_valid_out_hex7_s1;
  input            cpu_data_master_requests_cpu_jtag_debug_module;
  input            cpu_data_master_requests_inp_buy_finish_s1;
  input            cpu_data_master_requests_inp_cancel_buy_s1;
  input            cpu_data_master_requests_inp_confirm_buy_s1;
  input            cpu_data_master_requests_inp_the_goods_s1;
  input            cpu_data_master_requests_inp_the_money_s1;
  input            cpu_data_master_requests_onchip_memory_s1;
  input            cpu_data_master_requests_out_buy_success_s1;
  input            cpu_data_master_requests_out_enough_money_s1;
  input            cpu_data_master_requests_out_hex0_s1;
  input            cpu_data_master_requests_out_hex1_s1;
  input            cpu_data_master_requests_out_hex2_s1;
  input            cpu_data_master_requests_out_hex4_s1;
  input            cpu_data_master_requests_out_hex5_s1;
  input            cpu_data_master_requests_out_hex6_s1;
  input            cpu_data_master_requests_out_hex7_s1;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  input            d1_cpu_jtag_debug_module_end_xfer;
  input            d1_inp_buy_finish_s1_end_xfer;
  input            d1_inp_cancel_buy_s1_end_xfer;
  input            d1_inp_confirm_buy_s1_end_xfer;
  input            d1_inp_the_goods_s1_end_xfer;
  input            d1_inp_the_money_s1_end_xfer;
  input            d1_onchip_memory_s1_end_xfer;
  input            d1_out_buy_success_s1_end_xfer;
  input            d1_out_enough_money_s1_end_xfer;
  input            d1_out_hex0_s1_end_xfer;
  input            d1_out_hex1_s1_end_xfer;
  input            d1_out_hex2_s1_end_xfer;
  input            d1_out_hex4_s1_end_xfer;
  input            d1_out_hex5_s1_end_xfer;
  input            d1_out_hex6_s1_end_xfer;
  input            d1_out_hex7_s1_end_xfer;
  input            inp_buy_finish_s1_irq_from_sa;
  input            inp_buy_finish_s1_readdata_from_sa;
  input            inp_cancel_buy_s1_irq_from_sa;
  input            inp_cancel_buy_s1_readdata_from_sa;
  input            inp_confirm_buy_s1_irq_from_sa;
  input            inp_confirm_buy_s1_readdata_from_sa;
  input            inp_the_goods_s1_irq_from_sa;
  input   [  2: 0] inp_the_goods_s1_readdata_from_sa;
  input            inp_the_money_s1_irq_from_sa;
  input   [  2: 0] inp_the_money_s1_readdata_from_sa;
  input   [ 31: 0] onchip_memory_s1_readdata_from_sa;
  input            out_buy_success_s1_readdata_from_sa;
  input            out_enough_money_s1_readdata_from_sa;
  input   [  6: 0] out_hex0_s1_readdata_from_sa;
  input   [  6: 0] out_hex1_s1_readdata_from_sa;
  input   [  6: 0] out_hex2_s1_readdata_from_sa;
  input   [  6: 0] out_hex4_s1_readdata_from_sa;
  input   [  6: 0] out_hex5_s1_readdata_from_sa;
  input   [  6: 0] out_hex6_s1_readdata_from_sa;
  input   [  6: 0] out_hex7_s1_readdata_from_sa;
  input            registered_cpu_data_master_read_data_valid_onchip_memory_s1;
  input            reset_n;

  wire    [ 15: 0] cpu_data_master_address_to_slave;
  wire    [ 31: 0] cpu_data_master_irq;
  wire    [ 31: 0] cpu_data_master_readdata;
  wire             cpu_data_master_run;
  reg              cpu_data_master_waitrequest;
  wire             r_0;
  wire             r_1;
  wire             r_2;
  wire             r_3;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_requests_cpu_jtag_debug_module) & (cpu_data_master_granted_cpu_jtag_debug_module | ~cpu_data_master_qualified_request_cpu_jtag_debug_module) & ((~cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_inp_buy_finish_s1 | ~cpu_data_master_requests_inp_buy_finish_s1) & ((~cpu_data_master_qualified_request_inp_buy_finish_s1 | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_inp_buy_finish_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_inp_cancel_buy_s1 | ~cpu_data_master_requests_inp_cancel_buy_s1) & ((~cpu_data_master_qualified_request_inp_cancel_buy_s1 | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_inp_cancel_buy_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_inp_confirm_buy_s1 | ~cpu_data_master_requests_inp_confirm_buy_s1) & ((~cpu_data_master_qualified_request_inp_confirm_buy_s1 | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_inp_confirm_buy_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_inp_the_goods_s1 | ~cpu_data_master_requests_inp_the_goods_s1) & ((~cpu_data_master_qualified_request_inp_the_goods_s1 | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign cpu_data_master_run = r_0 & r_1 & r_2 & r_3;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = ((~cpu_data_master_qualified_request_inp_the_goods_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_inp_the_money_s1 | ~cpu_data_master_requests_inp_the_money_s1) & ((~cpu_data_master_qualified_request_inp_the_money_s1 | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_inp_the_money_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_onchip_memory_s1 | registered_cpu_data_master_read_data_valid_onchip_memory_s1 | ~cpu_data_master_requests_onchip_memory_s1) & (cpu_data_master_granted_onchip_memory_s1 | ~cpu_data_master_qualified_request_onchip_memory_s1) & ((~cpu_data_master_qualified_request_onchip_memory_s1 | ~cpu_data_master_read | (registered_cpu_data_master_read_data_valid_onchip_memory_s1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_onchip_memory_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_out_buy_success_s1 | ~cpu_data_master_requests_out_buy_success_s1) & ((~cpu_data_master_qualified_request_out_buy_success_s1 | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_out_buy_success_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_out_enough_money_s1 | ~cpu_data_master_requests_out_enough_money_s1) & ((~cpu_data_master_qualified_request_out_enough_money_s1 | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_out_enough_money_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_out_hex0_s1 | ~cpu_data_master_requests_out_hex0_s1);

  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = ((~cpu_data_master_qualified_request_out_hex0_s1 | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_out_hex0_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_out_hex1_s1 | ~cpu_data_master_requests_out_hex1_s1) & ((~cpu_data_master_qualified_request_out_hex1_s1 | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_out_hex1_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_out_hex2_s1 | ~cpu_data_master_requests_out_hex2_s1) & ((~cpu_data_master_qualified_request_out_hex2_s1 | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_out_hex2_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_out_hex4_s1 | ~cpu_data_master_requests_out_hex4_s1) & ((~cpu_data_master_qualified_request_out_hex4_s1 | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_out_hex4_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_out_hex5_s1 | ~cpu_data_master_requests_out_hex5_s1) & ((~cpu_data_master_qualified_request_out_hex5_s1 | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_out_hex5_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_out_hex6_s1 | ~cpu_data_master_requests_out_hex6_s1);

  //r_3 master_run cascaded wait assignment, which is an e_assign
  assign r_3 = ((~cpu_data_master_qualified_request_out_hex6_s1 | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_out_hex6_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_out_hex7_s1 | ~cpu_data_master_requests_out_hex7_s1) & ((~cpu_data_master_qualified_request_out_hex7_s1 | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_out_hex7_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write)));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_data_master_address_to_slave = cpu_data_master_address[15 : 0];

  //cpu/data_master readdata mux, which is an e_mux
  assign cpu_data_master_readdata = ({32 {~cpu_data_master_requests_cpu_jtag_debug_module}} | cpu_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_inp_buy_finish_s1}} | inp_buy_finish_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_inp_cancel_buy_s1}} | inp_cancel_buy_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_inp_confirm_buy_s1}} | inp_confirm_buy_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_inp_the_goods_s1}} | inp_the_goods_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_inp_the_money_s1}} | inp_the_money_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_onchip_memory_s1}} | onchip_memory_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_out_buy_success_s1}} | out_buy_success_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_out_enough_money_s1}} | out_enough_money_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_out_hex0_s1}} | out_hex0_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_out_hex1_s1}} | out_hex1_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_out_hex2_s1}} | out_hex2_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_out_hex4_s1}} | out_hex4_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_out_hex5_s1}} | out_hex5_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_out_hex6_s1}} | out_hex6_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_out_hex7_s1}} | out_hex7_s1_readdata_from_sa);

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
    inp_cancel_buy_s1_irq_from_sa,
    inp_buy_finish_s1_irq_from_sa,
    inp_confirm_buy_s1_irq_from_sa,
    inp_the_money_s1_irq_from_sa,
    inp_the_goods_s1_irq_from_sa};


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
  wire             r_1;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_instruction_master_qualified_request_cpu_jtag_debug_module | ~cpu_instruction_master_requests_cpu_jtag_debug_module) & (cpu_instruction_master_granted_cpu_jtag_debug_module | ~cpu_instruction_master_qualified_request_cpu_jtag_debug_module) & ((~cpu_instruction_master_qualified_request_cpu_jtag_debug_module | ~cpu_instruction_master_read | (1 & ~d1_cpu_jtag_debug_module_end_xfer & cpu_instruction_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign cpu_instruction_master_run = r_0 & r_1;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (cpu_instruction_master_qualified_request_onchip_memory_s1 | ~cpu_instruction_master_requests_onchip_memory_s1) & (cpu_instruction_master_granted_onchip_memory_s1 | ~cpu_instruction_master_qualified_request_onchip_memory_s1) & ((~cpu_instruction_master_qualified_request_onchip_memory_s1 | ~cpu_instruction_master_read | (1 & cpu_instruction_master_read)));

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

module inp_buy_finish_s1_arbitrator (
                                      // inputs:
                                       clk,
                                       cpu_data_master_address_to_slave,
                                       cpu_data_master_read,
                                       cpu_data_master_waitrequest,
                                       cpu_data_master_write,
                                       cpu_data_master_writedata,
                                       inp_buy_finish_s1_irq,
                                       inp_buy_finish_s1_readdata,
                                       reset_n,

                                      // outputs:
                                       cpu_data_master_granted_inp_buy_finish_s1,
                                       cpu_data_master_qualified_request_inp_buy_finish_s1,
                                       cpu_data_master_read_data_valid_inp_buy_finish_s1,
                                       cpu_data_master_requests_inp_buy_finish_s1,
                                       d1_inp_buy_finish_s1_end_xfer,
                                       inp_buy_finish_s1_address,
                                       inp_buy_finish_s1_chipselect,
                                       inp_buy_finish_s1_irq_from_sa,
                                       inp_buy_finish_s1_readdata_from_sa,
                                       inp_buy_finish_s1_reset_n,
                                       inp_buy_finish_s1_write_n,
                                       inp_buy_finish_s1_writedata
                                    )
;

  output           cpu_data_master_granted_inp_buy_finish_s1;
  output           cpu_data_master_qualified_request_inp_buy_finish_s1;
  output           cpu_data_master_read_data_valid_inp_buy_finish_s1;
  output           cpu_data_master_requests_inp_buy_finish_s1;
  output           d1_inp_buy_finish_s1_end_xfer;
  output  [  1: 0] inp_buy_finish_s1_address;
  output           inp_buy_finish_s1_chipselect;
  output           inp_buy_finish_s1_irq_from_sa;
  output           inp_buy_finish_s1_readdata_from_sa;
  output           inp_buy_finish_s1_reset_n;
  output           inp_buy_finish_s1_write_n;
  output           inp_buy_finish_s1_writedata;
  input            clk;
  input   [ 15: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            inp_buy_finish_s1_irq;
  input            inp_buy_finish_s1_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_inp_buy_finish_s1;
  wire             cpu_data_master_qualified_request_inp_buy_finish_s1;
  wire             cpu_data_master_read_data_valid_inp_buy_finish_s1;
  wire             cpu_data_master_requests_inp_buy_finish_s1;
  wire             cpu_data_master_saved_grant_inp_buy_finish_s1;
  reg              d1_inp_buy_finish_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_inp_buy_finish_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] inp_buy_finish_s1_address;
  wire             inp_buy_finish_s1_allgrants;
  wire             inp_buy_finish_s1_allow_new_arb_cycle;
  wire             inp_buy_finish_s1_any_bursting_master_saved_grant;
  wire             inp_buy_finish_s1_any_continuerequest;
  wire             inp_buy_finish_s1_arb_counter_enable;
  reg              inp_buy_finish_s1_arb_share_counter;
  wire             inp_buy_finish_s1_arb_share_counter_next_value;
  wire             inp_buy_finish_s1_arb_share_set_values;
  wire             inp_buy_finish_s1_beginbursttransfer_internal;
  wire             inp_buy_finish_s1_begins_xfer;
  wire             inp_buy_finish_s1_chipselect;
  wire             inp_buy_finish_s1_end_xfer;
  wire             inp_buy_finish_s1_firsttransfer;
  wire             inp_buy_finish_s1_grant_vector;
  wire             inp_buy_finish_s1_in_a_read_cycle;
  wire             inp_buy_finish_s1_in_a_write_cycle;
  wire             inp_buy_finish_s1_irq_from_sa;
  wire             inp_buy_finish_s1_master_qreq_vector;
  wire             inp_buy_finish_s1_non_bursting_master_requests;
  wire             inp_buy_finish_s1_readdata_from_sa;
  reg              inp_buy_finish_s1_reg_firsttransfer;
  wire             inp_buy_finish_s1_reset_n;
  reg              inp_buy_finish_s1_slavearbiterlockenable;
  wire             inp_buy_finish_s1_slavearbiterlockenable2;
  wire             inp_buy_finish_s1_unreg_firsttransfer;
  wire             inp_buy_finish_s1_waits_for_read;
  wire             inp_buy_finish_s1_waits_for_write;
  wire             inp_buy_finish_s1_write_n;
  wire             inp_buy_finish_s1_writedata;
  wire    [ 15: 0] shifted_address_to_inp_buy_finish_s1_from_cpu_data_master;
  wire             wait_for_inp_buy_finish_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~inp_buy_finish_s1_end_xfer;
    end


  assign inp_buy_finish_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_inp_buy_finish_s1));
  //assign inp_buy_finish_s1_readdata_from_sa = inp_buy_finish_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign inp_buy_finish_s1_readdata_from_sa = inp_buy_finish_s1_readdata;

  assign cpu_data_master_requests_inp_buy_finish_s1 = ({cpu_data_master_address_to_slave[15 : 4] , 4'b0} == 16'h9050) & (cpu_data_master_read | cpu_data_master_write);
  //inp_buy_finish_s1_arb_share_counter set values, which is an e_mux
  assign inp_buy_finish_s1_arb_share_set_values = 1;

  //inp_buy_finish_s1_non_bursting_master_requests mux, which is an e_mux
  assign inp_buy_finish_s1_non_bursting_master_requests = cpu_data_master_requests_inp_buy_finish_s1;

  //inp_buy_finish_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign inp_buy_finish_s1_any_bursting_master_saved_grant = 0;

  //inp_buy_finish_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign inp_buy_finish_s1_arb_share_counter_next_value = inp_buy_finish_s1_firsttransfer ? (inp_buy_finish_s1_arb_share_set_values - 1) : |inp_buy_finish_s1_arb_share_counter ? (inp_buy_finish_s1_arb_share_counter - 1) : 0;

  //inp_buy_finish_s1_allgrants all slave grants, which is an e_mux
  assign inp_buy_finish_s1_allgrants = |inp_buy_finish_s1_grant_vector;

  //inp_buy_finish_s1_end_xfer assignment, which is an e_assign
  assign inp_buy_finish_s1_end_xfer = ~(inp_buy_finish_s1_waits_for_read | inp_buy_finish_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_inp_buy_finish_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_inp_buy_finish_s1 = inp_buy_finish_s1_end_xfer & (~inp_buy_finish_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //inp_buy_finish_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign inp_buy_finish_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_inp_buy_finish_s1 & inp_buy_finish_s1_allgrants) | (end_xfer_arb_share_counter_term_inp_buy_finish_s1 & ~inp_buy_finish_s1_non_bursting_master_requests);

  //inp_buy_finish_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          inp_buy_finish_s1_arb_share_counter <= 0;
      else if (inp_buy_finish_s1_arb_counter_enable)
          inp_buy_finish_s1_arb_share_counter <= inp_buy_finish_s1_arb_share_counter_next_value;
    end


  //inp_buy_finish_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          inp_buy_finish_s1_slavearbiterlockenable <= 0;
      else if ((|inp_buy_finish_s1_master_qreq_vector & end_xfer_arb_share_counter_term_inp_buy_finish_s1) | (end_xfer_arb_share_counter_term_inp_buy_finish_s1 & ~inp_buy_finish_s1_non_bursting_master_requests))
          inp_buy_finish_s1_slavearbiterlockenable <= |inp_buy_finish_s1_arb_share_counter_next_value;
    end


  //cpu/data_master inp_buy_finish/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = inp_buy_finish_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //inp_buy_finish_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign inp_buy_finish_s1_slavearbiterlockenable2 = |inp_buy_finish_s1_arb_share_counter_next_value;

  //cpu/data_master inp_buy_finish/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = inp_buy_finish_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //inp_buy_finish_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign inp_buy_finish_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_inp_buy_finish_s1 = cpu_data_master_requests_inp_buy_finish_s1 & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //inp_buy_finish_s1_writedata mux, which is an e_mux
  assign inp_buy_finish_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_inp_buy_finish_s1 = cpu_data_master_qualified_request_inp_buy_finish_s1;

  //cpu/data_master saved-grant inp_buy_finish/s1, which is an e_assign
  assign cpu_data_master_saved_grant_inp_buy_finish_s1 = cpu_data_master_requests_inp_buy_finish_s1;

  //allow new arb cycle for inp_buy_finish/s1, which is an e_assign
  assign inp_buy_finish_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign inp_buy_finish_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign inp_buy_finish_s1_master_qreq_vector = 1;

  //inp_buy_finish_s1_reset_n assignment, which is an e_assign
  assign inp_buy_finish_s1_reset_n = reset_n;

  assign inp_buy_finish_s1_chipselect = cpu_data_master_granted_inp_buy_finish_s1;
  //inp_buy_finish_s1_firsttransfer first transaction, which is an e_assign
  assign inp_buy_finish_s1_firsttransfer = inp_buy_finish_s1_begins_xfer ? inp_buy_finish_s1_unreg_firsttransfer : inp_buy_finish_s1_reg_firsttransfer;

  //inp_buy_finish_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign inp_buy_finish_s1_unreg_firsttransfer = ~(inp_buy_finish_s1_slavearbiterlockenable & inp_buy_finish_s1_any_continuerequest);

  //inp_buy_finish_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          inp_buy_finish_s1_reg_firsttransfer <= 1'b1;
      else if (inp_buy_finish_s1_begins_xfer)
          inp_buy_finish_s1_reg_firsttransfer <= inp_buy_finish_s1_unreg_firsttransfer;
    end


  //inp_buy_finish_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign inp_buy_finish_s1_beginbursttransfer_internal = inp_buy_finish_s1_begins_xfer;

  //~inp_buy_finish_s1_write_n assignment, which is an e_mux
  assign inp_buy_finish_s1_write_n = ~(cpu_data_master_granted_inp_buy_finish_s1 & cpu_data_master_write);

  assign shifted_address_to_inp_buy_finish_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //inp_buy_finish_s1_address mux, which is an e_mux
  assign inp_buy_finish_s1_address = shifted_address_to_inp_buy_finish_s1_from_cpu_data_master >> 2;

  //d1_inp_buy_finish_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_inp_buy_finish_s1_end_xfer <= 1;
      else 
        d1_inp_buy_finish_s1_end_xfer <= inp_buy_finish_s1_end_xfer;
    end


  //inp_buy_finish_s1_waits_for_read in a cycle, which is an e_mux
  assign inp_buy_finish_s1_waits_for_read = inp_buy_finish_s1_in_a_read_cycle & inp_buy_finish_s1_begins_xfer;

  //inp_buy_finish_s1_in_a_read_cycle assignment, which is an e_assign
  assign inp_buy_finish_s1_in_a_read_cycle = cpu_data_master_granted_inp_buy_finish_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = inp_buy_finish_s1_in_a_read_cycle;

  //inp_buy_finish_s1_waits_for_write in a cycle, which is an e_mux
  assign inp_buy_finish_s1_waits_for_write = inp_buy_finish_s1_in_a_write_cycle & 0;

  //inp_buy_finish_s1_in_a_write_cycle assignment, which is an e_assign
  assign inp_buy_finish_s1_in_a_write_cycle = cpu_data_master_granted_inp_buy_finish_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = inp_buy_finish_s1_in_a_write_cycle;

  assign wait_for_inp_buy_finish_s1_counter = 0;
  //assign inp_buy_finish_s1_irq_from_sa = inp_buy_finish_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign inp_buy_finish_s1_irq_from_sa = inp_buy_finish_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //inp_buy_finish/s1 enable non-zero assertions, which is an e_register
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

module inp_cancel_buy_s1_arbitrator (
                                      // inputs:
                                       clk,
                                       cpu_data_master_address_to_slave,
                                       cpu_data_master_read,
                                       cpu_data_master_waitrequest,
                                       cpu_data_master_write,
                                       cpu_data_master_writedata,
                                       inp_cancel_buy_s1_irq,
                                       inp_cancel_buy_s1_readdata,
                                       reset_n,

                                      // outputs:
                                       cpu_data_master_granted_inp_cancel_buy_s1,
                                       cpu_data_master_qualified_request_inp_cancel_buy_s1,
                                       cpu_data_master_read_data_valid_inp_cancel_buy_s1,
                                       cpu_data_master_requests_inp_cancel_buy_s1,
                                       d1_inp_cancel_buy_s1_end_xfer,
                                       inp_cancel_buy_s1_address,
                                       inp_cancel_buy_s1_chipselect,
                                       inp_cancel_buy_s1_irq_from_sa,
                                       inp_cancel_buy_s1_readdata_from_sa,
                                       inp_cancel_buy_s1_reset_n,
                                       inp_cancel_buy_s1_write_n,
                                       inp_cancel_buy_s1_writedata
                                    )
;

  output           cpu_data_master_granted_inp_cancel_buy_s1;
  output           cpu_data_master_qualified_request_inp_cancel_buy_s1;
  output           cpu_data_master_read_data_valid_inp_cancel_buy_s1;
  output           cpu_data_master_requests_inp_cancel_buy_s1;
  output           d1_inp_cancel_buy_s1_end_xfer;
  output  [  1: 0] inp_cancel_buy_s1_address;
  output           inp_cancel_buy_s1_chipselect;
  output           inp_cancel_buy_s1_irq_from_sa;
  output           inp_cancel_buy_s1_readdata_from_sa;
  output           inp_cancel_buy_s1_reset_n;
  output           inp_cancel_buy_s1_write_n;
  output           inp_cancel_buy_s1_writedata;
  input            clk;
  input   [ 15: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            inp_cancel_buy_s1_irq;
  input            inp_cancel_buy_s1_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_inp_cancel_buy_s1;
  wire             cpu_data_master_qualified_request_inp_cancel_buy_s1;
  wire             cpu_data_master_read_data_valid_inp_cancel_buy_s1;
  wire             cpu_data_master_requests_inp_cancel_buy_s1;
  wire             cpu_data_master_saved_grant_inp_cancel_buy_s1;
  reg              d1_inp_cancel_buy_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_inp_cancel_buy_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] inp_cancel_buy_s1_address;
  wire             inp_cancel_buy_s1_allgrants;
  wire             inp_cancel_buy_s1_allow_new_arb_cycle;
  wire             inp_cancel_buy_s1_any_bursting_master_saved_grant;
  wire             inp_cancel_buy_s1_any_continuerequest;
  wire             inp_cancel_buy_s1_arb_counter_enable;
  reg              inp_cancel_buy_s1_arb_share_counter;
  wire             inp_cancel_buy_s1_arb_share_counter_next_value;
  wire             inp_cancel_buy_s1_arb_share_set_values;
  wire             inp_cancel_buy_s1_beginbursttransfer_internal;
  wire             inp_cancel_buy_s1_begins_xfer;
  wire             inp_cancel_buy_s1_chipselect;
  wire             inp_cancel_buy_s1_end_xfer;
  wire             inp_cancel_buy_s1_firsttransfer;
  wire             inp_cancel_buy_s1_grant_vector;
  wire             inp_cancel_buy_s1_in_a_read_cycle;
  wire             inp_cancel_buy_s1_in_a_write_cycle;
  wire             inp_cancel_buy_s1_irq_from_sa;
  wire             inp_cancel_buy_s1_master_qreq_vector;
  wire             inp_cancel_buy_s1_non_bursting_master_requests;
  wire             inp_cancel_buy_s1_readdata_from_sa;
  reg              inp_cancel_buy_s1_reg_firsttransfer;
  wire             inp_cancel_buy_s1_reset_n;
  reg              inp_cancel_buy_s1_slavearbiterlockenable;
  wire             inp_cancel_buy_s1_slavearbiterlockenable2;
  wire             inp_cancel_buy_s1_unreg_firsttransfer;
  wire             inp_cancel_buy_s1_waits_for_read;
  wire             inp_cancel_buy_s1_waits_for_write;
  wire             inp_cancel_buy_s1_write_n;
  wire             inp_cancel_buy_s1_writedata;
  wire    [ 15: 0] shifted_address_to_inp_cancel_buy_s1_from_cpu_data_master;
  wire             wait_for_inp_cancel_buy_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~inp_cancel_buy_s1_end_xfer;
    end


  assign inp_cancel_buy_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_inp_cancel_buy_s1));
  //assign inp_cancel_buy_s1_readdata_from_sa = inp_cancel_buy_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign inp_cancel_buy_s1_readdata_from_sa = inp_cancel_buy_s1_readdata;

  assign cpu_data_master_requests_inp_cancel_buy_s1 = ({cpu_data_master_address_to_slave[15 : 4] , 4'b0} == 16'h9060) & (cpu_data_master_read | cpu_data_master_write);
  //inp_cancel_buy_s1_arb_share_counter set values, which is an e_mux
  assign inp_cancel_buy_s1_arb_share_set_values = 1;

  //inp_cancel_buy_s1_non_bursting_master_requests mux, which is an e_mux
  assign inp_cancel_buy_s1_non_bursting_master_requests = cpu_data_master_requests_inp_cancel_buy_s1;

  //inp_cancel_buy_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign inp_cancel_buy_s1_any_bursting_master_saved_grant = 0;

  //inp_cancel_buy_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign inp_cancel_buy_s1_arb_share_counter_next_value = inp_cancel_buy_s1_firsttransfer ? (inp_cancel_buy_s1_arb_share_set_values - 1) : |inp_cancel_buy_s1_arb_share_counter ? (inp_cancel_buy_s1_arb_share_counter - 1) : 0;

  //inp_cancel_buy_s1_allgrants all slave grants, which is an e_mux
  assign inp_cancel_buy_s1_allgrants = |inp_cancel_buy_s1_grant_vector;

  //inp_cancel_buy_s1_end_xfer assignment, which is an e_assign
  assign inp_cancel_buy_s1_end_xfer = ~(inp_cancel_buy_s1_waits_for_read | inp_cancel_buy_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_inp_cancel_buy_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_inp_cancel_buy_s1 = inp_cancel_buy_s1_end_xfer & (~inp_cancel_buy_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //inp_cancel_buy_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign inp_cancel_buy_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_inp_cancel_buy_s1 & inp_cancel_buy_s1_allgrants) | (end_xfer_arb_share_counter_term_inp_cancel_buy_s1 & ~inp_cancel_buy_s1_non_bursting_master_requests);

  //inp_cancel_buy_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          inp_cancel_buy_s1_arb_share_counter <= 0;
      else if (inp_cancel_buy_s1_arb_counter_enable)
          inp_cancel_buy_s1_arb_share_counter <= inp_cancel_buy_s1_arb_share_counter_next_value;
    end


  //inp_cancel_buy_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          inp_cancel_buy_s1_slavearbiterlockenable <= 0;
      else if ((|inp_cancel_buy_s1_master_qreq_vector & end_xfer_arb_share_counter_term_inp_cancel_buy_s1) | (end_xfer_arb_share_counter_term_inp_cancel_buy_s1 & ~inp_cancel_buy_s1_non_bursting_master_requests))
          inp_cancel_buy_s1_slavearbiterlockenable <= |inp_cancel_buy_s1_arb_share_counter_next_value;
    end


  //cpu/data_master inp_cancel_buy/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = inp_cancel_buy_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //inp_cancel_buy_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign inp_cancel_buy_s1_slavearbiterlockenable2 = |inp_cancel_buy_s1_arb_share_counter_next_value;

  //cpu/data_master inp_cancel_buy/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = inp_cancel_buy_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //inp_cancel_buy_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign inp_cancel_buy_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_inp_cancel_buy_s1 = cpu_data_master_requests_inp_cancel_buy_s1 & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //inp_cancel_buy_s1_writedata mux, which is an e_mux
  assign inp_cancel_buy_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_inp_cancel_buy_s1 = cpu_data_master_qualified_request_inp_cancel_buy_s1;

  //cpu/data_master saved-grant inp_cancel_buy/s1, which is an e_assign
  assign cpu_data_master_saved_grant_inp_cancel_buy_s1 = cpu_data_master_requests_inp_cancel_buy_s1;

  //allow new arb cycle for inp_cancel_buy/s1, which is an e_assign
  assign inp_cancel_buy_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign inp_cancel_buy_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign inp_cancel_buy_s1_master_qreq_vector = 1;

  //inp_cancel_buy_s1_reset_n assignment, which is an e_assign
  assign inp_cancel_buy_s1_reset_n = reset_n;

  assign inp_cancel_buy_s1_chipselect = cpu_data_master_granted_inp_cancel_buy_s1;
  //inp_cancel_buy_s1_firsttransfer first transaction, which is an e_assign
  assign inp_cancel_buy_s1_firsttransfer = inp_cancel_buy_s1_begins_xfer ? inp_cancel_buy_s1_unreg_firsttransfer : inp_cancel_buy_s1_reg_firsttransfer;

  //inp_cancel_buy_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign inp_cancel_buy_s1_unreg_firsttransfer = ~(inp_cancel_buy_s1_slavearbiterlockenable & inp_cancel_buy_s1_any_continuerequest);

  //inp_cancel_buy_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          inp_cancel_buy_s1_reg_firsttransfer <= 1'b1;
      else if (inp_cancel_buy_s1_begins_xfer)
          inp_cancel_buy_s1_reg_firsttransfer <= inp_cancel_buy_s1_unreg_firsttransfer;
    end


  //inp_cancel_buy_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign inp_cancel_buy_s1_beginbursttransfer_internal = inp_cancel_buy_s1_begins_xfer;

  //~inp_cancel_buy_s1_write_n assignment, which is an e_mux
  assign inp_cancel_buy_s1_write_n = ~(cpu_data_master_granted_inp_cancel_buy_s1 & cpu_data_master_write);

  assign shifted_address_to_inp_cancel_buy_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //inp_cancel_buy_s1_address mux, which is an e_mux
  assign inp_cancel_buy_s1_address = shifted_address_to_inp_cancel_buy_s1_from_cpu_data_master >> 2;

  //d1_inp_cancel_buy_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_inp_cancel_buy_s1_end_xfer <= 1;
      else 
        d1_inp_cancel_buy_s1_end_xfer <= inp_cancel_buy_s1_end_xfer;
    end


  //inp_cancel_buy_s1_waits_for_read in a cycle, which is an e_mux
  assign inp_cancel_buy_s1_waits_for_read = inp_cancel_buy_s1_in_a_read_cycle & inp_cancel_buy_s1_begins_xfer;

  //inp_cancel_buy_s1_in_a_read_cycle assignment, which is an e_assign
  assign inp_cancel_buy_s1_in_a_read_cycle = cpu_data_master_granted_inp_cancel_buy_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = inp_cancel_buy_s1_in_a_read_cycle;

  //inp_cancel_buy_s1_waits_for_write in a cycle, which is an e_mux
  assign inp_cancel_buy_s1_waits_for_write = inp_cancel_buy_s1_in_a_write_cycle & 0;

  //inp_cancel_buy_s1_in_a_write_cycle assignment, which is an e_assign
  assign inp_cancel_buy_s1_in_a_write_cycle = cpu_data_master_granted_inp_cancel_buy_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = inp_cancel_buy_s1_in_a_write_cycle;

  assign wait_for_inp_cancel_buy_s1_counter = 0;
  //assign inp_cancel_buy_s1_irq_from_sa = inp_cancel_buy_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign inp_cancel_buy_s1_irq_from_sa = inp_cancel_buy_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //inp_cancel_buy/s1 enable non-zero assertions, which is an e_register
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

module inp_confirm_buy_s1_arbitrator (
                                       // inputs:
                                        clk,
                                        cpu_data_master_address_to_slave,
                                        cpu_data_master_read,
                                        cpu_data_master_waitrequest,
                                        cpu_data_master_write,
                                        cpu_data_master_writedata,
                                        inp_confirm_buy_s1_irq,
                                        inp_confirm_buy_s1_readdata,
                                        reset_n,

                                       // outputs:
                                        cpu_data_master_granted_inp_confirm_buy_s1,
                                        cpu_data_master_qualified_request_inp_confirm_buy_s1,
                                        cpu_data_master_read_data_valid_inp_confirm_buy_s1,
                                        cpu_data_master_requests_inp_confirm_buy_s1,
                                        d1_inp_confirm_buy_s1_end_xfer,
                                        inp_confirm_buy_s1_address,
                                        inp_confirm_buy_s1_chipselect,
                                        inp_confirm_buy_s1_irq_from_sa,
                                        inp_confirm_buy_s1_readdata_from_sa,
                                        inp_confirm_buy_s1_reset_n,
                                        inp_confirm_buy_s1_write_n,
                                        inp_confirm_buy_s1_writedata
                                     )
;

  output           cpu_data_master_granted_inp_confirm_buy_s1;
  output           cpu_data_master_qualified_request_inp_confirm_buy_s1;
  output           cpu_data_master_read_data_valid_inp_confirm_buy_s1;
  output           cpu_data_master_requests_inp_confirm_buy_s1;
  output           d1_inp_confirm_buy_s1_end_xfer;
  output  [  1: 0] inp_confirm_buy_s1_address;
  output           inp_confirm_buy_s1_chipselect;
  output           inp_confirm_buy_s1_irq_from_sa;
  output           inp_confirm_buy_s1_readdata_from_sa;
  output           inp_confirm_buy_s1_reset_n;
  output           inp_confirm_buy_s1_write_n;
  output           inp_confirm_buy_s1_writedata;
  input            clk;
  input   [ 15: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            inp_confirm_buy_s1_irq;
  input            inp_confirm_buy_s1_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_inp_confirm_buy_s1;
  wire             cpu_data_master_qualified_request_inp_confirm_buy_s1;
  wire             cpu_data_master_read_data_valid_inp_confirm_buy_s1;
  wire             cpu_data_master_requests_inp_confirm_buy_s1;
  wire             cpu_data_master_saved_grant_inp_confirm_buy_s1;
  reg              d1_inp_confirm_buy_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_inp_confirm_buy_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] inp_confirm_buy_s1_address;
  wire             inp_confirm_buy_s1_allgrants;
  wire             inp_confirm_buy_s1_allow_new_arb_cycle;
  wire             inp_confirm_buy_s1_any_bursting_master_saved_grant;
  wire             inp_confirm_buy_s1_any_continuerequest;
  wire             inp_confirm_buy_s1_arb_counter_enable;
  reg              inp_confirm_buy_s1_arb_share_counter;
  wire             inp_confirm_buy_s1_arb_share_counter_next_value;
  wire             inp_confirm_buy_s1_arb_share_set_values;
  wire             inp_confirm_buy_s1_beginbursttransfer_internal;
  wire             inp_confirm_buy_s1_begins_xfer;
  wire             inp_confirm_buy_s1_chipselect;
  wire             inp_confirm_buy_s1_end_xfer;
  wire             inp_confirm_buy_s1_firsttransfer;
  wire             inp_confirm_buy_s1_grant_vector;
  wire             inp_confirm_buy_s1_in_a_read_cycle;
  wire             inp_confirm_buy_s1_in_a_write_cycle;
  wire             inp_confirm_buy_s1_irq_from_sa;
  wire             inp_confirm_buy_s1_master_qreq_vector;
  wire             inp_confirm_buy_s1_non_bursting_master_requests;
  wire             inp_confirm_buy_s1_readdata_from_sa;
  reg              inp_confirm_buy_s1_reg_firsttransfer;
  wire             inp_confirm_buy_s1_reset_n;
  reg              inp_confirm_buy_s1_slavearbiterlockenable;
  wire             inp_confirm_buy_s1_slavearbiterlockenable2;
  wire             inp_confirm_buy_s1_unreg_firsttransfer;
  wire             inp_confirm_buy_s1_waits_for_read;
  wire             inp_confirm_buy_s1_waits_for_write;
  wire             inp_confirm_buy_s1_write_n;
  wire             inp_confirm_buy_s1_writedata;
  wire    [ 15: 0] shifted_address_to_inp_confirm_buy_s1_from_cpu_data_master;
  wire             wait_for_inp_confirm_buy_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~inp_confirm_buy_s1_end_xfer;
    end


  assign inp_confirm_buy_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_inp_confirm_buy_s1));
  //assign inp_confirm_buy_s1_readdata_from_sa = inp_confirm_buy_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign inp_confirm_buy_s1_readdata_from_sa = inp_confirm_buy_s1_readdata;

  assign cpu_data_master_requests_inp_confirm_buy_s1 = ({cpu_data_master_address_to_slave[15 : 4] , 4'b0} == 16'h9040) & (cpu_data_master_read | cpu_data_master_write);
  //inp_confirm_buy_s1_arb_share_counter set values, which is an e_mux
  assign inp_confirm_buy_s1_arb_share_set_values = 1;

  //inp_confirm_buy_s1_non_bursting_master_requests mux, which is an e_mux
  assign inp_confirm_buy_s1_non_bursting_master_requests = cpu_data_master_requests_inp_confirm_buy_s1;

  //inp_confirm_buy_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign inp_confirm_buy_s1_any_bursting_master_saved_grant = 0;

  //inp_confirm_buy_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign inp_confirm_buy_s1_arb_share_counter_next_value = inp_confirm_buy_s1_firsttransfer ? (inp_confirm_buy_s1_arb_share_set_values - 1) : |inp_confirm_buy_s1_arb_share_counter ? (inp_confirm_buy_s1_arb_share_counter - 1) : 0;

  //inp_confirm_buy_s1_allgrants all slave grants, which is an e_mux
  assign inp_confirm_buy_s1_allgrants = |inp_confirm_buy_s1_grant_vector;

  //inp_confirm_buy_s1_end_xfer assignment, which is an e_assign
  assign inp_confirm_buy_s1_end_xfer = ~(inp_confirm_buy_s1_waits_for_read | inp_confirm_buy_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_inp_confirm_buy_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_inp_confirm_buy_s1 = inp_confirm_buy_s1_end_xfer & (~inp_confirm_buy_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //inp_confirm_buy_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign inp_confirm_buy_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_inp_confirm_buy_s1 & inp_confirm_buy_s1_allgrants) | (end_xfer_arb_share_counter_term_inp_confirm_buy_s1 & ~inp_confirm_buy_s1_non_bursting_master_requests);

  //inp_confirm_buy_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          inp_confirm_buy_s1_arb_share_counter <= 0;
      else if (inp_confirm_buy_s1_arb_counter_enable)
          inp_confirm_buy_s1_arb_share_counter <= inp_confirm_buy_s1_arb_share_counter_next_value;
    end


  //inp_confirm_buy_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          inp_confirm_buy_s1_slavearbiterlockenable <= 0;
      else if ((|inp_confirm_buy_s1_master_qreq_vector & end_xfer_arb_share_counter_term_inp_confirm_buy_s1) | (end_xfer_arb_share_counter_term_inp_confirm_buy_s1 & ~inp_confirm_buy_s1_non_bursting_master_requests))
          inp_confirm_buy_s1_slavearbiterlockenable <= |inp_confirm_buy_s1_arb_share_counter_next_value;
    end


  //cpu/data_master inp_confirm_buy/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = inp_confirm_buy_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //inp_confirm_buy_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign inp_confirm_buy_s1_slavearbiterlockenable2 = |inp_confirm_buy_s1_arb_share_counter_next_value;

  //cpu/data_master inp_confirm_buy/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = inp_confirm_buy_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //inp_confirm_buy_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign inp_confirm_buy_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_inp_confirm_buy_s1 = cpu_data_master_requests_inp_confirm_buy_s1 & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //inp_confirm_buy_s1_writedata mux, which is an e_mux
  assign inp_confirm_buy_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_inp_confirm_buy_s1 = cpu_data_master_qualified_request_inp_confirm_buy_s1;

  //cpu/data_master saved-grant inp_confirm_buy/s1, which is an e_assign
  assign cpu_data_master_saved_grant_inp_confirm_buy_s1 = cpu_data_master_requests_inp_confirm_buy_s1;

  //allow new arb cycle for inp_confirm_buy/s1, which is an e_assign
  assign inp_confirm_buy_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign inp_confirm_buy_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign inp_confirm_buy_s1_master_qreq_vector = 1;

  //inp_confirm_buy_s1_reset_n assignment, which is an e_assign
  assign inp_confirm_buy_s1_reset_n = reset_n;

  assign inp_confirm_buy_s1_chipselect = cpu_data_master_granted_inp_confirm_buy_s1;
  //inp_confirm_buy_s1_firsttransfer first transaction, which is an e_assign
  assign inp_confirm_buy_s1_firsttransfer = inp_confirm_buy_s1_begins_xfer ? inp_confirm_buy_s1_unreg_firsttransfer : inp_confirm_buy_s1_reg_firsttransfer;

  //inp_confirm_buy_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign inp_confirm_buy_s1_unreg_firsttransfer = ~(inp_confirm_buy_s1_slavearbiterlockenable & inp_confirm_buy_s1_any_continuerequest);

  //inp_confirm_buy_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          inp_confirm_buy_s1_reg_firsttransfer <= 1'b1;
      else if (inp_confirm_buy_s1_begins_xfer)
          inp_confirm_buy_s1_reg_firsttransfer <= inp_confirm_buy_s1_unreg_firsttransfer;
    end


  //inp_confirm_buy_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign inp_confirm_buy_s1_beginbursttransfer_internal = inp_confirm_buy_s1_begins_xfer;

  //~inp_confirm_buy_s1_write_n assignment, which is an e_mux
  assign inp_confirm_buy_s1_write_n = ~(cpu_data_master_granted_inp_confirm_buy_s1 & cpu_data_master_write);

  assign shifted_address_to_inp_confirm_buy_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //inp_confirm_buy_s1_address mux, which is an e_mux
  assign inp_confirm_buy_s1_address = shifted_address_to_inp_confirm_buy_s1_from_cpu_data_master >> 2;

  //d1_inp_confirm_buy_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_inp_confirm_buy_s1_end_xfer <= 1;
      else 
        d1_inp_confirm_buy_s1_end_xfer <= inp_confirm_buy_s1_end_xfer;
    end


  //inp_confirm_buy_s1_waits_for_read in a cycle, which is an e_mux
  assign inp_confirm_buy_s1_waits_for_read = inp_confirm_buy_s1_in_a_read_cycle & inp_confirm_buy_s1_begins_xfer;

  //inp_confirm_buy_s1_in_a_read_cycle assignment, which is an e_assign
  assign inp_confirm_buy_s1_in_a_read_cycle = cpu_data_master_granted_inp_confirm_buy_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = inp_confirm_buy_s1_in_a_read_cycle;

  //inp_confirm_buy_s1_waits_for_write in a cycle, which is an e_mux
  assign inp_confirm_buy_s1_waits_for_write = inp_confirm_buy_s1_in_a_write_cycle & 0;

  //inp_confirm_buy_s1_in_a_write_cycle assignment, which is an e_assign
  assign inp_confirm_buy_s1_in_a_write_cycle = cpu_data_master_granted_inp_confirm_buy_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = inp_confirm_buy_s1_in_a_write_cycle;

  assign wait_for_inp_confirm_buy_s1_counter = 0;
  //assign inp_confirm_buy_s1_irq_from_sa = inp_confirm_buy_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign inp_confirm_buy_s1_irq_from_sa = inp_confirm_buy_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //inp_confirm_buy/s1 enable non-zero assertions, which is an e_register
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

module inp_the_goods_s1_arbitrator (
                                     // inputs:
                                      clk,
                                      cpu_data_master_address_to_slave,
                                      cpu_data_master_read,
                                      cpu_data_master_waitrequest,
                                      cpu_data_master_write,
                                      cpu_data_master_writedata,
                                      inp_the_goods_s1_irq,
                                      inp_the_goods_s1_readdata,
                                      reset_n,

                                     // outputs:
                                      cpu_data_master_granted_inp_the_goods_s1,
                                      cpu_data_master_qualified_request_inp_the_goods_s1,
                                      cpu_data_master_read_data_valid_inp_the_goods_s1,
                                      cpu_data_master_requests_inp_the_goods_s1,
                                      d1_inp_the_goods_s1_end_xfer,
                                      inp_the_goods_s1_address,
                                      inp_the_goods_s1_chipselect,
                                      inp_the_goods_s1_irq_from_sa,
                                      inp_the_goods_s1_readdata_from_sa,
                                      inp_the_goods_s1_reset_n,
                                      inp_the_goods_s1_write_n,
                                      inp_the_goods_s1_writedata
                                   )
;

  output           cpu_data_master_granted_inp_the_goods_s1;
  output           cpu_data_master_qualified_request_inp_the_goods_s1;
  output           cpu_data_master_read_data_valid_inp_the_goods_s1;
  output           cpu_data_master_requests_inp_the_goods_s1;
  output           d1_inp_the_goods_s1_end_xfer;
  output  [  1: 0] inp_the_goods_s1_address;
  output           inp_the_goods_s1_chipselect;
  output           inp_the_goods_s1_irq_from_sa;
  output  [  2: 0] inp_the_goods_s1_readdata_from_sa;
  output           inp_the_goods_s1_reset_n;
  output           inp_the_goods_s1_write_n;
  output  [  2: 0] inp_the_goods_s1_writedata;
  input            clk;
  input   [ 15: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            inp_the_goods_s1_irq;
  input   [  2: 0] inp_the_goods_s1_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_inp_the_goods_s1;
  wire             cpu_data_master_qualified_request_inp_the_goods_s1;
  wire             cpu_data_master_read_data_valid_inp_the_goods_s1;
  wire             cpu_data_master_requests_inp_the_goods_s1;
  wire             cpu_data_master_saved_grant_inp_the_goods_s1;
  reg              d1_inp_the_goods_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_inp_the_goods_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] inp_the_goods_s1_address;
  wire             inp_the_goods_s1_allgrants;
  wire             inp_the_goods_s1_allow_new_arb_cycle;
  wire             inp_the_goods_s1_any_bursting_master_saved_grant;
  wire             inp_the_goods_s1_any_continuerequest;
  wire             inp_the_goods_s1_arb_counter_enable;
  reg              inp_the_goods_s1_arb_share_counter;
  wire             inp_the_goods_s1_arb_share_counter_next_value;
  wire             inp_the_goods_s1_arb_share_set_values;
  wire             inp_the_goods_s1_beginbursttransfer_internal;
  wire             inp_the_goods_s1_begins_xfer;
  wire             inp_the_goods_s1_chipselect;
  wire             inp_the_goods_s1_end_xfer;
  wire             inp_the_goods_s1_firsttransfer;
  wire             inp_the_goods_s1_grant_vector;
  wire             inp_the_goods_s1_in_a_read_cycle;
  wire             inp_the_goods_s1_in_a_write_cycle;
  wire             inp_the_goods_s1_irq_from_sa;
  wire             inp_the_goods_s1_master_qreq_vector;
  wire             inp_the_goods_s1_non_bursting_master_requests;
  wire    [  2: 0] inp_the_goods_s1_readdata_from_sa;
  reg              inp_the_goods_s1_reg_firsttransfer;
  wire             inp_the_goods_s1_reset_n;
  reg              inp_the_goods_s1_slavearbiterlockenable;
  wire             inp_the_goods_s1_slavearbiterlockenable2;
  wire             inp_the_goods_s1_unreg_firsttransfer;
  wire             inp_the_goods_s1_waits_for_read;
  wire             inp_the_goods_s1_waits_for_write;
  wire             inp_the_goods_s1_write_n;
  wire    [  2: 0] inp_the_goods_s1_writedata;
  wire    [ 15: 0] shifted_address_to_inp_the_goods_s1_from_cpu_data_master;
  wire             wait_for_inp_the_goods_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~inp_the_goods_s1_end_xfer;
    end


  assign inp_the_goods_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_inp_the_goods_s1));
  //assign inp_the_goods_s1_readdata_from_sa = inp_the_goods_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign inp_the_goods_s1_readdata_from_sa = inp_the_goods_s1_readdata;

  assign cpu_data_master_requests_inp_the_goods_s1 = ({cpu_data_master_address_to_slave[15 : 4] , 4'b0} == 16'h9020) & (cpu_data_master_read | cpu_data_master_write);
  //inp_the_goods_s1_arb_share_counter set values, which is an e_mux
  assign inp_the_goods_s1_arb_share_set_values = 1;

  //inp_the_goods_s1_non_bursting_master_requests mux, which is an e_mux
  assign inp_the_goods_s1_non_bursting_master_requests = cpu_data_master_requests_inp_the_goods_s1;

  //inp_the_goods_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign inp_the_goods_s1_any_bursting_master_saved_grant = 0;

  //inp_the_goods_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign inp_the_goods_s1_arb_share_counter_next_value = inp_the_goods_s1_firsttransfer ? (inp_the_goods_s1_arb_share_set_values - 1) : |inp_the_goods_s1_arb_share_counter ? (inp_the_goods_s1_arb_share_counter - 1) : 0;

  //inp_the_goods_s1_allgrants all slave grants, which is an e_mux
  assign inp_the_goods_s1_allgrants = |inp_the_goods_s1_grant_vector;

  //inp_the_goods_s1_end_xfer assignment, which is an e_assign
  assign inp_the_goods_s1_end_xfer = ~(inp_the_goods_s1_waits_for_read | inp_the_goods_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_inp_the_goods_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_inp_the_goods_s1 = inp_the_goods_s1_end_xfer & (~inp_the_goods_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //inp_the_goods_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign inp_the_goods_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_inp_the_goods_s1 & inp_the_goods_s1_allgrants) | (end_xfer_arb_share_counter_term_inp_the_goods_s1 & ~inp_the_goods_s1_non_bursting_master_requests);

  //inp_the_goods_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          inp_the_goods_s1_arb_share_counter <= 0;
      else if (inp_the_goods_s1_arb_counter_enable)
          inp_the_goods_s1_arb_share_counter <= inp_the_goods_s1_arb_share_counter_next_value;
    end


  //inp_the_goods_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          inp_the_goods_s1_slavearbiterlockenable <= 0;
      else if ((|inp_the_goods_s1_master_qreq_vector & end_xfer_arb_share_counter_term_inp_the_goods_s1) | (end_xfer_arb_share_counter_term_inp_the_goods_s1 & ~inp_the_goods_s1_non_bursting_master_requests))
          inp_the_goods_s1_slavearbiterlockenable <= |inp_the_goods_s1_arb_share_counter_next_value;
    end


  //cpu/data_master inp_the_goods/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = inp_the_goods_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //inp_the_goods_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign inp_the_goods_s1_slavearbiterlockenable2 = |inp_the_goods_s1_arb_share_counter_next_value;

  //cpu/data_master inp_the_goods/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = inp_the_goods_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //inp_the_goods_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign inp_the_goods_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_inp_the_goods_s1 = cpu_data_master_requests_inp_the_goods_s1 & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //inp_the_goods_s1_writedata mux, which is an e_mux
  assign inp_the_goods_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_inp_the_goods_s1 = cpu_data_master_qualified_request_inp_the_goods_s1;

  //cpu/data_master saved-grant inp_the_goods/s1, which is an e_assign
  assign cpu_data_master_saved_grant_inp_the_goods_s1 = cpu_data_master_requests_inp_the_goods_s1;

  //allow new arb cycle for inp_the_goods/s1, which is an e_assign
  assign inp_the_goods_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign inp_the_goods_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign inp_the_goods_s1_master_qreq_vector = 1;

  //inp_the_goods_s1_reset_n assignment, which is an e_assign
  assign inp_the_goods_s1_reset_n = reset_n;

  assign inp_the_goods_s1_chipselect = cpu_data_master_granted_inp_the_goods_s1;
  //inp_the_goods_s1_firsttransfer first transaction, which is an e_assign
  assign inp_the_goods_s1_firsttransfer = inp_the_goods_s1_begins_xfer ? inp_the_goods_s1_unreg_firsttransfer : inp_the_goods_s1_reg_firsttransfer;

  //inp_the_goods_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign inp_the_goods_s1_unreg_firsttransfer = ~(inp_the_goods_s1_slavearbiterlockenable & inp_the_goods_s1_any_continuerequest);

  //inp_the_goods_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          inp_the_goods_s1_reg_firsttransfer <= 1'b1;
      else if (inp_the_goods_s1_begins_xfer)
          inp_the_goods_s1_reg_firsttransfer <= inp_the_goods_s1_unreg_firsttransfer;
    end


  //inp_the_goods_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign inp_the_goods_s1_beginbursttransfer_internal = inp_the_goods_s1_begins_xfer;

  //~inp_the_goods_s1_write_n assignment, which is an e_mux
  assign inp_the_goods_s1_write_n = ~(cpu_data_master_granted_inp_the_goods_s1 & cpu_data_master_write);

  assign shifted_address_to_inp_the_goods_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //inp_the_goods_s1_address mux, which is an e_mux
  assign inp_the_goods_s1_address = shifted_address_to_inp_the_goods_s1_from_cpu_data_master >> 2;

  //d1_inp_the_goods_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_inp_the_goods_s1_end_xfer <= 1;
      else 
        d1_inp_the_goods_s1_end_xfer <= inp_the_goods_s1_end_xfer;
    end


  //inp_the_goods_s1_waits_for_read in a cycle, which is an e_mux
  assign inp_the_goods_s1_waits_for_read = inp_the_goods_s1_in_a_read_cycle & inp_the_goods_s1_begins_xfer;

  //inp_the_goods_s1_in_a_read_cycle assignment, which is an e_assign
  assign inp_the_goods_s1_in_a_read_cycle = cpu_data_master_granted_inp_the_goods_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = inp_the_goods_s1_in_a_read_cycle;

  //inp_the_goods_s1_waits_for_write in a cycle, which is an e_mux
  assign inp_the_goods_s1_waits_for_write = inp_the_goods_s1_in_a_write_cycle & 0;

  //inp_the_goods_s1_in_a_write_cycle assignment, which is an e_assign
  assign inp_the_goods_s1_in_a_write_cycle = cpu_data_master_granted_inp_the_goods_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = inp_the_goods_s1_in_a_write_cycle;

  assign wait_for_inp_the_goods_s1_counter = 0;
  //assign inp_the_goods_s1_irq_from_sa = inp_the_goods_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign inp_the_goods_s1_irq_from_sa = inp_the_goods_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //inp_the_goods/s1 enable non-zero assertions, which is an e_register
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

module inp_the_money_s1_arbitrator (
                                     // inputs:
                                      clk,
                                      cpu_data_master_address_to_slave,
                                      cpu_data_master_read,
                                      cpu_data_master_waitrequest,
                                      cpu_data_master_write,
                                      cpu_data_master_writedata,
                                      inp_the_money_s1_irq,
                                      inp_the_money_s1_readdata,
                                      reset_n,

                                     // outputs:
                                      cpu_data_master_granted_inp_the_money_s1,
                                      cpu_data_master_qualified_request_inp_the_money_s1,
                                      cpu_data_master_read_data_valid_inp_the_money_s1,
                                      cpu_data_master_requests_inp_the_money_s1,
                                      d1_inp_the_money_s1_end_xfer,
                                      inp_the_money_s1_address,
                                      inp_the_money_s1_chipselect,
                                      inp_the_money_s1_irq_from_sa,
                                      inp_the_money_s1_readdata_from_sa,
                                      inp_the_money_s1_reset_n,
                                      inp_the_money_s1_write_n,
                                      inp_the_money_s1_writedata
                                   )
;

  output           cpu_data_master_granted_inp_the_money_s1;
  output           cpu_data_master_qualified_request_inp_the_money_s1;
  output           cpu_data_master_read_data_valid_inp_the_money_s1;
  output           cpu_data_master_requests_inp_the_money_s1;
  output           d1_inp_the_money_s1_end_xfer;
  output  [  1: 0] inp_the_money_s1_address;
  output           inp_the_money_s1_chipselect;
  output           inp_the_money_s1_irq_from_sa;
  output  [  2: 0] inp_the_money_s1_readdata_from_sa;
  output           inp_the_money_s1_reset_n;
  output           inp_the_money_s1_write_n;
  output  [  2: 0] inp_the_money_s1_writedata;
  input            clk;
  input   [ 15: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            inp_the_money_s1_irq;
  input   [  2: 0] inp_the_money_s1_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_inp_the_money_s1;
  wire             cpu_data_master_qualified_request_inp_the_money_s1;
  wire             cpu_data_master_read_data_valid_inp_the_money_s1;
  wire             cpu_data_master_requests_inp_the_money_s1;
  wire             cpu_data_master_saved_grant_inp_the_money_s1;
  reg              d1_inp_the_money_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_inp_the_money_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] inp_the_money_s1_address;
  wire             inp_the_money_s1_allgrants;
  wire             inp_the_money_s1_allow_new_arb_cycle;
  wire             inp_the_money_s1_any_bursting_master_saved_grant;
  wire             inp_the_money_s1_any_continuerequest;
  wire             inp_the_money_s1_arb_counter_enable;
  reg              inp_the_money_s1_arb_share_counter;
  wire             inp_the_money_s1_arb_share_counter_next_value;
  wire             inp_the_money_s1_arb_share_set_values;
  wire             inp_the_money_s1_beginbursttransfer_internal;
  wire             inp_the_money_s1_begins_xfer;
  wire             inp_the_money_s1_chipselect;
  wire             inp_the_money_s1_end_xfer;
  wire             inp_the_money_s1_firsttransfer;
  wire             inp_the_money_s1_grant_vector;
  wire             inp_the_money_s1_in_a_read_cycle;
  wire             inp_the_money_s1_in_a_write_cycle;
  wire             inp_the_money_s1_irq_from_sa;
  wire             inp_the_money_s1_master_qreq_vector;
  wire             inp_the_money_s1_non_bursting_master_requests;
  wire    [  2: 0] inp_the_money_s1_readdata_from_sa;
  reg              inp_the_money_s1_reg_firsttransfer;
  wire             inp_the_money_s1_reset_n;
  reg              inp_the_money_s1_slavearbiterlockenable;
  wire             inp_the_money_s1_slavearbiterlockenable2;
  wire             inp_the_money_s1_unreg_firsttransfer;
  wire             inp_the_money_s1_waits_for_read;
  wire             inp_the_money_s1_waits_for_write;
  wire             inp_the_money_s1_write_n;
  wire    [  2: 0] inp_the_money_s1_writedata;
  wire    [ 15: 0] shifted_address_to_inp_the_money_s1_from_cpu_data_master;
  wire             wait_for_inp_the_money_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~inp_the_money_s1_end_xfer;
    end


  assign inp_the_money_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_inp_the_money_s1));
  //assign inp_the_money_s1_readdata_from_sa = inp_the_money_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign inp_the_money_s1_readdata_from_sa = inp_the_money_s1_readdata;

  assign cpu_data_master_requests_inp_the_money_s1 = ({cpu_data_master_address_to_slave[15 : 4] , 4'b0} == 16'h9030) & (cpu_data_master_read | cpu_data_master_write);
  //inp_the_money_s1_arb_share_counter set values, which is an e_mux
  assign inp_the_money_s1_arb_share_set_values = 1;

  //inp_the_money_s1_non_bursting_master_requests mux, which is an e_mux
  assign inp_the_money_s1_non_bursting_master_requests = cpu_data_master_requests_inp_the_money_s1;

  //inp_the_money_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign inp_the_money_s1_any_bursting_master_saved_grant = 0;

  //inp_the_money_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign inp_the_money_s1_arb_share_counter_next_value = inp_the_money_s1_firsttransfer ? (inp_the_money_s1_arb_share_set_values - 1) : |inp_the_money_s1_arb_share_counter ? (inp_the_money_s1_arb_share_counter - 1) : 0;

  //inp_the_money_s1_allgrants all slave grants, which is an e_mux
  assign inp_the_money_s1_allgrants = |inp_the_money_s1_grant_vector;

  //inp_the_money_s1_end_xfer assignment, which is an e_assign
  assign inp_the_money_s1_end_xfer = ~(inp_the_money_s1_waits_for_read | inp_the_money_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_inp_the_money_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_inp_the_money_s1 = inp_the_money_s1_end_xfer & (~inp_the_money_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //inp_the_money_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign inp_the_money_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_inp_the_money_s1 & inp_the_money_s1_allgrants) | (end_xfer_arb_share_counter_term_inp_the_money_s1 & ~inp_the_money_s1_non_bursting_master_requests);

  //inp_the_money_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          inp_the_money_s1_arb_share_counter <= 0;
      else if (inp_the_money_s1_arb_counter_enable)
          inp_the_money_s1_arb_share_counter <= inp_the_money_s1_arb_share_counter_next_value;
    end


  //inp_the_money_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          inp_the_money_s1_slavearbiterlockenable <= 0;
      else if ((|inp_the_money_s1_master_qreq_vector & end_xfer_arb_share_counter_term_inp_the_money_s1) | (end_xfer_arb_share_counter_term_inp_the_money_s1 & ~inp_the_money_s1_non_bursting_master_requests))
          inp_the_money_s1_slavearbiterlockenable <= |inp_the_money_s1_arb_share_counter_next_value;
    end


  //cpu/data_master inp_the_money/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = inp_the_money_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //inp_the_money_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign inp_the_money_s1_slavearbiterlockenable2 = |inp_the_money_s1_arb_share_counter_next_value;

  //cpu/data_master inp_the_money/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = inp_the_money_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //inp_the_money_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign inp_the_money_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_inp_the_money_s1 = cpu_data_master_requests_inp_the_money_s1 & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //inp_the_money_s1_writedata mux, which is an e_mux
  assign inp_the_money_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_inp_the_money_s1 = cpu_data_master_qualified_request_inp_the_money_s1;

  //cpu/data_master saved-grant inp_the_money/s1, which is an e_assign
  assign cpu_data_master_saved_grant_inp_the_money_s1 = cpu_data_master_requests_inp_the_money_s1;

  //allow new arb cycle for inp_the_money/s1, which is an e_assign
  assign inp_the_money_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign inp_the_money_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign inp_the_money_s1_master_qreq_vector = 1;

  //inp_the_money_s1_reset_n assignment, which is an e_assign
  assign inp_the_money_s1_reset_n = reset_n;

  assign inp_the_money_s1_chipselect = cpu_data_master_granted_inp_the_money_s1;
  //inp_the_money_s1_firsttransfer first transaction, which is an e_assign
  assign inp_the_money_s1_firsttransfer = inp_the_money_s1_begins_xfer ? inp_the_money_s1_unreg_firsttransfer : inp_the_money_s1_reg_firsttransfer;

  //inp_the_money_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign inp_the_money_s1_unreg_firsttransfer = ~(inp_the_money_s1_slavearbiterlockenable & inp_the_money_s1_any_continuerequest);

  //inp_the_money_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          inp_the_money_s1_reg_firsttransfer <= 1'b1;
      else if (inp_the_money_s1_begins_xfer)
          inp_the_money_s1_reg_firsttransfer <= inp_the_money_s1_unreg_firsttransfer;
    end


  //inp_the_money_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign inp_the_money_s1_beginbursttransfer_internal = inp_the_money_s1_begins_xfer;

  //~inp_the_money_s1_write_n assignment, which is an e_mux
  assign inp_the_money_s1_write_n = ~(cpu_data_master_granted_inp_the_money_s1 & cpu_data_master_write);

  assign shifted_address_to_inp_the_money_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //inp_the_money_s1_address mux, which is an e_mux
  assign inp_the_money_s1_address = shifted_address_to_inp_the_money_s1_from_cpu_data_master >> 2;

  //d1_inp_the_money_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_inp_the_money_s1_end_xfer <= 1;
      else 
        d1_inp_the_money_s1_end_xfer <= inp_the_money_s1_end_xfer;
    end


  //inp_the_money_s1_waits_for_read in a cycle, which is an e_mux
  assign inp_the_money_s1_waits_for_read = inp_the_money_s1_in_a_read_cycle & inp_the_money_s1_begins_xfer;

  //inp_the_money_s1_in_a_read_cycle assignment, which is an e_assign
  assign inp_the_money_s1_in_a_read_cycle = cpu_data_master_granted_inp_the_money_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = inp_the_money_s1_in_a_read_cycle;

  //inp_the_money_s1_waits_for_write in a cycle, which is an e_mux
  assign inp_the_money_s1_waits_for_write = inp_the_money_s1_in_a_write_cycle & 0;

  //inp_the_money_s1_in_a_write_cycle assignment, which is an e_assign
  assign inp_the_money_s1_in_a_write_cycle = cpu_data_master_granted_inp_the_money_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = inp_the_money_s1_in_a_write_cycle;

  assign wait_for_inp_the_money_s1_counter = 0;
  //assign inp_the_money_s1_irq_from_sa = inp_the_money_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign inp_the_money_s1_irq_from_sa = inp_the_money_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //inp_the_money/s1 enable non-zero assertions, which is an e_register
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

module out_buy_success_s1_arbitrator (
                                       // inputs:
                                        clk,
                                        cpu_data_master_address_to_slave,
                                        cpu_data_master_read,
                                        cpu_data_master_waitrequest,
                                        cpu_data_master_write,
                                        cpu_data_master_writedata,
                                        out_buy_success_s1_readdata,
                                        reset_n,

                                       // outputs:
                                        cpu_data_master_granted_out_buy_success_s1,
                                        cpu_data_master_qualified_request_out_buy_success_s1,
                                        cpu_data_master_read_data_valid_out_buy_success_s1,
                                        cpu_data_master_requests_out_buy_success_s1,
                                        d1_out_buy_success_s1_end_xfer,
                                        out_buy_success_s1_address,
                                        out_buy_success_s1_chipselect,
                                        out_buy_success_s1_readdata_from_sa,
                                        out_buy_success_s1_reset_n,
                                        out_buy_success_s1_write_n,
                                        out_buy_success_s1_writedata
                                     )
;

  output           cpu_data_master_granted_out_buy_success_s1;
  output           cpu_data_master_qualified_request_out_buy_success_s1;
  output           cpu_data_master_read_data_valid_out_buy_success_s1;
  output           cpu_data_master_requests_out_buy_success_s1;
  output           d1_out_buy_success_s1_end_xfer;
  output  [  1: 0] out_buy_success_s1_address;
  output           out_buy_success_s1_chipselect;
  output           out_buy_success_s1_readdata_from_sa;
  output           out_buy_success_s1_reset_n;
  output           out_buy_success_s1_write_n;
  output           out_buy_success_s1_writedata;
  input            clk;
  input   [ 15: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            out_buy_success_s1_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_out_buy_success_s1;
  wire             cpu_data_master_qualified_request_out_buy_success_s1;
  wire             cpu_data_master_read_data_valid_out_buy_success_s1;
  wire             cpu_data_master_requests_out_buy_success_s1;
  wire             cpu_data_master_saved_grant_out_buy_success_s1;
  reg              d1_out_buy_success_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_out_buy_success_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] out_buy_success_s1_address;
  wire             out_buy_success_s1_allgrants;
  wire             out_buy_success_s1_allow_new_arb_cycle;
  wire             out_buy_success_s1_any_bursting_master_saved_grant;
  wire             out_buy_success_s1_any_continuerequest;
  wire             out_buy_success_s1_arb_counter_enable;
  reg              out_buy_success_s1_arb_share_counter;
  wire             out_buy_success_s1_arb_share_counter_next_value;
  wire             out_buy_success_s1_arb_share_set_values;
  wire             out_buy_success_s1_beginbursttransfer_internal;
  wire             out_buy_success_s1_begins_xfer;
  wire             out_buy_success_s1_chipselect;
  wire             out_buy_success_s1_end_xfer;
  wire             out_buy_success_s1_firsttransfer;
  wire             out_buy_success_s1_grant_vector;
  wire             out_buy_success_s1_in_a_read_cycle;
  wire             out_buy_success_s1_in_a_write_cycle;
  wire             out_buy_success_s1_master_qreq_vector;
  wire             out_buy_success_s1_non_bursting_master_requests;
  wire             out_buy_success_s1_readdata_from_sa;
  reg              out_buy_success_s1_reg_firsttransfer;
  wire             out_buy_success_s1_reset_n;
  reg              out_buy_success_s1_slavearbiterlockenable;
  wire             out_buy_success_s1_slavearbiterlockenable2;
  wire             out_buy_success_s1_unreg_firsttransfer;
  wire             out_buy_success_s1_waits_for_read;
  wire             out_buy_success_s1_waits_for_write;
  wire             out_buy_success_s1_write_n;
  wire             out_buy_success_s1_writedata;
  wire    [ 15: 0] shifted_address_to_out_buy_success_s1_from_cpu_data_master;
  wire             wait_for_out_buy_success_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~out_buy_success_s1_end_xfer;
    end


  assign out_buy_success_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_out_buy_success_s1));
  //assign out_buy_success_s1_readdata_from_sa = out_buy_success_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign out_buy_success_s1_readdata_from_sa = out_buy_success_s1_readdata;

  assign cpu_data_master_requests_out_buy_success_s1 = ({cpu_data_master_address_to_slave[15 : 4] , 4'b0} == 16'h9010) & (cpu_data_master_read | cpu_data_master_write);
  //out_buy_success_s1_arb_share_counter set values, which is an e_mux
  assign out_buy_success_s1_arb_share_set_values = 1;

  //out_buy_success_s1_non_bursting_master_requests mux, which is an e_mux
  assign out_buy_success_s1_non_bursting_master_requests = cpu_data_master_requests_out_buy_success_s1;

  //out_buy_success_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign out_buy_success_s1_any_bursting_master_saved_grant = 0;

  //out_buy_success_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign out_buy_success_s1_arb_share_counter_next_value = out_buy_success_s1_firsttransfer ? (out_buy_success_s1_arb_share_set_values - 1) : |out_buy_success_s1_arb_share_counter ? (out_buy_success_s1_arb_share_counter - 1) : 0;

  //out_buy_success_s1_allgrants all slave grants, which is an e_mux
  assign out_buy_success_s1_allgrants = |out_buy_success_s1_grant_vector;

  //out_buy_success_s1_end_xfer assignment, which is an e_assign
  assign out_buy_success_s1_end_xfer = ~(out_buy_success_s1_waits_for_read | out_buy_success_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_out_buy_success_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_out_buy_success_s1 = out_buy_success_s1_end_xfer & (~out_buy_success_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //out_buy_success_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign out_buy_success_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_out_buy_success_s1 & out_buy_success_s1_allgrants) | (end_xfer_arb_share_counter_term_out_buy_success_s1 & ~out_buy_success_s1_non_bursting_master_requests);

  //out_buy_success_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          out_buy_success_s1_arb_share_counter <= 0;
      else if (out_buy_success_s1_arb_counter_enable)
          out_buy_success_s1_arb_share_counter <= out_buy_success_s1_arb_share_counter_next_value;
    end


  //out_buy_success_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          out_buy_success_s1_slavearbiterlockenable <= 0;
      else if ((|out_buy_success_s1_master_qreq_vector & end_xfer_arb_share_counter_term_out_buy_success_s1) | (end_xfer_arb_share_counter_term_out_buy_success_s1 & ~out_buy_success_s1_non_bursting_master_requests))
          out_buy_success_s1_slavearbiterlockenable <= |out_buy_success_s1_arb_share_counter_next_value;
    end


  //cpu/data_master out_buy_success/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = out_buy_success_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //out_buy_success_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign out_buy_success_s1_slavearbiterlockenable2 = |out_buy_success_s1_arb_share_counter_next_value;

  //cpu/data_master out_buy_success/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = out_buy_success_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //out_buy_success_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign out_buy_success_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_out_buy_success_s1 = cpu_data_master_requests_out_buy_success_s1 & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //out_buy_success_s1_writedata mux, which is an e_mux
  assign out_buy_success_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_out_buy_success_s1 = cpu_data_master_qualified_request_out_buy_success_s1;

  //cpu/data_master saved-grant out_buy_success/s1, which is an e_assign
  assign cpu_data_master_saved_grant_out_buy_success_s1 = cpu_data_master_requests_out_buy_success_s1;

  //allow new arb cycle for out_buy_success/s1, which is an e_assign
  assign out_buy_success_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign out_buy_success_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign out_buy_success_s1_master_qreq_vector = 1;

  //out_buy_success_s1_reset_n assignment, which is an e_assign
  assign out_buy_success_s1_reset_n = reset_n;

  assign out_buy_success_s1_chipselect = cpu_data_master_granted_out_buy_success_s1;
  //out_buy_success_s1_firsttransfer first transaction, which is an e_assign
  assign out_buy_success_s1_firsttransfer = out_buy_success_s1_begins_xfer ? out_buy_success_s1_unreg_firsttransfer : out_buy_success_s1_reg_firsttransfer;

  //out_buy_success_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign out_buy_success_s1_unreg_firsttransfer = ~(out_buy_success_s1_slavearbiterlockenable & out_buy_success_s1_any_continuerequest);

  //out_buy_success_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          out_buy_success_s1_reg_firsttransfer <= 1'b1;
      else if (out_buy_success_s1_begins_xfer)
          out_buy_success_s1_reg_firsttransfer <= out_buy_success_s1_unreg_firsttransfer;
    end


  //out_buy_success_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign out_buy_success_s1_beginbursttransfer_internal = out_buy_success_s1_begins_xfer;

  //~out_buy_success_s1_write_n assignment, which is an e_mux
  assign out_buy_success_s1_write_n = ~(cpu_data_master_granted_out_buy_success_s1 & cpu_data_master_write);

  assign shifted_address_to_out_buy_success_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //out_buy_success_s1_address mux, which is an e_mux
  assign out_buy_success_s1_address = shifted_address_to_out_buy_success_s1_from_cpu_data_master >> 2;

  //d1_out_buy_success_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_out_buy_success_s1_end_xfer <= 1;
      else 
        d1_out_buy_success_s1_end_xfer <= out_buy_success_s1_end_xfer;
    end


  //out_buy_success_s1_waits_for_read in a cycle, which is an e_mux
  assign out_buy_success_s1_waits_for_read = out_buy_success_s1_in_a_read_cycle & out_buy_success_s1_begins_xfer;

  //out_buy_success_s1_in_a_read_cycle assignment, which is an e_assign
  assign out_buy_success_s1_in_a_read_cycle = cpu_data_master_granted_out_buy_success_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = out_buy_success_s1_in_a_read_cycle;

  //out_buy_success_s1_waits_for_write in a cycle, which is an e_mux
  assign out_buy_success_s1_waits_for_write = out_buy_success_s1_in_a_write_cycle & 0;

  //out_buy_success_s1_in_a_write_cycle assignment, which is an e_assign
  assign out_buy_success_s1_in_a_write_cycle = cpu_data_master_granted_out_buy_success_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = out_buy_success_s1_in_a_write_cycle;

  assign wait_for_out_buy_success_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //out_buy_success/s1 enable non-zero assertions, which is an e_register
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

module out_enough_money_s1_arbitrator (
                                        // inputs:
                                         clk,
                                         cpu_data_master_address_to_slave,
                                         cpu_data_master_read,
                                         cpu_data_master_waitrequest,
                                         cpu_data_master_write,
                                         cpu_data_master_writedata,
                                         out_enough_money_s1_readdata,
                                         reset_n,

                                        // outputs:
                                         cpu_data_master_granted_out_enough_money_s1,
                                         cpu_data_master_qualified_request_out_enough_money_s1,
                                         cpu_data_master_read_data_valid_out_enough_money_s1,
                                         cpu_data_master_requests_out_enough_money_s1,
                                         d1_out_enough_money_s1_end_xfer,
                                         out_enough_money_s1_address,
                                         out_enough_money_s1_chipselect,
                                         out_enough_money_s1_readdata_from_sa,
                                         out_enough_money_s1_reset_n,
                                         out_enough_money_s1_write_n,
                                         out_enough_money_s1_writedata
                                      )
;

  output           cpu_data_master_granted_out_enough_money_s1;
  output           cpu_data_master_qualified_request_out_enough_money_s1;
  output           cpu_data_master_read_data_valid_out_enough_money_s1;
  output           cpu_data_master_requests_out_enough_money_s1;
  output           d1_out_enough_money_s1_end_xfer;
  output  [  1: 0] out_enough_money_s1_address;
  output           out_enough_money_s1_chipselect;
  output           out_enough_money_s1_readdata_from_sa;
  output           out_enough_money_s1_reset_n;
  output           out_enough_money_s1_write_n;
  output           out_enough_money_s1_writedata;
  input            clk;
  input   [ 15: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            out_enough_money_s1_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_out_enough_money_s1;
  wire             cpu_data_master_qualified_request_out_enough_money_s1;
  wire             cpu_data_master_read_data_valid_out_enough_money_s1;
  wire             cpu_data_master_requests_out_enough_money_s1;
  wire             cpu_data_master_saved_grant_out_enough_money_s1;
  reg              d1_out_enough_money_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_out_enough_money_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] out_enough_money_s1_address;
  wire             out_enough_money_s1_allgrants;
  wire             out_enough_money_s1_allow_new_arb_cycle;
  wire             out_enough_money_s1_any_bursting_master_saved_grant;
  wire             out_enough_money_s1_any_continuerequest;
  wire             out_enough_money_s1_arb_counter_enable;
  reg              out_enough_money_s1_arb_share_counter;
  wire             out_enough_money_s1_arb_share_counter_next_value;
  wire             out_enough_money_s1_arb_share_set_values;
  wire             out_enough_money_s1_beginbursttransfer_internal;
  wire             out_enough_money_s1_begins_xfer;
  wire             out_enough_money_s1_chipselect;
  wire             out_enough_money_s1_end_xfer;
  wire             out_enough_money_s1_firsttransfer;
  wire             out_enough_money_s1_grant_vector;
  wire             out_enough_money_s1_in_a_read_cycle;
  wire             out_enough_money_s1_in_a_write_cycle;
  wire             out_enough_money_s1_master_qreq_vector;
  wire             out_enough_money_s1_non_bursting_master_requests;
  wire             out_enough_money_s1_readdata_from_sa;
  reg              out_enough_money_s1_reg_firsttransfer;
  wire             out_enough_money_s1_reset_n;
  reg              out_enough_money_s1_slavearbiterlockenable;
  wire             out_enough_money_s1_slavearbiterlockenable2;
  wire             out_enough_money_s1_unreg_firsttransfer;
  wire             out_enough_money_s1_waits_for_read;
  wire             out_enough_money_s1_waits_for_write;
  wire             out_enough_money_s1_write_n;
  wire             out_enough_money_s1_writedata;
  wire    [ 15: 0] shifted_address_to_out_enough_money_s1_from_cpu_data_master;
  wire             wait_for_out_enough_money_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~out_enough_money_s1_end_xfer;
    end


  assign out_enough_money_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_out_enough_money_s1));
  //assign out_enough_money_s1_readdata_from_sa = out_enough_money_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign out_enough_money_s1_readdata_from_sa = out_enough_money_s1_readdata;

  assign cpu_data_master_requests_out_enough_money_s1 = ({cpu_data_master_address_to_slave[15 : 4] , 4'b0} == 16'h9000) & (cpu_data_master_read | cpu_data_master_write);
  //out_enough_money_s1_arb_share_counter set values, which is an e_mux
  assign out_enough_money_s1_arb_share_set_values = 1;

  //out_enough_money_s1_non_bursting_master_requests mux, which is an e_mux
  assign out_enough_money_s1_non_bursting_master_requests = cpu_data_master_requests_out_enough_money_s1;

  //out_enough_money_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign out_enough_money_s1_any_bursting_master_saved_grant = 0;

  //out_enough_money_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign out_enough_money_s1_arb_share_counter_next_value = out_enough_money_s1_firsttransfer ? (out_enough_money_s1_arb_share_set_values - 1) : |out_enough_money_s1_arb_share_counter ? (out_enough_money_s1_arb_share_counter - 1) : 0;

  //out_enough_money_s1_allgrants all slave grants, which is an e_mux
  assign out_enough_money_s1_allgrants = |out_enough_money_s1_grant_vector;

  //out_enough_money_s1_end_xfer assignment, which is an e_assign
  assign out_enough_money_s1_end_xfer = ~(out_enough_money_s1_waits_for_read | out_enough_money_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_out_enough_money_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_out_enough_money_s1 = out_enough_money_s1_end_xfer & (~out_enough_money_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //out_enough_money_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign out_enough_money_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_out_enough_money_s1 & out_enough_money_s1_allgrants) | (end_xfer_arb_share_counter_term_out_enough_money_s1 & ~out_enough_money_s1_non_bursting_master_requests);

  //out_enough_money_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          out_enough_money_s1_arb_share_counter <= 0;
      else if (out_enough_money_s1_arb_counter_enable)
          out_enough_money_s1_arb_share_counter <= out_enough_money_s1_arb_share_counter_next_value;
    end


  //out_enough_money_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          out_enough_money_s1_slavearbiterlockenable <= 0;
      else if ((|out_enough_money_s1_master_qreq_vector & end_xfer_arb_share_counter_term_out_enough_money_s1) | (end_xfer_arb_share_counter_term_out_enough_money_s1 & ~out_enough_money_s1_non_bursting_master_requests))
          out_enough_money_s1_slavearbiterlockenable <= |out_enough_money_s1_arb_share_counter_next_value;
    end


  //cpu/data_master out_enough_money/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = out_enough_money_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //out_enough_money_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign out_enough_money_s1_slavearbiterlockenable2 = |out_enough_money_s1_arb_share_counter_next_value;

  //cpu/data_master out_enough_money/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = out_enough_money_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //out_enough_money_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign out_enough_money_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_out_enough_money_s1 = cpu_data_master_requests_out_enough_money_s1 & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //out_enough_money_s1_writedata mux, which is an e_mux
  assign out_enough_money_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_out_enough_money_s1 = cpu_data_master_qualified_request_out_enough_money_s1;

  //cpu/data_master saved-grant out_enough_money/s1, which is an e_assign
  assign cpu_data_master_saved_grant_out_enough_money_s1 = cpu_data_master_requests_out_enough_money_s1;

  //allow new arb cycle for out_enough_money/s1, which is an e_assign
  assign out_enough_money_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign out_enough_money_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign out_enough_money_s1_master_qreq_vector = 1;

  //out_enough_money_s1_reset_n assignment, which is an e_assign
  assign out_enough_money_s1_reset_n = reset_n;

  assign out_enough_money_s1_chipselect = cpu_data_master_granted_out_enough_money_s1;
  //out_enough_money_s1_firsttransfer first transaction, which is an e_assign
  assign out_enough_money_s1_firsttransfer = out_enough_money_s1_begins_xfer ? out_enough_money_s1_unreg_firsttransfer : out_enough_money_s1_reg_firsttransfer;

  //out_enough_money_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign out_enough_money_s1_unreg_firsttransfer = ~(out_enough_money_s1_slavearbiterlockenable & out_enough_money_s1_any_continuerequest);

  //out_enough_money_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          out_enough_money_s1_reg_firsttransfer <= 1'b1;
      else if (out_enough_money_s1_begins_xfer)
          out_enough_money_s1_reg_firsttransfer <= out_enough_money_s1_unreg_firsttransfer;
    end


  //out_enough_money_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign out_enough_money_s1_beginbursttransfer_internal = out_enough_money_s1_begins_xfer;

  //~out_enough_money_s1_write_n assignment, which is an e_mux
  assign out_enough_money_s1_write_n = ~(cpu_data_master_granted_out_enough_money_s1 & cpu_data_master_write);

  assign shifted_address_to_out_enough_money_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //out_enough_money_s1_address mux, which is an e_mux
  assign out_enough_money_s1_address = shifted_address_to_out_enough_money_s1_from_cpu_data_master >> 2;

  //d1_out_enough_money_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_out_enough_money_s1_end_xfer <= 1;
      else 
        d1_out_enough_money_s1_end_xfer <= out_enough_money_s1_end_xfer;
    end


  //out_enough_money_s1_waits_for_read in a cycle, which is an e_mux
  assign out_enough_money_s1_waits_for_read = out_enough_money_s1_in_a_read_cycle & out_enough_money_s1_begins_xfer;

  //out_enough_money_s1_in_a_read_cycle assignment, which is an e_assign
  assign out_enough_money_s1_in_a_read_cycle = cpu_data_master_granted_out_enough_money_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = out_enough_money_s1_in_a_read_cycle;

  //out_enough_money_s1_waits_for_write in a cycle, which is an e_mux
  assign out_enough_money_s1_waits_for_write = out_enough_money_s1_in_a_write_cycle & 0;

  //out_enough_money_s1_in_a_write_cycle assignment, which is an e_assign
  assign out_enough_money_s1_in_a_write_cycle = cpu_data_master_granted_out_enough_money_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = out_enough_money_s1_in_a_write_cycle;

  assign wait_for_out_enough_money_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //out_enough_money/s1 enable non-zero assertions, which is an e_register
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

module out_hex0_s1_arbitrator (
                                // inputs:
                                 clk,
                                 cpu_data_master_address_to_slave,
                                 cpu_data_master_read,
                                 cpu_data_master_waitrequest,
                                 cpu_data_master_write,
                                 cpu_data_master_writedata,
                                 out_hex0_s1_readdata,
                                 reset_n,

                                // outputs:
                                 cpu_data_master_granted_out_hex0_s1,
                                 cpu_data_master_qualified_request_out_hex0_s1,
                                 cpu_data_master_read_data_valid_out_hex0_s1,
                                 cpu_data_master_requests_out_hex0_s1,
                                 d1_out_hex0_s1_end_xfer,
                                 out_hex0_s1_address,
                                 out_hex0_s1_chipselect,
                                 out_hex0_s1_readdata_from_sa,
                                 out_hex0_s1_reset_n,
                                 out_hex0_s1_write_n,
                                 out_hex0_s1_writedata
                              )
;

  output           cpu_data_master_granted_out_hex0_s1;
  output           cpu_data_master_qualified_request_out_hex0_s1;
  output           cpu_data_master_read_data_valid_out_hex0_s1;
  output           cpu_data_master_requests_out_hex0_s1;
  output           d1_out_hex0_s1_end_xfer;
  output  [  1: 0] out_hex0_s1_address;
  output           out_hex0_s1_chipselect;
  output  [  6: 0] out_hex0_s1_readdata_from_sa;
  output           out_hex0_s1_reset_n;
  output           out_hex0_s1_write_n;
  output  [  6: 0] out_hex0_s1_writedata;
  input            clk;
  input   [ 15: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [  6: 0] out_hex0_s1_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_out_hex0_s1;
  wire             cpu_data_master_qualified_request_out_hex0_s1;
  wire             cpu_data_master_read_data_valid_out_hex0_s1;
  wire             cpu_data_master_requests_out_hex0_s1;
  wire             cpu_data_master_saved_grant_out_hex0_s1;
  reg              d1_out_hex0_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_out_hex0_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] out_hex0_s1_address;
  wire             out_hex0_s1_allgrants;
  wire             out_hex0_s1_allow_new_arb_cycle;
  wire             out_hex0_s1_any_bursting_master_saved_grant;
  wire             out_hex0_s1_any_continuerequest;
  wire             out_hex0_s1_arb_counter_enable;
  reg              out_hex0_s1_arb_share_counter;
  wire             out_hex0_s1_arb_share_counter_next_value;
  wire             out_hex0_s1_arb_share_set_values;
  wire             out_hex0_s1_beginbursttransfer_internal;
  wire             out_hex0_s1_begins_xfer;
  wire             out_hex0_s1_chipselect;
  wire             out_hex0_s1_end_xfer;
  wire             out_hex0_s1_firsttransfer;
  wire             out_hex0_s1_grant_vector;
  wire             out_hex0_s1_in_a_read_cycle;
  wire             out_hex0_s1_in_a_write_cycle;
  wire             out_hex0_s1_master_qreq_vector;
  wire             out_hex0_s1_non_bursting_master_requests;
  wire    [  6: 0] out_hex0_s1_readdata_from_sa;
  reg              out_hex0_s1_reg_firsttransfer;
  wire             out_hex0_s1_reset_n;
  reg              out_hex0_s1_slavearbiterlockenable;
  wire             out_hex0_s1_slavearbiterlockenable2;
  wire             out_hex0_s1_unreg_firsttransfer;
  wire             out_hex0_s1_waits_for_read;
  wire             out_hex0_s1_waits_for_write;
  wire             out_hex0_s1_write_n;
  wire    [  6: 0] out_hex0_s1_writedata;
  wire    [ 15: 0] shifted_address_to_out_hex0_s1_from_cpu_data_master;
  wire             wait_for_out_hex0_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~out_hex0_s1_end_xfer;
    end


  assign out_hex0_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_out_hex0_s1));
  //assign out_hex0_s1_readdata_from_sa = out_hex0_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign out_hex0_s1_readdata_from_sa = out_hex0_s1_readdata;

  assign cpu_data_master_requests_out_hex0_s1 = ({cpu_data_master_address_to_slave[15 : 4] , 4'b0} == 16'h90d0) & (cpu_data_master_read | cpu_data_master_write);
  //out_hex0_s1_arb_share_counter set values, which is an e_mux
  assign out_hex0_s1_arb_share_set_values = 1;

  //out_hex0_s1_non_bursting_master_requests mux, which is an e_mux
  assign out_hex0_s1_non_bursting_master_requests = cpu_data_master_requests_out_hex0_s1;

  //out_hex0_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign out_hex0_s1_any_bursting_master_saved_grant = 0;

  //out_hex0_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign out_hex0_s1_arb_share_counter_next_value = out_hex0_s1_firsttransfer ? (out_hex0_s1_arb_share_set_values - 1) : |out_hex0_s1_arb_share_counter ? (out_hex0_s1_arb_share_counter - 1) : 0;

  //out_hex0_s1_allgrants all slave grants, which is an e_mux
  assign out_hex0_s1_allgrants = |out_hex0_s1_grant_vector;

  //out_hex0_s1_end_xfer assignment, which is an e_assign
  assign out_hex0_s1_end_xfer = ~(out_hex0_s1_waits_for_read | out_hex0_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_out_hex0_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_out_hex0_s1 = out_hex0_s1_end_xfer & (~out_hex0_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //out_hex0_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign out_hex0_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_out_hex0_s1 & out_hex0_s1_allgrants) | (end_xfer_arb_share_counter_term_out_hex0_s1 & ~out_hex0_s1_non_bursting_master_requests);

  //out_hex0_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          out_hex0_s1_arb_share_counter <= 0;
      else if (out_hex0_s1_arb_counter_enable)
          out_hex0_s1_arb_share_counter <= out_hex0_s1_arb_share_counter_next_value;
    end


  //out_hex0_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          out_hex0_s1_slavearbiterlockenable <= 0;
      else if ((|out_hex0_s1_master_qreq_vector & end_xfer_arb_share_counter_term_out_hex0_s1) | (end_xfer_arb_share_counter_term_out_hex0_s1 & ~out_hex0_s1_non_bursting_master_requests))
          out_hex0_s1_slavearbiterlockenable <= |out_hex0_s1_arb_share_counter_next_value;
    end


  //cpu/data_master out_hex0/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = out_hex0_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //out_hex0_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign out_hex0_s1_slavearbiterlockenable2 = |out_hex0_s1_arb_share_counter_next_value;

  //cpu/data_master out_hex0/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = out_hex0_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //out_hex0_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign out_hex0_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_out_hex0_s1 = cpu_data_master_requests_out_hex0_s1 & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //out_hex0_s1_writedata mux, which is an e_mux
  assign out_hex0_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_out_hex0_s1 = cpu_data_master_qualified_request_out_hex0_s1;

  //cpu/data_master saved-grant out_hex0/s1, which is an e_assign
  assign cpu_data_master_saved_grant_out_hex0_s1 = cpu_data_master_requests_out_hex0_s1;

  //allow new arb cycle for out_hex0/s1, which is an e_assign
  assign out_hex0_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign out_hex0_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign out_hex0_s1_master_qreq_vector = 1;

  //out_hex0_s1_reset_n assignment, which is an e_assign
  assign out_hex0_s1_reset_n = reset_n;

  assign out_hex0_s1_chipselect = cpu_data_master_granted_out_hex0_s1;
  //out_hex0_s1_firsttransfer first transaction, which is an e_assign
  assign out_hex0_s1_firsttransfer = out_hex0_s1_begins_xfer ? out_hex0_s1_unreg_firsttransfer : out_hex0_s1_reg_firsttransfer;

  //out_hex0_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign out_hex0_s1_unreg_firsttransfer = ~(out_hex0_s1_slavearbiterlockenable & out_hex0_s1_any_continuerequest);

  //out_hex0_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          out_hex0_s1_reg_firsttransfer <= 1'b1;
      else if (out_hex0_s1_begins_xfer)
          out_hex0_s1_reg_firsttransfer <= out_hex0_s1_unreg_firsttransfer;
    end


  //out_hex0_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign out_hex0_s1_beginbursttransfer_internal = out_hex0_s1_begins_xfer;

  //~out_hex0_s1_write_n assignment, which is an e_mux
  assign out_hex0_s1_write_n = ~(cpu_data_master_granted_out_hex0_s1 & cpu_data_master_write);

  assign shifted_address_to_out_hex0_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //out_hex0_s1_address mux, which is an e_mux
  assign out_hex0_s1_address = shifted_address_to_out_hex0_s1_from_cpu_data_master >> 2;

  //d1_out_hex0_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_out_hex0_s1_end_xfer <= 1;
      else 
        d1_out_hex0_s1_end_xfer <= out_hex0_s1_end_xfer;
    end


  //out_hex0_s1_waits_for_read in a cycle, which is an e_mux
  assign out_hex0_s1_waits_for_read = out_hex0_s1_in_a_read_cycle & out_hex0_s1_begins_xfer;

  //out_hex0_s1_in_a_read_cycle assignment, which is an e_assign
  assign out_hex0_s1_in_a_read_cycle = cpu_data_master_granted_out_hex0_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = out_hex0_s1_in_a_read_cycle;

  //out_hex0_s1_waits_for_write in a cycle, which is an e_mux
  assign out_hex0_s1_waits_for_write = out_hex0_s1_in_a_write_cycle & 0;

  //out_hex0_s1_in_a_write_cycle assignment, which is an e_assign
  assign out_hex0_s1_in_a_write_cycle = cpu_data_master_granted_out_hex0_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = out_hex0_s1_in_a_write_cycle;

  assign wait_for_out_hex0_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //out_hex0/s1 enable non-zero assertions, which is an e_register
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

module out_hex1_s1_arbitrator (
                                // inputs:
                                 clk,
                                 cpu_data_master_address_to_slave,
                                 cpu_data_master_read,
                                 cpu_data_master_waitrequest,
                                 cpu_data_master_write,
                                 cpu_data_master_writedata,
                                 out_hex1_s1_readdata,
                                 reset_n,

                                // outputs:
                                 cpu_data_master_granted_out_hex1_s1,
                                 cpu_data_master_qualified_request_out_hex1_s1,
                                 cpu_data_master_read_data_valid_out_hex1_s1,
                                 cpu_data_master_requests_out_hex1_s1,
                                 d1_out_hex1_s1_end_xfer,
                                 out_hex1_s1_address,
                                 out_hex1_s1_chipselect,
                                 out_hex1_s1_readdata_from_sa,
                                 out_hex1_s1_reset_n,
                                 out_hex1_s1_write_n,
                                 out_hex1_s1_writedata
                              )
;

  output           cpu_data_master_granted_out_hex1_s1;
  output           cpu_data_master_qualified_request_out_hex1_s1;
  output           cpu_data_master_read_data_valid_out_hex1_s1;
  output           cpu_data_master_requests_out_hex1_s1;
  output           d1_out_hex1_s1_end_xfer;
  output  [  1: 0] out_hex1_s1_address;
  output           out_hex1_s1_chipselect;
  output  [  6: 0] out_hex1_s1_readdata_from_sa;
  output           out_hex1_s1_reset_n;
  output           out_hex1_s1_write_n;
  output  [  6: 0] out_hex1_s1_writedata;
  input            clk;
  input   [ 15: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [  6: 0] out_hex1_s1_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_out_hex1_s1;
  wire             cpu_data_master_qualified_request_out_hex1_s1;
  wire             cpu_data_master_read_data_valid_out_hex1_s1;
  wire             cpu_data_master_requests_out_hex1_s1;
  wire             cpu_data_master_saved_grant_out_hex1_s1;
  reg              d1_out_hex1_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_out_hex1_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] out_hex1_s1_address;
  wire             out_hex1_s1_allgrants;
  wire             out_hex1_s1_allow_new_arb_cycle;
  wire             out_hex1_s1_any_bursting_master_saved_grant;
  wire             out_hex1_s1_any_continuerequest;
  wire             out_hex1_s1_arb_counter_enable;
  reg              out_hex1_s1_arb_share_counter;
  wire             out_hex1_s1_arb_share_counter_next_value;
  wire             out_hex1_s1_arb_share_set_values;
  wire             out_hex1_s1_beginbursttransfer_internal;
  wire             out_hex1_s1_begins_xfer;
  wire             out_hex1_s1_chipselect;
  wire             out_hex1_s1_end_xfer;
  wire             out_hex1_s1_firsttransfer;
  wire             out_hex1_s1_grant_vector;
  wire             out_hex1_s1_in_a_read_cycle;
  wire             out_hex1_s1_in_a_write_cycle;
  wire             out_hex1_s1_master_qreq_vector;
  wire             out_hex1_s1_non_bursting_master_requests;
  wire    [  6: 0] out_hex1_s1_readdata_from_sa;
  reg              out_hex1_s1_reg_firsttransfer;
  wire             out_hex1_s1_reset_n;
  reg              out_hex1_s1_slavearbiterlockenable;
  wire             out_hex1_s1_slavearbiterlockenable2;
  wire             out_hex1_s1_unreg_firsttransfer;
  wire             out_hex1_s1_waits_for_read;
  wire             out_hex1_s1_waits_for_write;
  wire             out_hex1_s1_write_n;
  wire    [  6: 0] out_hex1_s1_writedata;
  wire    [ 15: 0] shifted_address_to_out_hex1_s1_from_cpu_data_master;
  wire             wait_for_out_hex1_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~out_hex1_s1_end_xfer;
    end


  assign out_hex1_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_out_hex1_s1));
  //assign out_hex1_s1_readdata_from_sa = out_hex1_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign out_hex1_s1_readdata_from_sa = out_hex1_s1_readdata;

  assign cpu_data_master_requests_out_hex1_s1 = ({cpu_data_master_address_to_slave[15 : 4] , 4'b0} == 16'h90c0) & (cpu_data_master_read | cpu_data_master_write);
  //out_hex1_s1_arb_share_counter set values, which is an e_mux
  assign out_hex1_s1_arb_share_set_values = 1;

  //out_hex1_s1_non_bursting_master_requests mux, which is an e_mux
  assign out_hex1_s1_non_bursting_master_requests = cpu_data_master_requests_out_hex1_s1;

  //out_hex1_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign out_hex1_s1_any_bursting_master_saved_grant = 0;

  //out_hex1_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign out_hex1_s1_arb_share_counter_next_value = out_hex1_s1_firsttransfer ? (out_hex1_s1_arb_share_set_values - 1) : |out_hex1_s1_arb_share_counter ? (out_hex1_s1_arb_share_counter - 1) : 0;

  //out_hex1_s1_allgrants all slave grants, which is an e_mux
  assign out_hex1_s1_allgrants = |out_hex1_s1_grant_vector;

  //out_hex1_s1_end_xfer assignment, which is an e_assign
  assign out_hex1_s1_end_xfer = ~(out_hex1_s1_waits_for_read | out_hex1_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_out_hex1_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_out_hex1_s1 = out_hex1_s1_end_xfer & (~out_hex1_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //out_hex1_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign out_hex1_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_out_hex1_s1 & out_hex1_s1_allgrants) | (end_xfer_arb_share_counter_term_out_hex1_s1 & ~out_hex1_s1_non_bursting_master_requests);

  //out_hex1_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          out_hex1_s1_arb_share_counter <= 0;
      else if (out_hex1_s1_arb_counter_enable)
          out_hex1_s1_arb_share_counter <= out_hex1_s1_arb_share_counter_next_value;
    end


  //out_hex1_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          out_hex1_s1_slavearbiterlockenable <= 0;
      else if ((|out_hex1_s1_master_qreq_vector & end_xfer_arb_share_counter_term_out_hex1_s1) | (end_xfer_arb_share_counter_term_out_hex1_s1 & ~out_hex1_s1_non_bursting_master_requests))
          out_hex1_s1_slavearbiterlockenable <= |out_hex1_s1_arb_share_counter_next_value;
    end


  //cpu/data_master out_hex1/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = out_hex1_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //out_hex1_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign out_hex1_s1_slavearbiterlockenable2 = |out_hex1_s1_arb_share_counter_next_value;

  //cpu/data_master out_hex1/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = out_hex1_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //out_hex1_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign out_hex1_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_out_hex1_s1 = cpu_data_master_requests_out_hex1_s1 & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //out_hex1_s1_writedata mux, which is an e_mux
  assign out_hex1_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_out_hex1_s1 = cpu_data_master_qualified_request_out_hex1_s1;

  //cpu/data_master saved-grant out_hex1/s1, which is an e_assign
  assign cpu_data_master_saved_grant_out_hex1_s1 = cpu_data_master_requests_out_hex1_s1;

  //allow new arb cycle for out_hex1/s1, which is an e_assign
  assign out_hex1_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign out_hex1_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign out_hex1_s1_master_qreq_vector = 1;

  //out_hex1_s1_reset_n assignment, which is an e_assign
  assign out_hex1_s1_reset_n = reset_n;

  assign out_hex1_s1_chipselect = cpu_data_master_granted_out_hex1_s1;
  //out_hex1_s1_firsttransfer first transaction, which is an e_assign
  assign out_hex1_s1_firsttransfer = out_hex1_s1_begins_xfer ? out_hex1_s1_unreg_firsttransfer : out_hex1_s1_reg_firsttransfer;

  //out_hex1_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign out_hex1_s1_unreg_firsttransfer = ~(out_hex1_s1_slavearbiterlockenable & out_hex1_s1_any_continuerequest);

  //out_hex1_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          out_hex1_s1_reg_firsttransfer <= 1'b1;
      else if (out_hex1_s1_begins_xfer)
          out_hex1_s1_reg_firsttransfer <= out_hex1_s1_unreg_firsttransfer;
    end


  //out_hex1_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign out_hex1_s1_beginbursttransfer_internal = out_hex1_s1_begins_xfer;

  //~out_hex1_s1_write_n assignment, which is an e_mux
  assign out_hex1_s1_write_n = ~(cpu_data_master_granted_out_hex1_s1 & cpu_data_master_write);

  assign shifted_address_to_out_hex1_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //out_hex1_s1_address mux, which is an e_mux
  assign out_hex1_s1_address = shifted_address_to_out_hex1_s1_from_cpu_data_master >> 2;

  //d1_out_hex1_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_out_hex1_s1_end_xfer <= 1;
      else 
        d1_out_hex1_s1_end_xfer <= out_hex1_s1_end_xfer;
    end


  //out_hex1_s1_waits_for_read in a cycle, which is an e_mux
  assign out_hex1_s1_waits_for_read = out_hex1_s1_in_a_read_cycle & out_hex1_s1_begins_xfer;

  //out_hex1_s1_in_a_read_cycle assignment, which is an e_assign
  assign out_hex1_s1_in_a_read_cycle = cpu_data_master_granted_out_hex1_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = out_hex1_s1_in_a_read_cycle;

  //out_hex1_s1_waits_for_write in a cycle, which is an e_mux
  assign out_hex1_s1_waits_for_write = out_hex1_s1_in_a_write_cycle & 0;

  //out_hex1_s1_in_a_write_cycle assignment, which is an e_assign
  assign out_hex1_s1_in_a_write_cycle = cpu_data_master_granted_out_hex1_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = out_hex1_s1_in_a_write_cycle;

  assign wait_for_out_hex1_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //out_hex1/s1 enable non-zero assertions, which is an e_register
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

module out_hex2_s1_arbitrator (
                                // inputs:
                                 clk,
                                 cpu_data_master_address_to_slave,
                                 cpu_data_master_read,
                                 cpu_data_master_waitrequest,
                                 cpu_data_master_write,
                                 cpu_data_master_writedata,
                                 out_hex2_s1_readdata,
                                 reset_n,

                                // outputs:
                                 cpu_data_master_granted_out_hex2_s1,
                                 cpu_data_master_qualified_request_out_hex2_s1,
                                 cpu_data_master_read_data_valid_out_hex2_s1,
                                 cpu_data_master_requests_out_hex2_s1,
                                 d1_out_hex2_s1_end_xfer,
                                 out_hex2_s1_address,
                                 out_hex2_s1_chipselect,
                                 out_hex2_s1_readdata_from_sa,
                                 out_hex2_s1_reset_n,
                                 out_hex2_s1_write_n,
                                 out_hex2_s1_writedata
                              )
;

  output           cpu_data_master_granted_out_hex2_s1;
  output           cpu_data_master_qualified_request_out_hex2_s1;
  output           cpu_data_master_read_data_valid_out_hex2_s1;
  output           cpu_data_master_requests_out_hex2_s1;
  output           d1_out_hex2_s1_end_xfer;
  output  [  1: 0] out_hex2_s1_address;
  output           out_hex2_s1_chipselect;
  output  [  6: 0] out_hex2_s1_readdata_from_sa;
  output           out_hex2_s1_reset_n;
  output           out_hex2_s1_write_n;
  output  [  6: 0] out_hex2_s1_writedata;
  input            clk;
  input   [ 15: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [  6: 0] out_hex2_s1_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_out_hex2_s1;
  wire             cpu_data_master_qualified_request_out_hex2_s1;
  wire             cpu_data_master_read_data_valid_out_hex2_s1;
  wire             cpu_data_master_requests_out_hex2_s1;
  wire             cpu_data_master_saved_grant_out_hex2_s1;
  reg              d1_out_hex2_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_out_hex2_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] out_hex2_s1_address;
  wire             out_hex2_s1_allgrants;
  wire             out_hex2_s1_allow_new_arb_cycle;
  wire             out_hex2_s1_any_bursting_master_saved_grant;
  wire             out_hex2_s1_any_continuerequest;
  wire             out_hex2_s1_arb_counter_enable;
  reg              out_hex2_s1_arb_share_counter;
  wire             out_hex2_s1_arb_share_counter_next_value;
  wire             out_hex2_s1_arb_share_set_values;
  wire             out_hex2_s1_beginbursttransfer_internal;
  wire             out_hex2_s1_begins_xfer;
  wire             out_hex2_s1_chipselect;
  wire             out_hex2_s1_end_xfer;
  wire             out_hex2_s1_firsttransfer;
  wire             out_hex2_s1_grant_vector;
  wire             out_hex2_s1_in_a_read_cycle;
  wire             out_hex2_s1_in_a_write_cycle;
  wire             out_hex2_s1_master_qreq_vector;
  wire             out_hex2_s1_non_bursting_master_requests;
  wire    [  6: 0] out_hex2_s1_readdata_from_sa;
  reg              out_hex2_s1_reg_firsttransfer;
  wire             out_hex2_s1_reset_n;
  reg              out_hex2_s1_slavearbiterlockenable;
  wire             out_hex2_s1_slavearbiterlockenable2;
  wire             out_hex2_s1_unreg_firsttransfer;
  wire             out_hex2_s1_waits_for_read;
  wire             out_hex2_s1_waits_for_write;
  wire             out_hex2_s1_write_n;
  wire    [  6: 0] out_hex2_s1_writedata;
  wire    [ 15: 0] shifted_address_to_out_hex2_s1_from_cpu_data_master;
  wire             wait_for_out_hex2_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~out_hex2_s1_end_xfer;
    end


  assign out_hex2_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_out_hex2_s1));
  //assign out_hex2_s1_readdata_from_sa = out_hex2_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign out_hex2_s1_readdata_from_sa = out_hex2_s1_readdata;

  assign cpu_data_master_requests_out_hex2_s1 = ({cpu_data_master_address_to_slave[15 : 4] , 4'b0} == 16'h90b0) & (cpu_data_master_read | cpu_data_master_write);
  //out_hex2_s1_arb_share_counter set values, which is an e_mux
  assign out_hex2_s1_arb_share_set_values = 1;

  //out_hex2_s1_non_bursting_master_requests mux, which is an e_mux
  assign out_hex2_s1_non_bursting_master_requests = cpu_data_master_requests_out_hex2_s1;

  //out_hex2_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign out_hex2_s1_any_bursting_master_saved_grant = 0;

  //out_hex2_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign out_hex2_s1_arb_share_counter_next_value = out_hex2_s1_firsttransfer ? (out_hex2_s1_arb_share_set_values - 1) : |out_hex2_s1_arb_share_counter ? (out_hex2_s1_arb_share_counter - 1) : 0;

  //out_hex2_s1_allgrants all slave grants, which is an e_mux
  assign out_hex2_s1_allgrants = |out_hex2_s1_grant_vector;

  //out_hex2_s1_end_xfer assignment, which is an e_assign
  assign out_hex2_s1_end_xfer = ~(out_hex2_s1_waits_for_read | out_hex2_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_out_hex2_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_out_hex2_s1 = out_hex2_s1_end_xfer & (~out_hex2_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //out_hex2_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign out_hex2_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_out_hex2_s1 & out_hex2_s1_allgrants) | (end_xfer_arb_share_counter_term_out_hex2_s1 & ~out_hex2_s1_non_bursting_master_requests);

  //out_hex2_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          out_hex2_s1_arb_share_counter <= 0;
      else if (out_hex2_s1_arb_counter_enable)
          out_hex2_s1_arb_share_counter <= out_hex2_s1_arb_share_counter_next_value;
    end


  //out_hex2_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          out_hex2_s1_slavearbiterlockenable <= 0;
      else if ((|out_hex2_s1_master_qreq_vector & end_xfer_arb_share_counter_term_out_hex2_s1) | (end_xfer_arb_share_counter_term_out_hex2_s1 & ~out_hex2_s1_non_bursting_master_requests))
          out_hex2_s1_slavearbiterlockenable <= |out_hex2_s1_arb_share_counter_next_value;
    end


  //cpu/data_master out_hex2/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = out_hex2_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //out_hex2_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign out_hex2_s1_slavearbiterlockenable2 = |out_hex2_s1_arb_share_counter_next_value;

  //cpu/data_master out_hex2/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = out_hex2_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //out_hex2_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign out_hex2_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_out_hex2_s1 = cpu_data_master_requests_out_hex2_s1 & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //out_hex2_s1_writedata mux, which is an e_mux
  assign out_hex2_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_out_hex2_s1 = cpu_data_master_qualified_request_out_hex2_s1;

  //cpu/data_master saved-grant out_hex2/s1, which is an e_assign
  assign cpu_data_master_saved_grant_out_hex2_s1 = cpu_data_master_requests_out_hex2_s1;

  //allow new arb cycle for out_hex2/s1, which is an e_assign
  assign out_hex2_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign out_hex2_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign out_hex2_s1_master_qreq_vector = 1;

  //out_hex2_s1_reset_n assignment, which is an e_assign
  assign out_hex2_s1_reset_n = reset_n;

  assign out_hex2_s1_chipselect = cpu_data_master_granted_out_hex2_s1;
  //out_hex2_s1_firsttransfer first transaction, which is an e_assign
  assign out_hex2_s1_firsttransfer = out_hex2_s1_begins_xfer ? out_hex2_s1_unreg_firsttransfer : out_hex2_s1_reg_firsttransfer;

  //out_hex2_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign out_hex2_s1_unreg_firsttransfer = ~(out_hex2_s1_slavearbiterlockenable & out_hex2_s1_any_continuerequest);

  //out_hex2_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          out_hex2_s1_reg_firsttransfer <= 1'b1;
      else if (out_hex2_s1_begins_xfer)
          out_hex2_s1_reg_firsttransfer <= out_hex2_s1_unreg_firsttransfer;
    end


  //out_hex2_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign out_hex2_s1_beginbursttransfer_internal = out_hex2_s1_begins_xfer;

  //~out_hex2_s1_write_n assignment, which is an e_mux
  assign out_hex2_s1_write_n = ~(cpu_data_master_granted_out_hex2_s1 & cpu_data_master_write);

  assign shifted_address_to_out_hex2_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //out_hex2_s1_address mux, which is an e_mux
  assign out_hex2_s1_address = shifted_address_to_out_hex2_s1_from_cpu_data_master >> 2;

  //d1_out_hex2_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_out_hex2_s1_end_xfer <= 1;
      else 
        d1_out_hex2_s1_end_xfer <= out_hex2_s1_end_xfer;
    end


  //out_hex2_s1_waits_for_read in a cycle, which is an e_mux
  assign out_hex2_s1_waits_for_read = out_hex2_s1_in_a_read_cycle & out_hex2_s1_begins_xfer;

  //out_hex2_s1_in_a_read_cycle assignment, which is an e_assign
  assign out_hex2_s1_in_a_read_cycle = cpu_data_master_granted_out_hex2_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = out_hex2_s1_in_a_read_cycle;

  //out_hex2_s1_waits_for_write in a cycle, which is an e_mux
  assign out_hex2_s1_waits_for_write = out_hex2_s1_in_a_write_cycle & 0;

  //out_hex2_s1_in_a_write_cycle assignment, which is an e_assign
  assign out_hex2_s1_in_a_write_cycle = cpu_data_master_granted_out_hex2_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = out_hex2_s1_in_a_write_cycle;

  assign wait_for_out_hex2_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //out_hex2/s1 enable non-zero assertions, which is an e_register
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

module out_hex4_s1_arbitrator (
                                // inputs:
                                 clk,
                                 cpu_data_master_address_to_slave,
                                 cpu_data_master_read,
                                 cpu_data_master_waitrequest,
                                 cpu_data_master_write,
                                 cpu_data_master_writedata,
                                 out_hex4_s1_readdata,
                                 reset_n,

                                // outputs:
                                 cpu_data_master_granted_out_hex4_s1,
                                 cpu_data_master_qualified_request_out_hex4_s1,
                                 cpu_data_master_read_data_valid_out_hex4_s1,
                                 cpu_data_master_requests_out_hex4_s1,
                                 d1_out_hex4_s1_end_xfer,
                                 out_hex4_s1_address,
                                 out_hex4_s1_chipselect,
                                 out_hex4_s1_readdata_from_sa,
                                 out_hex4_s1_reset_n,
                                 out_hex4_s1_write_n,
                                 out_hex4_s1_writedata
                              )
;

  output           cpu_data_master_granted_out_hex4_s1;
  output           cpu_data_master_qualified_request_out_hex4_s1;
  output           cpu_data_master_read_data_valid_out_hex4_s1;
  output           cpu_data_master_requests_out_hex4_s1;
  output           d1_out_hex4_s1_end_xfer;
  output  [  1: 0] out_hex4_s1_address;
  output           out_hex4_s1_chipselect;
  output  [  6: 0] out_hex4_s1_readdata_from_sa;
  output           out_hex4_s1_reset_n;
  output           out_hex4_s1_write_n;
  output  [  6: 0] out_hex4_s1_writedata;
  input            clk;
  input   [ 15: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [  6: 0] out_hex4_s1_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_out_hex4_s1;
  wire             cpu_data_master_qualified_request_out_hex4_s1;
  wire             cpu_data_master_read_data_valid_out_hex4_s1;
  wire             cpu_data_master_requests_out_hex4_s1;
  wire             cpu_data_master_saved_grant_out_hex4_s1;
  reg              d1_out_hex4_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_out_hex4_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] out_hex4_s1_address;
  wire             out_hex4_s1_allgrants;
  wire             out_hex4_s1_allow_new_arb_cycle;
  wire             out_hex4_s1_any_bursting_master_saved_grant;
  wire             out_hex4_s1_any_continuerequest;
  wire             out_hex4_s1_arb_counter_enable;
  reg              out_hex4_s1_arb_share_counter;
  wire             out_hex4_s1_arb_share_counter_next_value;
  wire             out_hex4_s1_arb_share_set_values;
  wire             out_hex4_s1_beginbursttransfer_internal;
  wire             out_hex4_s1_begins_xfer;
  wire             out_hex4_s1_chipselect;
  wire             out_hex4_s1_end_xfer;
  wire             out_hex4_s1_firsttransfer;
  wire             out_hex4_s1_grant_vector;
  wire             out_hex4_s1_in_a_read_cycle;
  wire             out_hex4_s1_in_a_write_cycle;
  wire             out_hex4_s1_master_qreq_vector;
  wire             out_hex4_s1_non_bursting_master_requests;
  wire    [  6: 0] out_hex4_s1_readdata_from_sa;
  reg              out_hex4_s1_reg_firsttransfer;
  wire             out_hex4_s1_reset_n;
  reg              out_hex4_s1_slavearbiterlockenable;
  wire             out_hex4_s1_slavearbiterlockenable2;
  wire             out_hex4_s1_unreg_firsttransfer;
  wire             out_hex4_s1_waits_for_read;
  wire             out_hex4_s1_waits_for_write;
  wire             out_hex4_s1_write_n;
  wire    [  6: 0] out_hex4_s1_writedata;
  wire    [ 15: 0] shifted_address_to_out_hex4_s1_from_cpu_data_master;
  wire             wait_for_out_hex4_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~out_hex4_s1_end_xfer;
    end


  assign out_hex4_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_out_hex4_s1));
  //assign out_hex4_s1_readdata_from_sa = out_hex4_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign out_hex4_s1_readdata_from_sa = out_hex4_s1_readdata;

  assign cpu_data_master_requests_out_hex4_s1 = ({cpu_data_master_address_to_slave[15 : 4] , 4'b0} == 16'h90a0) & (cpu_data_master_read | cpu_data_master_write);
  //out_hex4_s1_arb_share_counter set values, which is an e_mux
  assign out_hex4_s1_arb_share_set_values = 1;

  //out_hex4_s1_non_bursting_master_requests mux, which is an e_mux
  assign out_hex4_s1_non_bursting_master_requests = cpu_data_master_requests_out_hex4_s1;

  //out_hex4_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign out_hex4_s1_any_bursting_master_saved_grant = 0;

  //out_hex4_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign out_hex4_s1_arb_share_counter_next_value = out_hex4_s1_firsttransfer ? (out_hex4_s1_arb_share_set_values - 1) : |out_hex4_s1_arb_share_counter ? (out_hex4_s1_arb_share_counter - 1) : 0;

  //out_hex4_s1_allgrants all slave grants, which is an e_mux
  assign out_hex4_s1_allgrants = |out_hex4_s1_grant_vector;

  //out_hex4_s1_end_xfer assignment, which is an e_assign
  assign out_hex4_s1_end_xfer = ~(out_hex4_s1_waits_for_read | out_hex4_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_out_hex4_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_out_hex4_s1 = out_hex4_s1_end_xfer & (~out_hex4_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //out_hex4_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign out_hex4_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_out_hex4_s1 & out_hex4_s1_allgrants) | (end_xfer_arb_share_counter_term_out_hex4_s1 & ~out_hex4_s1_non_bursting_master_requests);

  //out_hex4_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          out_hex4_s1_arb_share_counter <= 0;
      else if (out_hex4_s1_arb_counter_enable)
          out_hex4_s1_arb_share_counter <= out_hex4_s1_arb_share_counter_next_value;
    end


  //out_hex4_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          out_hex4_s1_slavearbiterlockenable <= 0;
      else if ((|out_hex4_s1_master_qreq_vector & end_xfer_arb_share_counter_term_out_hex4_s1) | (end_xfer_arb_share_counter_term_out_hex4_s1 & ~out_hex4_s1_non_bursting_master_requests))
          out_hex4_s1_slavearbiterlockenable <= |out_hex4_s1_arb_share_counter_next_value;
    end


  //cpu/data_master out_hex4/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = out_hex4_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //out_hex4_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign out_hex4_s1_slavearbiterlockenable2 = |out_hex4_s1_arb_share_counter_next_value;

  //cpu/data_master out_hex4/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = out_hex4_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //out_hex4_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign out_hex4_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_out_hex4_s1 = cpu_data_master_requests_out_hex4_s1 & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //out_hex4_s1_writedata mux, which is an e_mux
  assign out_hex4_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_out_hex4_s1 = cpu_data_master_qualified_request_out_hex4_s1;

  //cpu/data_master saved-grant out_hex4/s1, which is an e_assign
  assign cpu_data_master_saved_grant_out_hex4_s1 = cpu_data_master_requests_out_hex4_s1;

  //allow new arb cycle for out_hex4/s1, which is an e_assign
  assign out_hex4_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign out_hex4_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign out_hex4_s1_master_qreq_vector = 1;

  //out_hex4_s1_reset_n assignment, which is an e_assign
  assign out_hex4_s1_reset_n = reset_n;

  assign out_hex4_s1_chipselect = cpu_data_master_granted_out_hex4_s1;
  //out_hex4_s1_firsttransfer first transaction, which is an e_assign
  assign out_hex4_s1_firsttransfer = out_hex4_s1_begins_xfer ? out_hex4_s1_unreg_firsttransfer : out_hex4_s1_reg_firsttransfer;

  //out_hex4_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign out_hex4_s1_unreg_firsttransfer = ~(out_hex4_s1_slavearbiterlockenable & out_hex4_s1_any_continuerequest);

  //out_hex4_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          out_hex4_s1_reg_firsttransfer <= 1'b1;
      else if (out_hex4_s1_begins_xfer)
          out_hex4_s1_reg_firsttransfer <= out_hex4_s1_unreg_firsttransfer;
    end


  //out_hex4_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign out_hex4_s1_beginbursttransfer_internal = out_hex4_s1_begins_xfer;

  //~out_hex4_s1_write_n assignment, which is an e_mux
  assign out_hex4_s1_write_n = ~(cpu_data_master_granted_out_hex4_s1 & cpu_data_master_write);

  assign shifted_address_to_out_hex4_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //out_hex4_s1_address mux, which is an e_mux
  assign out_hex4_s1_address = shifted_address_to_out_hex4_s1_from_cpu_data_master >> 2;

  //d1_out_hex4_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_out_hex4_s1_end_xfer <= 1;
      else 
        d1_out_hex4_s1_end_xfer <= out_hex4_s1_end_xfer;
    end


  //out_hex4_s1_waits_for_read in a cycle, which is an e_mux
  assign out_hex4_s1_waits_for_read = out_hex4_s1_in_a_read_cycle & out_hex4_s1_begins_xfer;

  //out_hex4_s1_in_a_read_cycle assignment, which is an e_assign
  assign out_hex4_s1_in_a_read_cycle = cpu_data_master_granted_out_hex4_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = out_hex4_s1_in_a_read_cycle;

  //out_hex4_s1_waits_for_write in a cycle, which is an e_mux
  assign out_hex4_s1_waits_for_write = out_hex4_s1_in_a_write_cycle & 0;

  //out_hex4_s1_in_a_write_cycle assignment, which is an e_assign
  assign out_hex4_s1_in_a_write_cycle = cpu_data_master_granted_out_hex4_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = out_hex4_s1_in_a_write_cycle;

  assign wait_for_out_hex4_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //out_hex4/s1 enable non-zero assertions, which is an e_register
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

module out_hex5_s1_arbitrator (
                                // inputs:
                                 clk,
                                 cpu_data_master_address_to_slave,
                                 cpu_data_master_read,
                                 cpu_data_master_waitrequest,
                                 cpu_data_master_write,
                                 cpu_data_master_writedata,
                                 out_hex5_s1_readdata,
                                 reset_n,

                                // outputs:
                                 cpu_data_master_granted_out_hex5_s1,
                                 cpu_data_master_qualified_request_out_hex5_s1,
                                 cpu_data_master_read_data_valid_out_hex5_s1,
                                 cpu_data_master_requests_out_hex5_s1,
                                 d1_out_hex5_s1_end_xfer,
                                 out_hex5_s1_address,
                                 out_hex5_s1_chipselect,
                                 out_hex5_s1_readdata_from_sa,
                                 out_hex5_s1_reset_n,
                                 out_hex5_s1_write_n,
                                 out_hex5_s1_writedata
                              )
;

  output           cpu_data_master_granted_out_hex5_s1;
  output           cpu_data_master_qualified_request_out_hex5_s1;
  output           cpu_data_master_read_data_valid_out_hex5_s1;
  output           cpu_data_master_requests_out_hex5_s1;
  output           d1_out_hex5_s1_end_xfer;
  output  [  1: 0] out_hex5_s1_address;
  output           out_hex5_s1_chipselect;
  output  [  6: 0] out_hex5_s1_readdata_from_sa;
  output           out_hex5_s1_reset_n;
  output           out_hex5_s1_write_n;
  output  [  6: 0] out_hex5_s1_writedata;
  input            clk;
  input   [ 15: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [  6: 0] out_hex5_s1_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_out_hex5_s1;
  wire             cpu_data_master_qualified_request_out_hex5_s1;
  wire             cpu_data_master_read_data_valid_out_hex5_s1;
  wire             cpu_data_master_requests_out_hex5_s1;
  wire             cpu_data_master_saved_grant_out_hex5_s1;
  reg              d1_out_hex5_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_out_hex5_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] out_hex5_s1_address;
  wire             out_hex5_s1_allgrants;
  wire             out_hex5_s1_allow_new_arb_cycle;
  wire             out_hex5_s1_any_bursting_master_saved_grant;
  wire             out_hex5_s1_any_continuerequest;
  wire             out_hex5_s1_arb_counter_enable;
  reg              out_hex5_s1_arb_share_counter;
  wire             out_hex5_s1_arb_share_counter_next_value;
  wire             out_hex5_s1_arb_share_set_values;
  wire             out_hex5_s1_beginbursttransfer_internal;
  wire             out_hex5_s1_begins_xfer;
  wire             out_hex5_s1_chipselect;
  wire             out_hex5_s1_end_xfer;
  wire             out_hex5_s1_firsttransfer;
  wire             out_hex5_s1_grant_vector;
  wire             out_hex5_s1_in_a_read_cycle;
  wire             out_hex5_s1_in_a_write_cycle;
  wire             out_hex5_s1_master_qreq_vector;
  wire             out_hex5_s1_non_bursting_master_requests;
  wire    [  6: 0] out_hex5_s1_readdata_from_sa;
  reg              out_hex5_s1_reg_firsttransfer;
  wire             out_hex5_s1_reset_n;
  reg              out_hex5_s1_slavearbiterlockenable;
  wire             out_hex5_s1_slavearbiterlockenable2;
  wire             out_hex5_s1_unreg_firsttransfer;
  wire             out_hex5_s1_waits_for_read;
  wire             out_hex5_s1_waits_for_write;
  wire             out_hex5_s1_write_n;
  wire    [  6: 0] out_hex5_s1_writedata;
  wire    [ 15: 0] shifted_address_to_out_hex5_s1_from_cpu_data_master;
  wire             wait_for_out_hex5_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~out_hex5_s1_end_xfer;
    end


  assign out_hex5_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_out_hex5_s1));
  //assign out_hex5_s1_readdata_from_sa = out_hex5_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign out_hex5_s1_readdata_from_sa = out_hex5_s1_readdata;

  assign cpu_data_master_requests_out_hex5_s1 = ({cpu_data_master_address_to_slave[15 : 4] , 4'b0} == 16'h9090) & (cpu_data_master_read | cpu_data_master_write);
  //out_hex5_s1_arb_share_counter set values, which is an e_mux
  assign out_hex5_s1_arb_share_set_values = 1;

  //out_hex5_s1_non_bursting_master_requests mux, which is an e_mux
  assign out_hex5_s1_non_bursting_master_requests = cpu_data_master_requests_out_hex5_s1;

  //out_hex5_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign out_hex5_s1_any_bursting_master_saved_grant = 0;

  //out_hex5_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign out_hex5_s1_arb_share_counter_next_value = out_hex5_s1_firsttransfer ? (out_hex5_s1_arb_share_set_values - 1) : |out_hex5_s1_arb_share_counter ? (out_hex5_s1_arb_share_counter - 1) : 0;

  //out_hex5_s1_allgrants all slave grants, which is an e_mux
  assign out_hex5_s1_allgrants = |out_hex5_s1_grant_vector;

  //out_hex5_s1_end_xfer assignment, which is an e_assign
  assign out_hex5_s1_end_xfer = ~(out_hex5_s1_waits_for_read | out_hex5_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_out_hex5_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_out_hex5_s1 = out_hex5_s1_end_xfer & (~out_hex5_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //out_hex5_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign out_hex5_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_out_hex5_s1 & out_hex5_s1_allgrants) | (end_xfer_arb_share_counter_term_out_hex5_s1 & ~out_hex5_s1_non_bursting_master_requests);

  //out_hex5_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          out_hex5_s1_arb_share_counter <= 0;
      else if (out_hex5_s1_arb_counter_enable)
          out_hex5_s1_arb_share_counter <= out_hex5_s1_arb_share_counter_next_value;
    end


  //out_hex5_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          out_hex5_s1_slavearbiterlockenable <= 0;
      else if ((|out_hex5_s1_master_qreq_vector & end_xfer_arb_share_counter_term_out_hex5_s1) | (end_xfer_arb_share_counter_term_out_hex5_s1 & ~out_hex5_s1_non_bursting_master_requests))
          out_hex5_s1_slavearbiterlockenable <= |out_hex5_s1_arb_share_counter_next_value;
    end


  //cpu/data_master out_hex5/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = out_hex5_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //out_hex5_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign out_hex5_s1_slavearbiterlockenable2 = |out_hex5_s1_arb_share_counter_next_value;

  //cpu/data_master out_hex5/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = out_hex5_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //out_hex5_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign out_hex5_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_out_hex5_s1 = cpu_data_master_requests_out_hex5_s1 & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //out_hex5_s1_writedata mux, which is an e_mux
  assign out_hex5_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_out_hex5_s1 = cpu_data_master_qualified_request_out_hex5_s1;

  //cpu/data_master saved-grant out_hex5/s1, which is an e_assign
  assign cpu_data_master_saved_grant_out_hex5_s1 = cpu_data_master_requests_out_hex5_s1;

  //allow new arb cycle for out_hex5/s1, which is an e_assign
  assign out_hex5_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign out_hex5_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign out_hex5_s1_master_qreq_vector = 1;

  //out_hex5_s1_reset_n assignment, which is an e_assign
  assign out_hex5_s1_reset_n = reset_n;

  assign out_hex5_s1_chipselect = cpu_data_master_granted_out_hex5_s1;
  //out_hex5_s1_firsttransfer first transaction, which is an e_assign
  assign out_hex5_s1_firsttransfer = out_hex5_s1_begins_xfer ? out_hex5_s1_unreg_firsttransfer : out_hex5_s1_reg_firsttransfer;

  //out_hex5_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign out_hex5_s1_unreg_firsttransfer = ~(out_hex5_s1_slavearbiterlockenable & out_hex5_s1_any_continuerequest);

  //out_hex5_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          out_hex5_s1_reg_firsttransfer <= 1'b1;
      else if (out_hex5_s1_begins_xfer)
          out_hex5_s1_reg_firsttransfer <= out_hex5_s1_unreg_firsttransfer;
    end


  //out_hex5_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign out_hex5_s1_beginbursttransfer_internal = out_hex5_s1_begins_xfer;

  //~out_hex5_s1_write_n assignment, which is an e_mux
  assign out_hex5_s1_write_n = ~(cpu_data_master_granted_out_hex5_s1 & cpu_data_master_write);

  assign shifted_address_to_out_hex5_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //out_hex5_s1_address mux, which is an e_mux
  assign out_hex5_s1_address = shifted_address_to_out_hex5_s1_from_cpu_data_master >> 2;

  //d1_out_hex5_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_out_hex5_s1_end_xfer <= 1;
      else 
        d1_out_hex5_s1_end_xfer <= out_hex5_s1_end_xfer;
    end


  //out_hex5_s1_waits_for_read in a cycle, which is an e_mux
  assign out_hex5_s1_waits_for_read = out_hex5_s1_in_a_read_cycle & out_hex5_s1_begins_xfer;

  //out_hex5_s1_in_a_read_cycle assignment, which is an e_assign
  assign out_hex5_s1_in_a_read_cycle = cpu_data_master_granted_out_hex5_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = out_hex5_s1_in_a_read_cycle;

  //out_hex5_s1_waits_for_write in a cycle, which is an e_mux
  assign out_hex5_s1_waits_for_write = out_hex5_s1_in_a_write_cycle & 0;

  //out_hex5_s1_in_a_write_cycle assignment, which is an e_assign
  assign out_hex5_s1_in_a_write_cycle = cpu_data_master_granted_out_hex5_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = out_hex5_s1_in_a_write_cycle;

  assign wait_for_out_hex5_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //out_hex5/s1 enable non-zero assertions, which is an e_register
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

module out_hex6_s1_arbitrator (
                                // inputs:
                                 clk,
                                 cpu_data_master_address_to_slave,
                                 cpu_data_master_read,
                                 cpu_data_master_waitrequest,
                                 cpu_data_master_write,
                                 cpu_data_master_writedata,
                                 out_hex6_s1_readdata,
                                 reset_n,

                                // outputs:
                                 cpu_data_master_granted_out_hex6_s1,
                                 cpu_data_master_qualified_request_out_hex6_s1,
                                 cpu_data_master_read_data_valid_out_hex6_s1,
                                 cpu_data_master_requests_out_hex6_s1,
                                 d1_out_hex6_s1_end_xfer,
                                 out_hex6_s1_address,
                                 out_hex6_s1_chipselect,
                                 out_hex6_s1_readdata_from_sa,
                                 out_hex6_s1_reset_n,
                                 out_hex6_s1_write_n,
                                 out_hex6_s1_writedata
                              )
;

  output           cpu_data_master_granted_out_hex6_s1;
  output           cpu_data_master_qualified_request_out_hex6_s1;
  output           cpu_data_master_read_data_valid_out_hex6_s1;
  output           cpu_data_master_requests_out_hex6_s1;
  output           d1_out_hex6_s1_end_xfer;
  output  [  1: 0] out_hex6_s1_address;
  output           out_hex6_s1_chipselect;
  output  [  6: 0] out_hex6_s1_readdata_from_sa;
  output           out_hex6_s1_reset_n;
  output           out_hex6_s1_write_n;
  output  [  6: 0] out_hex6_s1_writedata;
  input            clk;
  input   [ 15: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [  6: 0] out_hex6_s1_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_out_hex6_s1;
  wire             cpu_data_master_qualified_request_out_hex6_s1;
  wire             cpu_data_master_read_data_valid_out_hex6_s1;
  wire             cpu_data_master_requests_out_hex6_s1;
  wire             cpu_data_master_saved_grant_out_hex6_s1;
  reg              d1_out_hex6_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_out_hex6_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] out_hex6_s1_address;
  wire             out_hex6_s1_allgrants;
  wire             out_hex6_s1_allow_new_arb_cycle;
  wire             out_hex6_s1_any_bursting_master_saved_grant;
  wire             out_hex6_s1_any_continuerequest;
  wire             out_hex6_s1_arb_counter_enable;
  reg              out_hex6_s1_arb_share_counter;
  wire             out_hex6_s1_arb_share_counter_next_value;
  wire             out_hex6_s1_arb_share_set_values;
  wire             out_hex6_s1_beginbursttransfer_internal;
  wire             out_hex6_s1_begins_xfer;
  wire             out_hex6_s1_chipselect;
  wire             out_hex6_s1_end_xfer;
  wire             out_hex6_s1_firsttransfer;
  wire             out_hex6_s1_grant_vector;
  wire             out_hex6_s1_in_a_read_cycle;
  wire             out_hex6_s1_in_a_write_cycle;
  wire             out_hex6_s1_master_qreq_vector;
  wire             out_hex6_s1_non_bursting_master_requests;
  wire    [  6: 0] out_hex6_s1_readdata_from_sa;
  reg              out_hex6_s1_reg_firsttransfer;
  wire             out_hex6_s1_reset_n;
  reg              out_hex6_s1_slavearbiterlockenable;
  wire             out_hex6_s1_slavearbiterlockenable2;
  wire             out_hex6_s1_unreg_firsttransfer;
  wire             out_hex6_s1_waits_for_read;
  wire             out_hex6_s1_waits_for_write;
  wire             out_hex6_s1_write_n;
  wire    [  6: 0] out_hex6_s1_writedata;
  wire    [ 15: 0] shifted_address_to_out_hex6_s1_from_cpu_data_master;
  wire             wait_for_out_hex6_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~out_hex6_s1_end_xfer;
    end


  assign out_hex6_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_out_hex6_s1));
  //assign out_hex6_s1_readdata_from_sa = out_hex6_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign out_hex6_s1_readdata_from_sa = out_hex6_s1_readdata;

  assign cpu_data_master_requests_out_hex6_s1 = ({cpu_data_master_address_to_slave[15 : 4] , 4'b0} == 16'h9080) & (cpu_data_master_read | cpu_data_master_write);
  //out_hex6_s1_arb_share_counter set values, which is an e_mux
  assign out_hex6_s1_arb_share_set_values = 1;

  //out_hex6_s1_non_bursting_master_requests mux, which is an e_mux
  assign out_hex6_s1_non_bursting_master_requests = cpu_data_master_requests_out_hex6_s1;

  //out_hex6_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign out_hex6_s1_any_bursting_master_saved_grant = 0;

  //out_hex6_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign out_hex6_s1_arb_share_counter_next_value = out_hex6_s1_firsttransfer ? (out_hex6_s1_arb_share_set_values - 1) : |out_hex6_s1_arb_share_counter ? (out_hex6_s1_arb_share_counter - 1) : 0;

  //out_hex6_s1_allgrants all slave grants, which is an e_mux
  assign out_hex6_s1_allgrants = |out_hex6_s1_grant_vector;

  //out_hex6_s1_end_xfer assignment, which is an e_assign
  assign out_hex6_s1_end_xfer = ~(out_hex6_s1_waits_for_read | out_hex6_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_out_hex6_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_out_hex6_s1 = out_hex6_s1_end_xfer & (~out_hex6_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //out_hex6_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign out_hex6_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_out_hex6_s1 & out_hex6_s1_allgrants) | (end_xfer_arb_share_counter_term_out_hex6_s1 & ~out_hex6_s1_non_bursting_master_requests);

  //out_hex6_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          out_hex6_s1_arb_share_counter <= 0;
      else if (out_hex6_s1_arb_counter_enable)
          out_hex6_s1_arb_share_counter <= out_hex6_s1_arb_share_counter_next_value;
    end


  //out_hex6_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          out_hex6_s1_slavearbiterlockenable <= 0;
      else if ((|out_hex6_s1_master_qreq_vector & end_xfer_arb_share_counter_term_out_hex6_s1) | (end_xfer_arb_share_counter_term_out_hex6_s1 & ~out_hex6_s1_non_bursting_master_requests))
          out_hex6_s1_slavearbiterlockenable <= |out_hex6_s1_arb_share_counter_next_value;
    end


  //cpu/data_master out_hex6/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = out_hex6_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //out_hex6_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign out_hex6_s1_slavearbiterlockenable2 = |out_hex6_s1_arb_share_counter_next_value;

  //cpu/data_master out_hex6/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = out_hex6_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //out_hex6_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign out_hex6_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_out_hex6_s1 = cpu_data_master_requests_out_hex6_s1 & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //out_hex6_s1_writedata mux, which is an e_mux
  assign out_hex6_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_out_hex6_s1 = cpu_data_master_qualified_request_out_hex6_s1;

  //cpu/data_master saved-grant out_hex6/s1, which is an e_assign
  assign cpu_data_master_saved_grant_out_hex6_s1 = cpu_data_master_requests_out_hex6_s1;

  //allow new arb cycle for out_hex6/s1, which is an e_assign
  assign out_hex6_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign out_hex6_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign out_hex6_s1_master_qreq_vector = 1;

  //out_hex6_s1_reset_n assignment, which is an e_assign
  assign out_hex6_s1_reset_n = reset_n;

  assign out_hex6_s1_chipselect = cpu_data_master_granted_out_hex6_s1;
  //out_hex6_s1_firsttransfer first transaction, which is an e_assign
  assign out_hex6_s1_firsttransfer = out_hex6_s1_begins_xfer ? out_hex6_s1_unreg_firsttransfer : out_hex6_s1_reg_firsttransfer;

  //out_hex6_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign out_hex6_s1_unreg_firsttransfer = ~(out_hex6_s1_slavearbiterlockenable & out_hex6_s1_any_continuerequest);

  //out_hex6_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          out_hex6_s1_reg_firsttransfer <= 1'b1;
      else if (out_hex6_s1_begins_xfer)
          out_hex6_s1_reg_firsttransfer <= out_hex6_s1_unreg_firsttransfer;
    end


  //out_hex6_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign out_hex6_s1_beginbursttransfer_internal = out_hex6_s1_begins_xfer;

  //~out_hex6_s1_write_n assignment, which is an e_mux
  assign out_hex6_s1_write_n = ~(cpu_data_master_granted_out_hex6_s1 & cpu_data_master_write);

  assign shifted_address_to_out_hex6_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //out_hex6_s1_address mux, which is an e_mux
  assign out_hex6_s1_address = shifted_address_to_out_hex6_s1_from_cpu_data_master >> 2;

  //d1_out_hex6_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_out_hex6_s1_end_xfer <= 1;
      else 
        d1_out_hex6_s1_end_xfer <= out_hex6_s1_end_xfer;
    end


  //out_hex6_s1_waits_for_read in a cycle, which is an e_mux
  assign out_hex6_s1_waits_for_read = out_hex6_s1_in_a_read_cycle & out_hex6_s1_begins_xfer;

  //out_hex6_s1_in_a_read_cycle assignment, which is an e_assign
  assign out_hex6_s1_in_a_read_cycle = cpu_data_master_granted_out_hex6_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = out_hex6_s1_in_a_read_cycle;

  //out_hex6_s1_waits_for_write in a cycle, which is an e_mux
  assign out_hex6_s1_waits_for_write = out_hex6_s1_in_a_write_cycle & 0;

  //out_hex6_s1_in_a_write_cycle assignment, which is an e_assign
  assign out_hex6_s1_in_a_write_cycle = cpu_data_master_granted_out_hex6_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = out_hex6_s1_in_a_write_cycle;

  assign wait_for_out_hex6_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //out_hex6/s1 enable non-zero assertions, which is an e_register
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

module out_hex7_s1_arbitrator (
                                // inputs:
                                 clk,
                                 cpu_data_master_address_to_slave,
                                 cpu_data_master_read,
                                 cpu_data_master_waitrequest,
                                 cpu_data_master_write,
                                 cpu_data_master_writedata,
                                 out_hex7_s1_readdata,
                                 reset_n,

                                // outputs:
                                 cpu_data_master_granted_out_hex7_s1,
                                 cpu_data_master_qualified_request_out_hex7_s1,
                                 cpu_data_master_read_data_valid_out_hex7_s1,
                                 cpu_data_master_requests_out_hex7_s1,
                                 d1_out_hex7_s1_end_xfer,
                                 out_hex7_s1_address,
                                 out_hex7_s1_chipselect,
                                 out_hex7_s1_readdata_from_sa,
                                 out_hex7_s1_reset_n,
                                 out_hex7_s1_write_n,
                                 out_hex7_s1_writedata
                              )
;

  output           cpu_data_master_granted_out_hex7_s1;
  output           cpu_data_master_qualified_request_out_hex7_s1;
  output           cpu_data_master_read_data_valid_out_hex7_s1;
  output           cpu_data_master_requests_out_hex7_s1;
  output           d1_out_hex7_s1_end_xfer;
  output  [  1: 0] out_hex7_s1_address;
  output           out_hex7_s1_chipselect;
  output  [  6: 0] out_hex7_s1_readdata_from_sa;
  output           out_hex7_s1_reset_n;
  output           out_hex7_s1_write_n;
  output  [  6: 0] out_hex7_s1_writedata;
  input            clk;
  input   [ 15: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [  6: 0] out_hex7_s1_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_out_hex7_s1;
  wire             cpu_data_master_qualified_request_out_hex7_s1;
  wire             cpu_data_master_read_data_valid_out_hex7_s1;
  wire             cpu_data_master_requests_out_hex7_s1;
  wire             cpu_data_master_saved_grant_out_hex7_s1;
  reg              d1_out_hex7_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_out_hex7_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] out_hex7_s1_address;
  wire             out_hex7_s1_allgrants;
  wire             out_hex7_s1_allow_new_arb_cycle;
  wire             out_hex7_s1_any_bursting_master_saved_grant;
  wire             out_hex7_s1_any_continuerequest;
  wire             out_hex7_s1_arb_counter_enable;
  reg              out_hex7_s1_arb_share_counter;
  wire             out_hex7_s1_arb_share_counter_next_value;
  wire             out_hex7_s1_arb_share_set_values;
  wire             out_hex7_s1_beginbursttransfer_internal;
  wire             out_hex7_s1_begins_xfer;
  wire             out_hex7_s1_chipselect;
  wire             out_hex7_s1_end_xfer;
  wire             out_hex7_s1_firsttransfer;
  wire             out_hex7_s1_grant_vector;
  wire             out_hex7_s1_in_a_read_cycle;
  wire             out_hex7_s1_in_a_write_cycle;
  wire             out_hex7_s1_master_qreq_vector;
  wire             out_hex7_s1_non_bursting_master_requests;
  wire    [  6: 0] out_hex7_s1_readdata_from_sa;
  reg              out_hex7_s1_reg_firsttransfer;
  wire             out_hex7_s1_reset_n;
  reg              out_hex7_s1_slavearbiterlockenable;
  wire             out_hex7_s1_slavearbiterlockenable2;
  wire             out_hex7_s1_unreg_firsttransfer;
  wire             out_hex7_s1_waits_for_read;
  wire             out_hex7_s1_waits_for_write;
  wire             out_hex7_s1_write_n;
  wire    [  6: 0] out_hex7_s1_writedata;
  wire    [ 15: 0] shifted_address_to_out_hex7_s1_from_cpu_data_master;
  wire             wait_for_out_hex7_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~out_hex7_s1_end_xfer;
    end


  assign out_hex7_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_out_hex7_s1));
  //assign out_hex7_s1_readdata_from_sa = out_hex7_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign out_hex7_s1_readdata_from_sa = out_hex7_s1_readdata;

  assign cpu_data_master_requests_out_hex7_s1 = ({cpu_data_master_address_to_slave[15 : 4] , 4'b0} == 16'h9070) & (cpu_data_master_read | cpu_data_master_write);
  //out_hex7_s1_arb_share_counter set values, which is an e_mux
  assign out_hex7_s1_arb_share_set_values = 1;

  //out_hex7_s1_non_bursting_master_requests mux, which is an e_mux
  assign out_hex7_s1_non_bursting_master_requests = cpu_data_master_requests_out_hex7_s1;

  //out_hex7_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign out_hex7_s1_any_bursting_master_saved_grant = 0;

  //out_hex7_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign out_hex7_s1_arb_share_counter_next_value = out_hex7_s1_firsttransfer ? (out_hex7_s1_arb_share_set_values - 1) : |out_hex7_s1_arb_share_counter ? (out_hex7_s1_arb_share_counter - 1) : 0;

  //out_hex7_s1_allgrants all slave grants, which is an e_mux
  assign out_hex7_s1_allgrants = |out_hex7_s1_grant_vector;

  //out_hex7_s1_end_xfer assignment, which is an e_assign
  assign out_hex7_s1_end_xfer = ~(out_hex7_s1_waits_for_read | out_hex7_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_out_hex7_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_out_hex7_s1 = out_hex7_s1_end_xfer & (~out_hex7_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //out_hex7_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign out_hex7_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_out_hex7_s1 & out_hex7_s1_allgrants) | (end_xfer_arb_share_counter_term_out_hex7_s1 & ~out_hex7_s1_non_bursting_master_requests);

  //out_hex7_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          out_hex7_s1_arb_share_counter <= 0;
      else if (out_hex7_s1_arb_counter_enable)
          out_hex7_s1_arb_share_counter <= out_hex7_s1_arb_share_counter_next_value;
    end


  //out_hex7_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          out_hex7_s1_slavearbiterlockenable <= 0;
      else if ((|out_hex7_s1_master_qreq_vector & end_xfer_arb_share_counter_term_out_hex7_s1) | (end_xfer_arb_share_counter_term_out_hex7_s1 & ~out_hex7_s1_non_bursting_master_requests))
          out_hex7_s1_slavearbiterlockenable <= |out_hex7_s1_arb_share_counter_next_value;
    end


  //cpu/data_master out_hex7/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = out_hex7_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //out_hex7_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign out_hex7_s1_slavearbiterlockenable2 = |out_hex7_s1_arb_share_counter_next_value;

  //cpu/data_master out_hex7/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = out_hex7_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //out_hex7_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign out_hex7_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_out_hex7_s1 = cpu_data_master_requests_out_hex7_s1 & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //out_hex7_s1_writedata mux, which is an e_mux
  assign out_hex7_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_out_hex7_s1 = cpu_data_master_qualified_request_out_hex7_s1;

  //cpu/data_master saved-grant out_hex7/s1, which is an e_assign
  assign cpu_data_master_saved_grant_out_hex7_s1 = cpu_data_master_requests_out_hex7_s1;

  //allow new arb cycle for out_hex7/s1, which is an e_assign
  assign out_hex7_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign out_hex7_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign out_hex7_s1_master_qreq_vector = 1;

  //out_hex7_s1_reset_n assignment, which is an e_assign
  assign out_hex7_s1_reset_n = reset_n;

  assign out_hex7_s1_chipselect = cpu_data_master_granted_out_hex7_s1;
  //out_hex7_s1_firsttransfer first transaction, which is an e_assign
  assign out_hex7_s1_firsttransfer = out_hex7_s1_begins_xfer ? out_hex7_s1_unreg_firsttransfer : out_hex7_s1_reg_firsttransfer;

  //out_hex7_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign out_hex7_s1_unreg_firsttransfer = ~(out_hex7_s1_slavearbiterlockenable & out_hex7_s1_any_continuerequest);

  //out_hex7_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          out_hex7_s1_reg_firsttransfer <= 1'b1;
      else if (out_hex7_s1_begins_xfer)
          out_hex7_s1_reg_firsttransfer <= out_hex7_s1_unreg_firsttransfer;
    end


  //out_hex7_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign out_hex7_s1_beginbursttransfer_internal = out_hex7_s1_begins_xfer;

  //~out_hex7_s1_write_n assignment, which is an e_mux
  assign out_hex7_s1_write_n = ~(cpu_data_master_granted_out_hex7_s1 & cpu_data_master_write);

  assign shifted_address_to_out_hex7_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //out_hex7_s1_address mux, which is an e_mux
  assign out_hex7_s1_address = shifted_address_to_out_hex7_s1_from_cpu_data_master >> 2;

  //d1_out_hex7_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_out_hex7_s1_end_xfer <= 1;
      else 
        d1_out_hex7_s1_end_xfer <= out_hex7_s1_end_xfer;
    end


  //out_hex7_s1_waits_for_read in a cycle, which is an e_mux
  assign out_hex7_s1_waits_for_read = out_hex7_s1_in_a_read_cycle & out_hex7_s1_begins_xfer;

  //out_hex7_s1_in_a_read_cycle assignment, which is an e_assign
  assign out_hex7_s1_in_a_read_cycle = cpu_data_master_granted_out_hex7_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = out_hex7_s1_in_a_read_cycle;

  //out_hex7_s1_waits_for_write in a cycle, which is an e_mux
  assign out_hex7_s1_waits_for_write = out_hex7_s1_in_a_write_cycle & 0;

  //out_hex7_s1_in_a_write_cycle assignment, which is an e_assign
  assign out_hex7_s1_in_a_write_cycle = cpu_data_master_granted_out_hex7_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = out_hex7_s1_in_a_write_cycle;

  assign wait_for_out_hex7_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //out_hex7/s1 enable non-zero assertions, which is an e_register
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

                // the_inp_buy_finish
                 in_port_to_the_inp_buy_finish,

                // the_inp_cancel_buy
                 in_port_to_the_inp_cancel_buy,

                // the_inp_confirm_buy
                 in_port_to_the_inp_confirm_buy,

                // the_inp_the_goods
                 in_port_to_the_inp_the_goods,

                // the_inp_the_money
                 in_port_to_the_inp_the_money,

                // the_out_buy_success
                 out_port_from_the_out_buy_success,

                // the_out_enough_money
                 out_port_from_the_out_enough_money,

                // the_out_hex0
                 out_port_from_the_out_hex0,

                // the_out_hex1
                 out_port_from_the_out_hex1,

                // the_out_hex2
                 out_port_from_the_out_hex2,

                // the_out_hex4
                 out_port_from_the_out_hex4,

                // the_out_hex5
                 out_port_from_the_out_hex5,

                // the_out_hex6
                 out_port_from_the_out_hex6,

                // the_out_hex7
                 out_port_from_the_out_hex7
              )
;

  output           out_port_from_the_out_buy_success;
  output           out_port_from_the_out_enough_money;
  output  [  6: 0] out_port_from_the_out_hex0;
  output  [  6: 0] out_port_from_the_out_hex1;
  output  [  6: 0] out_port_from_the_out_hex2;
  output  [  6: 0] out_port_from_the_out_hex4;
  output  [  6: 0] out_port_from_the_out_hex5;
  output  [  6: 0] out_port_from_the_out_hex6;
  output  [  6: 0] out_port_from_the_out_hex7;
  input            clk_0;
  input            in_port_to_the_inp_buy_finish;
  input            in_port_to_the_inp_cancel_buy;
  input            in_port_to_the_inp_confirm_buy;
  input   [  2: 0] in_port_to_the_inp_the_goods;
  input   [  2: 0] in_port_to_the_inp_the_money;
  input            reset_n;

  wire             clk_0_reset_n;
  wire    [ 15: 0] cpu_data_master_address;
  wire    [ 15: 0] cpu_data_master_address_to_slave;
  wire    [  3: 0] cpu_data_master_byteenable;
  wire             cpu_data_master_debugaccess;
  wire             cpu_data_master_granted_cpu_jtag_debug_module;
  wire             cpu_data_master_granted_inp_buy_finish_s1;
  wire             cpu_data_master_granted_inp_cancel_buy_s1;
  wire             cpu_data_master_granted_inp_confirm_buy_s1;
  wire             cpu_data_master_granted_inp_the_goods_s1;
  wire             cpu_data_master_granted_inp_the_money_s1;
  wire             cpu_data_master_granted_onchip_memory_s1;
  wire             cpu_data_master_granted_out_buy_success_s1;
  wire             cpu_data_master_granted_out_enough_money_s1;
  wire             cpu_data_master_granted_out_hex0_s1;
  wire             cpu_data_master_granted_out_hex1_s1;
  wire             cpu_data_master_granted_out_hex2_s1;
  wire             cpu_data_master_granted_out_hex4_s1;
  wire             cpu_data_master_granted_out_hex5_s1;
  wire             cpu_data_master_granted_out_hex6_s1;
  wire             cpu_data_master_granted_out_hex7_s1;
  wire    [ 31: 0] cpu_data_master_irq;
  wire             cpu_data_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_data_master_qualified_request_inp_buy_finish_s1;
  wire             cpu_data_master_qualified_request_inp_cancel_buy_s1;
  wire             cpu_data_master_qualified_request_inp_confirm_buy_s1;
  wire             cpu_data_master_qualified_request_inp_the_goods_s1;
  wire             cpu_data_master_qualified_request_inp_the_money_s1;
  wire             cpu_data_master_qualified_request_onchip_memory_s1;
  wire             cpu_data_master_qualified_request_out_buy_success_s1;
  wire             cpu_data_master_qualified_request_out_enough_money_s1;
  wire             cpu_data_master_qualified_request_out_hex0_s1;
  wire             cpu_data_master_qualified_request_out_hex1_s1;
  wire             cpu_data_master_qualified_request_out_hex2_s1;
  wire             cpu_data_master_qualified_request_out_hex4_s1;
  wire             cpu_data_master_qualified_request_out_hex5_s1;
  wire             cpu_data_master_qualified_request_out_hex6_s1;
  wire             cpu_data_master_qualified_request_out_hex7_s1;
  wire             cpu_data_master_read;
  wire             cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_data_master_read_data_valid_inp_buy_finish_s1;
  wire             cpu_data_master_read_data_valid_inp_cancel_buy_s1;
  wire             cpu_data_master_read_data_valid_inp_confirm_buy_s1;
  wire             cpu_data_master_read_data_valid_inp_the_goods_s1;
  wire             cpu_data_master_read_data_valid_inp_the_money_s1;
  wire             cpu_data_master_read_data_valid_onchip_memory_s1;
  wire             cpu_data_master_read_data_valid_out_buy_success_s1;
  wire             cpu_data_master_read_data_valid_out_enough_money_s1;
  wire             cpu_data_master_read_data_valid_out_hex0_s1;
  wire             cpu_data_master_read_data_valid_out_hex1_s1;
  wire             cpu_data_master_read_data_valid_out_hex2_s1;
  wire             cpu_data_master_read_data_valid_out_hex4_s1;
  wire             cpu_data_master_read_data_valid_out_hex5_s1;
  wire             cpu_data_master_read_data_valid_out_hex6_s1;
  wire             cpu_data_master_read_data_valid_out_hex7_s1;
  wire    [ 31: 0] cpu_data_master_readdata;
  wire             cpu_data_master_requests_cpu_jtag_debug_module;
  wire             cpu_data_master_requests_inp_buy_finish_s1;
  wire             cpu_data_master_requests_inp_cancel_buy_s1;
  wire             cpu_data_master_requests_inp_confirm_buy_s1;
  wire             cpu_data_master_requests_inp_the_goods_s1;
  wire             cpu_data_master_requests_inp_the_money_s1;
  wire             cpu_data_master_requests_onchip_memory_s1;
  wire             cpu_data_master_requests_out_buy_success_s1;
  wire             cpu_data_master_requests_out_enough_money_s1;
  wire             cpu_data_master_requests_out_hex0_s1;
  wire             cpu_data_master_requests_out_hex1_s1;
  wire             cpu_data_master_requests_out_hex2_s1;
  wire             cpu_data_master_requests_out_hex4_s1;
  wire             cpu_data_master_requests_out_hex5_s1;
  wire             cpu_data_master_requests_out_hex6_s1;
  wire             cpu_data_master_requests_out_hex7_s1;
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
  wire             d1_inp_buy_finish_s1_end_xfer;
  wire             d1_inp_cancel_buy_s1_end_xfer;
  wire             d1_inp_confirm_buy_s1_end_xfer;
  wire             d1_inp_the_goods_s1_end_xfer;
  wire             d1_inp_the_money_s1_end_xfer;
  wire             d1_onchip_memory_s1_end_xfer;
  wire             d1_out_buy_success_s1_end_xfer;
  wire             d1_out_enough_money_s1_end_xfer;
  wire             d1_out_hex0_s1_end_xfer;
  wire             d1_out_hex1_s1_end_xfer;
  wire             d1_out_hex2_s1_end_xfer;
  wire             d1_out_hex4_s1_end_xfer;
  wire             d1_out_hex5_s1_end_xfer;
  wire             d1_out_hex6_s1_end_xfer;
  wire             d1_out_hex7_s1_end_xfer;
  wire    [  1: 0] inp_buy_finish_s1_address;
  wire             inp_buy_finish_s1_chipselect;
  wire             inp_buy_finish_s1_irq;
  wire             inp_buy_finish_s1_irq_from_sa;
  wire             inp_buy_finish_s1_readdata;
  wire             inp_buy_finish_s1_readdata_from_sa;
  wire             inp_buy_finish_s1_reset_n;
  wire             inp_buy_finish_s1_write_n;
  wire             inp_buy_finish_s1_writedata;
  wire    [  1: 0] inp_cancel_buy_s1_address;
  wire             inp_cancel_buy_s1_chipselect;
  wire             inp_cancel_buy_s1_irq;
  wire             inp_cancel_buy_s1_irq_from_sa;
  wire             inp_cancel_buy_s1_readdata;
  wire             inp_cancel_buy_s1_readdata_from_sa;
  wire             inp_cancel_buy_s1_reset_n;
  wire             inp_cancel_buy_s1_write_n;
  wire             inp_cancel_buy_s1_writedata;
  wire    [  1: 0] inp_confirm_buy_s1_address;
  wire             inp_confirm_buy_s1_chipselect;
  wire             inp_confirm_buy_s1_irq;
  wire             inp_confirm_buy_s1_irq_from_sa;
  wire             inp_confirm_buy_s1_readdata;
  wire             inp_confirm_buy_s1_readdata_from_sa;
  wire             inp_confirm_buy_s1_reset_n;
  wire             inp_confirm_buy_s1_write_n;
  wire             inp_confirm_buy_s1_writedata;
  wire    [  1: 0] inp_the_goods_s1_address;
  wire             inp_the_goods_s1_chipselect;
  wire             inp_the_goods_s1_irq;
  wire             inp_the_goods_s1_irq_from_sa;
  wire    [  2: 0] inp_the_goods_s1_readdata;
  wire    [  2: 0] inp_the_goods_s1_readdata_from_sa;
  wire             inp_the_goods_s1_reset_n;
  wire             inp_the_goods_s1_write_n;
  wire    [  2: 0] inp_the_goods_s1_writedata;
  wire    [  1: 0] inp_the_money_s1_address;
  wire             inp_the_money_s1_chipselect;
  wire             inp_the_money_s1_irq;
  wire             inp_the_money_s1_irq_from_sa;
  wire    [  2: 0] inp_the_money_s1_readdata;
  wire    [  2: 0] inp_the_money_s1_readdata_from_sa;
  wire             inp_the_money_s1_reset_n;
  wire             inp_the_money_s1_write_n;
  wire    [  2: 0] inp_the_money_s1_writedata;
  wire    [ 12: 0] onchip_memory_s1_address;
  wire    [  3: 0] onchip_memory_s1_byteenable;
  wire             onchip_memory_s1_chipselect;
  wire             onchip_memory_s1_clken;
  wire    [ 31: 0] onchip_memory_s1_readdata;
  wire    [ 31: 0] onchip_memory_s1_readdata_from_sa;
  wire             onchip_memory_s1_write;
  wire    [ 31: 0] onchip_memory_s1_writedata;
  wire    [  1: 0] out_buy_success_s1_address;
  wire             out_buy_success_s1_chipselect;
  wire             out_buy_success_s1_readdata;
  wire             out_buy_success_s1_readdata_from_sa;
  wire             out_buy_success_s1_reset_n;
  wire             out_buy_success_s1_write_n;
  wire             out_buy_success_s1_writedata;
  wire    [  1: 0] out_enough_money_s1_address;
  wire             out_enough_money_s1_chipselect;
  wire             out_enough_money_s1_readdata;
  wire             out_enough_money_s1_readdata_from_sa;
  wire             out_enough_money_s1_reset_n;
  wire             out_enough_money_s1_write_n;
  wire             out_enough_money_s1_writedata;
  wire    [  1: 0] out_hex0_s1_address;
  wire             out_hex0_s1_chipselect;
  wire    [  6: 0] out_hex0_s1_readdata;
  wire    [  6: 0] out_hex0_s1_readdata_from_sa;
  wire             out_hex0_s1_reset_n;
  wire             out_hex0_s1_write_n;
  wire    [  6: 0] out_hex0_s1_writedata;
  wire    [  1: 0] out_hex1_s1_address;
  wire             out_hex1_s1_chipselect;
  wire    [  6: 0] out_hex1_s1_readdata;
  wire    [  6: 0] out_hex1_s1_readdata_from_sa;
  wire             out_hex1_s1_reset_n;
  wire             out_hex1_s1_write_n;
  wire    [  6: 0] out_hex1_s1_writedata;
  wire    [  1: 0] out_hex2_s1_address;
  wire             out_hex2_s1_chipselect;
  wire    [  6: 0] out_hex2_s1_readdata;
  wire    [  6: 0] out_hex2_s1_readdata_from_sa;
  wire             out_hex2_s1_reset_n;
  wire             out_hex2_s1_write_n;
  wire    [  6: 0] out_hex2_s1_writedata;
  wire    [  1: 0] out_hex4_s1_address;
  wire             out_hex4_s1_chipselect;
  wire    [  6: 0] out_hex4_s1_readdata;
  wire    [  6: 0] out_hex4_s1_readdata_from_sa;
  wire             out_hex4_s1_reset_n;
  wire             out_hex4_s1_write_n;
  wire    [  6: 0] out_hex4_s1_writedata;
  wire    [  1: 0] out_hex5_s1_address;
  wire             out_hex5_s1_chipselect;
  wire    [  6: 0] out_hex5_s1_readdata;
  wire    [  6: 0] out_hex5_s1_readdata_from_sa;
  wire             out_hex5_s1_reset_n;
  wire             out_hex5_s1_write_n;
  wire    [  6: 0] out_hex5_s1_writedata;
  wire    [  1: 0] out_hex6_s1_address;
  wire             out_hex6_s1_chipselect;
  wire    [  6: 0] out_hex6_s1_readdata;
  wire    [  6: 0] out_hex6_s1_readdata_from_sa;
  wire             out_hex6_s1_reset_n;
  wire             out_hex6_s1_write_n;
  wire    [  6: 0] out_hex6_s1_writedata;
  wire    [  1: 0] out_hex7_s1_address;
  wire             out_hex7_s1_chipselect;
  wire    [  6: 0] out_hex7_s1_readdata;
  wire    [  6: 0] out_hex7_s1_readdata_from_sa;
  wire             out_hex7_s1_reset_n;
  wire             out_hex7_s1_write_n;
  wire    [  6: 0] out_hex7_s1_writedata;
  wire             out_port_from_the_out_buy_success;
  wire             out_port_from_the_out_enough_money;
  wire    [  6: 0] out_port_from_the_out_hex0;
  wire    [  6: 0] out_port_from_the_out_hex1;
  wire    [  6: 0] out_port_from_the_out_hex2;
  wire    [  6: 0] out_port_from_the_out_hex4;
  wire    [  6: 0] out_port_from_the_out_hex5;
  wire    [  6: 0] out_port_from_the_out_hex6;
  wire    [  6: 0] out_port_from_the_out_hex7;
  wire             registered_cpu_data_master_read_data_valid_onchip_memory_s1;
  wire             reset_n_sources;
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
      .clk                                                         (clk_0),
      .cpu_data_master_address                                     (cpu_data_master_address),
      .cpu_data_master_address_to_slave                            (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_cpu_jtag_debug_module               (cpu_data_master_granted_cpu_jtag_debug_module),
      .cpu_data_master_granted_inp_buy_finish_s1                   (cpu_data_master_granted_inp_buy_finish_s1),
      .cpu_data_master_granted_inp_cancel_buy_s1                   (cpu_data_master_granted_inp_cancel_buy_s1),
      .cpu_data_master_granted_inp_confirm_buy_s1                  (cpu_data_master_granted_inp_confirm_buy_s1),
      .cpu_data_master_granted_inp_the_goods_s1                    (cpu_data_master_granted_inp_the_goods_s1),
      .cpu_data_master_granted_inp_the_money_s1                    (cpu_data_master_granted_inp_the_money_s1),
      .cpu_data_master_granted_onchip_memory_s1                    (cpu_data_master_granted_onchip_memory_s1),
      .cpu_data_master_granted_out_buy_success_s1                  (cpu_data_master_granted_out_buy_success_s1),
      .cpu_data_master_granted_out_enough_money_s1                 (cpu_data_master_granted_out_enough_money_s1),
      .cpu_data_master_granted_out_hex0_s1                         (cpu_data_master_granted_out_hex0_s1),
      .cpu_data_master_granted_out_hex1_s1                         (cpu_data_master_granted_out_hex1_s1),
      .cpu_data_master_granted_out_hex2_s1                         (cpu_data_master_granted_out_hex2_s1),
      .cpu_data_master_granted_out_hex4_s1                         (cpu_data_master_granted_out_hex4_s1),
      .cpu_data_master_granted_out_hex5_s1                         (cpu_data_master_granted_out_hex5_s1),
      .cpu_data_master_granted_out_hex6_s1                         (cpu_data_master_granted_out_hex6_s1),
      .cpu_data_master_granted_out_hex7_s1                         (cpu_data_master_granted_out_hex7_s1),
      .cpu_data_master_irq                                         (cpu_data_master_irq),
      .cpu_data_master_qualified_request_cpu_jtag_debug_module     (cpu_data_master_qualified_request_cpu_jtag_debug_module),
      .cpu_data_master_qualified_request_inp_buy_finish_s1         (cpu_data_master_qualified_request_inp_buy_finish_s1),
      .cpu_data_master_qualified_request_inp_cancel_buy_s1         (cpu_data_master_qualified_request_inp_cancel_buy_s1),
      .cpu_data_master_qualified_request_inp_confirm_buy_s1        (cpu_data_master_qualified_request_inp_confirm_buy_s1),
      .cpu_data_master_qualified_request_inp_the_goods_s1          (cpu_data_master_qualified_request_inp_the_goods_s1),
      .cpu_data_master_qualified_request_inp_the_money_s1          (cpu_data_master_qualified_request_inp_the_money_s1),
      .cpu_data_master_qualified_request_onchip_memory_s1          (cpu_data_master_qualified_request_onchip_memory_s1),
      .cpu_data_master_qualified_request_out_buy_success_s1        (cpu_data_master_qualified_request_out_buy_success_s1),
      .cpu_data_master_qualified_request_out_enough_money_s1       (cpu_data_master_qualified_request_out_enough_money_s1),
      .cpu_data_master_qualified_request_out_hex0_s1               (cpu_data_master_qualified_request_out_hex0_s1),
      .cpu_data_master_qualified_request_out_hex1_s1               (cpu_data_master_qualified_request_out_hex1_s1),
      .cpu_data_master_qualified_request_out_hex2_s1               (cpu_data_master_qualified_request_out_hex2_s1),
      .cpu_data_master_qualified_request_out_hex4_s1               (cpu_data_master_qualified_request_out_hex4_s1),
      .cpu_data_master_qualified_request_out_hex5_s1               (cpu_data_master_qualified_request_out_hex5_s1),
      .cpu_data_master_qualified_request_out_hex6_s1               (cpu_data_master_qualified_request_out_hex6_s1),
      .cpu_data_master_qualified_request_out_hex7_s1               (cpu_data_master_qualified_request_out_hex7_s1),
      .cpu_data_master_read                                        (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cpu_jtag_debug_module       (cpu_data_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_data_master_read_data_valid_inp_buy_finish_s1           (cpu_data_master_read_data_valid_inp_buy_finish_s1),
      .cpu_data_master_read_data_valid_inp_cancel_buy_s1           (cpu_data_master_read_data_valid_inp_cancel_buy_s1),
      .cpu_data_master_read_data_valid_inp_confirm_buy_s1          (cpu_data_master_read_data_valid_inp_confirm_buy_s1),
      .cpu_data_master_read_data_valid_inp_the_goods_s1            (cpu_data_master_read_data_valid_inp_the_goods_s1),
      .cpu_data_master_read_data_valid_inp_the_money_s1            (cpu_data_master_read_data_valid_inp_the_money_s1),
      .cpu_data_master_read_data_valid_onchip_memory_s1            (cpu_data_master_read_data_valid_onchip_memory_s1),
      .cpu_data_master_read_data_valid_out_buy_success_s1          (cpu_data_master_read_data_valid_out_buy_success_s1),
      .cpu_data_master_read_data_valid_out_enough_money_s1         (cpu_data_master_read_data_valid_out_enough_money_s1),
      .cpu_data_master_read_data_valid_out_hex0_s1                 (cpu_data_master_read_data_valid_out_hex0_s1),
      .cpu_data_master_read_data_valid_out_hex1_s1                 (cpu_data_master_read_data_valid_out_hex1_s1),
      .cpu_data_master_read_data_valid_out_hex2_s1                 (cpu_data_master_read_data_valid_out_hex2_s1),
      .cpu_data_master_read_data_valid_out_hex4_s1                 (cpu_data_master_read_data_valid_out_hex4_s1),
      .cpu_data_master_read_data_valid_out_hex5_s1                 (cpu_data_master_read_data_valid_out_hex5_s1),
      .cpu_data_master_read_data_valid_out_hex6_s1                 (cpu_data_master_read_data_valid_out_hex6_s1),
      .cpu_data_master_read_data_valid_out_hex7_s1                 (cpu_data_master_read_data_valid_out_hex7_s1),
      .cpu_data_master_readdata                                    (cpu_data_master_readdata),
      .cpu_data_master_requests_cpu_jtag_debug_module              (cpu_data_master_requests_cpu_jtag_debug_module),
      .cpu_data_master_requests_inp_buy_finish_s1                  (cpu_data_master_requests_inp_buy_finish_s1),
      .cpu_data_master_requests_inp_cancel_buy_s1                  (cpu_data_master_requests_inp_cancel_buy_s1),
      .cpu_data_master_requests_inp_confirm_buy_s1                 (cpu_data_master_requests_inp_confirm_buy_s1),
      .cpu_data_master_requests_inp_the_goods_s1                   (cpu_data_master_requests_inp_the_goods_s1),
      .cpu_data_master_requests_inp_the_money_s1                   (cpu_data_master_requests_inp_the_money_s1),
      .cpu_data_master_requests_onchip_memory_s1                   (cpu_data_master_requests_onchip_memory_s1),
      .cpu_data_master_requests_out_buy_success_s1                 (cpu_data_master_requests_out_buy_success_s1),
      .cpu_data_master_requests_out_enough_money_s1                (cpu_data_master_requests_out_enough_money_s1),
      .cpu_data_master_requests_out_hex0_s1                        (cpu_data_master_requests_out_hex0_s1),
      .cpu_data_master_requests_out_hex1_s1                        (cpu_data_master_requests_out_hex1_s1),
      .cpu_data_master_requests_out_hex2_s1                        (cpu_data_master_requests_out_hex2_s1),
      .cpu_data_master_requests_out_hex4_s1                        (cpu_data_master_requests_out_hex4_s1),
      .cpu_data_master_requests_out_hex5_s1                        (cpu_data_master_requests_out_hex5_s1),
      .cpu_data_master_requests_out_hex6_s1                        (cpu_data_master_requests_out_hex6_s1),
      .cpu_data_master_requests_out_hex7_s1                        (cpu_data_master_requests_out_hex7_s1),
      .cpu_data_master_waitrequest                                 (cpu_data_master_waitrequest),
      .cpu_data_master_write                                       (cpu_data_master_write),
      .cpu_jtag_debug_module_readdata_from_sa                      (cpu_jtag_debug_module_readdata_from_sa),
      .d1_cpu_jtag_debug_module_end_xfer                           (d1_cpu_jtag_debug_module_end_xfer),
      .d1_inp_buy_finish_s1_end_xfer                               (d1_inp_buy_finish_s1_end_xfer),
      .d1_inp_cancel_buy_s1_end_xfer                               (d1_inp_cancel_buy_s1_end_xfer),
      .d1_inp_confirm_buy_s1_end_xfer                              (d1_inp_confirm_buy_s1_end_xfer),
      .d1_inp_the_goods_s1_end_xfer                                (d1_inp_the_goods_s1_end_xfer),
      .d1_inp_the_money_s1_end_xfer                                (d1_inp_the_money_s1_end_xfer),
      .d1_onchip_memory_s1_end_xfer                                (d1_onchip_memory_s1_end_xfer),
      .d1_out_buy_success_s1_end_xfer                              (d1_out_buy_success_s1_end_xfer),
      .d1_out_enough_money_s1_end_xfer                             (d1_out_enough_money_s1_end_xfer),
      .d1_out_hex0_s1_end_xfer                                     (d1_out_hex0_s1_end_xfer),
      .d1_out_hex1_s1_end_xfer                                     (d1_out_hex1_s1_end_xfer),
      .d1_out_hex2_s1_end_xfer                                     (d1_out_hex2_s1_end_xfer),
      .d1_out_hex4_s1_end_xfer                                     (d1_out_hex4_s1_end_xfer),
      .d1_out_hex5_s1_end_xfer                                     (d1_out_hex5_s1_end_xfer),
      .d1_out_hex6_s1_end_xfer                                     (d1_out_hex6_s1_end_xfer),
      .d1_out_hex7_s1_end_xfer                                     (d1_out_hex7_s1_end_xfer),
      .inp_buy_finish_s1_irq_from_sa                               (inp_buy_finish_s1_irq_from_sa),
      .inp_buy_finish_s1_readdata_from_sa                          (inp_buy_finish_s1_readdata_from_sa),
      .inp_cancel_buy_s1_irq_from_sa                               (inp_cancel_buy_s1_irq_from_sa),
      .inp_cancel_buy_s1_readdata_from_sa                          (inp_cancel_buy_s1_readdata_from_sa),
      .inp_confirm_buy_s1_irq_from_sa                              (inp_confirm_buy_s1_irq_from_sa),
      .inp_confirm_buy_s1_readdata_from_sa                         (inp_confirm_buy_s1_readdata_from_sa),
      .inp_the_goods_s1_irq_from_sa                                (inp_the_goods_s1_irq_from_sa),
      .inp_the_goods_s1_readdata_from_sa                           (inp_the_goods_s1_readdata_from_sa),
      .inp_the_money_s1_irq_from_sa                                (inp_the_money_s1_irq_from_sa),
      .inp_the_money_s1_readdata_from_sa                           (inp_the_money_s1_readdata_from_sa),
      .onchip_memory_s1_readdata_from_sa                           (onchip_memory_s1_readdata_from_sa),
      .out_buy_success_s1_readdata_from_sa                         (out_buy_success_s1_readdata_from_sa),
      .out_enough_money_s1_readdata_from_sa                        (out_enough_money_s1_readdata_from_sa),
      .out_hex0_s1_readdata_from_sa                                (out_hex0_s1_readdata_from_sa),
      .out_hex1_s1_readdata_from_sa                                (out_hex1_s1_readdata_from_sa),
      .out_hex2_s1_readdata_from_sa                                (out_hex2_s1_readdata_from_sa),
      .out_hex4_s1_readdata_from_sa                                (out_hex4_s1_readdata_from_sa),
      .out_hex5_s1_readdata_from_sa                                (out_hex5_s1_readdata_from_sa),
      .out_hex6_s1_readdata_from_sa                                (out_hex6_s1_readdata_from_sa),
      .out_hex7_s1_readdata_from_sa                                (out_hex7_s1_readdata_from_sa),
      .registered_cpu_data_master_read_data_valid_onchip_memory_s1 (registered_cpu_data_master_read_data_valid_onchip_memory_s1),
      .reset_n                                                     (clk_0_reset_n)
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

  inp_buy_finish_s1_arbitrator the_inp_buy_finish_s1
    (
      .clk                                                 (clk_0),
      .cpu_data_master_address_to_slave                    (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_inp_buy_finish_s1           (cpu_data_master_granted_inp_buy_finish_s1),
      .cpu_data_master_qualified_request_inp_buy_finish_s1 (cpu_data_master_qualified_request_inp_buy_finish_s1),
      .cpu_data_master_read                                (cpu_data_master_read),
      .cpu_data_master_read_data_valid_inp_buy_finish_s1   (cpu_data_master_read_data_valid_inp_buy_finish_s1),
      .cpu_data_master_requests_inp_buy_finish_s1          (cpu_data_master_requests_inp_buy_finish_s1),
      .cpu_data_master_waitrequest                         (cpu_data_master_waitrequest),
      .cpu_data_master_write                               (cpu_data_master_write),
      .cpu_data_master_writedata                           (cpu_data_master_writedata),
      .d1_inp_buy_finish_s1_end_xfer                       (d1_inp_buy_finish_s1_end_xfer),
      .inp_buy_finish_s1_address                           (inp_buy_finish_s1_address),
      .inp_buy_finish_s1_chipselect                        (inp_buy_finish_s1_chipselect),
      .inp_buy_finish_s1_irq                               (inp_buy_finish_s1_irq),
      .inp_buy_finish_s1_irq_from_sa                       (inp_buy_finish_s1_irq_from_sa),
      .inp_buy_finish_s1_readdata                          (inp_buy_finish_s1_readdata),
      .inp_buy_finish_s1_readdata_from_sa                  (inp_buy_finish_s1_readdata_from_sa),
      .inp_buy_finish_s1_reset_n                           (inp_buy_finish_s1_reset_n),
      .inp_buy_finish_s1_write_n                           (inp_buy_finish_s1_write_n),
      .inp_buy_finish_s1_writedata                         (inp_buy_finish_s1_writedata),
      .reset_n                                             (clk_0_reset_n)
    );

  inp_buy_finish the_inp_buy_finish
    (
      .address    (inp_buy_finish_s1_address),
      .chipselect (inp_buy_finish_s1_chipselect),
      .clk        (clk_0),
      .in_port    (in_port_to_the_inp_buy_finish),
      .irq        (inp_buy_finish_s1_irq),
      .readdata   (inp_buy_finish_s1_readdata),
      .reset_n    (inp_buy_finish_s1_reset_n),
      .write_n    (inp_buy_finish_s1_write_n),
      .writedata  (inp_buy_finish_s1_writedata)
    );

  inp_cancel_buy_s1_arbitrator the_inp_cancel_buy_s1
    (
      .clk                                                 (clk_0),
      .cpu_data_master_address_to_slave                    (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_inp_cancel_buy_s1           (cpu_data_master_granted_inp_cancel_buy_s1),
      .cpu_data_master_qualified_request_inp_cancel_buy_s1 (cpu_data_master_qualified_request_inp_cancel_buy_s1),
      .cpu_data_master_read                                (cpu_data_master_read),
      .cpu_data_master_read_data_valid_inp_cancel_buy_s1   (cpu_data_master_read_data_valid_inp_cancel_buy_s1),
      .cpu_data_master_requests_inp_cancel_buy_s1          (cpu_data_master_requests_inp_cancel_buy_s1),
      .cpu_data_master_waitrequest                         (cpu_data_master_waitrequest),
      .cpu_data_master_write                               (cpu_data_master_write),
      .cpu_data_master_writedata                           (cpu_data_master_writedata),
      .d1_inp_cancel_buy_s1_end_xfer                       (d1_inp_cancel_buy_s1_end_xfer),
      .inp_cancel_buy_s1_address                           (inp_cancel_buy_s1_address),
      .inp_cancel_buy_s1_chipselect                        (inp_cancel_buy_s1_chipselect),
      .inp_cancel_buy_s1_irq                               (inp_cancel_buy_s1_irq),
      .inp_cancel_buy_s1_irq_from_sa                       (inp_cancel_buy_s1_irq_from_sa),
      .inp_cancel_buy_s1_readdata                          (inp_cancel_buy_s1_readdata),
      .inp_cancel_buy_s1_readdata_from_sa                  (inp_cancel_buy_s1_readdata_from_sa),
      .inp_cancel_buy_s1_reset_n                           (inp_cancel_buy_s1_reset_n),
      .inp_cancel_buy_s1_write_n                           (inp_cancel_buy_s1_write_n),
      .inp_cancel_buy_s1_writedata                         (inp_cancel_buy_s1_writedata),
      .reset_n                                             (clk_0_reset_n)
    );

  inp_cancel_buy the_inp_cancel_buy
    (
      .address    (inp_cancel_buy_s1_address),
      .chipselect (inp_cancel_buy_s1_chipselect),
      .clk        (clk_0),
      .in_port    (in_port_to_the_inp_cancel_buy),
      .irq        (inp_cancel_buy_s1_irq),
      .readdata   (inp_cancel_buy_s1_readdata),
      .reset_n    (inp_cancel_buy_s1_reset_n),
      .write_n    (inp_cancel_buy_s1_write_n),
      .writedata  (inp_cancel_buy_s1_writedata)
    );

  inp_confirm_buy_s1_arbitrator the_inp_confirm_buy_s1
    (
      .clk                                                  (clk_0),
      .cpu_data_master_address_to_slave                     (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_inp_confirm_buy_s1           (cpu_data_master_granted_inp_confirm_buy_s1),
      .cpu_data_master_qualified_request_inp_confirm_buy_s1 (cpu_data_master_qualified_request_inp_confirm_buy_s1),
      .cpu_data_master_read                                 (cpu_data_master_read),
      .cpu_data_master_read_data_valid_inp_confirm_buy_s1   (cpu_data_master_read_data_valid_inp_confirm_buy_s1),
      .cpu_data_master_requests_inp_confirm_buy_s1          (cpu_data_master_requests_inp_confirm_buy_s1),
      .cpu_data_master_waitrequest                          (cpu_data_master_waitrequest),
      .cpu_data_master_write                                (cpu_data_master_write),
      .cpu_data_master_writedata                            (cpu_data_master_writedata),
      .d1_inp_confirm_buy_s1_end_xfer                       (d1_inp_confirm_buy_s1_end_xfer),
      .inp_confirm_buy_s1_address                           (inp_confirm_buy_s1_address),
      .inp_confirm_buy_s1_chipselect                        (inp_confirm_buy_s1_chipselect),
      .inp_confirm_buy_s1_irq                               (inp_confirm_buy_s1_irq),
      .inp_confirm_buy_s1_irq_from_sa                       (inp_confirm_buy_s1_irq_from_sa),
      .inp_confirm_buy_s1_readdata                          (inp_confirm_buy_s1_readdata),
      .inp_confirm_buy_s1_readdata_from_sa                  (inp_confirm_buy_s1_readdata_from_sa),
      .inp_confirm_buy_s1_reset_n                           (inp_confirm_buy_s1_reset_n),
      .inp_confirm_buy_s1_write_n                           (inp_confirm_buy_s1_write_n),
      .inp_confirm_buy_s1_writedata                         (inp_confirm_buy_s1_writedata),
      .reset_n                                              (clk_0_reset_n)
    );

  inp_confirm_buy the_inp_confirm_buy
    (
      .address    (inp_confirm_buy_s1_address),
      .chipselect (inp_confirm_buy_s1_chipselect),
      .clk        (clk_0),
      .in_port    (in_port_to_the_inp_confirm_buy),
      .irq        (inp_confirm_buy_s1_irq),
      .readdata   (inp_confirm_buy_s1_readdata),
      .reset_n    (inp_confirm_buy_s1_reset_n),
      .write_n    (inp_confirm_buy_s1_write_n),
      .writedata  (inp_confirm_buy_s1_writedata)
    );

  inp_the_goods_s1_arbitrator the_inp_the_goods_s1
    (
      .clk                                                (clk_0),
      .cpu_data_master_address_to_slave                   (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_inp_the_goods_s1           (cpu_data_master_granted_inp_the_goods_s1),
      .cpu_data_master_qualified_request_inp_the_goods_s1 (cpu_data_master_qualified_request_inp_the_goods_s1),
      .cpu_data_master_read                               (cpu_data_master_read),
      .cpu_data_master_read_data_valid_inp_the_goods_s1   (cpu_data_master_read_data_valid_inp_the_goods_s1),
      .cpu_data_master_requests_inp_the_goods_s1          (cpu_data_master_requests_inp_the_goods_s1),
      .cpu_data_master_waitrequest                        (cpu_data_master_waitrequest),
      .cpu_data_master_write                              (cpu_data_master_write),
      .cpu_data_master_writedata                          (cpu_data_master_writedata),
      .d1_inp_the_goods_s1_end_xfer                       (d1_inp_the_goods_s1_end_xfer),
      .inp_the_goods_s1_address                           (inp_the_goods_s1_address),
      .inp_the_goods_s1_chipselect                        (inp_the_goods_s1_chipselect),
      .inp_the_goods_s1_irq                               (inp_the_goods_s1_irq),
      .inp_the_goods_s1_irq_from_sa                       (inp_the_goods_s1_irq_from_sa),
      .inp_the_goods_s1_readdata                          (inp_the_goods_s1_readdata),
      .inp_the_goods_s1_readdata_from_sa                  (inp_the_goods_s1_readdata_from_sa),
      .inp_the_goods_s1_reset_n                           (inp_the_goods_s1_reset_n),
      .inp_the_goods_s1_write_n                           (inp_the_goods_s1_write_n),
      .inp_the_goods_s1_writedata                         (inp_the_goods_s1_writedata),
      .reset_n                                            (clk_0_reset_n)
    );

  inp_the_goods the_inp_the_goods
    (
      .address    (inp_the_goods_s1_address),
      .chipselect (inp_the_goods_s1_chipselect),
      .clk        (clk_0),
      .in_port    (in_port_to_the_inp_the_goods),
      .irq        (inp_the_goods_s1_irq),
      .readdata   (inp_the_goods_s1_readdata),
      .reset_n    (inp_the_goods_s1_reset_n),
      .write_n    (inp_the_goods_s1_write_n),
      .writedata  (inp_the_goods_s1_writedata)
    );

  inp_the_money_s1_arbitrator the_inp_the_money_s1
    (
      .clk                                                (clk_0),
      .cpu_data_master_address_to_slave                   (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_inp_the_money_s1           (cpu_data_master_granted_inp_the_money_s1),
      .cpu_data_master_qualified_request_inp_the_money_s1 (cpu_data_master_qualified_request_inp_the_money_s1),
      .cpu_data_master_read                               (cpu_data_master_read),
      .cpu_data_master_read_data_valid_inp_the_money_s1   (cpu_data_master_read_data_valid_inp_the_money_s1),
      .cpu_data_master_requests_inp_the_money_s1          (cpu_data_master_requests_inp_the_money_s1),
      .cpu_data_master_waitrequest                        (cpu_data_master_waitrequest),
      .cpu_data_master_write                              (cpu_data_master_write),
      .cpu_data_master_writedata                          (cpu_data_master_writedata),
      .d1_inp_the_money_s1_end_xfer                       (d1_inp_the_money_s1_end_xfer),
      .inp_the_money_s1_address                           (inp_the_money_s1_address),
      .inp_the_money_s1_chipselect                        (inp_the_money_s1_chipselect),
      .inp_the_money_s1_irq                               (inp_the_money_s1_irq),
      .inp_the_money_s1_irq_from_sa                       (inp_the_money_s1_irq_from_sa),
      .inp_the_money_s1_readdata                          (inp_the_money_s1_readdata),
      .inp_the_money_s1_readdata_from_sa                  (inp_the_money_s1_readdata_from_sa),
      .inp_the_money_s1_reset_n                           (inp_the_money_s1_reset_n),
      .inp_the_money_s1_write_n                           (inp_the_money_s1_write_n),
      .inp_the_money_s1_writedata                         (inp_the_money_s1_writedata),
      .reset_n                                            (clk_0_reset_n)
    );

  inp_the_money the_inp_the_money
    (
      .address    (inp_the_money_s1_address),
      .chipselect (inp_the_money_s1_chipselect),
      .clk        (clk_0),
      .in_port    (in_port_to_the_inp_the_money),
      .irq        (inp_the_money_s1_irq),
      .readdata   (inp_the_money_s1_readdata),
      .reset_n    (inp_the_money_s1_reset_n),
      .write_n    (inp_the_money_s1_write_n),
      .writedata  (inp_the_money_s1_writedata)
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

  out_buy_success_s1_arbitrator the_out_buy_success_s1
    (
      .clk                                                  (clk_0),
      .cpu_data_master_address_to_slave                     (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_out_buy_success_s1           (cpu_data_master_granted_out_buy_success_s1),
      .cpu_data_master_qualified_request_out_buy_success_s1 (cpu_data_master_qualified_request_out_buy_success_s1),
      .cpu_data_master_read                                 (cpu_data_master_read),
      .cpu_data_master_read_data_valid_out_buy_success_s1   (cpu_data_master_read_data_valid_out_buy_success_s1),
      .cpu_data_master_requests_out_buy_success_s1          (cpu_data_master_requests_out_buy_success_s1),
      .cpu_data_master_waitrequest                          (cpu_data_master_waitrequest),
      .cpu_data_master_write                                (cpu_data_master_write),
      .cpu_data_master_writedata                            (cpu_data_master_writedata),
      .d1_out_buy_success_s1_end_xfer                       (d1_out_buy_success_s1_end_xfer),
      .out_buy_success_s1_address                           (out_buy_success_s1_address),
      .out_buy_success_s1_chipselect                        (out_buy_success_s1_chipselect),
      .out_buy_success_s1_readdata                          (out_buy_success_s1_readdata),
      .out_buy_success_s1_readdata_from_sa                  (out_buy_success_s1_readdata_from_sa),
      .out_buy_success_s1_reset_n                           (out_buy_success_s1_reset_n),
      .out_buy_success_s1_write_n                           (out_buy_success_s1_write_n),
      .out_buy_success_s1_writedata                         (out_buy_success_s1_writedata),
      .reset_n                                              (clk_0_reset_n)
    );

  out_buy_success the_out_buy_success
    (
      .address    (out_buy_success_s1_address),
      .chipselect (out_buy_success_s1_chipselect),
      .clk        (clk_0),
      .out_port   (out_port_from_the_out_buy_success),
      .readdata   (out_buy_success_s1_readdata),
      .reset_n    (out_buy_success_s1_reset_n),
      .write_n    (out_buy_success_s1_write_n),
      .writedata  (out_buy_success_s1_writedata)
    );

  out_enough_money_s1_arbitrator the_out_enough_money_s1
    (
      .clk                                                   (clk_0),
      .cpu_data_master_address_to_slave                      (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_out_enough_money_s1           (cpu_data_master_granted_out_enough_money_s1),
      .cpu_data_master_qualified_request_out_enough_money_s1 (cpu_data_master_qualified_request_out_enough_money_s1),
      .cpu_data_master_read                                  (cpu_data_master_read),
      .cpu_data_master_read_data_valid_out_enough_money_s1   (cpu_data_master_read_data_valid_out_enough_money_s1),
      .cpu_data_master_requests_out_enough_money_s1          (cpu_data_master_requests_out_enough_money_s1),
      .cpu_data_master_waitrequest                           (cpu_data_master_waitrequest),
      .cpu_data_master_write                                 (cpu_data_master_write),
      .cpu_data_master_writedata                             (cpu_data_master_writedata),
      .d1_out_enough_money_s1_end_xfer                       (d1_out_enough_money_s1_end_xfer),
      .out_enough_money_s1_address                           (out_enough_money_s1_address),
      .out_enough_money_s1_chipselect                        (out_enough_money_s1_chipselect),
      .out_enough_money_s1_readdata                          (out_enough_money_s1_readdata),
      .out_enough_money_s1_readdata_from_sa                  (out_enough_money_s1_readdata_from_sa),
      .out_enough_money_s1_reset_n                           (out_enough_money_s1_reset_n),
      .out_enough_money_s1_write_n                           (out_enough_money_s1_write_n),
      .out_enough_money_s1_writedata                         (out_enough_money_s1_writedata),
      .reset_n                                               (clk_0_reset_n)
    );

  out_enough_money the_out_enough_money
    (
      .address    (out_enough_money_s1_address),
      .chipselect (out_enough_money_s1_chipselect),
      .clk        (clk_0),
      .out_port   (out_port_from_the_out_enough_money),
      .readdata   (out_enough_money_s1_readdata),
      .reset_n    (out_enough_money_s1_reset_n),
      .write_n    (out_enough_money_s1_write_n),
      .writedata  (out_enough_money_s1_writedata)
    );

  out_hex0_s1_arbitrator the_out_hex0_s1
    (
      .clk                                           (clk_0),
      .cpu_data_master_address_to_slave              (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_out_hex0_s1           (cpu_data_master_granted_out_hex0_s1),
      .cpu_data_master_qualified_request_out_hex0_s1 (cpu_data_master_qualified_request_out_hex0_s1),
      .cpu_data_master_read                          (cpu_data_master_read),
      .cpu_data_master_read_data_valid_out_hex0_s1   (cpu_data_master_read_data_valid_out_hex0_s1),
      .cpu_data_master_requests_out_hex0_s1          (cpu_data_master_requests_out_hex0_s1),
      .cpu_data_master_waitrequest                   (cpu_data_master_waitrequest),
      .cpu_data_master_write                         (cpu_data_master_write),
      .cpu_data_master_writedata                     (cpu_data_master_writedata),
      .d1_out_hex0_s1_end_xfer                       (d1_out_hex0_s1_end_xfer),
      .out_hex0_s1_address                           (out_hex0_s1_address),
      .out_hex0_s1_chipselect                        (out_hex0_s1_chipselect),
      .out_hex0_s1_readdata                          (out_hex0_s1_readdata),
      .out_hex0_s1_readdata_from_sa                  (out_hex0_s1_readdata_from_sa),
      .out_hex0_s1_reset_n                           (out_hex0_s1_reset_n),
      .out_hex0_s1_write_n                           (out_hex0_s1_write_n),
      .out_hex0_s1_writedata                         (out_hex0_s1_writedata),
      .reset_n                                       (clk_0_reset_n)
    );

  out_hex0 the_out_hex0
    (
      .address    (out_hex0_s1_address),
      .chipselect (out_hex0_s1_chipselect),
      .clk        (clk_0),
      .out_port   (out_port_from_the_out_hex0),
      .readdata   (out_hex0_s1_readdata),
      .reset_n    (out_hex0_s1_reset_n),
      .write_n    (out_hex0_s1_write_n),
      .writedata  (out_hex0_s1_writedata)
    );

  out_hex1_s1_arbitrator the_out_hex1_s1
    (
      .clk                                           (clk_0),
      .cpu_data_master_address_to_slave              (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_out_hex1_s1           (cpu_data_master_granted_out_hex1_s1),
      .cpu_data_master_qualified_request_out_hex1_s1 (cpu_data_master_qualified_request_out_hex1_s1),
      .cpu_data_master_read                          (cpu_data_master_read),
      .cpu_data_master_read_data_valid_out_hex1_s1   (cpu_data_master_read_data_valid_out_hex1_s1),
      .cpu_data_master_requests_out_hex1_s1          (cpu_data_master_requests_out_hex1_s1),
      .cpu_data_master_waitrequest                   (cpu_data_master_waitrequest),
      .cpu_data_master_write                         (cpu_data_master_write),
      .cpu_data_master_writedata                     (cpu_data_master_writedata),
      .d1_out_hex1_s1_end_xfer                       (d1_out_hex1_s1_end_xfer),
      .out_hex1_s1_address                           (out_hex1_s1_address),
      .out_hex1_s1_chipselect                        (out_hex1_s1_chipselect),
      .out_hex1_s1_readdata                          (out_hex1_s1_readdata),
      .out_hex1_s1_readdata_from_sa                  (out_hex1_s1_readdata_from_sa),
      .out_hex1_s1_reset_n                           (out_hex1_s1_reset_n),
      .out_hex1_s1_write_n                           (out_hex1_s1_write_n),
      .out_hex1_s1_writedata                         (out_hex1_s1_writedata),
      .reset_n                                       (clk_0_reset_n)
    );

  out_hex1 the_out_hex1
    (
      .address    (out_hex1_s1_address),
      .chipselect (out_hex1_s1_chipselect),
      .clk        (clk_0),
      .out_port   (out_port_from_the_out_hex1),
      .readdata   (out_hex1_s1_readdata),
      .reset_n    (out_hex1_s1_reset_n),
      .write_n    (out_hex1_s1_write_n),
      .writedata  (out_hex1_s1_writedata)
    );

  out_hex2_s1_arbitrator the_out_hex2_s1
    (
      .clk                                           (clk_0),
      .cpu_data_master_address_to_slave              (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_out_hex2_s1           (cpu_data_master_granted_out_hex2_s1),
      .cpu_data_master_qualified_request_out_hex2_s1 (cpu_data_master_qualified_request_out_hex2_s1),
      .cpu_data_master_read                          (cpu_data_master_read),
      .cpu_data_master_read_data_valid_out_hex2_s1   (cpu_data_master_read_data_valid_out_hex2_s1),
      .cpu_data_master_requests_out_hex2_s1          (cpu_data_master_requests_out_hex2_s1),
      .cpu_data_master_waitrequest                   (cpu_data_master_waitrequest),
      .cpu_data_master_write                         (cpu_data_master_write),
      .cpu_data_master_writedata                     (cpu_data_master_writedata),
      .d1_out_hex2_s1_end_xfer                       (d1_out_hex2_s1_end_xfer),
      .out_hex2_s1_address                           (out_hex2_s1_address),
      .out_hex2_s1_chipselect                        (out_hex2_s1_chipselect),
      .out_hex2_s1_readdata                          (out_hex2_s1_readdata),
      .out_hex2_s1_readdata_from_sa                  (out_hex2_s1_readdata_from_sa),
      .out_hex2_s1_reset_n                           (out_hex2_s1_reset_n),
      .out_hex2_s1_write_n                           (out_hex2_s1_write_n),
      .out_hex2_s1_writedata                         (out_hex2_s1_writedata),
      .reset_n                                       (clk_0_reset_n)
    );

  out_hex2 the_out_hex2
    (
      .address    (out_hex2_s1_address),
      .chipselect (out_hex2_s1_chipselect),
      .clk        (clk_0),
      .out_port   (out_port_from_the_out_hex2),
      .readdata   (out_hex2_s1_readdata),
      .reset_n    (out_hex2_s1_reset_n),
      .write_n    (out_hex2_s1_write_n),
      .writedata  (out_hex2_s1_writedata)
    );

  out_hex4_s1_arbitrator the_out_hex4_s1
    (
      .clk                                           (clk_0),
      .cpu_data_master_address_to_slave              (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_out_hex4_s1           (cpu_data_master_granted_out_hex4_s1),
      .cpu_data_master_qualified_request_out_hex4_s1 (cpu_data_master_qualified_request_out_hex4_s1),
      .cpu_data_master_read                          (cpu_data_master_read),
      .cpu_data_master_read_data_valid_out_hex4_s1   (cpu_data_master_read_data_valid_out_hex4_s1),
      .cpu_data_master_requests_out_hex4_s1          (cpu_data_master_requests_out_hex4_s1),
      .cpu_data_master_waitrequest                   (cpu_data_master_waitrequest),
      .cpu_data_master_write                         (cpu_data_master_write),
      .cpu_data_master_writedata                     (cpu_data_master_writedata),
      .d1_out_hex4_s1_end_xfer                       (d1_out_hex4_s1_end_xfer),
      .out_hex4_s1_address                           (out_hex4_s1_address),
      .out_hex4_s1_chipselect                        (out_hex4_s1_chipselect),
      .out_hex4_s1_readdata                          (out_hex4_s1_readdata),
      .out_hex4_s1_readdata_from_sa                  (out_hex4_s1_readdata_from_sa),
      .out_hex4_s1_reset_n                           (out_hex4_s1_reset_n),
      .out_hex4_s1_write_n                           (out_hex4_s1_write_n),
      .out_hex4_s1_writedata                         (out_hex4_s1_writedata),
      .reset_n                                       (clk_0_reset_n)
    );

  out_hex4 the_out_hex4
    (
      .address    (out_hex4_s1_address),
      .chipselect (out_hex4_s1_chipselect),
      .clk        (clk_0),
      .out_port   (out_port_from_the_out_hex4),
      .readdata   (out_hex4_s1_readdata),
      .reset_n    (out_hex4_s1_reset_n),
      .write_n    (out_hex4_s1_write_n),
      .writedata  (out_hex4_s1_writedata)
    );

  out_hex5_s1_arbitrator the_out_hex5_s1
    (
      .clk                                           (clk_0),
      .cpu_data_master_address_to_slave              (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_out_hex5_s1           (cpu_data_master_granted_out_hex5_s1),
      .cpu_data_master_qualified_request_out_hex5_s1 (cpu_data_master_qualified_request_out_hex5_s1),
      .cpu_data_master_read                          (cpu_data_master_read),
      .cpu_data_master_read_data_valid_out_hex5_s1   (cpu_data_master_read_data_valid_out_hex5_s1),
      .cpu_data_master_requests_out_hex5_s1          (cpu_data_master_requests_out_hex5_s1),
      .cpu_data_master_waitrequest                   (cpu_data_master_waitrequest),
      .cpu_data_master_write                         (cpu_data_master_write),
      .cpu_data_master_writedata                     (cpu_data_master_writedata),
      .d1_out_hex5_s1_end_xfer                       (d1_out_hex5_s1_end_xfer),
      .out_hex5_s1_address                           (out_hex5_s1_address),
      .out_hex5_s1_chipselect                        (out_hex5_s1_chipselect),
      .out_hex5_s1_readdata                          (out_hex5_s1_readdata),
      .out_hex5_s1_readdata_from_sa                  (out_hex5_s1_readdata_from_sa),
      .out_hex5_s1_reset_n                           (out_hex5_s1_reset_n),
      .out_hex5_s1_write_n                           (out_hex5_s1_write_n),
      .out_hex5_s1_writedata                         (out_hex5_s1_writedata),
      .reset_n                                       (clk_0_reset_n)
    );

  out_hex5 the_out_hex5
    (
      .address    (out_hex5_s1_address),
      .chipselect (out_hex5_s1_chipselect),
      .clk        (clk_0),
      .out_port   (out_port_from_the_out_hex5),
      .readdata   (out_hex5_s1_readdata),
      .reset_n    (out_hex5_s1_reset_n),
      .write_n    (out_hex5_s1_write_n),
      .writedata  (out_hex5_s1_writedata)
    );

  out_hex6_s1_arbitrator the_out_hex6_s1
    (
      .clk                                           (clk_0),
      .cpu_data_master_address_to_slave              (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_out_hex6_s1           (cpu_data_master_granted_out_hex6_s1),
      .cpu_data_master_qualified_request_out_hex6_s1 (cpu_data_master_qualified_request_out_hex6_s1),
      .cpu_data_master_read                          (cpu_data_master_read),
      .cpu_data_master_read_data_valid_out_hex6_s1   (cpu_data_master_read_data_valid_out_hex6_s1),
      .cpu_data_master_requests_out_hex6_s1          (cpu_data_master_requests_out_hex6_s1),
      .cpu_data_master_waitrequest                   (cpu_data_master_waitrequest),
      .cpu_data_master_write                         (cpu_data_master_write),
      .cpu_data_master_writedata                     (cpu_data_master_writedata),
      .d1_out_hex6_s1_end_xfer                       (d1_out_hex6_s1_end_xfer),
      .out_hex6_s1_address                           (out_hex6_s1_address),
      .out_hex6_s1_chipselect                        (out_hex6_s1_chipselect),
      .out_hex6_s1_readdata                          (out_hex6_s1_readdata),
      .out_hex6_s1_readdata_from_sa                  (out_hex6_s1_readdata_from_sa),
      .out_hex6_s1_reset_n                           (out_hex6_s1_reset_n),
      .out_hex6_s1_write_n                           (out_hex6_s1_write_n),
      .out_hex6_s1_writedata                         (out_hex6_s1_writedata),
      .reset_n                                       (clk_0_reset_n)
    );

  out_hex6 the_out_hex6
    (
      .address    (out_hex6_s1_address),
      .chipselect (out_hex6_s1_chipselect),
      .clk        (clk_0),
      .out_port   (out_port_from_the_out_hex6),
      .readdata   (out_hex6_s1_readdata),
      .reset_n    (out_hex6_s1_reset_n),
      .write_n    (out_hex6_s1_write_n),
      .writedata  (out_hex6_s1_writedata)
    );

  out_hex7_s1_arbitrator the_out_hex7_s1
    (
      .clk                                           (clk_0),
      .cpu_data_master_address_to_slave              (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_out_hex7_s1           (cpu_data_master_granted_out_hex7_s1),
      .cpu_data_master_qualified_request_out_hex7_s1 (cpu_data_master_qualified_request_out_hex7_s1),
      .cpu_data_master_read                          (cpu_data_master_read),
      .cpu_data_master_read_data_valid_out_hex7_s1   (cpu_data_master_read_data_valid_out_hex7_s1),
      .cpu_data_master_requests_out_hex7_s1          (cpu_data_master_requests_out_hex7_s1),
      .cpu_data_master_waitrequest                   (cpu_data_master_waitrequest),
      .cpu_data_master_write                         (cpu_data_master_write),
      .cpu_data_master_writedata                     (cpu_data_master_writedata),
      .d1_out_hex7_s1_end_xfer                       (d1_out_hex7_s1_end_xfer),
      .out_hex7_s1_address                           (out_hex7_s1_address),
      .out_hex7_s1_chipselect                        (out_hex7_s1_chipselect),
      .out_hex7_s1_readdata                          (out_hex7_s1_readdata),
      .out_hex7_s1_readdata_from_sa                  (out_hex7_s1_readdata_from_sa),
      .out_hex7_s1_reset_n                           (out_hex7_s1_reset_n),
      .out_hex7_s1_write_n                           (out_hex7_s1_write_n),
      .out_hex7_s1_writedata                         (out_hex7_s1_writedata),
      .reset_n                                       (clk_0_reset_n)
    );

  out_hex7 the_out_hex7
    (
      .address    (out_hex7_s1_address),
      .chipselect (out_hex7_s1_chipselect),
      .clk        (clk_0),
      .out_port   (out_port_from_the_out_hex7),
      .readdata   (out_hex7_s1_readdata),
      .reset_n    (out_hex7_s1_reset_n),
      .write_n    (out_hex7_s1_write_n),
      .writedata  (out_hex7_s1_writedata)
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
`include "out_hex2.v"
`include "out_buy_success.v"
`include "out_hex5.v"
`include "inp_buy_finish.v"
`include "out_enough_money.v"
`include "onchip_memory.v"
`include "cpu_test_bench.v"
`include "cpu_mult_cell.v"
`include "cpu_oci_test_bench.v"
`include "cpu_jtag_debug_module_tck.v"
`include "cpu_jtag_debug_module_sysclk.v"
`include "cpu_jtag_debug_module_wrapper.v"
`include "cpu.v"
`include "out_hex0.v"
`include "out_hex7.v"
`include "inp_confirm_buy.v"
`include "out_hex4.v"
`include "inp_cancel_buy.v"
`include "inp_the_money.v"
`include "out_hex1.v"
`include "out_hex6.v"
`include "inp_the_goods.v"

`timescale 1ns / 1ps

module test_bench 
;


  wire             clk;
  reg              clk_0;
  wire             in_port_to_the_inp_buy_finish;
  wire             in_port_to_the_inp_cancel_buy;
  wire             in_port_to_the_inp_confirm_buy;
  wire    [  2: 0] in_port_to_the_inp_the_goods;
  wire    [  2: 0] in_port_to_the_inp_the_money;
  wire             out_port_from_the_out_buy_success;
  wire             out_port_from_the_out_enough_money;
  wire    [  6: 0] out_port_from_the_out_hex0;
  wire    [  6: 0] out_port_from_the_out_hex1;
  wire    [  6: 0] out_port_from_the_out_hex2;
  wire    [  6: 0] out_port_from_the_out_hex4;
  wire    [  6: 0] out_port_from_the_out_hex5;
  wire    [  6: 0] out_port_from_the_out_hex6;
  wire    [  6: 0] out_port_from_the_out_hex7;
  reg              reset_n;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  KERNEL DUT
    (
      .clk_0                              (clk_0),
      .in_port_to_the_inp_buy_finish      (in_port_to_the_inp_buy_finish),
      .in_port_to_the_inp_cancel_buy      (in_port_to_the_inp_cancel_buy),
      .in_port_to_the_inp_confirm_buy     (in_port_to_the_inp_confirm_buy),
      .in_port_to_the_inp_the_goods       (in_port_to_the_inp_the_goods),
      .in_port_to_the_inp_the_money       (in_port_to_the_inp_the_money),
      .out_port_from_the_out_buy_success  (out_port_from_the_out_buy_success),
      .out_port_from_the_out_enough_money (out_port_from_the_out_enough_money),
      .out_port_from_the_out_hex0         (out_port_from_the_out_hex0),
      .out_port_from_the_out_hex1         (out_port_from_the_out_hex1),
      .out_port_from_the_out_hex2         (out_port_from_the_out_hex2),
      .out_port_from_the_out_hex4         (out_port_from_the_out_hex4),
      .out_port_from_the_out_hex5         (out_port_from_the_out_hex5),
      .out_port_from_the_out_hex6         (out_port_from_the_out_hex6),
      .out_port_from_the_out_hex7         (out_port_from_the_out_hex7),
      .reset_n                            (reset_n)
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