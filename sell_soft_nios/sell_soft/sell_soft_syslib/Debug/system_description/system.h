/* system.h
 *
 * Machine generated for a CPU named "cpu" as defined in:
 * C:\Users\Dell\Desktop\sell_soft\KERNEL.ptf
 *
 * Generated: 2018-03-21 21:07:33.988
 *
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/*

DO NOT MODIFY THIS FILE

   Changing this file will have subtle consequences
   which will almost certainly lead to a nonfunctioning
   system. If you do modify this file, be aware that your
   changes will be overwritten and lost when this file
   is generated again.

DO NOT MODIFY THIS FILE

*/

/******************************************************************************
*                                                                             *
* License Agreement                                                           *
*                                                                             *
* Copyright (c) 2003 Altera Corporation, San Jose, California, USA.           *
* All rights reserved.                                                        *
*                                                                             *
* Permission is hereby granted, free of charge, to any person obtaining a     *
* copy of this software and associated documentation files (the "Software"),  *
* to deal in the Software without restriction, including without limitation   *
* the rights to use, copy, modify, merge, publish, distribute, sublicense,    *
* and/or sell copies of the Software, and to permit persons to whom the       *
* Software is furnished to do so, subject to the following conditions:        *
*                                                                             *
* The above copyright notice and this permission notice shall be included in  *
* all copies or substantial portions of the Software.                         *
*                                                                             *
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  *
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,    *
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE *
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER      *
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING     *
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER         *
* DEALINGS IN THE SOFTWARE.                                                   *
*                                                                             *
* This agreement shall be governed in all respects by the laws of the State   *
* of California and by the laws of the United States of America.              *
*                                                                             *
******************************************************************************/

/*
 * system configuration
 *
 */

#define ALT_SYSTEM_NAME "KERNEL"
#define ALT_CPU_NAME "cpu"
#define ALT_CPU_ARCHITECTURE "altera_nios2"
#define ALT_DEVICE_FAMILY "CYCLONEII"
#define ALT_STDIN "/dev/null"
#define ALT_STDIN_TYPE ""
#define ALT_STDIN_BASE UNDEFINED VARIABLE %BASE_ADDRESS%
#define ALT_STDIN_DEV null
#define ALT_STDOUT "/dev/null"
#define ALT_STDOUT_TYPE ""
#define ALT_STDOUT_BASE UNDEFINED VARIABLE %BASE_ADDRESS%
#define ALT_STDOUT_DEV null
#define ALT_STDERR "/dev/null"
#define ALT_STDERR_TYPE ""
#define ALT_STDERR_BASE UNDEFINED VARIABLE %BASE_ADDRESS%
#define ALT_STDERR_DEV null
#define ALT_CPU_FREQ 50000000
#define ALT_IRQ_BASE NULL

/*
 * processor configuration
 *
 */

#define NIOS2_CPU_IMPLEMENTATION "fast"
#define NIOS2_BIG_ENDIAN 0

#define NIOS2_ICACHE_SIZE 4096
#define NIOS2_DCACHE_SIZE 0
#define NIOS2_ICACHE_LINE_SIZE 32
#define NIOS2_ICACHE_LINE_SIZE_LOG2 5
#define NIOS2_DCACHE_LINE_SIZE 0
#define NIOS2_DCACHE_LINE_SIZE_LOG2 0
#define NIOS2_FLUSHDA_SUPPORTED

#define NIOS2_EXCEPTION_ADDR 0x00000020
#define NIOS2_RESET_ADDR 0x00000000
#define NIOS2_BREAK_ADDR 0x00008820

#define NIOS2_HAS_DEBUG_STUB

#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0

/*
 * A define for each class of peripheral
 *
 */

#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __ALTERA_AVALON_PIO

/*
 * onchip_memory configuration
 *
 */

