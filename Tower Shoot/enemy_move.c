#include <gb/gb.h>
#include <gb/cgb.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <rand.h>

UINT8 enemy_move_delay = 0;
// Both of these are just used for the movement animation
UINT8 enemy_walk_delay = 0;
bool enemy_walk_state = false;

UINT8 tower_des[2];


void rnJesus(){
    //Generates random numer 0-2 and assign the target tower accordingly

    UINT8 rand_num;
    rand_num = rand();
    rand_num = rand_num % 3;

    if(rand_num == 0){
        tower_des[0] = towerAlocation[0];
        tower_des[1] = towerAlocation[1];
    }
    else if (rand_num == 1){
        tower_des[0] = towerBlocation[0];
        tower_des[1] = towerBlocation[1];
    }
    else if (rand_num == 2){
        tower_des[0] = towerClocation[0];
        tower_des[1] = towerClocation[1];
    } 
}
void enemy_walk(UINT8 walkSpriteID) {
    // Each "frame", increment by 1. Every 8 frames, reset then change walk state from 0 to 1
    if(enemy_walk_delay != 8){
        enemy_walk_delay++;
    }
    else{
        enemy_walk_delay = 0;
        if(enemy_walk_state == 0){
        // Hardcoded for a specific sprite index right now
        set_sprite_tile(walkSpriteID,0);
        enemy_walk_state = 1;
        }
        else {
            set_sprite_tile(walkSpriteID,1);
            enemy_walk_state = 0;
        }
    }
    
}

void enemy_move(UINT8 enemy_speed, UINT8 moveSpriteID, UINT8 enemy_pos_x, UINT8 enemy_pos_y)
{
    UINT8 enemy_pos[2];
    enemy_pos[0] = enemy_pos_x;
    enemy_pos[1] = enemy_pos_y;
    INT16 enemy_err[2];
    // Delays enemey movement to 1/128 of a physics tick
    if(enemy_move_delay != 128) {
        enemy_move_delay++;
    }

    else{
        enemy_move_delay = 0;
        // Calculate error
        enemy_err[0] = tower_des[0] - enemy_pos[0];
        enemy_err[1] = tower_des[1] - enemy_pos[1];
        // Calculate the direction
        if(enemy_err[0] > 0){
            enemy_pos[0] = enemy_pos[0] + enemy_speed;
        }
        else if(enemy_err[0] < 0){
            enemy_pos[0] = enemy_pos[0] - enemy_speed;
        }
        if(enemy_err[1] > 0){
            enemy_pos[1] = enemy_pos[1] + enemy_speed;
        }
        else if(enemy_err[1] < 0){
            enemy_pos[1] = enemy_pos[1] - enemy_speed;
        }

        if(enemy_err[0] == 0 && enemy_err[1] == 0){
            //For longer term, this is where the enemy attack command should be used
            //Or this would be the section where the enemies fall into the tower's "slotted"
            rnJesus();
        }

            //Sprite animation
        if(enemy_err[0] != 0 || enemy_err[1] != 0){
            enemy_walk(moveSpriteID);
        }
    }
    //Sprite driectional input

    move_sprite(moveSpriteID, enemy_pos[0], enemy_pos[1]);

    // Return pointer to enemy position
    // Uhhhh
    // Idk how to do that

    // Remember. Everything has to flow "one way". Enemy_move can pass to enemies but enemies can't pass back to enemy_move.

    return enemy_pos;
}


