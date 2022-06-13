
#include <gb/gb.h>
#include <gb/cgb.h>
#include <stdio.h>
#include <stdlib.h>
#include "enemy_move.c"


// Array of all enemies

UINT8 enemyIndex = 25;
#define MAX_ENEMIES 9
#define ENEMY_SPRITE_ID_LIMIT 34
// Values below 26 and above 34 are reserved for player sprites
// First index used is above value + 1

struct enemy{
    UINT8 health;
    UINT8 speed;
    UINT8 damage;
    UINT8 spriteID;
    // Positions for movement
    // UINT8 en_tower_des[2];
    UINT8 en_enemy_pos[2];
    // INT16 en_enemy_err[2];
    struct enemy *next_ptr;
};

struct enemy *enemy_head = NULL;
struct enemy *enemy_tail = NULL;

// Do X and Y spawn as optional args?
struct enemy * getGrunt(int xSpawn, int ySpawn){
    enemyIndex++;

    struct enemy *grunt = malloc(sizeof(struct enemy));
    grunt->health = 10;
    grunt->speed = 1;
    grunt->damage = 1;

    grunt->spriteID = enemyIndex;
    
    grunt->en_enemy_pos[0] = xSpawn,
    grunt->en_enemy_pos[1] = ySpawn,
    set_sprite_tile(grunt->spriteID, 1);
    set_sprite_prop(grunt->spriteID, 0);
    // Spawn enemy at unique index, make array, pop on/off, use next_ptr to link enemies
    
    // Inserts at first location in list? 
    grunt->next_ptr = enemy_head;

    enemy_head = grunt;

    // MAKE A LINKED LIST OF ENEMIES

    // Need to move next_ptr for each enemy to create a stack of enemys
    
    // If enemy capacity is at max don't spawn enemies
    if(enemyIndex == ENEMY_SPRITE_ID_LIMIT)
    {
        return NULL;
    }

    return grunt;
}

// FOR DEBUG PURPOSES ONLY
void printEnemyList(){
    struct enemy *tmp = enemy_head;
    while(tmp != NULL){
        printf("%d\n", tmp->spriteID);
        tmp = tmp->next_ptr;
    }
}

int enemyListLength(){
    int length = 0;
    struct enemy *tmp = enemy_head;

    while(tmp != NULL){
        length++;
        tmp = tmp->next_ptr;
    }
    return length;
}

struct enemy* find(int spriteID){
    struct enemy *tmp = enemy_head;

    while(tmp != NULL){
        if(tmp->spriteID == spriteID){
            return tmp;
        }
        tmp = tmp->next_ptr;
    }
    free(tmp);
    return NULL;
}
// Set position by spriteID
struct enemy* setEnemyPosition(int spriteID){
    
    struct enemy *tmp = find(spriteID);
    if(tmp != NULL){
        tmp->en_enemy_pos[0] = x;
        tmp->en_enemy_pos[1] = y;
        move_sprite(spriteID, x, y);
        // This isn't actually updating the value the value needs to be updated on each sprite object
    }
    free(tmp);
}

// UINT8 enemyGrunt_getEnemyHealth(enemyGrunt *enemy) {
//     return enemy->health;
// }

void enemy_movement_tick(){
    struct enemy *tmp = enemy_head;
    while(tmp != NULL){
        // Move enemy
        enemy_move(tmp->speed, tmp->spriteID, tmp->en_enemy_pos[0], tmp->en_enemy_pos[1]);
        tmp = tmp->next_ptr;
    }
    free(tmp);
}


// void enemy_move(UINT8 enemy_speed){
//     UINT8 tower_des[2];
//     UINT8 enemy_pos[2];
//     INT16 enemy_err[2];
//     // Delays enemey movement to 1/128 of a physics tick
//     if(enemy_move_delay != 128) {
//         enemy_move_delay++;
//     }

//     else{
//         enemy_move_delay = 0;
//         // Calculate error
//         enemy_err[0] = tower_des[0] - enemy_pos[0];
//         enemy_err[1] = tower_des[1] - enemy_pos[1];
//         // Calculate the direction
//         if(enemy_err[0] > 0){
//             enemy_pos[0] = enemy_pos[0] + enemy_speed;
//         }
//         else if(enemy_err[0] < 0){
//             enemy_pos[0] = enemy_pos[0] - enemy_speed;
//         }
//         if(enemy_err[1] > 0){
//             enemy_pos[1] = enemy_pos[1] + enemy_speed;
//         }
//         else if(enemy_err[1] < 0){
//             enemy_pos[1] = enemy_pos[1] - enemy_speed;
//         }

//         // if(enemy_err[0] == 0 && enemy_err[1] == 0){
//         //     //For longer term, this is where the enemy attack command should be used
//         //     //Or this would be the section where the enemies fall into the tower's "slotted"
//         //     rnJesus();
//         // }

//         //     //Sprite animation
//         // if(enemy_err[0] != 0 || enemy_err[1] != 0){
//         //     enemy_walk();
//         // }
//     }
//     //Sprite driectional input
//     move_sprite(26, enemy_pos[0], enemy_pos[1]);
// }

// In set_sprite_tile(26,0); is the 26 a spot in an index for a sprite? Could 26 - 100 be allocated for enemies?
// Allocate 200 - 255 for enemy spawns

// enemyGrunt spawnNewEnemy() {
    
//     enemyGruntPtr newEnemy = (enemyGruntPtr) malloc(sizeof(enemyGrunt));
//     set_sprite_tile(enemyIndex, 0);
//     enemyIndex++;

//     return newEnemy;
// }

// Everything below is just an example while I sketch things out

// Update health of enemy
// enemy->health = 4;