#define ONCHIP_MEMORY_NAME "/dev/onchip_memory"
#define ONCHIP_MEMORY_TYPE "altera_avalon_onchip_memory2"
#define ONCHIP_MEMORY_BASE 0x00000000
#define ONCHIP_MEMORY_SPAN 32768
#define ONCHIP_MEMORY_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define ONCHIP_MEMORY_RAM_BLOCK_TYPE "M4K"
#define ONCHIP_MEMORY_INIT_CONTENTS_FILE "onchip_memory"
#define ONCHIP_MEMORY_NON_DEFAULT_INIT_FILE_ENABLED 0
#define ONCHIP_MEMORY_GUI_RAM_BLOCK_TYPE "Automatic"
#define ONCHIP_MEMORY_WRITEABLE 1
#define ONCHIP_MEMORY_DUAL_PORT 0
#define ONCHIP_MEMORY_SIZE_VALUE 32768
#define ONCHIP_MEMORY_SIZE_MULTIPLE 1
#define ONCHIP_MEMORY_USE_SHALLOW_MEM_BLOCKS 0
#define ONCHIP_MEMORY_INIT_MEM_CONTENT 1
#define ONCHIP_MEMORY_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define ONCHIP_MEMORY_INSTANCE_ID "NONE"
#define ONCHIP_MEMORY_READ_DURING_WRITE_MODE "DONT_CARE"
#define ONCHIP_MEMORY_IGNORE_AUTO_BLOCK_TYPE_ASSIGNMENT 1
#define ONCHIP_MEMORY_CONTENTS_INFO ""
#define ALT_MODULE_CLASS_onchip_memory altera_avalon_onchip_memory2

/*
 * out_enough_money configuration
 *
 */

#define OUT_ENOUGH_MONEY_NAME "/dev/out_enough_money"
#define OUT_ENOUGH_MONEY_TYPE "altera_avalon_pio"
#define OUT_ENOUGH_MONEY_BASE 0x00009000
#define OUT_ENOUGH_MONEY_SPAN 16
#define OUT_ENOUGH_MONEY_DO_TEST_BENCH_WIRING 0
#define OUT_ENOUGH_MONEY_DRIVEN_SIM_VALUE 0
#define OUT_ENOUGH_MONEY_HAS_TRI 0
#define OUT_ENOUGH_MONEY_HAS_OUT 1
#define OUT_ENOUGH_MONEY_HAS_IN 0
#define OUT_ENOUGH_MONEY_CAPTURE 0
#define OUT_ENOUGH_MONEY_DATA_WIDTH 1
#define OUT_ENOUGH_MONEY_RESET_VALUE 0
#define OUT_ENOUGH_MONEY_EDGE_TYPE "NONE"
#define OUT_ENOUGH_MONEY_IRQ_TYPE "NONE"
#define OUT_ENOUGH_MONEY_BIT_CLEARING_EDGE_REGISTER 0
#define OUT_ENOUGH_MONEY_BIT_MODIFYING_OUTPUT_REGISTER 0
#define OUT_ENOUGH_MONEY_FREQ 50000000
#define ALT_MODULE_CLASS_out_enough_money altera_avalon_pio

/*
 * out_buy_success configuration
 *
 */

#define OUT_BUY_SUCCESS_NAME "/dev/out_buy_success"
#define OUT_BUY_SUCCESS_TYPE "altera_avalon_pio"
#define OUT_BUY_SUCCESS_BASE 0x00009010
#define OUT_BUY_SUCCESS_SPAN 16
#define OUT_BUY_SUCCESS_DO_TEST_BENCH_WIRING 0
#define OUT_BUY_SUCCESS_DRIVEN_SIM_VALUE 0
#define OUT_BUY_SUCCESS_HAS_TRI 0
#define OUT_BUY_SUCCESS_HAS_OUT 1
#define OUT_BUY_SUCCESS_HAS_IN 0
#define OUT_BUY_SUCCESS_CAPTURE 0
#define OUT_BUY_SUCCESS_DATA_WIDTH 1
#define OUT_BUY_SUCCESS_RESET_VALUE 0
#define OUT_BUY_SUCCESS_EDGE_TYPE "NONE"
#define OUT_BUY_SUCCESS_IRQ_TYPE "NONE"
#define OUT_BUY_SUCCESS_BIT_CLEARING_EDGE_REGISTER 0
#define OUT_BUY_SUCCESS_BIT_MODIFYING_OUTPUT_REGISTER 0
#define OUT_BUY_SUCCESS_FREQ 50000000
#define ALT_MODULE_CLASS_out_buy_success altera_avalon_pio

