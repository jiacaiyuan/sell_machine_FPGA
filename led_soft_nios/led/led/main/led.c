#include "../inc/sopc.h"
#include <unistd.h>



int main(void)
{
    int i;
    
    while(1)
    {
        for(i=0;i<8;i++)
        {
             LED->DATA =1 << i;
             usleep(100000);
             
        }
    
    }
    return 0;
}