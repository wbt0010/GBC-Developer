#include <gb/gb.h>
#include <gb/cgb.h>
#include <stdio.h>

//moves stuff that doesn't need to be on screen 
UINT8 outofthefuckingway[2];
//Selector mode
UINT8 status = 0;
//Location of player on map
UINT8 mappos = 0;
//Use your eyes
UINT8 crosshairlocation[2];
UINT8 selectorlocation[2];

//Use your eyes
UINT8 towerAlocation[2];
UINT8 towerBlocation[2];
UINT8 towerClocation[2];

void definevar() {
//tower sprite location [0],x [1],y
towerAlocation[0] = 80;
towerAlocation[1] = 108;

//tower sprite location [0],x [1],y
towerBlocation[0] = 40;
towerBlocation[1] = 72;

//tower sprite location [0],x [1],y
towerClocation[0] = 120;
towerClocation[1] = 72;

//initializing selector location
selectorlocation[0] = towerAlocation[0];
selectorlocation[1] = towerAlocation[1];
crosshairlocation[0] = 80;
crosshairlocation[1] = 72;
}