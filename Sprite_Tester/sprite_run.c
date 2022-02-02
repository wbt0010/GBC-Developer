#include <gb/gb.h>
#include <gb/cgb.h>
#include <stdio.h>
//Name of file with sprite martices
#include "dia.h"

const UWORD backgpalette[] = {
    RGB_DARKGRAY, RGB_DARKGRAY, RGB_DARKGRAY, RGB_DARKGRAY
};

const UWORD spritepalette[] = {
    diaCGBPal0c0,
    diaCGBPal0c1,
    diaCGBPal0c2,
    diaCGBPal0c3,
};

void main(){

    set_bkg_palette(0,1,&backgpalette[0]);
    set_sprite_palette(0,1,&spritepalette[0]);
    
    //(First Sprite tile desired, Final Sprite tile desired, VariableXY name)
    //set_sprite_data(0, 4, Rocket);
    set_sprite_data(0, 6, dia);
    //(0 does nothing, Number Tile desired to be displayed)
    set_sprite_tile(0, 0);
    set_sprite_prop(0,0);
    //Initial Location of sprite (0 does nothing, X, Y)
    move_sprite(0, 88, 78);
    SHOW_SPRITES;
}