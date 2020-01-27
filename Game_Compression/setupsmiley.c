#include <gb/gb.h>

struct GameCharacterLarge smiley;

void setupsmiley(){
    smiley.x = 10;
    smiley.y = 40;
    smiley.width = 16;
    smiley.height = 24;
    
    //smiley sprite tiles
    set_sprite_tile(4, 4);
    smiley.spriteidslarge[0] = 4;
    set_sprite_tile(5, 5);
    smiley.spriteidslarge[1] = 5;
    set_sprite_tile(6, 6);
    smiley.spriteidslarge[2] = 6;
    set_sprite_tile(7, 7);
    smiley.spriteidslarge[3] = 7;
    set_sprite_tile(12, 12);
    smiley.spriteidslarge[4] = 12;
    set_sprite_tile(13, 13);
    smiley.spriteidslarge[5] = 13;

    movegamecharacterlarge(&smiley, smiley.x, smiley.y);
}