/*
 * inp_the_goods configuration
 *
 */

#define INP_THE_GOODS_NAME "/dev/inp_the_goods"
#define INP_THE_GOODS_TYPE "altera_avalon_pio"
#define INP_THE_GOODS_BASE 0x00009020
#define INP_THE_GOODS_SPAN 16
#define INP_THE_GOODS_IRQ 0
#define INP_THE_GOODS_DO_TEST_BENCH_WIRING 0
#define INP_THE_GOODS_DRIVEN_SIM_VALUE 0
#define INP_THE_GOODS_HAS_TRI 0
#define INP_THE_GOODS_HAS_OUT 0
#define INP_THE_GOODS_HAS_IN 1
#define INP_THE_GOODS_CAPTURE 1
#define INP_THE_GOODS_DATA_WIDTH 3
#define INP_THE_GOODS_RESET_VALUE 0
#define INP_THE_GOODS_EDGE_TYPE "RISING"
#define INP_THE_GOODS_IRQ_TYPE "EDGE"
#define INP_THE_GOODS_BIT_CLEARING_EDGE_REGISTER 0
#define INP_THE_GOODS_BIT_MODIFYING_OUTPUT_REGISTER 0
#define INP_THE_GOODS_FREQ 50000000
#define ALT_MODULE_CLASS_inp_the_goods altera_avalon_pio

/*
 * inp_the_money configuration
 *
 */

#define INP_THE_MONEY_NAME "/dev/inp_the_money"
#define INP_THE_MONEY_TYPE "altera_avalon_pio"
#define INP_THE_MONEY_BASE 0x00009030
#define INP_THE_MONEY_SPAN 16
#define INP_THE_MONEY_IRQ 1
#define INP_THE_MONEY_DO_TEST_BENCH_WIRING 0
#define INP_THE_MONEY_DRIVEN_SIM_VALUE 0
#define INP_THE_MONEY_HAS_TRI 0
#define INP_THE_MONEY_HAS_OUT 0
#define INP_THE_MONEY_HAS_IN 1
#define INP_THE_MONEY_CAPTURE 1
#define INP_THE_MONEY_DATA_WIDTH 3
#define INP_THE_MONEY_RESET_VALUE 0
#define INP_THE_MONEY_EDGE_TYPE "RISING"
#define INP_THE_MONEY_IRQ_TYPE "EDGE"
#define INP_THE_MONEY_BIT_CLEARING_EDGE_REGISTER 0
#define INP_THE_MONEY_BIT_MODIFYING_OUTPUT_REGISTER 0
#define INP_THE_MONEY_FREQ 50000000
#define ALT_MODULE_CLASS_inp_the_money altera_avalon_pio

/*
 * inp_confirm_buy configuration
 *
 */

#define INP_CONFIRM_BUY_NAME "/dev/inp_confirm_buy"
#define INP_CONFIRM_BUY_TYPE "altera_avalon_pio"
#define INP_CONFIRM_BUY_BASE 0x00009040
#define INP_CONFIRM_BUY_SPAN 16
#define INP_CONFIRM_BUY_IRQ 2
#define INP_CONFIRM_BUY_DO_TEST_BENCH_WIRING 0
#define INP_CONFIRM_BUY_DRIVEN_SIM_VALUE 0
#define INP_CONFIRM_BUY_HAS_TRI 0
#define INP_CONFIRM_BUY_HAS_OUT 0
#define INP_CONFIRM_BUY_HAS_IN 1
#define INP_CONFIRM_BUY_CAPTURE 1
#define INP_CONFIRM_BUY_DATA_WIDTH 1
#define INP_CONFIRM_BUY_RESET_VALUE 0
#define INP_CONFIRM_BUY_EDGE_TYPE "RISING"
#define INP_CONFIRM_BUY_IRQ_TYPE "EDGE"
#define INP_CONFIRM_BUY_BIT_CLEARING_EDGE_REGISTER 0
#define INP_CONFIRM_BUY_BIT_MODIFYING_OUTPUT_REGISTER 0
#define INP_CONFIRM_BUY_FREQ 50000000
#define ALT_MODULE_CLASS_inp_confirm_buy altera_avalon_pio

