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

//Enemy to Building Distance for Tower A
UINT8 tAted0;
UINT8 tAted1;
UINT8 tAted2;
UINT8 tAted3;
UINT8 tAted4;
UINT8 tAted5;
UINT8 tAted6;
UINT8 tAted7;
UINT8 tAted8;
UINT8 tAted9;
UINT8 tAted10;
//An array that tracks the distance of each enemy to Tower A
UINT8 distvectA[11] = {tAted0, tAted1, tAted2, tAted3, tAted4, tAted5, tAted6, tAted7, tAted8, tAted9, tAted10};

//Enemy to Building Distance for Tower B
UINT8 tBted0;
UINT8 tBted1;
UINT8 tBted2;
UINT8 tBted3;
UINT8 tBted4;
UINT8 tBted5;
UINT8 tBted6;
UINT8 tBted7;
UINT8 tBted8;
UINT8 tBted9;
UINT8 tBted10;
//An array that tracks the distance of each enemy to Tower B
UINT8 distvectB[11] = {tBted0, tBted1, tBted2, tBted3, tBted4, tBted5, tBted6, tBted7, tBted8, tBted9, tBted10};

//Enemy to Building Distance for Tower C
UINT8 tCted0;
UINT8 tCted1;
UINT8 tCted2;
UINT8 tCted3;
UINT8 tCted4;
UINT8 tCted5;
UINT8 tCted6;
UINT8 tCted7;
UINT8 tCted8;
UINT8 tCted9;
UINT8 tCted10;
//An array that tracks the distance of each enemy to Tower B
UINT8 distvectC[11] = {tCted0, tCted1, tCted2, tCted3, tCted4, tCted5, tCted6, tCted7, tCted8, tCted9, tCted10};

//An array that tracks the distance of each enemy to every tower
UINT8 enemydistvect0[3] = {distvectA[0], distvectB[0], distvectC[0]};
UINT8 enemydistvect1[3] = {distvectA[1], distvectB[1], distvectC[1]};
UINT8 enemydistvect2[3] = {distvectA[2], distvectB[2], distvectC[2]};
UINT8 enemydistvect3[3] = {distvectA[3], distvectB[3], distvectC[3]};
UINT8 enemydistvect4[3] = {distvectA[4], distvectB[4], distvectC[4]};
UINT8 enemydistvect5[3] = {distvectA[5], distvectB[5], distvectC[5]};
UINT8 enemydistvect6[3] = {distvectA[6], distvectB[6], distvectC[6]};
UINT8 enemydistvect7[3] = {distvectA[7], distvectB[7], distvectC[7]};
UINT8 enemydistvect8[3] = {distvectA[8], distvectB[8], distvectC[8]};
UINT8 enemydistvect9[3] = {distvectA[9], distvectB[9], distvectC[9]};
UINT8 enemydistvect10[3] = {distvectA[10], distvectB[10], distvectC[10]};

UINT8 enemyAttack = 0;

