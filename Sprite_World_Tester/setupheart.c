#include <gb/gb.h>

UINT8 mult; 
struct GameCharacterSmall heart[3];

void setupheart(){
    /**if(heart[k].initialized==1){
			scroll_sprite(obstacles[k].startspriteid,-speed,0);
			scroll_sprite(obstacles[k].startspriteid+1,-speed,0);
**/
mult = 0;
            heart[mult].x = 135;
            heart[mult].y = 20;
            heart[mult].width = 8;
            heart[mult].height = 8;
    

    //heart sprite tiles
    set_sprite_tile(14, 14);
    heart[mult].spriteidssmall[0] = 14;

    movegamecharactersmall(&heart[mult], heart[mult].x, heart[mult].y);

mult = 1;

    heart[mult].x = 143;
    heart[mult].y = 20;
    heart[mult].width = 8;
    heart[mult].height = 8;
    
    //heart sprite tiles
    set_sprite_tile(14+mult, 14+mult);
    heart[mult].spriteidssmall[0] = 14+mult;

    movegamecharactersmall(&heart[mult], heart[mult].x, heart[mult].y);

mult = 2;
    heart[mult].x = 151;
    heart[mult].y = 20;
    heart[mult].width = 8;
    heart[mult].height = 8;
    
    //heart sprite tiles
    set_sprite_tile(14+mult, 14+mult);
    heart[mult].spriteidssmall[0] = 14+mult;

    movegamecharactersmall(&heart[mult], heart[mult].x, heart[mult].y);
}







/**
struct GameCharacterSmall heart1;

void setupheart1(){
    heart1.x = 143;
    heart1.y = 20;
    heart1.width = 8;
    heart1.height = 8;
    
    //heart sprite tiles
    set_sprite_tile(15, 15);
    heart1.spriteidssmall[0] = 15;

    movegamecharactersmall(&heart1, heart1.x, heart1.y);
}

struct GameCharacterSmall heart2;

void setupheart2(){
    heart2.x = 151;
    heart2.y = 20;
    heart2.width = 8;
    heart2.height = 8;
    
    //heart sprite tiles
    set_sprite_tile(16, 16);
    heart2.spriteidssmall[0] = 16;

    movegamecharactersmall(&heart2, heart2.x, heart2.y);
}
**/
