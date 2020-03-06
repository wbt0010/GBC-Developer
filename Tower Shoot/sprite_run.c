#include <gb/gb.h>
#include <gb/cgb.h>
#include <stdio.h>
//Name of file with sprite martices
#include "dia.h"

UINT8 posshift = 0;
UINT8 mappos = 0;
UINT8 playerlocation[2];
UINT8 aimdire = 0;
UINT8 moveplayerx = 0;
UINT8 moveplayery = 0;

const UWORD backgpalette[] = {
    RGB_DARKGRAY, RGB_DARKGRAY, RGB_DARKGRAY, RGB_DARKGRAY
};

const UWORD spritepalette[] = {
    diaCGBPal0c0,
    diaCGBPal0c1,
    diaCGBPal0c2,
    diaCGBPal0c3,
};

void performantdelay(UINT8 numloops){
    UINT8 i;
    for(i = 0; i < numloops; i++){
        wait_vbl_done();
    }     
}

void main(){

    playerlocation[0] = 88;
    playerlocation[1] = 120;
    set_bkg_palette(0,1,&backgpalette[0]);
    set_sprite_palette(0,1,&spritepalette[0]);
    
    //(First Sprite tile desired, Final Sprite tile desired, VariableXY name)
    set_sprite_data(0, 6, dia);
    //(0 does nothing, Number Tile desired to be displayed)
    set_sprite_tile(0, 0);
    set_sprite_prop(0,0);
    //Initial Location of sprite (0 does nothing, X, Y)
    move_sprite(0, playerlocation[0], playerlocation[1]);

    SHOW_SPRITES;

    while (1){

        //At Point A
        if(mappos == 0){
            
            //Move to Point B
            if (joypad() & J_B && joypad() & J_LEFT){
                posshift = 1;
            }
            while (posshift == 1){
                performantdelay(3);
                moveplayerx = -2;
                moveplayery = -1;
                scroll_sprite ( 0, moveplayerx, moveplayery);
                playerlocation[0] -= 2;
                 if (playerlocation[0] <= 48){
                    posshift = 0;
                    mappos = 1;
                    playerlocation[0] = 48;
                // move_sprite (0, 48, 88);
                    }
                }
            //Move toward Point C
            if (joypad() & J_B && joypad() & J_RIGHT){
                posshift = 2;
            }
            while (posshift == 2){
                performantdelay(3);
                moveplayerx = 2;
                moveplayery = -1;
                scroll_sprite ( 0, moveplayerx, moveplayery);
                playerlocation[0] += 2;
                if (playerlocation[0] >= 128){
                    posshift = 0;
                    mappos = -1;
                    playerlocation[0] = 128;   
                    //move_sprite (0, 128, 88);                
                }
            }
                
            
            if(joypad() & J_LEFT){
                set_sprite_tile(0, 2);
                aimdire = 2;
            }

            if(joypad() & J_RIGHT){
                set_sprite_tile(0, 1);
                aimdire = 1;
            }

            if(joypad() & J_UP){
                set_sprite_tile(0, 0);
                aimdire = 0;
                
            }

            if(joypad() & J_DOWN){
                //nothing for now
            }

            if(joypad() & J_A){
                //firing button
            }

            if(joypad() & J_B){
                //nothing for now
            }
        }

        //At Point B
        if(mappos == 1){
            
            //Move to Point A
            if (joypad() & J_B && joypad() & J_RIGHT){
                posshift = 2;
            }
            while (posshift == 2){
                performantdelay(3);
                moveplayerx = 2;
                moveplayery = 1;
                scroll_sprite ( 0, moveplayerx, moveplayery);
                playerlocation[0] += 2;
                if (playerlocation[0] >= 88){
                    posshift = 0;
                    mappos = 0;
                    playerlocation[0] = 88;   
                    //move_sprite (0, 128, 88);
                }
            }
            if(joypad() & J_LEFT){
                //nothing for now
            }

            if(joypad() & J_RIGHT){
                set_sprite_tile(0, 3);
                aimdire = 3;
            }

            if(joypad() & J_UP){
                set_sprite_tile(0, 5);
                aimdire = 5;
            }

            if(joypad() & J_DOWN){
                set_sprite_tile(0, 4);
                aimdire = 4;
            }

            if(joypad() & J_A){
                
            }

            if(joypad() & J_B){
                
            }
        }

        //At Point C
        if(mappos == -1){
            
            //Move to Point A
            if (joypad() & J_B && joypad() & J_LEFT){
                posshift = 1;
            }
            while (posshift == 1){
                performantdelay(3);
                moveplayerx = -2;
                moveplayery = 1;
                scroll_sprite ( 0, moveplayerx, moveplayery);
                playerlocation[0] -= 2;
                 if (playerlocation[0] <= 88){
                    posshift = 0;
                    mappos = 0;
                    playerlocation[0] = 88;
                }
            }
            if(joypad() & J_LEFT){
                
            }

            if(joypad() & J_RIGHT){
                
            }

            if(joypad() & J_UP){
                
            }

            if(joypad() & J_DOWN){
                
            }

            if(joypad() & J_A){
                
            }

            if(joypad() & J_B){
                
            }
        }
        performantdelay(4);
    }

}