#include <gb/gb.h>
#include <stdio.h>

BYTE contact;
INT8 counter = 1;
INT8 lives = 0;

UBYTE checkcollisions(struct GameCharacter* one, struct GameCharacterLarge* two, struct GameCharacter* three){
    return (one->x >= two->x && one->x <= two->x + two->width) && (one->y >= two->y && one->y <= two->y + two->height) || (two->x >= one->x && two->x <= one->x + one->width) && (two->y >= one->y && two->y <= one->y + one->height) || (one->x >= three->x && one->x <= three->x + three->width) && (one->y >= three->y && one->y <= three->y + three->height) || (three->x >= one->x && three->x <= one->x + one->width) && (three->y >= one->y && three->y <= one->y + one->height);
}

void endgame(){

  if (checkcollisions(&kirby, &smiley, &bomb) == 1){
        lives += counter;
        counter = 0;     
    }
    if (checkcollisions(&kirby, &smiley, &bomb) == 0){
        counter = 1;
    }

}
