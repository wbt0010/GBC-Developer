#include <gb/gb.h>
#include <stdio.h>

void main()
{
    UINT8 x = 1;
    while (x == 1)
    {
        printf("Hello World");
        delay(1500);
        x = x + 1;
        if (x == 2)
        {
            printf(", Suckith my dickus from the rear");
            
        }

    }
    
}