#include <gb/gb.h>
#include <stdio.h>
#include <gb/font.h>
//
#include "title_data.c"
#include "title_map.c"
#include "bricks.c"
#include "lair.c"
#include "kirbs16.c"
#include "GameCharacter.c"
#include "GameCharacterLarge.c"
#include "movegamecharacter.c"
//
#include "setupbomb.c"
#include "setupkirby.c"
#include "setupsmiley.c"
//
#include "jump.c"
#include "lives.c"


INT8 speedx = 2;
INT8 fallspeed = 3;
const char blankmap[1] = {0x00};



void performantdelay(UINT8 numloops){
    UINT8 i;
    for(i = 0; i < numloops; i++){
        wait_vbl_done();
    }     
}

void main(){

    //set_bkg_data(0, 170, title_data);
    //set_bkg_tiles(0, 0, 18, 18, title_map);

    SHOW_BKG;
    DISPLAY_ON;

    waitpad(J_START);

    //HIDE_BKG;
    set_bkg_tiles(0, 0, 40, 20, lair);
    set_bkg_data(0, 11, bricks);
    set_sprite_data(0, 16, kirbs16);
    setupkirby();
    setupsmiley();
    setupbomb();

    //SHOW_BKG;
    SHOW_SPRITES;

while(1){
    endgame();
        if((joypad() & J_UP) || jumping == 1){
            jump(0, kirby);
        }        
        if(joypad() & J_LEFT){
            kirby.x -= 2;
            if(kirby.x <= 15){
                scroll_bkg(-2, 0);
                kirby.x += 2;
                movegamecharacter(&kirby, kirby.x, kirby.y);
            }
            movegamecharacter(&kirby, kirby.x, kirby.y);
        }
        if(joypad() & J_RIGHT){
            scroll_bkg(2, 0);
            if(kirby.x <= 82){
                scroll_bkg(-2, 0);
                kirby.x += 2;
                movegamecharacter(&kirby, kirby.x, kirby.y);
            }
        }
        if(spritestate >= 3){
            smiley.y += smiley.x/8;
            spritestate += 1;
            if(spritestate >= 100 && smiley.y >=30){
                spritestate = 0;
                smiley.y = 30;
            }
        }
        smiley.x += speedx;
            if(smiley.x == 20){
              speedx = 2;
              spritestate += 1;


        }
            if(smiley.x == 144){
              speedx = -2;
              spritestate += 1;
        }
        movegamecharacterlarge(&smiley, smiley.x, smiley.y);

        bomb.y += fallspeed;
        if(bomb.y >= 160){
            bomb.y = 160;
        }
        if(smiley.x == kirby.x){
            bomb.y = smiley.y;
            bomb.x = kirby.x;
            fallspeed = 4;
        }

        movegamecharacter(&bomb, bomb.x, bomb.y);
        performantdelay(3);
        //printf("\n \n \n \n \n    %d\n", lives);
    }
    printf("\n \n \n \n \n        Game");
}