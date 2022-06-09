// #include <gb/gb.h>
// #include <gb/cgb.h>
// #include <stdio.h>

// UINT8 ballA_pos[2];
// UINT8 ballB_pos[2];
// UINT8 ballC_pos[2];
// UINT8 enemy_pos[2];

// INT16 ballA_err[2];
// INT16 ballB_err[2];
// INT16 ballC_err[2];

// void cataball_pos(){

//     ballA_pos[0] = towerAlocation[0];
//     ballA_pos[1] = towerAlocation[1];

//     ballB_pos[0] = towerBlocation[0];
//     ballB_pos[1] = towerBlocation[1];

//     ballC_pos[0] = towerClocation[0];
//     ballC_pos[1] = towerClocation[1];
    
// }

// void cataball_track(ballA_speed){

//     ballA_err[0] = enemy_pos[0] - ballA_pos[0];
//     ballA_err[1] = enemy_pos[1] - ballA_pos[1]; 
//     // Calculate the direction
//         if(ballA_err[0] > 0){
//             ballA_pos[0] = ballA_pos[0] + ballA_speed;
//         }
//         else if(ballA_err[0] < 0){
//             ballA_pos[0] = ballA_pos[0] - ballA_speed;
//         }
//         if(ballA_err[1] > 0){
//             ballA_pos[1] = ballA_pos[1] + ballA_speed;
//         }
//         else if(ballA_err[1] < 0){
//             ballA_pos[1] = ballA_pos[1] - ballA_speed;
//         }

//     move_sprite(40, ballA_pos[0], ballA_pos[1]);
// }







