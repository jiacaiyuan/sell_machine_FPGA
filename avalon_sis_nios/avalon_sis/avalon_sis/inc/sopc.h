#ifndef SOPC_H_
#define SOPC_H_

#include "system.h"

#define _SW

typedef struct
{
    unsigned long int DATA;
    unsigned long int DIRECTION;
    unsigned long int INTERRUPT_MASK;
    unsigned long int EDGE_CAPTURE;
}PIO_STR;

#ifdef _SW
#define SW ((PIO_STR*) SW_BASE)
#endif

#endif /*SOPC_H_*/
