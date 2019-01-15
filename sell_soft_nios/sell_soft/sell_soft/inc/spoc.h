#ifndef SPOC_H_
#define SPOC_H_

#include "system.h"

#define _HEX7
#define _HEX6

#define _HEX5
#define _HEX4

#define _HEX2
#define _HEX1
#define _HEX0

#define _ENOUGH_MONEY
#define _BUY_SUCCESS

#define _THE_GOODS
#define _THE_MONEY
#define _CONFIRM_BUY
#define _BUY_FINISH
#define _CANCEL_BUY


typedef struct
{
    unsigned long int DATA;
    unsigned long int DIRECTION;
    unsigned long int INTERRUPT_MASK;
    unsigned long int EDGE_CAPTURE; 
}PIO_STR;

#ifdef _HEX7
#define HEX7 ((PIO_STR *)OUT_HEX7_BASE)
#endif

#ifdef _HEX6
#define HEX6 ((PIO_STR *)OUT_HEX6_BASE)
#endif

#ifdef _HEX5
#define HEX5 ((PIO_STR *)OUT_HEX5_BASE)
#endif

#ifdef _HEX4
#define HEX4 ((PIO_STR *)OUT_HEX4_BASE)
#endif

#ifdef _HEX2
#define HEX2 ((PIO_STR *)OUT_HEX2_BASE)
#endif

#ifdef _HEX1
#define HEX1 ((PIO_STR *)OUT_HEX1_BASE)
#endif

#ifdef _HEX0
#define HEX0 ((PIO_STR *)OUT_HEX0_BASE)
#endif

#ifdef _ENOUGH_MONEY
#define ENOUGH_MONEY ((PIO_STR *) OUT_ENOUGH_MONEY_BASE)
#endif

#ifdef _BUY_SUCCESS
#define BUY_SUCCESS ((PIO_STR *)OUT_BUY_SUCCESS_BASE)
#endif

#ifdef _THE_GOODS
#define THE_GOODS ((PIO_STR *)INP_THE_GOODS_BASE)
#endif

#ifdef _THE_MONEY
#define THE_MONEY ((PIO_STR *)INP_THE_MONEY_BASE)
#endif

#ifdef _CONFIRM_BUY
#define CONFIRM_BUY ((PIO_STR *)INP_CONFIRM_BUY_BASE) 
#endif

#ifdef _BUY_FINISH
#define BUY_FINISH ((PIO_STR *)INP_BUY_FINISH_BASE)
#endif 

#ifdef _CANCEL_BUY
#define CANCEL_BUY ((PIO_STR *)INP_CANCEL_BUY_BASE)
#endif

#endif /*SPOC_H_*/
