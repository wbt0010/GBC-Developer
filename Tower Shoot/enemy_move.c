#include <gb/gb.h>
#include <gb/cgb.h>
#include <stdio.h>

INT8 enemy_pos[2];
INT8 enemy_err[2];
INT8 PID_gain[2];
INT8 PID_out[2];

void enemy_position(){
enemy_pos[0] = 80;
enemy_pos[1] = 80;
}

void enemy_move(UNIT8 enemy_speed){

    // Just an example
    if (enemy_err[0] < 0 ){
        enemy_pos[0] = enemy_pos[0] - enemy_speed;
    }
    else if (enemy_err[0] > 0 ){
        enemy_pos[0] = enemy_pos[0] + enemy_speed;
    }
    if (enemy_err[1] < 0 ){
        enemy_pos[1] = enemy_pos[1] - enemy_speed;
    }
    else if (enemy_err[1] > 0 ){
        enemy_pos[1] = enemy_pos[1] + enemy_speed;
    }

    //X direction movement
    enemy_err[0] = towerAlocation[0] - enemy_pos[0];
    PID_gain[0] = 1;
    PID_out[0] = PID_gain[0] * enemy_err[0];

    enemy_pos[0] += PID_out[0];


    //Y direction movement
    enemy_err[1] = towerAlocation[1] - enemy_pos[1];
    PID_gain[1] = 1;
    PID_out[1] = PID_gain[1] * enemy_err[1];

    enemy_pos[1] += PID_out[1];

    move_sprite(26, enemy_pos[0], enemy_pos[1]);
}
