#include "../inc/spoc.h"
#include "sys/alt_irq.h"
#include "system.h"
#include <unistd.h>
//the include info
//int the_goods=0;
int price=0;
int change=0;
int pay=0;
//jc_yuan the perfect version
//the initial value declare
//the display of HEX
int display_hex(int num)
{
    int show=64;
    switch(num)
        {
            case 0:
                    show=64;  //7'b0000000
                    break;
            case 1:
                    show=121; //7'b1111001
                    break;
            case 2:
                    show=36; //7'b0100100
                    break;
            case 3:
                    show=48; //7'b0110000
                    break;
            case 4:
                    show=25; //7'b0011001
                    break;
            case 5:
                    show=18; //7'b0010010
                    break;
            case 6:
                    show=2; //7'b0000010
                    break;
            case 7:
                    show=120; //7'b1111000
                    break;                    
            case 8:
                    show=0; //7'b0000000
                    break;        
            case 9:
                    show=16; //7'b0010000
                    break;        
        }
    return show;
}
//the choose of goods----------------------------------------------------
/*void ISR_CHOOSE(void *context,unsigned long id)
{
    if(THE_GOODS->DATA==4)
    {
        price=20;
    }
    else if(THE_GOODS->DATA==2)
    {
        price=14;
    }
    else if(THE_GOODS->DATA==1)
    {   
        price=10;
    }
    else
    {
        price=price;
    }
}
int init_ISR_CHOOSE(void)
{
    THE_GOODS->INTERRUPT_MASK=7;
    THE_GOODS->EDGE_CAPTURE=7;
    return alt_irq_register(INP_THE_GOODS_IRQ,NULL,ISR_CHOOSE);
} */
//--------------------------------------------------------------
//the pay of money----------------------------------------------
void ISR_MONEY(void *context,unsigned long id)
{
    THE_GOODS->INTERRUPT_MASK=0;
    THE_GOODS->EDGE_CAPTURE=1;//for the reason of the priority
   // CONFIRM_BUY->INTERRUPT_MASK=1;
   // CONFIRM_BUY->EDGE_CAPTURE=1;
   // CANCEL_BUY->INTERRUPT_MASK=1;
   // CANCEL_BUY->EDGE_CAPTURE=1;
    
        
    if(THE_MONEY->DATA==4)
    {
        pay=pay+10;
    }
    else if(THE_MONEY->DATA==2)
    {
        pay=pay+5;
    }
    else if(THE_MONEY->DATA==1)
    {
        pay=pay+1;
    }
    else
    {
        pay=pay;
    }
    THE_MONEY->EDGE_CAPTURE=7;
    
    
}
int init_ISR_MONEY(void)
{
    THE_MONEY->INTERRUPT_MASK=7;
    THE_MONEY->EDGE_CAPTURE=7;
    return alt_irq_register(INP_THE_MONEY_IRQ,NULL,ISR_MONEY);
}
//--------------------------------------------------------------
//cancel buy it-------------------------------------------------
void ISR_CANCEL(void *context,unsigned long id)
{
    price=0;
    change=pay;
//    usleep(1000000);
//    price=0;
//    change=0;
//    pay=0;
    CANCEL_BUY->EDGE_CAPTURE=1;
}
int init_ISR_CANCEL(void)
{
    CANCEL_BUY->INTERRUPT_MASK=1;
    CANCEL_BUY->EDGE_CAPTURE=1;
    return alt_irq_register(INP_CANCEL_BUY_IRQ,NULL,ISR_CANCEL);

}
//----------------------------------------------------------------
//confirm to buy  SW[16]------------------------------------------
void ISR_CONFIRM(void *context,unsigned long id)
{
    CANCEL_BUY->INTERRUPT_MASK=0;
    CANCEL_BUY->EDGE_CAPTURE=1;
    change=pay-price;
    CONFIRM_BUY->EDGE_CAPTURE=1;
}
int init_ISR_CONFIRM(void)
{
    CONFIRM_BUY->INTERRUPT_MASK=1;
    CONFIRM_BUY->EDGE_CAPTURE=1;
    return alt_irq_register(INP_CONFIRM_BUY_IRQ,NULL,ISR_CONFIRM);
}
//-----------------------------------------------------------------
//buying is finish
void ISR_FINISH(void *context,unsigned long id)
{   
    if((pay>=price)&&(pay!=0))
    {
        BUY_SUCCESS->DATA=1;
    }
    else
    {
        BUY_SUCCESS->DATA=0;    
    }
    usleep(1000000);
    BUY_SUCCESS->DATA=0;
    price=0;
    change=0;
    pay=0;
    
    BUY_FINISH->EDGE_CAPTURE=1;
} 
int init_ISR_FINISH(void)
{
    BUY_FINISH->INTERRUPT_MASK=1;
    BUY_FINISH->EDGE_CAPTURE=1;
    return alt_irq_register(INP_BUY_FINISH_IRQ,NULL,ISR_FINISH);
}
//------------------------------------------------------------------
int main(void)
{
    price=0;
    change=0;
    pay=0;
   // init_ISR_CHOOSE();
    init_ISR_MONEY();
    init_ISR_CANCEL();
    init_ISR_CONFIRM();
    init_ISR_FINISH();

    while(1)
    {
        if(THE_GOODS->DATA==4)
        {
            price=20;
        }
        else if(THE_GOODS->DATA==2)
        {
            price=14;
        }
        else if(THE_GOODS->DATA==1)
        {   
            price=10;
        }
        else
        {
            price=price;
        }
        HEX7->DATA=display_hex(price/10);
        HEX6->DATA=display_hex(price%10);
        
        if((pay>=price)&&(pay!=0))
        {
            ENOUGH_MONEY->DATA=1;
        }
        else
        {
            ENOUGH_MONEY->DATA=0;
        }
    
       // HEX7->DATA=display_hex(price/10);
       // HEX6->DATA=display_hex(price%10);
        
        HEX5->DATA=display_hex(pay/10);
        HEX4->DATA=display_hex(pay%10);
        
        HEX2->DATA=display_hex(change/10);
        HEX1->DATA=display_hex((change%10)/5);
        HEX0->DATA=display_hex((change%10)%5);
    }
    return 0;
}






