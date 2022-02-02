#include <gb/gb.h>
#include <stdio.h>
//
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

INT8 speedx = 2;
INT8 fallspeed = 3;

void main(){    

    set_sprite_data(0, 14, kirbs16);
    setupkirby();
    setupsmiley();
    setupbomb();

    DISPLAY_ON;
    SHOW_SPRITES;

    while(!checkcollisions(&kirby, &smiley, &bomb)){
        if((joypad() & J_UP) || jumping == 1){
            jump(0, kirby);
        }        
        if(joypad() & J_LEFT){
            kirby.x -= 2;
            movegamecharacter(&kirby, kirby.x, kirby.y);
        }
        if(joypad() & J_RIGHT){
            kirby.x += 2;
            movegamecharacter(&kirby, kirby.x, kirby.y);
        }
        if(spritestate >= 3){
            smiley.y += smiley.x/8;
            spritestate += 1;
            if(spritestate >= 100 && smiley.y <=30){
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
        delay(50);
    }
    printf("\n \n \n \n \n        Game");
}