#include <gb/gb.h>
#include <gb/cgb.h>
#include <stdio.h>
//Name of file with sprite martices
#include "dia.h"
UINT8 status = 0;
UINT8 mappos = 0;
UINT8 spawn = 0;
UINT8 spawnlocal = 0;
UINT8 enemyspawn = 0;
UINT8 crosshairlocation[2];
UINT8 selectorlocation[2];
UINT8 towerAlocation[2];
UINT8 towerBlocation[2];
UINT8 towerClocation[2];
UINT8 outofthefuckingway[2];

const UWORD backgpalette[] = {
    RGB_DARKGRAY, RGB_DARKGRAY, RGB_DARKGRAY, RGB_DARKGRAY
};

const UWORD spritepalette[] = {
    diaCGBPal0c0,
    diaCGBPal0c1,
    diaCGBPal0c2,
    diaCGBPal0c3,
};
//delay function so the game doesn't run too fast
void performantdelay(UINT8 numloops){
    UINT8 i;
    for(i = 0; i < numloops; i++){
        wait_vbl_done();
    }     
}

void main(){
    //tower sprite location [0],x [1],y
    towerAlocation[0] = 80;
    towerAlocation[1] = 108;
    towerBlocation[0] = 40;
    towerBlocation[1] = 72;
    towerClocation[0] = 120;
    towerClocation[1] = 72;
    //initializing selector location
    selectorlocation[0] = towerAlocation[0];
    selectorlocation[1] = towerAlocation[1];
    crosshairlocation[0] = 80;
    crosshairlocation[1] = 72;
    set_bkg_palette(0,1,&backgpalette[0]);
    set_sprite_palette(0,1,&spritepalette[0]);
    
    //(First Sprite tile desired, Final Sprite tile desired, VariableXY name)
    set_sprite_data(0, 3, dia);
    //(Entity #, Number Tile desired to be displayed)
    //selector tile(tile identifyer, tile location)
    set_sprite_tile(0,0);
    set_sprite_tile(1,1);
    set_sprite_tile(2,2);
    set_sprite_prop(0,0);

    SHOW_SPRITES;

    while (1){
        if(status == 0){
        if(joypad() & J_DOWN){
            selectorlocation[0] = towerAlocation[0];
            selectorlocation[1] = towerAlocation[1];
            mappos = 0;
        }
        if(joypad() & J_LEFT){
            selectorlocation[0] = towerBlocation[0];
            selectorlocation[1] = towerBlocation[1];
            mappos = 1;
        }
        if(joypad() & J_RIGHT){
            selectorlocation[0] = towerClocation[0];
            selectorlocation[1] = towerClocation[1];
            mappos = 2;
            }
        }
        while(joypad() & J_B){
            status = 1;
            move_sprite(0, outofthefuckingway[0], outofthefuckingway[1]);
            if(joypad() & J_UP && crosshairlocation[1] >= 20){
                crosshairlocation[1] = crosshairlocation[1] - 1;
            }
            if(joypad() & J_DOWN && crosshairlocation[1] <= towerAlocation[1]){
                crosshairlocation[1] = crosshairlocation[1] + 1;
            }
            if(joypad() & J_LEFT && crosshairlocation[0] >= towerBlocation[0]){
                crosshairlocation[0] = crosshairlocation[0] - 1;
             }
            if(joypad() & J_RIGHT && crosshairlocation[0] <= towerClocation[0]){
                crosshairlocation[0] = crosshairlocation[0] + 1;
                
             }
            move_sprite(1, crosshairlocation[0], crosshairlocation[1]);
            delay(8);
        }
        status = 0;
        move_sprite(0, selectorlocation[0], selectorlocation[1]);
        move_sprite(1, outofthefuckingway[0], outofthefuckingway[1]);
        spawn += 1;
        if(spawn <= 50){
            spawnlocal = 0;
            enemyspawn = 35;
         }
        if(spawn >= 51 && spawn <= 101){
            spawnlocal = 1;
            enemyspawn = 70;
        }
        if(spawn >= 102 && spawn <= 152){
            spawnlocal = 2;
            enemyspawn = 105;
         }
         if(spawn >= 204 && spawn <= 255){
            spawnlocal = 3;
            enemyspawn = 140;
         }
         if(spawnlocal == 0){
             move_sprite(2, enemyspawn, 50);
         }
         
    }
} 
