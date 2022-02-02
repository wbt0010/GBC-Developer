#include <gb/gb.h>
#include <stdio.h>
#include <gb/font.h>
//
#include "title_data.c"
#include "title_map.c"
#include "bricks.c"
#include "test.c"
#include "lair.c"
#include "kirbs16.c"
#include "GameCharacter.c"
#include "GameCharacterSmall.c"
#include "GameCharacterLarge.c"
#include "movegamecharacter.c"
//
#include "setupbomb.c"
#include "setupkirby.c"
#include "setupsmiley.c"
#include "setupheart.c"
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

    set_bkg_data(0, 183, title_data);
    set_bkg_tiles(0, 0, 18, 18, title_map);

    SHOW_BKG;
    DISPLAY_ON;

    waitpad(J_START);

    set_bkg_data(0, 12, bricks);
    set_bkg_tiles(0, 0, 40, 18, test);
    set_sprite_data(0, 17, kirbs16);

    setupkirby();
    setupsmiley();
    setupbomb();
    setupheart();

    SHOW_SPRITES;

while(lives < 3){

    endgame();


    if(lives == 1){
        heart[mult].y = 0;
        movegamecharactersmall(&heart[mult], heart[mult].x, heart[mult].y);
        mult=1;
    }

    if(lives == 2){
        heart[mult].y = 0;
        movegamecharactersmall(&heart[mult], heart[mult].x, heart[mult].y);
        mult=2;
    }

    if(lives == 3){
        heart[mult].y = 0;
        movegamecharactersmall(&heart[mult], heart[mult].x, heart[mult].y);
    }



    

        if((joypad() & J_UP) || jumping == 1){
            jump(0, kirby);
        }        
        if(joypad() & J_LEFT){
            kirby.x -= 2;
            if(kirby.x <= 20){
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
        if(spritesweep >= 3 && smiley.y <= 130){
            smiley.y += 7;
            speedx = 3;
            spritesweep += 1;
        }

        if(smiley.x >= 100 && smiley.y > 40){
                smiley.y -= 7;
                spritesweep = 0;
        }
        
        smiley.x += speedx;
            if(smiley.x == 20){
              speedx = 2;
              spritesweep += 1;
        }
            if(smiley.x >= 144){
              speedx = -2;
              //spritesweep += 1;
        }
        movegamecharacterlarge(&smiley, smiley.x, smiley.y);

        bomb.y += fallspeed;
        if(bomb.y >= 160){
            bomb.y = 160;
        }
        if(smiley.x == kirby.x && smiley.y <= kirby.y){
            bomb.y = smiley.y;
            bomb.x = kirby.x;
            fallspeed = 5;
        }
        
        movegamecharacter(&bomb, bomb.x, bomb.y);

        performantdelay(3);
    }
    
    printf("\n \n \n \n \n        Game");
}