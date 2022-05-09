#include <gb/gb.h>
#include <gb/cgb.h>
#include <gbdk/font.h>
// Can't compile? UPDATE YOUR GBDK!!!
#include <stdio.h>
#include "Variable_pckg.c"
#include "enemies.c"
//Background Tiles
#include "map_v1_1.h"
#include "Grassland.h"
//Sprite Tiles with Color
#include "GTP.h"
void selector();
void crosshair();

const UWORD backgpalette[] = {
    
    /* Gameboy Color palette 0 */
    map_v1_1_labelCGBPal0c0,
    map_v1_1_labelCGBPal0c1,
    map_v1_1_labelCGBPal0c2,
    map_v1_1_labelCGBPal0c3,
    /* Gameboy Color palette 1 */
    map_v1_1_labelCGBPal1c0,
    map_v1_1_labelCGBPal1c1,
    map_v1_1_labelCGBPal1c2,
    map_v1_1_labelCGBPal1c3,

    /* Gameboy Color palette 2 */
    map_v1_1_labelCGBPal2c0,
    map_v1_1_labelCGBPal2c1,
    map_v1_1_labelCGBPal2c2,
    map_v1_1_labelCGBPal2c3,

    /* Gameboy Color palette 3 */
    map_v1_1_labelCGBPal3c0,
    map_v1_1_labelCGBPal3c1,
    map_v1_1_labelCGBPal3c2,
    map_v1_1_labelCGBPal3c3,

    /* Gameboy Color palette 4 */
    map_v1_1_labelCGBPal4c0,
    map_v1_1_labelCGBPal4c1,
    map_v1_1_labelCGBPal4c2,
    map_v1_1_labelCGBPal4c3,

    /* Gameboy Color palette 5 */
    map_v1_1_labelCGBPal5c0,
    map_v1_1_labelCGBPal5c1,
    map_v1_1_labelCGBPal5c2,
    map_v1_1_labelCGBPal5c3,

    /* Gameboy Color palette 6 */
    map_v1_1_labelCGBPal6c0,
    map_v1_1_labelCGBPal6c1,
    map_v1_1_labelCGBPal6c2,
    map_v1_1_labelCGBPal6c3,

    /* Gameboy Color palette 7 */
    map_v1_1_labelCGBPal7c0,
    map_v1_1_labelCGBPal7c1,
    map_v1_1_labelCGBPal7c2,
    map_v1_1_labelCGBPal7c3,
};

const UWORD spritepalette[] = {
    //Enemy Palatte //Sprite prop(X,0)
    GTPCGBPal0c0,
    GTPCGBPal0c1,
    GTPCGBPal0c2,
    GTPCGBPal0c3,
    //Tower Palatte //Sprite prop(X,1)
    GTPCGBPal1c0,
    GTPCGBPal1c1,
    GTPCGBPal1c2,
    GTPCGBPal1c3
};

//delay function so the game doesn't run too fast
void performantdelay(UINT8 numloops){
    UINT8 i;
    for(i = 0; i < numloops; i++){
        wait_vbl_done();
    }     
}

void main(){
    /*
    font_t min_font;

    font_init();
    min_font = font_load(font_min);
    font_set(min_font);
*/
    definevar();
    //Sprite Tile Set
    set_sprite_data(0, 127, GTP);
    //Sprite Palette Set
    set_sprite_palette(0, 8u, &spritepalette[0]);
    //Bckg Palette Set
    set_bkg_palette(0,12u, &backgpalette[0]);
    //Bckg Tile Location
    set_bkg_data(0,6u, map_v1_1_label);

    VBK_REG = 1;

    set_bkg_tiles(0, 0, Grassland_labelWidth, Grassland_labelHeight, Grassland_labelPLN1);

    VBK_REG = 0;

    set_bkg_tiles(0, 0, Grassland_labelWidth, Grassland_labelHeight, Grassland_labelPLN0);

    set_bkg_palette(0,1,&backgpalette[0]);


    
    /**
    (First Sprite tile desired, Final Sprite tile desired, VariableXY name)
    (Entity #, Number Tile desired to be displayed)
    Tile displayed can be changed with changed with variable i.e. set_sprite_tile(0,a)
    selector tile(tile identifyer, tile location)
    */

    //Selector
    set_sprite_tile(0,15);
    set_sprite_prop(0,1);
    move_sprite(0, towerAlocation[0], towerAlocation[1]);
    //Crosshair
    set_sprite_tile(1,14);
    set_sprite_prop(1,1);
    //Projectile
    //Tower A tiles
    set_sprite_tile(2,48);
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

    //Enemy Sprite
    set_sprite_tile(26,0);
    set_sprite_prop(26,0);

    //pseudo tower meta sprites
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
   
    SHOW_BKG;
    DISPLAY_ON;
    SHOW_SPRITES;

    while (1){
    selector();
    crosshair();
    status = 0;
    move_sprite(0, selectorlocation[0], selectorlocation[1]);
    move_sprite(1, outofthefuckingway[0], outofthefuckingway[1]);
    }
} 

void selector(){
if(status == 0){
    switch(joypad()){
            case J_DOWN:
            selectorlocation[0] = towerAlocation[0];
            selectorlocation[1] = towerAlocation[1];
            mappos = 0;
            break;

            case J_LEFT:
            selectorlocation[0] = towerBlocation[0];
            selectorlocation[1] = towerBlocation[1];
            mappos = 1;
            break;

            case J_RIGHT:
            selectorlocation[0] = towerClocation[0];
            selectorlocation[1] = towerClocation[1];
            mappos = 2;
            break;
            }
            
        }
}

void crosshair(){
    while(joypad() & J_B){
            status = 1;
            move_sprite(0, outofthefuckingway[0], outofthefuckingway[1]);
        
            if(joypad() & J_UP && crosshairlocation[1] >= 20){
                crosshairlocation[1] = crosshairlocation[1] - 1;
            }
            if(joypad() & J_DOWN && crosshairlocation[1] <= towerAlocation[1]){
                crosshairlocation[1] = crosshairlocation[1] + 1;
            }
            if(joypad() & J_LEFT && crosshairlocation[0] >= towerBlocation[0]){
                crosshairlocation[0] = crosshairlocation[0] - 1;
             }
            if(joypad() & J_RIGHT && crosshairlocation[0] <= towerClocation[0]){
                crosshairlocation[0] = crosshairlocation[0] + 1;
             }

            if(joypad() & J_A){
                //drop selected special
                move_sprite(26,  crosshairlocation[0], crosshairlocation[1]);
            }
            move_sprite(1, crosshairlocation[0], crosshairlocation[1]);
            delay(8);
        }
}

//If loop to prevent cycling through options or movements too quickly
void keypress(){
if (keydown){
    waitpadup();
    keydown = 0;
    }
}


void special(){
//Mini display of which special is selected: bomb = 1, arrowstorm = 2, lightning = 3.
keypress(); 
specSel = 1;
//changes selection of special
if(joypad() & J_SELECT){
    keydown = 1;
    specSel += 1;
    //move_sprite(icon, x, y);
}

//cycles through special selections
if (specSel > 3){
    specSel = 1;
    }
}

