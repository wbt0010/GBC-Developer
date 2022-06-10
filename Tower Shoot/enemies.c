
#include <gb/gb.h>
#include <gb/cgb.h>
#include <stdio.h>
#include <stdlib.h>

// Array of all enemies
// UINT8 allEnemies[];
UINT8 enemyIndex = 100;
// Values above 100 are reserved for enemies

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

struct enemy * getGrunt(){

    struct enemy *grunt = malloc(sizeof(struct enemy));
    grunt->health = 10;
    grunt->speed = 1;
    grunt->damage = 1;
    grunt->spriteID = enemyIndex;
    enemyIndex++;

    // Need to move next_ptr for each enemy to create a stack of enemys


    return grunt;
}

// UINT8 enemyGrunt_getEnemyHealth(enemyGrunt *enemy) {
//     return enemy->health;
// }

void enemy_movement_tick(){

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