void definevar() {
//tower sprite location [0],x [1],y
towerAlocation[0] = 96;
towerAlocation[1] = 148;

//tower sprite location [0],x [1],y
towerBlocation[0] = 40;
towerBlocation[1] = 88;

//tower sprite location [0],x [1],y
towerClocation[0] = 125;
towerClocation[1] = 72;
//initializing selector location
selectorlocation[0] = towerAlocation[0];
selectorlocation[1] = towerAlocation[1];
crosshairlocation[0] = 80;
crosshairlocation[1] = 72;
//Enemy Spawn
enemyspawn0[0] = 20;
enemyspawn0[1] = 0;
//tower A to enemy distance
tAted0 = (towerAlocation[0] - enemyspawn0[0]) + (towerAlocation[1] - enemyspawn0[1]);
tAted1 = (towerAlocation[0] - enemyspawn1[0]) + (towerAlocation[1] - enemyspawn1[1]);
tAted2 = (towerAlocation[0] - enemyspawn2[0]) + (towerAlocation[1] - enemyspawn2[1]);
tAted3 = (towerAlocation[0] - enemyspawn3[0]) + (towerAlocation[1] - enemyspawn3[1]);
tAted4 = (towerAlocation[0] - enemyspawn4[0]) + (towerAlocation[1] - enemyspawn4[1]);
tAted5 = (towerAlocation[0] - enemyspawn5[0]) + (towerAlocation[1] - enemyspawn5[1]);
tAted6 = (towerAlocation[0] - enemyspawn6[0]) + (towerAlocation[1] - enemyspawn6[1]);
tAted7 = (towerAlocation[0] - enemyspawn7[0]) + (towerAlocation[1] - enemyspawn7[1]);
tAted8 = (towerAlocation[0] - enemyspawn8[0]) + (towerAlocation[1] - enemyspawn8[1]);
tAted9 = (towerAlocation[0] - enemyspawn9[0]) + (towerAlocation[1] - enemyspawn9[1]);
tAted10 = (towerAlocation[0] - enemyspawn10[0]) + (towerAlocation[1] - enemyspawn10[1]);

//tower B to enemy distance
tBted0 = (towerBlocation[0] - enemyspawn0[0]) + (towerBlocation[1] - enemyspawn0[1]);
tBted1 = (towerBlocation[0] - enemyspawn1[0]) + (towerBlocation[1] - enemyspawn1[1]);
tBted2 = (towerBlocation[0] - enemyspawn2[0]) + (towerBlocation[1] - enemyspawn2[1]);
tBted3 = (towerBlocation[0] - enemyspawn3[0]) + (towerBlocation[1] - enemyspawn3[1]);
tBted4 = (towerBlocation[0] - enemyspawn4[0]) + (towerBlocation[1] - enemyspawn4[1]);
tBted5 = (towerBlocation[0] - enemyspawn5[0]) + (towerBlocation[1] - enemyspawn5[1]);
tBted6 = (towerBlocation[0] - enemyspawn6[0]) + (towerBlocation[1] - enemyspawn6[1]);
tBted7 = (towerBlocation[0] - enemyspawn7[0]) + (towerBlocation[1] - enemyspawn7[1]);
tBted8 = (towerBlocation[0] - enemyspawn8[0]) + (towerBlocation[1] - enemyspawn8[1]);
tBted9 = (towerBlocation[0] - enemyspawn9[0]) + (towerBlocation[1] - enemyspawn9[1]);
tBted10 = (towerBlocation[0] - enemyspawn10[0]) + (towerBlocation[1] - enemyspawn10[1]);

//tower C to enemy distance
tCted0 = (towerClocation[0] - enemyspawn0[0]) + (towerClocation[1] - enemyspawn0[1]);
tCted1 = (towerClocation[0] - enemyspawn1[0]) + (towerClocation[1] - enemyspawn1[1]);
tCted2 = (towerClocation[0] - enemyspawn2[0]) + (towerClocation[1] - enemyspawn2[1]);
tCted3 = (towerClocation[0] - enemyspawn3[0]) + (towerClocation[1] - enemyspawn3[1]);
tCted4 = (towerClocation[0] - enemyspawn4[0]) + (towerClocation[1] - enemyspawn4[1]);
tCted5 = (towerClocation[0] - enemyspawn5[0]) + (towerClocation[1] - enemyspawn5[1]);
tCted6 = (towerClocation[0] - enemyspawn6[0]) + (towerClocation[1] - enemyspawn6[1]);
tCted7 = (towerClocation[0] - enemyspawn7[0]) + (towerClocation[1] - enemyspawn7[1]);
tCted8 = (towerClocation[0] - enemyspawn8[0]) + (towerClocation[1] - enemyspawn8[1]);
tCted9 = (towerClocation[0] - enemyspawn9[0]) + (towerClocation[1] - enemyspawn9[1]);
tCted10 = (towerClocation[0] - enemyspawn10[0]) + (towerBlocation[1] - enemyspawn10[1]);
}