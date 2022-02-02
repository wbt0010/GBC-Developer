#include <gb/gb.h>
#include <stdio.h>
#include "title_data.c"
#include "title_map.c"

UINT8 backgroundoffset1x;

void interruptLCD(){
    switch (LYC_REG)
    {
        case 0x35:
            move_bkg(backgroundoffset1x,0);
            LYC_REG = 0x35;
            break;
    }
}

void main(){
    backgroundoffset1x = 0;
    set_bkg_data(0, 170, title_data);
    set_bkg_tiles(0, 0, 18, 18, title_map);

    STAT_REG = 0x45; // enable LYC=LY interrupt so that we can set a specific line it will fire at
    LYC_REG = 0x00;

    disable_interrupts();
    add_LCD(interruptLCD);
    enable_interrupts();

    set_interrupts(VBL_IFLAG | LCD_IFLAG);

    SHOW_BKG;
    DISPLAY_ON;

    while(1){
        backgroundoffset1x += 1;
        delay(10);
    }

}