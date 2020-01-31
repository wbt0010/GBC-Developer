#include <gb/gb.h>


BYTE jumping;
UINT8 gravity = -1; //how fast the player falls
UINT8 currentspeedY;
UINT8 floorYposition = 139;
UINT8 spritestate = 0; 

UBYTE checkcollisions(struct GameCharacter* one, struct GameCharacterLarge* two, struct GameCharacter* three){
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
