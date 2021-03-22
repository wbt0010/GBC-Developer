#include <gb/gb.h>
#include <gb/cgb.h>
#include <stdio.h>

//moves stuff that doesn't need to be on screen 
UINT8 outofthefuckingway[2];
//Selector mode
UINT8 status = 0;
//Location of player on map
UINT8 mappos = 0;
//Use your eyes
UINT8 crosshairlocation[2];
UINT8 selectorlocation[2];

//Use your eyes
UINT8 towerAlocation[2];
UINT8 towerBlocation[2];
UINT8 towerClocation[2];

//Projectile Vectors for Tower A
UINT8 projectileA1[2];
UINT8 projectileA2[2];
UINT8 projectileA3[2];

//Projectile Vectors for Tower B
UINT8 projectileB1[2];
UINT8 projectileB2[2];
UINT8 projectileB3[2];

//Projectile Vectors for Tower C
UINT8 projectileC1[2];
UINT8 projectileC2[2];
UINT8 projectileC3[2];

//Enemy Vectors
UINT8 spawn = 0;
UINT8 spawnlocal = 0;
UINT8 enemyspawn0[2];
UINT8 enemyspawn1[2];
UINT8 enemyspawn2[2];
UINT8 enemyspawn3[2];
UINT8 enemyspawn4[2];
UINT8 enemyspawn5[2];
UINT8 enemyspawn6[2];
UINT8 enemyspawn7[2];
UINT8 enemyspawn8[2];
UINT8 enemyspawn9[2];
UINT8 enemyspawn10[2];

void definevar() {
//tower sprite location [0],x [1],y
towerAlocation[0] = 80;
towerAlocation[1] = 108;

//tower sprite location [0],x [1],y
towerBlocation[0] = 40;
towerBlocation[1] = 72;

//tower sprite location [0],x [1],y
towerClocation[0] = 120;
towerClocation[1] = 72;

//pseudo tower meta sprites
/*move_sprite(tower a bottom right, towerAlocation[0]+8, towerAlocation[1]);
move_sprite(tower a top right, towerAlocation[0]+8, towerAlocation[1]-8);
move_sprite(tower a top left, towerAlocation[0], towerAlocation[1]-8);
*/

/*move_sprite(tower B bottom right, towerBlocation[0]+8, towerBlocation[1]);
move_sprite(tower B top right, towerBlocation[0]+8, towerBlocation[1]-8);
move_sprite(tower B top left, towerBlocation[0], towerBlocation[1]-8);
*/

/*move_sprite(tower C bottom right, towerClocation[0]+8, towerClocation[1]);
move_sprite(tower C top right, towerClocation[0]+8, towerClocation[1]-8);
move_sprite(tower C top left, towerClocation[0], towerClocation[1]-8);
*/

//initializing selector location
selectorlocation[0] = towerAlocation[0];
selectorlocation[1] = towerAlocation[1];
crosshairlocation[0] = 80;
crosshairlocation[1] = 72;

}