/*
 * inp_buy_finish configuration
 *
 */

#define INP_BUY_FINISH_NAME "/dev/inp_buy_finish"
#define INP_BUY_FINISH_TYPE "altera_avalon_pio"
#define INP_BUY_FINISH_BASE 0x00009050
#define INP_BUY_FINISH_SPAN 16
#define INP_BUY_FINISH_IRQ 3
#define INP_BUY_FINISH_DO_TEST_BENCH_WIRING 0
#define INP_BUY_FINISH_DRIVEN_SIM_VALUE 0
#define INP_BUY_FINISH_HAS_TRI 0
#define INP_BUY_FINISH_HAS_OUT 0
#define INP_BUY_FINISH_HAS_IN 1
#define INP_BUY_FINISH_CAPTURE 1
#define INP_BUY_FINISH_DATA_WIDTH 1
#define INP_BUY_FINISH_RESET_VALUE 0
#define INP_BUY_FINISH_EDGE_TYPE "RISING"
#define INP_BUY_FINISH_IRQ_TYPE "EDGE"
#define INP_BUY_FINISH_BIT_CLEARING_EDGE_REGISTER 0
#define INP_BUY_FINISH_BIT_MODIFYING_OUTPUT_REGISTER 0
#define INP_BUY_FINISH_FREQ 50000000
#define ALT_MODULE_CLASS_inp_buy_finish altera_avalon_pio

/*
 * inp_cancel_buy configuration
 *
 */

#define INP_CANCEL_BUY_NAME "/dev/inp_cancel_buy"
#define INP_CANCEL_BUY_TYPE "altera_avalon_pio"
#define INP_CANCEL_BUY_BASE 0x00009060
#define INP_CANCEL_BUY_SPAN 16
#define INP_CANCEL_BUY_IRQ 4
#define INP_CANCEL_BUY_DO_TEST_BENCH_WIRING 0
#define INP_CANCEL_BUY_DRIVEN_SIM_VALUE 0
#define INP_CANCEL_BUY_HAS_TRI 0
#define INP_CANCEL_BUY_HAS_OUT 0
#define INP_CANCEL_BUY_HAS_IN 1
#define INP_CANCEL_BUY_CAPTURE 1
#define INP_CANCEL_BUY_DATA_WIDTH 1
#define INP_CANCEL_BUY_RESET_VALUE 0
#define INP_CANCEL_BUY_EDGE_TYPE "RISING"
#define INP_CANCEL_BUY_IRQ_TYPE "EDGE"
#define INP_CANCEL_BUY_BIT_CLEARING_EDGE_REGISTER 0
#define INP_CANCEL_BUY_BIT_MODIFYING_OUTPUT_REGISTER 0
#define INP_CANCEL_BUY_FREQ 50000000
#define ALT_MODULE_CLASS_inp_cancel_buy altera_avalon_pio

/*
 * out_hex7 configuration
 *
 */

#define OUT_HEX7_NAME "/dev/out_hex7"
#define OUT_HEX7_TYPE "altera_avalon_pio"
#define OUT_HEX7_BASE 0x00009070
#define OUT_HEX7_SPAN 16
#define OUT_HEX7_DO_TEST_BENCH_WIRING 0
#define OUT_HEX7_DRIVEN_SIM_VALUE 0
#define OUT_HEX7_HAS_TRI 0
#define OUT_HEX7_HAS_OUT 1
#define OUT_HEX7_HAS_IN 0
#define OUT_HEX7_CAPTURE 0
#define OUT_HEX7_DATA_WIDTH 7
#define OUT_HEX7_RESET_VALUE 0
#define OUT_HEX7_EDGE_TYPE "NONE"
#define OUT_HEX7_IRQ_TYPE "NONE"
#define OUT_HEX7_BIT_CLEARING_EDGE_REGISTER 0
#define OUT_HEX7_BIT_MODIFYING_OUTPUT_REGISTER 0
#define OUT_HEX7_FREQ 50000000
#define ALT_MODULE_CLASS_out_hex7 altera_avalon_pio

