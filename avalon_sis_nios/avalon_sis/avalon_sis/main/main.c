#include "system.h"
#include "../inc/sopc.h"
#include "sys/alt_irq.h"

#include <unistd.h>
#include <stdio.h>

int init_SW(void);
void ISR_SW(void *context,unsigned long id);
//define the avalon name
typedef struct
{
    unsigned long int sw;
}sell_ha_so;
sell_ha_so* sell=(sell_ha_so *) VENDOR3_TOP_3_0_BASE;

void ISR_SW(void *context,unsigned long id)
{
    sell->sw=SW->DATA;
    SW->EDGE_CAPTURE=262143;
    sell->sw=0;//add later
}

int init_SW(void)
{
    SW->INTERRUPT_MASK=262143;
    SW->EDGE_CAPTURE=262143;
    return alt_irq_register(SW_IRQ,NULL,ISR_SW);
}
int main(void)
{
    init_SW();
    sell->sw=0;
    while(1)
    {
        ;
    }
    return 0;
}




