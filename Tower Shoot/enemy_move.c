#include <gb/gb.h>
#include <gb/cgb.h>
#include <stdio.h>
#include <Variable_pckg.c>

UINT8 enemy_pos[2];
UINT8 enemy_err[2];
UINT8 PID_gain[2];
UINT8 PID_out[2];

void enemy_move();

    //X direction movement
    enemy_err[0] = towerAlocation[0] - enemy_pos[0];
    PID_gain[0] = 1;
    PID_out[0] = PID_gain[0] * enemy_err[0];

    //Y direction movement
    enemy_err[1] = towerAlocation[1] - enemy_pos[1];
    PID_gain[1] = 1;
    PID_out[1] = PID_gain[1] * enemy_err[1];

    move_sprite(0, PID_out[0], PID_out[1]);
