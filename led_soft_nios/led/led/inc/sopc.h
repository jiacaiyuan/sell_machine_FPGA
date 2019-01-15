#ifndef SOPC_H_
#define SOPC_H_

#include "system.h"

#define _LED

typedef struct
{
    unsigned long int DATA;
    unsigned long int DIRECTION;
    unsigned long int INTERRUPT_MASK;
    unsigned long int EDGE_CAPTURE;
}PIO_STR;

#ifdef _LED
#define LED ((PIO_STR*) PIO_BASE)
#endif


#endif /*SOPC_H_*/
