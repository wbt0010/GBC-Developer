#include <gb/gb.h>

UBYTE spritesize = 8;

void movegamecharacter(struct GameCharacter* character, UINT8 x, UINT8 y){
    move_sprite(character->spriteids[0], x, y);
    move_sprite(character->spriteids[1], x + spritesize, y);
    move_sprite(character->spriteids[2], x, y + spritesize);
    move_sprite(character->spriteids[3], x + spritesize, y + spritesize);
}

void movegamecharacterlarge(struct GameCharacterLarge* characterlarge, UINT8 x, UINT8 y){
    move_sprite(characterlarge->spriteidslarge[0], x, y);
    move_sprite(characterlarge->spriteidslarge[1], x + spritesize, y);
    move_sprite(characterlarge->spriteidslarge[2], x, y + spritesize);
    move_sprite(characterlarge->spriteidslarge[3], x + spritesize, y + spritesize);
    move_sprite(characterlarge->spriteidslarge[4], x, y - spritesize);
    move_sprite(characterlarge->spriteidslarge[5], x + spritesize, y - spritesize);
}
