#include <gb/gb.h>
#include <stdio.h>
#include "kirbs16.c"
#include "GameCharacter.c"

BYTE jumping;
UINT8 gravity = -1; //how fast the player falls
UINT8 currentspeedY;
UINT8 floorYposition = 139;
UBYTE spritesize = 8;
UINT8 spritestate = 0;    
INT8 speedx = 2;
INT8 fallspeed = 3;

struct GameCharacter kirby;
struct GameCharacter smiley;
struct GameCharacter bomb;

void movegamecharacter(struct GameCharacter* character, UINT8 x, UINT8 y){
    move_sprite(character->spriteids[0], x, y);
    move_sprite(character->spriteids[1], x + spritesize, y);
    move_sprite(character->spriteids[2], x, y + spritesize);
    move_sprite(character->spriteids[3], x + spritesize, y + spritesize);
}

void setupkirby(){
    kirby.x = 80;
    kirby.y = 139;
    kirby.width = 16;
    kirby.height = 16;
    
    //Kirby sprite tiles right
    set_sprite_tile(0, 0);
    kirby.spriteids[0] = 0;
    set_sprite_tile(1, 1);
    kirby.spriteids[1] = 1;
    set_sprite_tile(2, 2);
    kirby.spriteids[2] = 2;
    set_sprite_tile(3, 3);
    kirby.spriteids[3] = 3;
    movegamecharacter(&kirby, kirby.x, kirby.y);

}

void setupsmiley(){
    smiley.x = 10;
    smiley.y = 40;
    smiley.width = 16;
    smiley.height = 16;
    
    //smiley sprite tiles
    set_sprite_tile(4, 4);
    smiley.spriteids[0] = 4;
    set_sprite_tile(5, 5);
    smiley.spriteids[1] = 5;
    set_sprite_tile(6, 6);
    smiley.spriteids[2] = 6;
    set_sprite_tile(7, 7);
    smiley.spriteids[3] = 7;

    movegamecharacter(&smiley, smiley.x, smiley.y);
}
void setupbomb(){
    bomb.x = 10;
    bomb.y = 160;
    bomb.width = 16;
    bomb.height = 16;
    
    //bomb sprite tiles
    set_sprite_tile(8, 8);
    bomb.spriteids[0] = 8;
    set_sprite_tile(9, 9);
    bomb.spriteids[1] = 9;
    set_sprite_tile(10, 10);
    bomb.spriteids[2] = 10;
    set_sprite_tile(11, 11);
    bomb.spriteids[3] = 11;

    movegamecharacter(&bomb, bomb.x, bomb.y);
}


UBYTE checkcollisions(struct GameCharacter* one, struct GameCharacter* two, struct GameCharacter* three){
    return (one->x >= two->x && one->x <= two->x + two->width) && (one->y >= two->y && one->y <= two->y + two->height) || (two->x >= one->x && two->x <= one->x + one->width) && (two->y >= one->y && two->y <= one->y + one->height) || (one->x >= three->x && one->x <= three->x + three->width) && (one->y >= three->y && one->y <= three->y + three->height) || (three->x >= one->x && three->x <= one->x + one->width) && (three->y >= one->y && three->y <= one->y + one->height);
}
INT8 wouldhitsurface(UINT8 projectedYPosition){
    if(projectedYPosition >= floorYposition){
        return floorYposition;
    }
    return -1;
}

void jump(){
    UINT8 possiblesurfaceY;

    if (jumping == 0){
        jumping = 1;
        currentspeedY = 12;
    }
    currentspeedY += gravity;

    kirby.y -= currentspeedY;
    possiblesurfaceY = wouldhitsurface(kirby.y);

    if(possiblesurfaceY != -1){
        jumping = 0;
        movegamecharacter(&kirby, kirby.x, possiblesurfaceY);
    }
    else{
        movegamecharacter(&kirby, kirby.x, kirby.y);
    }
    
}

void main(){    

    set_sprite_data(0, 16, kirbs16);
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
        movegamecharacter(&smiley, smiley.x, smiley.y);

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



