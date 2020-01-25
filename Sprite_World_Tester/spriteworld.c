#include <gb/gb.h>
#include <gb/font.h>
#include "bricks.c"
#include "lair.c"
#include "GameCharacter.c"
#include "kirbs16.c"

BYTE jumping;
UINT8 gravity = -1; //how fast the player falls
UINT8 currentspeedY;
UINT8 floorYposition = 140;
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
    kirby.y = 140;
    kirby.width = 16;
    kirby.height = 16;
    
    //Kirby sprite tiles right
    if(spritestate == 0){
    set_sprite_tile(0, 0);
    kirby.spriteids[0] = 0;
    set_sprite_tile(1, 1);
    kirby.spriteids[1] = 1;
    set_sprite_tile(2, 2);
    kirby.spriteids[2] = 2;
    set_sprite_tile(3, 3);
    kirby.spriteids[3] = 3;
    }
    if(spritestate == 1){
    set_sprite_tile(8, 8);
    kirby.spriteids[0] = 8;
    set_sprite_tile(9, 9);
    kirby.spriteids[1] = 9;
    set_sprite_tile(10, 10);
    kirby.spriteids[2] = 10;
    set_sprite_tile(11, 11);
    kirby.spriteids[3] = 11;
    }
    movegamecharacter(&kirby, kirby.x, kirby.y);

}

void setupsmiley(){
    smiley.x = 10;
    smiley.y = 0;
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

    set_bkg_data(0, 11, bricks);
    set_bkg_tiles(0, 0, 40, 20, lair);
    set_sprite_data(0, 12, kirbs16);
    setupkirby();
    setupsmiley();
    setupbomb();

    SHOW_SPRITES;
    SHOW_BKG;
    DISPLAY_ON;
    
     while(1){
         UINT8 bkgspeed = kirby.x*2;
         move_bkg(bkgspeed, 0);

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
        smiley.y = kirby.y/4;
        smiley.x += speedx;
            if(smiley.x == 20){
              speedx = 2;
        }
            if(smiley.x == 144){
              speedx = -2;
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
}