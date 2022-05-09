#include <gb/gb.h>
#include <gb/cgb.h>
#include <stdio.h>
#include <stdlib.h>
#include <rand.h>

UINT8 enemy_pos[2];
UINT8 tower_des[2];
INT16 enemy_err[2];

void enemy_position(){
    enemy_pos[0] = 80;
    enemy_pos[1] = 80;
}

void rnJesus(){
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

void enemy_move(UINT8 enemy_speed){

    //X direction movement
    enemy_err[0] = tower_des[0] - enemy_pos[0];

    if (enemy_err[0] < 0 ){
        enemy_pos[0] = enemy_pos[0] - enemy_speed;
    }
    else if (enemy_err[0] > 0 ){
        enemy_pos[0] = enemy_pos[0] + enemy_speed;
    }

    //Y direction movement
    enemy_err[1] = tower_des[1] - enemy_pos[1];

    if (enemy_err[1] < 0 ){
        enemy_pos[1] = enemy_pos[1] - enemy_speed;
    }
    else if (enemy_err[1] > 0 ){
        enemy_pos[1] = enemy_pos[1] + enemy_speed;
    }

    if(enemy_err[0] == 0 && enemy_err[1] == 0){
        rnJesus();
    }

    //Sprite driectional input
    move_sprite(26, enemy_pos[0], enemy_pos[1]);
    
}
