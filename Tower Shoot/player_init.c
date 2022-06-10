#include <gb/gb.h>
#include <gb/cgb.h>
#include <gbdk/font.h>


// Tower A tiles 3-9 

// Tower B tiles 10-17

// //Tower C tiles 18-25

enum tower_id{
    tower_a,
    tower_b,
    tower_c
};

void init_tower_sprite_tiles(){
    UINT8 i;
    UINT8 k; 
    UINT8 j;
    j = 2;
    for(i = 0; i <= 3; i++){
        for(k = 48; k <= 55; k++){
            set_sprite_tile(j,k);
            //To set color pallete set_sprite_prop(Internal ID # of sprite, desired color palatte)
            set_sprite_prop(j,1);
            j++;
        }
    }
}

void init_tower_sprite_pos(){
    // Todo: Can we find a way to "reuse" tower sprites? This is murdering our sprite count

    //tower a bottom right
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
    move_sprite(25, towerClocation[0] + 8, towerClocation[1]);
    //tower c bottom left
    move_sprite(23, towerClocation[0], towerClocation[1]);
    //tower c middle right
    move_sprite(24, towerClocation[0] + 8, towerClocation[1] - 8);
    //tower c middle left
    move_sprite(22, towerClocation[0], towerClocation[1] - 8);
    //tower c middle upper right
    move_sprite(21, towerClocation[0] + 8, towerClocation[1] - 16);
    //tower c middle upper left
    move_sprite(19, towerClocation[0], towerClocation[1] - 16);
    //tower c top right
    move_sprite(20, towerClocation[0] + 8, towerClocation[1] - 24);
    //tower c top left
    move_sprite(18, towerClocation[0], towerClocation[1] - 24);
}


//This function can be used to changed the tower to any desired color palatte
//j is the # of the first sprite for that tower (see index on line 6)
void tower_select_color(UINT8 j, UINT8 tower_pal){
    UINT8 k; 
        for(k = 48; k <= 55; k++){
            set_sprite_tile(j,k);
            //To set color pallete set_sprite_prop(Internal ID # of sprite, desired color palatte)
            set_sprite_prop(j,tower_pal);
            j++;
        }
    }

void tower_set_color(enum tower_id tower_id){
    switch(tower_id){
        case tower_a:
            tower_select_color(2,0);
            tower_select_color(10,1);
            tower_select_color(18,1);
            break;
        case tower_b:
            tower_select_color(2,1);
            tower_select_color(10,0);
            tower_select_color(18,1);
            break;
        case tower_c:
            tower_select_color(2,1);
            tower_select_color(10,1);
            tower_select_color(18,0);
            break;
    }

}