#include <gb/gb.h>

struct GameCharacter bomb;

void setupbomb(){
    bomb.x = 10;
    bomb.y = 160;
    bomb.width = 14;
    bomb.height = 13;
    
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