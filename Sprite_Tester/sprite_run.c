#include <gb/gb.h>
#include <stdio.h>
//Name of file with sprite martices
#include "Rocket.c"
#include "dia.c"


void main(){
    //Arbitary Variable UINT8 means 8 bit integer, allows cycling of sprites
    UINT8 currentspriteindex = 0;
    //(First Sprite tile desired, Final Sprite tile desired, VariableXY name)
    //set_sprite_data(0, 4, Rocket);
    set_sprite_data(0, 6, dia);
    //(0 does nothing, Number Tile desired to be displayed)
    set_sprite_tile(0, 0);
    //Initial Location of sprite (0 does nothing, X, Y)
    move_sprite(0, 88, 78);
    SHOW_SPRITES;

    while(1){
        set_sprite_tile(0,0);
        currentspriteindex = 1;
        set_sprite_tile(0, currentspriteindex);
        delay(100);
        //Moves sprite across the screen (0 does nothing, move x, move y)
        scroll_sprite(0, 5, 5);
        currentspriteindex = 2;
        set_sprite_tile(0, currentspriteindex);
        delay(100);
        scroll_sprite(0, 5, 5);
        currentspriteindex = 3;
        set_sprite_tile(0, currentspriteindex);
        delay(100);
        scroll_sprite(0, 5, 5);
        currentspriteindex = 0;
        set_sprite_tile(0, currentspriteindex);
        delay(100);
        scroll_sprite(0, 5, 5);
    }
}