/*
 * out_hex6 configuration
 *
 */

#define OUT_HEX6_NAME "/dev/out_hex6"
#define OUT_HEX6_TYPE "altera_avalon_pio"
#define OUT_HEX6_BASE 0x00009080
#define OUT_HEX6_SPAN 16
#define OUT_HEX6_DO_TEST_BENCH_WIRING 0
#define OUT_HEX6_DRIVEN_SIM_VALUE 0
#define OUT_HEX6_HAS_TRI 0
#define OUT_HEX6_HAS_OUT 1
#define OUT_HEX6_HAS_IN 0
#define OUT_HEX6_CAPTURE 0
#define OUT_HEX6_DATA_WIDTH 7
#define OUT_HEX6_RESET_VALUE 0
#define OUT_HEX6_EDGE_TYPE "NONE"
#define OUT_HEX6_IRQ_TYPE "NONE"
#define OUT_HEX6_BIT_CLEARING_EDGE_REGISTER 0
#define OUT_HEX6_BIT_MODIFYING_OUTPUT_REGISTER 0
#define OUT_HEX6_FREQ 50000000
#define ALT_MODULE_CLASS_out_hex6 altera_avalon_pio

/*
 * out_hex5 configuration
 *
 */

#define OUT_HEX5_NAME "/dev/out_hex5"
#define OUT_HEX5_TYPE "altera_avalon_pio"
#define OUT_HEX5_BASE 0x00009090
#define OUT_HEX5_SPAN 16
#define OUT_HEX5_DO_TEST_BENCH_WIRING 0
#define OUT_HEX5_DRIVEN_SIM_VALUE 0
#define OUT_HEX5_HAS_TRI 0
#define OUT_HEX5_HAS_OUT 1
#define OUT_HEX5_HAS_IN 0
#define OUT_HEX5_CAPTURE 0
#define OUT_HEX5_DATA_WIDTH 7
#define OUT_HEX5_RESET_VALUE 0
#define OUT_HEX5_EDGE_TYPE "NONE"
#define OUT_HEX5_IRQ_TYPE "NONE"
#define OUT_HEX5_BIT_CLEARING_EDGE_REGISTER 0
#define OUT_HEX5_BIT_MODIFYING_OUTPUT_REGISTER 0
#define OUT_HEX5_FREQ 50000000
#define ALT_MODULE_CLASS_out_hex5 altera_avalon_pio

/*
 * out_hex4 configuration
 *
 */

#define OUT_HEX4_NAME "/dev/out_hex4"
#define OUT_HEX4_TYPE "altera_avalon_pio"
#define OUT_HEX4_BASE 0x000090a0
#define OUT_HEX4_SPAN 16
#define OUT_HEX4_DO_TEST_BENCH_WIRING 0
#define OUT_HEX4_DRIVEN_SIM_VALUE 0
#define OUT_HEX4_HAS_TRI 0
#define OUT_HEX4_HAS_OUT 1
#define OUT_HEX4_HAS_IN 0
#define OUT_HEX4_CAPTURE 0
#define OUT_HEX4_DATA_WIDTH 7
#define OUT_HEX4_RESET_VALUE 0
#define OUT_HEX4_EDGE_TYPE "NONE"
#define OUT_HEX4_IRQ_TYPE "NONE"
#define OUT_HEX4_BIT_CLEARING_EDGE_REGISTER 0
#define OUT_HEX4_BIT_MODIFYING_OUTPUT_REGISTER 0
#define OUT_HEX4_FREQ 50000000
#define ALT_MODULE_CLASS_out_hex4 altera_avalon_pio

/*
 * out_hex2 configuration
 *
 */

