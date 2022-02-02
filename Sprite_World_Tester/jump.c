#include <gb/gb.h>


BYTE jumping;
UINT8 gravity = -1; //how fast the player falls
UINT8 currentspeedY;
UINT8 floorYposition = 139;
UINT8 spritesweep = 0; 


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
