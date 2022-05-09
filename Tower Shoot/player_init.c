#include <gb/gb.h>
#include <gb/cgb.h>

void init_tower_sprite_tiles(){

    for(i = 2; i <= 25; i++){
        for (j = 48; j <= 55; j++)
        set_sprite_tile(i,j);
    }
    set_sprite_tile(2,48);

    // Tells sprite to use the color pallete
    // Currently making one spot of the tower blue
    
    /*
    set_sprite_prop(2,1);
    set_sprite_tile(3,49);
    set_sprite_tile(4,50);
    set_sprite_tile(5,51);
    set_sprite_tile(6,52);
    set_sprite_tile(7,53);
    set_sprite_tile(8,54);
    set_sprite_tile(9,55);
    //Tower B tiles
    set_sprite_tile(10,48);
    set_sprite_tile(11,49);
    set_sprite_tile(12,50);
    set_sprite_tile(13,51);
    set_sprite_tile(14,52);
    set_sprite_tile(15,53);
    set_sprite_tile(16,54);
    set_sprite_tile(17,55);
    
    //Tower C tiles
    set_sprite_tile(18,48);
    set_sprite_tile(19,49);
    set_sprite_tile(20,50);
    set_sprite_tile(21,51);
    set_sprite_tile(22,52);
    set_sprite_tile(23,53);
    set_sprite_tile(24,54);
    set_sprite_tile(25,55);
    */
}

void init_tower_sprite_pos(){

    
    move_sprite(9, towerAlocation[0], towerAlocation[1]);
    //tower a bottom left
    move_sprite(7, towerAlocation[0] - 8, towerAlocation[1]);
    //tower a middle right
    move_sprite(8, towerAlocation[0], towerAlocation[1] - 8);
    //tower a middle left
    move_sprite(6, towerAlocation[0] - 8, towerAlocation[1] - 8);
    //tower a middle upper right
    move_sprite(5, towerAlocation[0], towerAlocation[1] - 16);
    //tower a middle upper left
    move_sprite(3, towerAlocation[0] - 8, towerAlocation[1] - 16);
    //tower a top right
    move_sprite(4, towerAlocation[0], towerAlocation[1] - 24);
    //tower a top left
    move_sprite(2, towerAlocation[0] - 8, towerAlocation[1] - 24);
    
    //tower b bottom right
    move_sprite(17, towerBlocation[0], towerBlocation[1]);
    //tower b bottom left
    move_sprite(15, towerBlocation[0] - 8, towerBlocation[1]);
    //tower b middle right
    move_sprite(16, towerBlocation[0], towerBlocation[1] - 8);
    //tower b middle left
    move_sprite(14, towerBlocation[0] - 8, towerBlocation[1] - 8);
    //tower b middle upper right
    move_sprite(13, towerBlocation[0], towerBlocation[1] - 16);
    //tower b middle upper left
    move_sprite(11, towerBlocation[0] - 8, towerBlocation[1] - 16);
    //tower b top right
    move_sprite(12, towerBlocation[0], towerBlocation[1] - 24);
    //tower b top left
    move_sprite(10, towerBlocation[0] - 8, towerBlocation[1] - 24);
    
   
    //tower c bottom right
    move_sprite(25, towerClocation[0], towerClocation[1]);
    //tower c bottom left
    move_sprite(23, towerClocation[0] - 8, towerClocation[1]);
    //tower c middle right
    move_sprite(24, towerClocation[0], towerClocation[1] - 8);
    //tower c middle left
    move_sprite(22, towerClocation[0] - 8, towerClocation[1] - 8);
    //tower c middle upper right
    move_sprite(21, towerClocation[0], towerClocation[1] - 16);
    //tower c middle upper left
    move_sprite(19, towerClocation[0] - 8, towerClocation[1] - 16);
    //tower c top right
    move_sprite(20, towerClocation[0], towerClocation[1] - 24);
    //tower c top left
    move_sprite(18, towerClocation[0] - 8, towerClocation[1] - 24);
}