module cpu_0_test_bench (
                          // inputs:
                           D_iw,
                           D_iw_op,
                           D_iw_opx,
                           D_valid,
                           E_alu_result,
                           E_mem_byte_en,
                           E_st_data,
                           E_valid,
                           F_pcb,
                           F_valid,
                           R_ctrl_ld,
                           R_ctrl_ld_non_io,
                           R_dst_regnum,
                           R_wr_dst_reg,
                           W_alu_result,
                           W_bstatus_reg,
                           W_cmp_result,
                           W_estatus_reg,
                           W_ienable_reg,
                           W_ipending_reg,
                           W_status_reg,
                           W_valid,
                           W_wr_data,
                           av_ld_data_aligned_unfiltered,
                           clk,
                           d_address,
                           d_byteenable,
                           d_read,
                           d_write_nxt,
                           i_address,
                           i_read,
                           i_readdata,
                           i_waitrequest,
                           reset_n,

                          // outputs:
                           av_ld_data_aligned_filtered,
                           d_write
                        )
;

  output  [ 31: 0] av_ld_data_aligned_filtered;
  output           d_write;
  input   [ 31: 0] D_iw;
  input   [  5: 0] D_iw_op;
  input   [  5: 0] D_iw_opx;
  input            D_valid;
  input   [ 31: 0] E_alu_result;
  input   [  3: 0] E_mem_byte_en;
  input   [ 31: 0] E_st_data;
  input            E_valid;
  input   [ 22: 0] F_pcb;
  input            F_valid;
  input            R_ctrl_ld;
  input            R_ctrl_ld_non_io;
  input   [  4: 0] R_dst_regnum;
  input            R_wr_dst_reg;
  input   [ 31: 0] W_alu_result;
  input            W_bstatus_reg;
  input            W_cmp_result;
  input            W_estatus_reg;
  input   [ 31: 0] W_ienable_reg;
  input   [ 31: 0] W_ipending_reg;
  input            W_status_reg;
  input            W_valid;
  input   [ 31: 0] W_wr_data;
  input   [ 31: 0] av_ld_data_aligned_unfiltered;
  input            clk;
  input   [ 22: 0] d_address;
  input   [  3: 0] d_byteenable;
  input            d_read;
  input            d_write_nxt;
  input   [ 22: 0] i_address;
  input            i_read;
  input   [ 31: 0] i_readdata;
  input            i_waitrequest;
  input            reset_n;

  wire    [ 55: 0] D_inst;
  wire             D_op_add;
  wire             D_op_addi;
  wire             D_op_and;
  wire             D_op_andhi;
  wire             D_op_andi;
  wire             D_op_beq;
  wire             D_op_bge;
  wire             D_op_bgeu;
  wire             D_op_blt;
  wire             D_op_bltu;
  wire             D_op_bne;
  wire             D_op_br;
  wire             D_op_break;
  wire             D_op_bret;
  wire             D_op_call;
  wire             D_op_callr;
  wire             D_op_cmpeq;
  wire             D_op_cmpeqi;
  wire             D_op_cmpge;
  wire             D_op_cmpgei;
  wire             D_op_cmpgeu;
  wire             D_op_cmpgeui;
  wire             D_op_cmplt;
  wire             D_op_cmplti;
  wire             D_op_cmpltu;
  wire             D_op_cmpltui;
  wire             D_op_cmpne;
  wire             D_op_cmpnei;
  wire             D_op_custom;
  wire             D_op_div;
  wire             D_op_divu;
  wire             D_op_eret;
  wire             D_op_flushd;
  wire             D_op_flushda;
  wire             D_op_flushi;
  wire             D_op_flushp;
  wire             D_op_hbreak;
  wire             D_op_initd;
  wire             D_op_initi;
  wire             D_op_intr;
  wire             D_op_jmp;
  wire             D_op_ldb;
  wire             D_op_ldbio;
  wire             D_op_ldbu;
  wire             D_op_ldbuio;
  wire             D_op_ldh;
  wire             D_op_ldhio;
  wire             D_op_ldhu;
  wire             D_op_ldhuio;
  wire             D_op_ldw;
  wire             D_op_ldwio;
  wire             D_op_mul;
  wire             D_op_muli;
  wire             D_op_mulxss;
  wire             D_op_mulxsu;
  wire             D_op_mulxuu;
  wire             D_op_nextpc;
  wire             D_op_nor;
  wire             D_op_opx;
  wire             D_op_or;
  wire             D_op_orhi;
  wire             D_op_ori;
  wire             D_op_rdctl;
  wire             D_op_ret;
  wire             D_op_rol;
  wire             D_op_roli;
  wire             D_op_ror;
  wire             D_op_rsv01;
  wire             D_op_rsv02;
  wire             D_op_rsv09;
  wire             D_op_rsv10;
  wire             D_op_rsv17;
  wire             D_op_rsv18;
  wire             D_op_rsv19;
  wire             D_op_rsv25;
  wire             D_op_rsv26;
  wire             D_op_rsv29;
  wire             D_op_rsv31;
  wire             D_op_rsv33;
  wire             D_op_rsv34;
  wire             D_op_rsv41;
  wire             D_op_rsv42;
  wire             D_op_rsv49;
  wire             D_op_rsv56;
  wire             D_op_rsv57;
  wire             D_op_rsv61;
  wire             D_op_rsv62;
  wire             D_op_rsv63;
  wire             D_op_rsvx00;
  wire             D_op_rsvx10;
  wire             D_op_rsvx15;
  wire             D_op_rsvx17;
  wire             D_op_rsvx20;
  wire             D_op_rsvx21;
  wire             D_op_rsvx25;
  wire             D_op_rsvx33;
  wire             D_op_rsvx34;
  wire             D_op_rsvx35;
  wire             D_op_rsvx42;
  wire             D_op_rsvx43;
  wire             D_op_rsvx44;
  wire             D_op_rsvx47;
  wire             D_op_rsvx50;
  wire             D_op_rsvx51;
  wire             D_op_rsvx55;
  wire             D_op_rsvx56;
  wire             D_op_rsvx60;
  wire             D_op_rsvx62;
  wire             D_op_rsvx63;
  wire             D_op_sll;
  wire             D_op_slli;
  wire             D_op_sra;
  wire             D_op_srai;
  wire             D_op_srl;
  wire             D_op_srli;
  wire             D_op_stb;
  wire             D_op_stbio;
  wire             D_op_sth;
  wire             D_op_sthio;
  wire             D_op_stw;
  wire             D_op_stwio;
  wire             D_op_sub;
  wire             D_op_sync;
  wire             D_op_trap;
  wire             D_op_wrctl;
  wire             D_op_xor;
  wire             D_op_xorhi;
  wire             D_op_xori;
  wire    [ 55: 0] W_vinst;
  wire    [ 31: 0] av_ld_data_aligned_filtered;
  wire             av_ld_data_aligned_unfiltered_0_is_x;
  wire             av_ld_data_aligned_unfiltered_10_is_x;
  wire             av_ld_data_aligned_unfiltered_11_is_x;
  wire             av_ld_data_aligned_unfiltered_12_is_x;
  wire             av_ld_data_aligned_unfiltered_13_is_x;
  wire             av_ld_data_aligned_unfiltered_14_is_x;
  wire             av_ld_data_aligned_unfiltered_15_is_x;
  wire             av_ld_data_aligned_unfiltered_16_is_x;
  wire             av_ld_data_aligned_unfiltered_17_is_x;
  wire             av_ld_data_aligned_unfiltered_18_is_x;
  wire             av_ld_data_aligned_unfiltered_19_is_x;
  wire             av_ld_data_aligned_unfiltered_1_is_x;
  wire             av_ld_data_aligned_unfiltered_20_is_x;
  wire             av_ld_data_aligned_unfiltered_21_is_x;
  wire             av_ld_data_aligned_unfiltered_22_is_x;
  wire             av_ld_data_aligned_unfiltered_23_is_x;
  wire             av_ld_data_aligned_unfiltered_24_is_x;
  wire             av_ld_data_aligned_unfiltered_25_is_x;
  wire             av_ld_data_aligned_unfiltered_26_is_x;
  wire             av_ld_data_aligned_unfiltered_27_is_x;
  wire             av_ld_data_aligned_unfiltered_28_is_x;
  wire             av_ld_data_aligned_unfiltered_29_is_x;
  wire             av_ld_data_aligned_unfiltered_2_is_x;
  wire             av_ld_data_aligned_unfiltered_30_is_x;
  wire             av_ld_data_aligned_unfiltered_31_is_x;
  wire             av_ld_data_aligned_unfiltered_3_is_x;
  wire             av_ld_data_aligned_unfiltered_4_is_x;
  wire             av_ld_data_aligned_unfiltered_5_is_x;
  wire             av_ld_data_aligned_unfiltered_6_is_x;
  wire             av_ld_data_aligned_unfiltered_7_is_x;
  wire             av_ld_data_aligned_unfiltered_8_is_x;
  wire             av_ld_data_aligned_unfiltered_9_is_x;
  reg              d_write;
  wire             rf_wr;
  wire    [ 31: 0] rf_wr_data;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d_write <= 0;
      else if (1'b1)
          d_write <= d_write_nxt;
    end


  assign rf_wr = R_wr_dst_reg | R_ctrl_ld;
  assign rf_wr_data = R_ctrl_ld ? av_ld_data_aligned_filtered : W_wr_data;
  assign D_op_rsv02 = D_iw_op[5 : 0] == 2;
  assign D_op_cmplti = D_iw_op[5 : 0] == 16;
  assign D_op_rsv18 = D_iw_op[5 : 0] == 18;
  assign D_op_rsv01 = D_iw_op[5 : 0] == 1;
  assign D_op_rsv26 = D_iw_op[5 : 0] == 26;
  assign D_op_rsv42 = D_iw_op[5 : 0] == 42;
  assign D_op_ldbio = D_iw_op[5 : 0] == 39;
  assign D_op_ldbu = D_iw_op[5 : 0] == 3;
  assign D_op_orhi = D_iw_op[5 : 0] == 52;
  assign D_op_rsv31 = D_iw_op[5 : 0] == 31;
  assign D_op_bge = D_iw_op[5 : 0] == 14;
  assign D_op_br = D_iw_op[5 : 0] == 6;
  assign D_op_ldhio = D_iw_op[5 : 0] == 47;
  assign D_op_rsv41 = D_iw_op[5 : 0] == 41;
  assign D_op_rsv19 = D_iw_op[5 : 0] == 19;
  assign D_op_ldwio = D_iw_op[5 : 0] == 55;
  assign D_op_rsv29 = D_iw_op[5 : 0] == 29;
  assign D_op_rsv61 = D_iw_op[5 : 0] == 61;
  assign D_op_opx = D_iw_op[5 : 0] == 58;
  assign D_op_stb = D_iw_op[5 : 0] == 5;
  assign D_op_rsv62 = D_iw_op[5 : 0] == 62;
  assign D_op_bltu = D_iw_op[5 : 0] == 54;
  assign D_op_custom = D_iw_op[5 : 0] == 50;
  assign D_op_muli = D_iw_op[5 : 0] == 36;
  assign D_op_xori = D_iw_op[5 : 0] == 28;
  assign D_op_cmpgei = D_iw_op[5 : 0] == 8;
  assign D_op_ldw = D_iw_op[5 : 0] == 23;
  assign D_op_cmpeqi = D_iw_op[5 : 0] == 32;
  assign D_op_ldh = D_iw_op[5 : 0] == 15;
  assign D_op_stw = D_iw_op[5 : 0] == 21;
  assign D_op_rsv09 = D_iw_op[5 : 0] == 9;
  assign D_op_cmpnei = D_iw_op[5 : 0] == 24;
  assign D_op_ldb = D_iw_op[5 : 0] == 7;
  assign D_op_bgeu = D_iw_op[5 : 0] == 46;
  assign D_op_stwio = D_iw_op[5 : 0] == 53;
  assign D_op_rsv33 = D_iw_op[5 : 0] == 33;
  assign D_op_andhi = D_iw_op[5 : 0] == 44;
  assign D_op_ldbuio = D_iw_op[5 : 0] == 35;
  assign D_op_rsv34 = D_iw_op[5 : 0] == 34;
  assign D_op_sthio = D_iw_op[5 : 0] == 45;
  assign D_op_cmpgeui = D_iw_op[5 : 0] == 40;
  assign D_op_stbio = D_iw_op[5 : 0] == 37;
  assign D_op_andi = D_iw_op[5 : 0] == 12;
  assign D_op_addi = D_iw_op[5 : 0] == 4;
  assign D_op_flushda = D_iw_op[5 : 0] == 27;
  assign D_op_rsv49 = D_iw_op[5 : 0] == 49;
  assign D_op_blt = D_iw_op[5 : 0] == 22;
  assign D_op_beq = D_iw_op[5 : 0] == 38;
  assign D_op_ori = D_iw_op[5 : 0] == 20;
  assign D_op_cmpltui = D_iw_op[5 : 0] == 48;
  assign D_op_xorhi = D_iw_op[5 : 0] == 60;
  assign D_op_rsv56 = D_iw_op[5 : 0] == 56;
  assign D_op_ldhuio = D_iw_op[5 : 0] == 43;
  assign D_op_rsv63 = D_iw_op[5 : 0] == 63;
  assign D_op_bne = D_iw_op[5 : 0] == 30;
  assign D_op_rsv57 = D_iw_op[5 : 0] == 57;
  assign D_op_call = D_iw_op[5 : 0] == 0;
  assign D_op_ldhu = D_iw_op[5 : 0] == 11;
  assign D_op_flushd = D_iw_op[5 : 0] == 59;
  assign D_op_initd = D_iw_op[5 : 0] == 51;
  assign D_op_rsv10 = D_iw_op[5 : 0] == 10;
  assign D_op_rsv17 = D_iw_op[5 : 0] == 17;
  assign D_op_sth = D_iw_op[5 : 0] == 13;
  assign D_op_rsv25 = D_iw_op[5 : 0] == 25;
  assign D_op_flushi = D_op_opx & (D_iw_opx[5 : 0] == 12);
  assign D_op_mulxuu = D_op_opx & (D_iw_opx[5 : 0] == 7);
  assign D_op_rsvx33 = D_op_opx & (D_iw_opx[5 : 0] == 33);
  assign D_op_wrctl = D_op_opx & (D_iw_opx[5 : 0] == 46);
  assign D_op_roli = D_op_opx & (D_iw_opx[5 : 0] == 2);
  assign D_op_intr = D_op_opx & (D_iw_opx[5 : 0] == 61);
  assign D_op_rsvx43 = D_op_opx & (D_iw_opx[5 : 0] == 43);
  assign D_op_srl = D_op_opx & (D_iw_opx[5 : 0] == 27);
  assign D_op_trap = D_op_opx & (D_iw_opx[5 : 0] == 45);
  assign D_op_rsvx17 = D_op_opx & (D_iw_opx[5 : 0] == 17);
  assign D_op_break = D_op_opx & (D_iw_opx[5 : 0] == 52);
  assign D_op_rdctl = D_op_opx & (D_iw_opx[5 : 0] == 38);
  assign D_op_cmpltu = D_op_opx & (D_iw_opx[5 : 0] == 48);
  assign D_op_callr = D_op_opx & (D_iw_opx[5 : 0] == 29);
  assign D_op_cmpge = D_op_opx & (D_iw_opx[5 : 0] == 8);
  assign D_op_rsvx47 = D_op_opx & (D_iw_opx[5 : 0] == 47);
  assign D_op_and = D_op_opx & (D_iw_opx[5 : 0] == 14);
  assign D_op_rsvx00 = D_op_opx & (D_iw_opx[5 : 0] == 0);
  assign D_op_rsvx56 = D_op_opx & (D_iw_opx[5 : 0] == 56);
  assign D_op_hbreak = D_op_opx & (D_iw_opx[5 : 0] == 53);
  assign D_op_flushp = D_op_opx & (D_iw_opx[5 : 0] == 4);
  assign D_op_nor = D_op_opx & (D_iw_opx[5 : 0] == 6);
  assign D_op_rsvx50 = D_op_opx & (D_iw_opx[5 : 0] == 50);
  assign D_op_initi = D_op_opx & (D_iw_opx[5 : 0] == 41);
  assign D_op_srai = D_op_opx & (D_iw_opx[5 : 0] == 58);
  assign D_op_sync = D_op_opx & (D_iw_opx[5 : 0] == 54);
  assign D_op_rsvx15 = D_op_opx & (D_iw_opx[5 : 0] == 15);
  assign D_op_rsvx55 = D_op_opx & (D_iw_opx[5 : 0] == 55);
  assign D_op_rsvx42 = D_op_opx & (D_iw_opx[5 : 0] == 42);
  assign D_op_xor = D_op_opx & (D_iw_opx[5 : 0] == 30);
  assign D_op_rsvx34 = D_op_opx & (D_iw_opx[5 : 0] == 34);
  assign D_op_mulxss = D_op_opx & (D_iw_opx[5 : 0] == 31);
  assign D_op_rsvx51 = D_op_opx & (D_iw_opx[5 : 0] == 51);
  assign D_op_rsvx10 = D_op_opx & (D_iw_opx[5 : 0] == 10);
  assign D_op_eret = D_op_opx & (D_iw_opx[5 : 0] == 1);
  assign D_op_rsvx25 = D_op_opx & (D_iw_opx[5 : 0] == 25);
  assign D_op_jmp = D_op_opx & (D_iw_opx[5 : 0] == 13);
  assign D_op_or = D_op_opx & (D_iw_opx[5 : 0] == 22);
  assign D_op_rsvx35 = D_op_opx & (D_iw_opx[5 : 0] == 35);
  assign D_op_sra = D_op_opx & (D_iw_opx[5 : 0] == 59);
  assign D_op_rsvx20 = D_op_opx & (D_iw_opx[5 : 0] == 20);
  assign D_op_slli = D_op_opx & (D_iw_opx[5 : 0] == 18);
  assign D_op_mulxsu = D_op_opx & (D_iw_opx[5 : 0] == 23);
  assign D_op_rsvx21 = D_op_opx & (D_iw_opx[5 : 0] == 21);
  assign D_op_ror = D_op_opx & (D_iw_opx[5 : 0] == 11);
  assign D_op_srli = D_op_opx & (D_iw_opx[5 : 0] == 26);
  assign D_op_sll = D_op_opx & (D_iw_opx[5 : 0] == 19);
  assign D_op_div = D_op_opx & (D_iw_opx[5 : 0] == 37);
  assign D_op_cmplt = D_op_opx & (D_iw_opx[5 : 0] == 16);
  assign D_op_add = D_op_opx & (D_iw_opx[5 : 0] == 49);
  assign D_op_rsvx44 = D_op_opx & (D_iw_opx[5 : 0] == 44);
  assign D_op_bret = D_op_opx & (D_iw_opx[5 : 0] == 9);
  assign D_op_rsvx60 = D_op_opx & (D_iw_opx[5 : 0] == 60);
  assign D_op_rsvx63 = D_op_opx & (D_iw_opx[5 : 0] == 63);
  assign D_op_mul = D_op_opx & (D_iw_opx[5 : 0] == 39);
  assign D_op_cmpgeu = D_op_opx & (D_iw_opx[5 : 0] == 40);
  assign D_op_cmpne = D_op_opx & (D_iw_opx[5 : 0] == 24);
  assign D_op_cmpeq = D_op_opx & (D_iw_opx[5 : 0] == 32);
  assign D_op_ret = D_op_opx & (D_iw_opx[5 : 0] == 5);
  assign D_op_rsvx62 = D_op_opx & (D_iw_opx[5 : 0] == 62);
  assign D_op_rol = D_op_opx & (D_iw_opx[5 : 0] == 3);
  assign D_op_sub = D_op_opx & (D_iw_opx[5 : 0] == 57);
  assign D_op_nextpc = D_op_opx & (D_iw_opx[5 : 0] == 28);
  assign D_op_divu = D_op_opx & (D_iw_opx[5 : 0] == 36);

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Clearing 'X' data bits
  assign av_ld_data_aligned_unfiltered_0_is_x = ^(av_ld_data_aligned_unfiltered[0]) === 1'bx;

  assign av_ld_data_aligned_filtered[0] = (av_ld_data_aligned_unfiltered_0_is_x & (R_ctrl_ld_non_io)) ? 1'b0 : av_ld_data_aligned_unfiltered[0];
  assign av_ld_data_aligned_unfiltered_1_is_x = ^(av_ld_data_aligned_unfiltered[1]) === 1'bx;
  assign av_ld_data_aligned_filtered[1] = (av_ld_data_aligned_unfiltered_1_is_x & (R_ctrl_ld_non_io)) ? 1'b0 : av_ld_data_aligned_unfiltered[1];
  assign av_ld_data_aligned_unfiltered_2_is_x = ^(av_ld_data_aligned_unfiltered[2]) === 1'bx;
  assign av_ld_data_aligned_filtered[2] = (av_ld_data_aligned_unfiltered_2_is_x & (R_ctrl_ld_non_io)) ? 1'b0 : av_ld_data_aligned_unfiltered[2];
  assign av_ld_data_aligned_unfiltered_3_is_x = ^(av_ld_data_aligned_unfiltered[3]) === 1'bx;
  assign av_ld_data_aligned_filtered[3] = (av_ld_data_aligned_unfiltered_3_is_x & (R_ctrl_ld_non_io)) ? 1'b0 : av_ld_data_aligned_unfiltered[3];
  assign av_ld_data_aligned_unfiltered_4_is_x = ^(av_ld_data_aligned_unfiltered[4]) === 1'bx;
  assign av_ld_data_aligned_filtered[4] = (av_ld_data_aligned_unfiltered_4_is_x & (R_ctrl_ld_non_io)) ? 1'b0 : av_ld_data_aligned_unfiltered[4];
  assign av_ld_data_aligned_unfiltered_5_is_x = ^(av_ld_data_aligned_unfiltered[5]) === 1'bx;
  assign av_ld_data_aligned_filtered[5] = (av_ld_data_aligned_unfiltered_5_is_x & (R_ctrl_ld_non_io)) ? 1'b0 : av_ld_data_aligned_unfiltered[5];
  assign av_ld_data_aligned_unfiltered_6_is_x = ^(av_ld_data_aligned_unfiltered[6]) === 1'bx;
  assign av_ld_data_aligned_filtered[6] = (av_ld_data_aligned_unfiltered_6_is_x & (R_ctrl_ld_non_io)) ? 1'b0 : av_ld_data_aligned_unfiltered[6];
  assign av_ld_data_aligned_unfiltered_7_is_x = ^(av_ld_data_aligned_unfiltered[7]) === 1'bx;
  assign av_ld_data_aligned_filtered[7] = (av_ld_data_aligned_unfiltered_7_is_x & (R_ctrl_ld_non_io)) ? 1'b0 : av_ld_data_aligned_unfiltered[7];
  assign av_ld_data_aligned_unfiltered_8_is_x = ^(av_ld_data_aligned_unfiltered[8]) === 1'bx;
  assign av_ld_data_aligned_filtered[8] = (av_ld_data_aligned_unfiltered_8_is_x & (R_ctrl_ld_non_io)) ? 1'b0 : av_ld_data_aligned_unfiltered[8];
  assign av_ld_data_aligned_unfiltered_9_is_x = ^(av_ld_data_aligned_unfiltered[9]) === 1'bx;
  assign av_ld_data_aligned_filtered[9] = (av_ld_data_aligned_unfiltered_9_is_x & (R_ctrl_ld_non_io)) ? 1'b0 : av_ld_data_aligned_unfiltered[9];
  assign av_ld_data_aligned_unfiltered_10_is_x = ^(av_ld_data_aligned_unfiltered[10]) === 1'bx;
  assign av_ld_data_aligned_filtered[10] = (av_ld_data_aligned_unfiltered_10_is_x & (R_ctrl_ld_non_io)) ? 1'b0 : av_ld_data_aligned_unfiltered[10];
  assign av_ld_data_aligned_unfiltered_11_is_x = ^(av_ld_data_aligned_unfiltered[11]) === 1'bx;
  assign av_ld_data_aligned_filtered[11] = (av_ld_data_aligned_unfiltered_11_is_x & (R_ctrl_ld_non_io)) ? 1'b0 : av_ld_data_aligned_unfiltered[11];
  assign av_ld_data_aligned_unfiltered_12_is_x = ^(av_ld_data_aligned_unfiltered[12]) === 1'bx;
  assign av_ld_data_aligned_filtered[12] = (av_ld_data_aligned_unfiltered_12_is_x & (R_ctrl_ld_non_io)) ? 1'b0 : av_ld_data_aligned_unfiltered[12];
  assign av_ld_data_aligned_unfiltered_13_is_x = ^(av_ld_data_aligned_unfiltered[13]) === 1'bx;
  assign av_ld_data_aligned_filtered[13] = (av_ld_data_aligned_unfiltered_13_is_x & (R_ctrl_ld_non_io)) ? 1'b0 : av_ld_data_aligned_unfiltered[13];
  assign av_ld_data_aligned_unfiltered_14_is_x = ^(av_ld_data_aligned_unfiltered[14]) === 1'bx;
  assign av_ld_data_aligned_filtered[14] = (av_ld_data_aligned_unfiltered_14_is_x & (R_ctrl_ld_non_io)) ? 1'b0 : av_ld_data_aligned_unfiltered[14];
  assign av_ld_data_aligned_unfiltered_15_is_x = ^(av_ld_data_aligned_unfiltered[15]) === 1'bx;
  assign av_ld_data_aligned_filtered[15] = (av_ld_data_aligned_unfiltered_15_is_x & (R_ctrl_ld_non_io)) ? 1'b0 : av_ld_data_aligned_unfiltered[15];
  assign av_ld_data_aligned_unfiltered_16_is_x = ^(av_ld_data_aligned_unfiltered[16]) === 1'bx;
  assign av_ld_data_aligned_filtered[16] = (av_ld_data_aligned_unfiltered_16_is_x & (R_ctrl_ld_non_io)) ? 1'b0 : av_ld_data_aligned_unfiltered[16];
  assign av_ld_data_aligned_unfiltered_17_is_x = ^(av_ld_data_aligned_unfiltered[17]) === 1'bx;
  assign av_ld_data_aligned_filtered[17] = (av_ld_data_aligned_unfiltered_17_is_x & (R_ctrl_ld_non_io)) ? 1'b0 : av_ld_data_aligned_unfiltered[17];
  assign av_ld_data_aligned_unfiltered_18_is_x = ^(av_ld_data_aligned_unfiltered[18]) === 1'bx;
  assign av_ld_data_aligned_filtered[18] = (av_ld_data_aligned_unfiltered_18_is_x & (R_ctrl_ld_non_io)) ? 1'b0 : av_ld_data_aligned_unfiltered[18];
  assign av_ld_data_aligned_unfiltered_19_is_x = ^(av_ld_data_aligned_unfiltered[19]) === 1'bx;
  assign av_ld_data_aligned_filtered[19] = (av_ld_data_aligned_unfiltered_19_is_x & (R_ctrl_ld_non_io)) ? 1'b0 : av_ld_data_aligned_unfiltered[19];
  assign av_ld_data_aligned_unfiltered_20_is_x = ^(av_ld_data_aligned_unfiltered[20]) === 1'bx;
  assign av_ld_data_aligned_filtered[20] = (av_ld_data_aligned_unfiltered_20_is_x & (R_ctrl_ld_non_io)) ? 1'b0 : av_ld_data_aligned_unfiltered[20];
  assign av_ld_data_aligned_unfiltered_21_is_x = ^(av_ld_data_aligned_unfiltered[21]) === 1'bx;
  assign av_ld_data_aligned_filtered[21] = (av_ld_data_aligned_unfiltered_21_is_x & (R_ctrl_ld_non_io)) ? 1'b0 : av_ld_data_aligned_unfiltered[21];
  assign av_ld_data_aligned_unfiltered_22_is_x = ^(av_ld_data_aligned_unfiltered[22]) === 1'bx;
  assign av_ld_data_aligned_filtered[22] = (av_ld_data_aligned_unfiltered_22_is_x & (R_ctrl_ld_non_io)) ? 1'b0 : av_ld_data_aligned_unfiltered[22];
  assign av_ld_data_aligned_unfiltered_23_is_x = ^(av_ld_data_aligned_unfiltered[23]) === 1'bx;
  assign av_ld_data_aligned_filtered[23] = (av_ld_data_aligned_unfiltered_23_is_x & (R_ctrl_ld_non_io)) ? 1'b0 : av_ld_data_aligned_unfiltered[23];
  assign av_ld_data_aligned_unfiltered_24_is_x = ^(av_ld_data_aligned_unfiltered[24]) === 1'bx;
  assign av_ld_data_aligned_filtered[24] = (av_ld_data_aligned_unfiltered_24_is_x & (R_ctrl_ld_non_io)) ? 1'b0 : av_ld_data_aligned_unfiltered[24];
  assign av_ld_data_aligned_unfiltered_25_is_x = ^(av_ld_data_aligned_unfiltered[25]) === 1'bx;
  assign av_ld_data_aligned_filtered[25] = (av_ld_data_aligned_unfiltered_25_is_x & (R_ctrl_ld_non_io)) ? 1'b0 : av_ld_data_aligned_unfiltered[25];
  assign av_ld_data_aligned_unfiltered_26_is_x = ^(av_ld_data_aligned_unfiltered[26]) === 1'bx;
  assign av_ld_data_aligned_filtered[26] = (av_ld_data_aligned_unfiltered_26_is_x & (R_ctrl_ld_non_io)) ? 1'b0 : av_ld_data_aligned_unfiltered[26];
  assign av_ld_data_aligned_unfiltered_27_is_x = ^(av_ld_data_aligned_unfiltered[27]) === 1'bx;
  assign av_ld_data_aligned_filtered[27] = (av_ld_data_aligned_unfiltered_27_is_x & (R_ctrl_ld_non_io)) ? 1'b0 : av_ld_data_aligned_unfiltered[27];
  assign av_ld_data_aligned_unfiltered_28_is_x = ^(av_ld_data_aligned_unfiltered[28]) === 1'bx;
  assign av_ld_data_aligned_filtered[28] = (av_ld_data_aligned_unfiltered_28_is_x & (R_ctrl_ld_non_io)) ? 1'b0 : av_ld_data_aligned_unfiltered[28];
  assign av_ld_data_aligned_unfiltered_29_is_x = ^(av_ld_data_aligned_unfiltered[29]) === 1'bx;
  assign av_ld_data_aligned_filtered[29] = (av_ld_data_aligned_unfiltered_29_is_x & (R_ctrl_ld_non_io)) ? 1'b0 : av_ld_data_aligned_unfiltered[29];
  assign av_ld_data_aligned_unfiltered_30_is_x = ^(av_ld_data_aligned_unfiltered[30]) === 1'bx;
  assign av_ld_data_aligned_filtered[30] = (av_ld_data_aligned_unfiltered_30_is_x & (R_ctrl_ld_non_io)) ? 1'b0 : av_ld_data_aligned_unfiltered[30];
  assign av_ld_data_aligned_unfiltered_31_is_x = ^(av_ld_data_aligned_unfiltered[31]) === 1'bx;
  assign av_ld_data_aligned_filtered[31] = (av_ld_data_aligned_unfiltered_31_is_x & (R_ctrl_ld_non_io)) ? 1'b0 : av_ld_data_aligned_unfiltered[31];
  always @(posedge clk)
    begin
      if (reset_n)
          if (^(F_valid) === 1'bx)
            begin
              $write("%0d ns: ERROR: cpu_0_test_bench/F_valid is 'x'\n", $time);
              $stop;
            end
    end


  always @(posedge clk)
    begin
      if (reset_n)
          if (^(D_valid) === 1'bx)
            begin
              $write("%0d ns: ERROR: cpu_0_test_bench/D_valid is 'x'\n", $time);
              $stop;
            end
    end


  always @(posedge clk)
    begin
      if (reset_n)
          if (^(E_valid) === 1'bx)
            begin
              $write("%0d ns: ERROR: cpu_0_test_bench/E_valid is 'x'\n", $time);
              $stop;
            end
    end


  always @(posedge clk)
    begin
      if (reset_n)
          if (^(W_valid) === 1'bx)
            begin
              $write("%0d ns: ERROR: cpu_0_test_bench/W_valid is 'x'\n", $time);
              $stop;
            end
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
        begin
        end
      else if (W_valid)
          if (^(R_wr_dst_reg) === 1'bx)
            begin
              $write("%0d ns: ERROR: cpu_0_test_bench/R_wr_dst_reg is 'x'\n", $time);
              $stop;
            end
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
        begin
        end
      else if (W_valid & R_wr_dst_reg)
          if (^(W_wr_data) === 1'bx)
            begin
              $write("%0d ns: ERROR: cpu_0_test_bench/W_wr_data is 'x'\n", $time);
              $stop;
            end
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
        begin
        end
      else if (W_valid & R_wr_dst_reg)
          if (^(R_dst_regnum) === 1'bx)
            begin
              $write("%0d ns: ERROR: cpu_0_test_bench/R_dst_regnum is 'x'\n", $time);
              $stop;
            end
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
        begin
        end
      else if (W_valid & R_ctrl_ld)
          if (^(R_dst_regnum) === 1'bx)
            begin
              $write("%0d ns: ERROR: cpu_0_test_bench/R_dst_regnum is 'x'\n", $time);
              $stop;
            end
    end


  always @(posedge clk)
    begin
      if (reset_n)
          if (^(d_write) === 1'bx)
            begin
              $write("%0d ns: ERROR: cpu_0_test_bench/d_write is 'x'\n", $time);
              $stop;
            end
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
        begin
        end
      else if (d_write)
          if (^(d_byteenable) === 1'bx)
            begin
              $write("%0d ns: ERROR: cpu_0_test_bench/d_byteenable is 'x'\n", $time);
              $stop;
            end
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
        begin
        end
      else if (d_write | d_read)
          if (^(d_address) === 1'bx)
            begin
              $write("%0d ns: ERROR: cpu_0_test_bench/d_address is 'x'\n", $time);
              $stop;
            end
    end


  always @(posedge clk)
    begin
      if (reset_n)
          if (^(d_read) === 1'bx)
            begin
              $write("%0d ns: ERROR: cpu_0_test_bench/d_read is 'x'\n", $time);
              $stop;
            end
    end


  always @(posedge clk)
    begin
      if (reset_n)
          if (^(i_read) === 1'bx)
            begin
              $write("%0d ns: ERROR: cpu_0_test_bench/i_read is 'x'\n", $time);
              $stop;
            end
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
        begin
        end
      else if (i_read)
          if (^(i_address) === 1'bx)
            begin
              $write("%0d ns: ERROR: cpu_0_test_bench/i_address is 'x'\n", $time);
              $stop;
            end
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
        begin
        end
      else if (i_read & ~i_waitrequest)
          if (^(i_readdata) === 1'bx)
            begin
              $write("%0d ns: ERROR: cpu_0_test_bench/i_readdata is 'x'\n", $time);
              $stop;
            end
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
        begin
        end
      else if (W_valid & R_ctrl_ld)
          if (^(av_ld_data_aligned_unfiltered) === 1'bx)
            begin
              $write("%0d ns: WARNING: cpu_0_test_bench/av_ld_data_aligned_unfiltered is 'x'\n", $time);
            end
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
        begin
        end
      else if (W_valid & R_wr_dst_reg)
          if (^(W_wr_data) === 1'bx)
            begin
              $write("%0d ns: WARNING: cpu_0_test_bench/W_wr_data is 'x'\n", $time);
            end
    end


  
  reg [31:0] trace_handle; // for $fopen
  initial  
  begin
    trace_handle = $fopen("cpu_0.tr");
    $fwrite(trace_handle, "version 2\nnumThreads 1\n");
  end
  always @(posedge clk)
    begin
      if (~reset_n || (W_valid))
          $fwrite(trace_handle, "%0d ns: %0h,%0h,%0h,%0h,%0h,%0h,%0h,%0h,%0h,%0h,%0h,%0h,%0h,%0h,%0h,%0h,%0h,%0h,%0h,%0h\n", $time, ~reset_n, F_pcb, 0, D_op_intr, D_op_hbreak, D_iw, rf_wr, R_dst_regnum, rf_wr_data, W_alu_result, E_st_data, E_mem_byte_en, W_cmp_result, E_alu_result, W_status_reg, W_estatus_reg, W_bstatus_reg, W_ienable_reg, W_ipending_reg, 0);
    end


  assign D_inst = ((((D_iw_op[5 : 0] == 2))))? 56'h20207273763032 :
    ((((D_iw_op[5 : 0] == 16))))? 56'h20636d706c7469 :
    ((((D_iw_op[5 : 0] == 18))))? 56'h20207273763138 :
    ((((D_iw_op[5 : 0] == 1))))? 56'h20207273763031 :
    ((((D_iw_op[5 : 0] == 26))))? 56'h20207273763236 :
    ((((D_iw_op[5 : 0] == 42))))? 56'h20207273763432 :
    ((((D_iw_op[5 : 0] == 39))))? 56'h20206c6462696f :
    ((((D_iw_op[5 : 0] == 3))))? 56'h2020206c646275 :
    ((((D_iw_op[5 : 0] == 52))))? 56'h2020206f726869 :
    ((((D_iw_op[5 : 0] == 31))))? 56'h20207273763331 :
    ((((D_iw_op[5 : 0] == 14))))? 56'h20202020626765 :
    ((((D_iw_op[5 : 0] == 6))))? 56'h20202020206272 :
    ((((D_iw_op[5 : 0] == 47))))? 56'h20206c6468696f :
    ((((D_iw_op[5 : 0] == 41))))? 56'h20207273763431 :
    ((((D_iw_op[5 : 0] == 19))))? 56'h20207273763139 :
    ((((D_iw_op[5 : 0] == 55))))? 56'h20206c6477696f :
    ((((D_iw_op[5 : 0] == 29))))? 56'h20207273763239 :
    ((((D_iw_op[5 : 0] == 61))))? 56'h20207273763631 :
    ((((D_iw_op[5 : 0] == 5))))? 56'h20202020737462 :
    ((((D_iw_op[5 : 0] == 62))))? 56'h20207273763632 :
    ((((D_iw_op[5 : 0] == 54))))? 56'h202020626c7475 :
    ((((D_iw_op[5 : 0] == 50))))? 56'h20637573746f6d :
    ((((D_iw_op[5 : 0] == 36))))? 56'h2020206d756c69 :
    ((((D_iw_op[5 : 0] == 28))))? 56'h202020786f7269 :
    ((((D_iw_op[5 : 0] == 8))))? 56'h20636d70676569 :
    ((((D_iw_op[5 : 0] == 23))))? 56'h202020206c6477 :
    ((((D_iw_op[5 : 0] == 32))))? 56'h20636d70657169 :
    ((((D_iw_op[5 : 0] == 15))))? 56'h202020206c6468 :
    ((((D_iw_op[5 : 0] == 21))))? 56'h20202020737477 :
    ((((D_iw_op[5 : 0] == 9))))? 56'h20207273763039 :
    ((((D_iw_op[5 : 0] == 24))))? 56'h20636d706e6569 :
    ((((D_iw_op[5 : 0] == 7))))? 56'h202020206c6462 :
    ((((D_iw_op[5 : 0] == 46))))? 56'h20202062676575 :
    ((((D_iw_op[5 : 0] == 53))))? 56'h2020737477696f :
    ((((D_iw_op[5 : 0] == 33))))? 56'h20207273763333 :
    ((((D_iw_op[5 : 0] == 44))))? 56'h2020616e646869 :
    ((((D_iw_op[5 : 0] == 35))))? 56'h206c646275696f :
    ((((D_iw_op[5 : 0] == 34))))? 56'h20207273763334 :
    ((((D_iw_op[5 : 0] == 45))))? 56'h2020737468696f :
    ((((D_iw_op[5 : 0] == 40))))? 56'h636d7067657569 :
    ((((D_iw_op[5 : 0] == 37))))? 56'h2020737462696f :
    ((((D_iw_op[5 : 0] == 12))))? 56'h202020616e6469 :
    ((((D_iw_op[5 : 0] == 4))))? 56'h20202061646469 :
    ((((D_iw_op[5 : 0] == 27))))? 56'h666c7573686461 :
    ((((D_iw_op[5 : 0] == 49))))? 56'h20207273763439 :
    ((((D_iw_op[5 : 0] == 22))))? 56'h20202020626c74 :
    ((((D_iw_op[5 : 0] == 38))))? 56'h20202020626571 :
    ((((D_iw_op[5 : 0] == 20))))? 56'h202020206f7269 :
    ((((D_iw_op[5 : 0] == 48))))? 56'h636d706c747569 :
    ((((D_iw_op[5 : 0] == 60))))? 56'h2020786f726869 :
    ((((D_iw_op[5 : 0] == 56))))? 56'h20207273763536 :
    ((((D_iw_op[5 : 0] == 43))))? 56'h206c646875696f :
    ((((D_iw_op[5 : 0] == 63))))? 56'h20207273763633 :
    ((((D_iw_op[5 : 0] == 30))))? 56'h20202020626e65 :
    ((((D_iw_op[5 : 0] == 57))))? 56'h20207273763537 :
    ((((D_iw_op[5 : 0] == 0))))? 56'h20202063616c6c :
    ((((D_iw_op[5 : 0] == 11))))? 56'h2020206c646875 :
    ((((D_iw_op[5 : 0] == 59))))? 56'h20666c75736864 :
    ((((D_iw_op[5 : 0] == 51))))? 56'h2020696e697464 :
    ((((D_iw_op[5 : 0] == 10))))? 56'h20207273763130 :
    ((((D_iw_op[5 : 0] == 17))))? 56'h20207273763137 :
    ((((D_iw_op[5 : 0] == 13))))? 56'h20202020737468 :
    ((((D_iw_op[5 : 0] == 25))))? 56'h20207273763235 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 12))))? 56'h20666c75736869 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 7))))? 56'h206d756c787575 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 33))))? 56'h20727376783333 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 46))))? 56'h2020777263746c :
    (((D_op_opx & (D_iw_opx[5 : 0] == 2))))? 56'h202020726f6c69 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 61))))? 56'h202020696e7472 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 43))))? 56'h20727376783433 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 27))))? 56'h2020202073726c :
    (((D_op_opx & (D_iw_opx[5 : 0] == 45))))? 56'h20202074726170 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 17))))? 56'h20727376783137 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 52))))? 56'h2020627265616b :
    (((D_op_opx & (D_iw_opx[5 : 0] == 38))))? 56'h2020726463746c :
    (((D_op_opx & (D_iw_opx[5 : 0] == 48))))? 56'h20636d706c7475 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 29))))? 56'h202063616c6c72 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 8))))? 56'h2020636d706765 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 47))))? 56'h20727376783437 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 14))))? 56'h20202020616e64 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 0))))? 56'h20727376783030 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 56))))? 56'h20727376783536 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 53))))? 56'h2068627265616b :
    (((D_op_opx & (D_iw_opx[5 : 0] == 4))))? 56'h20666c75736870 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 6))))? 56'h202020206e6f72 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 50))))? 56'h20727376783530 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 41))))? 56'h2020696e697469 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 58))))? 56'h20202073726169 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 54))))? 56'h20202073796e63 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 15))))? 56'h20727376783135 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 55))))? 56'h20727376783535 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 42))))? 56'h20727376783432 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 30))))? 56'h20202020786f72 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 34))))? 56'h20727376783334 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 31))))? 56'h206d756c787373 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 51))))? 56'h20727376783531 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 10))))? 56'h20727376783130 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 1))))? 56'h20202065726574 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 25))))? 56'h20727376783235 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 13))))? 56'h202020206a6d70 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 22))))? 56'h20202020206f72 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 35))))? 56'h20727376783335 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 59))))? 56'h20202020737261 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 20))))? 56'h20727376783230 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 18))))? 56'h202020736c6c69 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 23))))? 56'h206d756c787375 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 21))))? 56'h20727376783231 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 11))))? 56'h20202020726f72 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 26))))? 56'h20202073726c69 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 19))))? 56'h20202020736c6c :
    (((D_op_opx & (D_iw_opx[5 : 0] == 37))))? 56'h20202020646976 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 16))))? 56'h2020636d706c74 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 49))))? 56'h20202020616464 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 44))))? 56'h20727376783434 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 9))))? 56'h20202062726574 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 60))))? 56'h20727376783630 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 63))))? 56'h20727376783633 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 39))))? 56'h202020206d756c :
    (((D_op_opx & (D_iw_opx[5 : 0] == 40))))? 56'h20636d70676575 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 24))))? 56'h2020636d706e65 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 32))))? 56'h2020636d706571 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 5))))? 56'h20202020726574 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 62))))? 56'h20727376783632 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 3))))? 56'h20202020726f6c :
    (((D_op_opx & (D_iw_opx[5 : 0] == 57))))? 56'h20202020737562 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 28))))? 56'h206e6578747063 :
    (((D_op_opx & (D_iw_opx[5 : 0] == 36))))? 56'h20202064697675 :
    56'h20202020424144;

  assign W_vinst = W_valid ? D_inst : {7{8'h2d}};

//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  
//  assign av_ld_data_aligned_filtered = av_ld_data_aligned_unfiltered;
//
//synthesis read_comments_as_HDL off

endmodule

