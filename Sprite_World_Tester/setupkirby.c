#include <gb/gb.h>


struct GameCharacter kirby;

void setupkirby(){
    kirby.x = 80;
    kirby.y = 139;
    kirby.width = 15;
    kirby.height = 14;
    
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