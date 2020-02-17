#include <gb/gb.h>

struct GameCharacterSmall heart;

void setupheart(){
    heart.x = 135;
    heart.y = 20;
    heart.width = 8;
    heart.height = 8;
    
    //heart sprite tiles
    set_sprite_tile(14, 14);
    heart.spriteidssmall[0] = 14;

    movegamecharactersmall(&heart, heart.x, heart.y);
}

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