#define OUT_HEX2_NAME "/dev/out_hex2"
#define OUT_HEX2_TYPE "altera_avalon_pio"
#define OUT_HEX2_BASE 0x000090b0
#define OUT_HEX2_SPAN 16
#define OUT_HEX2_DO_TEST_BENCH_WIRING 0
#define OUT_HEX2_DRIVEN_SIM_VALUE 0
#define OUT_HEX2_HAS_TRI 0
#define OUT_HEX2_HAS_OUT 1
#define OUT_HEX2_HAS_IN 0
#define OUT_HEX2_CAPTURE 0
#define OUT_HEX2_DATA_WIDTH 7
#define OUT_HEX2_RESET_VALUE 0
#define OUT_HEX2_EDGE_TYPE "NONE"
#define OUT_HEX2_IRQ_TYPE "NONE"
#define OUT_HEX2_BIT_CLEARING_EDGE_REGISTER 0
#define OUT_HEX2_BIT_MODIFYING_OUTPUT_REGISTER 0
#define OUT_HEX2_FREQ 50000000
#define ALT_MODULE_CLASS_out_hex2 altera_avalon_pio

/*
 * out_hex1 configuration
 *
 */

#define OUT_HEX1_NAME "/dev/out_hex1"
#define OUT_HEX1_TYPE "altera_avalon_pio"
#define OUT_HEX1_BASE 0x000090c0
#define OUT_HEX1_SPAN 16
#define OUT_HEX1_DO_TEST_BENCH_WIRING 0
#define OUT_HEX1_DRIVEN_SIM_VALUE 0
#define OUT_HEX1_HAS_TRI 0
#define OUT_HEX1_HAS_OUT 1
#define OUT_HEX1_HAS_IN 0
#define OUT_HEX1_CAPTURE 0
#define OUT_HEX1_DATA_WIDTH 7
#define OUT_HEX1_RESET_VALUE 0
#define OUT_HEX1_EDGE_TYPE "NONE"
#define OUT_HEX1_IRQ_TYPE "NONE"
#define OUT_HEX1_BIT_CLEARING_EDGE_REGISTER 0
#define OUT_HEX1_BIT_MODIFYING_OUTPUT_REGISTER 0
#define OUT_HEX1_FREQ 50000000
#define ALT_MODULE_CLASS_out_hex1 altera_avalon_pio

/*
 * out_hex0 configuration
 *
 */

#define OUT_HEX0_NAME "/dev/out_hex0"
#define OUT_HEX0_TYPE "altera_avalon_pio"
#define OUT_HEX0_BASE 0x000090d0
#define OUT_HEX0_SPAN 16
#define OUT_HEX0_DO_TEST_BENCH_WIRING 0
#define OUT_HEX0_DRIVEN_SIM_VALUE 0
#define OUT_HEX0_HAS_TRI 0
#define OUT_HEX0_HAS_OUT 1
#define OUT_HEX0_HAS_IN 0
#define OUT_HEX0_CAPTURE 0
#define OUT_HEX0_DATA_WIDTH 7
#define OUT_HEX0_RESET_VALUE 0
#define OUT_HEX0_EDGE_TYPE "NONE"
#define OUT_HEX0_IRQ_TYPE "NONE"
#define OUT_HEX0_BIT_CLEARING_EDGE_REGISTER 0
#define OUT_HEX0_BIT_MODIFYING_OUTPUT_REGISTER 0
#define OUT_HEX0_FREQ 50000000
#define ALT_MODULE_CLASS_out_hex0 altera_avalon_pio

/*
 * system library configuration
 *
 */

#define ALT_MAX_FD 32
#define ALT_SYS_CLK none
#define ALT_TIMESTAMP_CLK none

/*
 * Devices associated with code sections.
 *
 */

#define ALT_TEXT_DEVICE       ONCHIP_MEMORY
#define ALT_RODATA_DEVICE     ONCHIP_MEMORY
#define ALT_RWDATA_DEVICE     ONCHIP_MEMORY
#define ALT_EXCEPTIONS_DEVICE ONCHIP_MEMORY
#define ALT_RESET_DEVICE      ONCHIP_MEMORY

/*
 * The text section is initialised so no bootloader will be required.
 * Set a variable to tell crt0.S to provide code at the reset address and
 * to initialise rwdata if appropriate.
 */

#define ALT_NO_BOOTLOADER


#endif /* __SYSTEM_H_ */
