;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (Mac OS X x86_64)
;--------------------------------------------------------
	.module sprite_run
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _performantdelay
	.globl _definevar
	.globl _set_sprite_palette
	.globl _set_bkg_palette
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _joypad
	.globl _delay
	.globl _enemyAttack
	.globl _enemydistvect10
	.globl _enemydistvect9
	.globl _enemydistvect8
	.globl _enemydistvect7
	.globl _enemydistvect6
	.globl _enemydistvect5
	.globl _enemydistvect4
	.globl _enemydistvect3
	.globl _enemydistvect2
	.globl _enemydistvect1
	.globl _enemydistvect0
	.globl _distvectC
	.globl _distvectB
	.globl _distvectA
	.globl _spawnlocal
	.globl _spawn
	.globl _mappos
	.globl _status
	.globl _tCted10
	.globl _tCted9
	.globl _tCted8
	.globl _tCted7
	.globl _tCted6
	.globl _tCted5
	.globl _tCted4
	.globl _tCted3
	.globl _tCted2
	.globl _tCted1
	.globl _tCted0
	.globl _tBted10
	.globl _tBted9
	.globl _tBted8
	.globl _tBted7
	.globl _tBted6
	.globl _tBted5
	.globl _tBted4
	.globl _tBted3
	.globl _tBted2
	.globl _tBted1
	.globl _tBted0
	.globl _tAted10
	.globl _tAted9
	.globl _tAted8
	.globl _tAted7
	.globl _tAted6
	.globl _tAted5
	.globl _tAted4
	.globl _tAted3
	.globl _tAted2
	.globl _tAted1
	.globl _tAted0
	.globl _enemyspawn10
	.globl _enemyspawn9
	.globl _enemyspawn8
	.globl _enemyspawn7
	.globl _enemyspawn6
	.globl _enemyspawn5
	.globl _enemyspawn4
	.globl _enemyspawn3
	.globl _enemyspawn2
	.globl _enemyspawn1
	.globl _enemyspawn0
	.globl _projectileC3
	.globl _projectileC2
	.globl _projectileC1
	.globl _projectileB3
	.globl _projectileB2
	.globl _projectileB1
	.globl _projectileA3
	.globl _projectileA2
	.globl _projectileA1
	.globl _towerClocation
	.globl _towerBlocation
	.globl _towerAlocation
	.globl _selectorlocation
	.globl _crosshairlocation
	.globl _outofthefuckingway
	.globl _spritepalette
	.globl _backgpalette
	.globl _selector
	.globl _crosshair
	.globl _enemymovement
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_outofthefuckingway::
	.ds 2
_crosshairlocation::
	.ds 2
_selectorlocation::
	.ds 2
_towerAlocation::
	.ds 2
_towerBlocation::
	.ds 2
_towerClocation::
	.ds 2
_projectileA1::
	.ds 2
_projectileA2::
	.ds 2
_projectileA3::
	.ds 2
_projectileB1::
	.ds 2
_projectileB2::
	.ds 2
_projectileB3::
	.ds 2
_projectileC1::
	.ds 2
_projectileC2::
	.ds 2
_projectileC3::
	.ds 2
_enemyspawn0::
	.ds 2
_enemyspawn1::
	.ds 2
_enemyspawn2::
	.ds 2
_enemyspawn3::
	.ds 2
_enemyspawn4::
	.ds 2
_enemyspawn5::
	.ds 2
_enemyspawn6::
	.ds 2
_enemyspawn7::
	.ds 2
_enemyspawn8::
	.ds 2
_enemyspawn9::
	.ds 2
_enemyspawn10::
	.ds 2
_tAted0::
	.ds 1
_tAted1::
	.ds 1
_tAted2::
	.ds 1
_tAted3::
	.ds 1
_tAted4::
	.ds 1
_tAted5::
	.ds 1
_tAted6::
	.ds 1
_tAted7::
	.ds 1
_tAted8::
	.ds 1
_tAted9::
	.ds 1
_tAted10::
	.ds 1
_tBted0::
	.ds 1
_tBted1::
	.ds 1
_tBted2::
	.ds 1
_tBted3::
	.ds 1
_tBted4::
	.ds 1
_tBted5::
	.ds 1
_tBted6::
	.ds 1
_tBted7::
	.ds 1
_tBted8::
	.ds 1
_tBted9::
	.ds 1
_tBted10::
	.ds 1
_tCted0::
	.ds 1
_tCted1::
	.ds 1
_tCted2::
	.ds 1
_tCted3::
	.ds 1
_tCted4::
	.ds 1
_tCted5::
	.ds 1
_tCted6::
	.ds 1
_tCted7::
	.ds 1
_tCted8::
	.ds 1
_tCted9::
	.ds 1
_tCted10::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_status::
	.ds 1
_mappos::
	.ds 1
_spawn::
	.ds 1
_spawnlocal::
	.ds 1
_distvectA::
	.ds 11
_distvectB::
	.ds 11
_distvectC::
	.ds 11
_enemydistvect0::
	.ds 3
_enemydistvect1::
	.ds 3
_enemydistvect2::
	.ds 3
_enemydistvect3::
	.ds 3
_enemydistvect4::
	.ds 3
_enemydistvect5::
	.ds 3
_enemydistvect6::
	.ds 3
_enemydistvect7::
	.ds 3
_enemydistvect8::
	.ds 3
_enemydistvect9::
	.ds 3
_enemydistvect10::
	.ds 3
_enemyAttack::
	.ds 1
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;Variable_pckg.c:110: void definevar() {
;	---------------------------------
; Function definevar
; ---------------------------------
_definevar::
;Variable_pckg.c:112: towerAlocation[0] = 96;
	ld	hl, #_towerAlocation
	ld	(hl), #0x60
;Variable_pckg.c:113: towerAlocation[1] = 148;
	ld	hl, #(_towerAlocation + 1)
	ld	(hl), #0x94
;Variable_pckg.c:116: towerBlocation[0] = 40;
	ld	hl, #_towerBlocation
	ld	(hl), #0x28
;Variable_pckg.c:117: towerBlocation[1] = 88;
	ld	hl, #(_towerBlocation + 1)
	ld	(hl), #0x58
;Variable_pckg.c:120: towerClocation[0] = 125;
	ld	hl, #_towerClocation
	ld	(hl), #0x7d
;Variable_pckg.c:121: towerClocation[1] = 72;
	ld	hl, #(_towerClocation + 1)
	ld	(hl), #0x48
;Variable_pckg.c:123: selectorlocation[0] = towerAlocation[0];
	ld	bc, #_selectorlocation+0
	ld	a, (#_towerAlocation + 0)
	ld	(bc), a
;Variable_pckg.c:124: selectorlocation[1] = towerAlocation[1];
	inc	bc
	ld	a, (#(_towerAlocation + 1) + 0)
	ld	(bc), a
;Variable_pckg.c:125: crosshairlocation[0] = 80;
	ld	hl, #_crosshairlocation
	ld	(hl), #0x50
;Variable_pckg.c:126: crosshairlocation[1] = 72;
	ld	hl, #(_crosshairlocation + 1)
	ld	(hl), #0x48
;Variable_pckg.c:128: enemyspawn0[0] = 20;
	ld	hl, #_enemyspawn0
	ld	(hl), #0x14
;Variable_pckg.c:129: enemyspawn0[1] = 0;
	ld	hl, #(_enemyspawn0 + 1)
	ld	(hl), #0x00
;Variable_pckg.c:131: tAted0 = (towerAlocation[0] - enemyspawn0[0]) + (towerAlocation[1] - enemyspawn0[1]);
	ld	a, (#_towerAlocation + 0)
	ld	hl, #_enemyspawn0
	ld	c, (hl)
	sub	a, c
	ld	c, a
	ld	a, (#(_towerAlocation + 1) + 0)
	ld	hl, #(_enemyspawn0 + 1)
	ld	b, (hl)
	sub	a, b
	add	a, c
	ld	(#_tAted0),a
;Variable_pckg.c:132: tAted1 = (towerAlocation[0] - enemyspawn1[0]) + (towerAlocation[1] - enemyspawn1[1]);
	ld	hl, #_towerAlocation
	ld	c, (hl)
	ld	hl, #_enemyspawn1
	ld	b, (hl)
	ld	a, c
	sub	a, b
	ld	c, a
	ld	hl, #(_towerAlocation + 1)
	ld	b, (hl)
	ld	hl, #(_enemyspawn1 + 1)
	ld	l, (hl)
;	spillPairReg hl
	ld	a, b
	sub	a, l
	add	a, c
	ld	(#_tAted1),a
;Variable_pckg.c:133: tAted2 = (towerAlocation[0] - enemyspawn2[0]) + (towerAlocation[1] - enemyspawn2[1]);
	ld	hl, #_towerAlocation
	ld	c, (hl)
	ld	hl, #_enemyspawn2
	ld	b, (hl)
	ld	a, c
	sub	a, b
	ld	c, a
	ld	hl, #(_towerAlocation + 1)
	ld	b, (hl)
	ld	hl, #(_enemyspawn2 + 1)
	ld	l, (hl)
;	spillPairReg hl
	ld	a, b
	sub	a, l
	add	a, c
	ld	(#_tAted2),a
;Variable_pckg.c:134: tAted3 = (towerAlocation[0] - enemyspawn3[0]) + (towerAlocation[1] - enemyspawn3[1]);
	ld	hl, #_towerAlocation
	ld	c, (hl)
	ld	hl, #_enemyspawn3
	ld	b, (hl)
	ld	a, c
	sub	a, b
	ld	c, a
	ld	hl, #(_towerAlocation + 1)
	ld	b, (hl)
	ld	hl, #(_enemyspawn3 + 1)
	ld	l, (hl)
;	spillPairReg hl
	ld	a, b
	sub	a, l
	add	a, c
	ld	(#_tAted3),a
;Variable_pckg.c:135: tAted4 = (towerAlocation[0] - enemyspawn4[0]) + (towerAlocation[1] - enemyspawn4[1]);
	ld	hl, #_towerAlocation
	ld	c, (hl)
	ld	hl, #_enemyspawn4
	ld	b, (hl)
	ld	a, c
	sub	a, b
	ld	c, a
	ld	hl, #(_towerAlocation + 1)
	ld	b, (hl)
	ld	hl, #(_enemyspawn4 + 1)
	ld	l, (hl)
;	spillPairReg hl
	ld	a, b
	sub	a, l
	add	a, c
	ld	(#_tAted4),a
;Variable_pckg.c:136: tAted5 = (towerAlocation[0] - enemyspawn5[0]) + (towerAlocation[1] - enemyspawn5[1]);
	ld	hl, #_towerAlocation
	ld	c, (hl)
	ld	hl, #_enemyspawn5
	ld	b, (hl)
	ld	a, c
	sub	a, b
	ld	c, a
	ld	hl, #(_towerAlocation + 1)
	ld	b, (hl)
	ld	hl, #(_enemyspawn5 + 1)
	ld	l, (hl)
;	spillPairReg hl
	ld	a, b
	sub	a, l
	add	a, c
	ld	(#_tAted5),a
;Variable_pckg.c:137: tAted6 = (towerAlocation[0] - enemyspawn6[0]) + (towerAlocation[1] - enemyspawn6[1]);
	ld	hl, #_towerAlocation
	ld	c, (hl)
	ld	hl, #_enemyspawn6
	ld	b, (hl)
	ld	a, c
	sub	a, b
	ld	c, a
	ld	hl, #(_towerAlocation + 1)
	ld	b, (hl)
	ld	hl, #(_enemyspawn6 + 1)
	ld	l, (hl)
;	spillPairReg hl
	ld	a, b
	sub	a, l
	add	a, c
	ld	(#_tAted6),a
;Variable_pckg.c:138: tAted7 = (towerAlocation[0] - enemyspawn7[0]) + (towerAlocation[1] - enemyspawn7[1]);
	ld	hl, #_towerAlocation
	ld	c, (hl)
	ld	hl, #_enemyspawn7
	ld	b, (hl)
	ld	a, c
	sub	a, b
	ld	c, a
	ld	hl, #(_towerAlocation + 1)
	ld	b, (hl)
	ld	hl, #(_enemyspawn7 + 1)
	ld	l, (hl)
;	spillPairReg hl
	ld	a, b
	sub	a, l
	add	a, c
	ld	(#_tAted7),a
;Variable_pckg.c:139: tAted8 = (towerAlocation[0] - enemyspawn8[0]) + (towerAlocation[1] - enemyspawn8[1]);
	ld	hl, #_towerAlocation
	ld	c, (hl)
	ld	hl, #_enemyspawn8
	ld	b, (hl)
	ld	a, c
	sub	a, b
	ld	c, a
	ld	hl, #(_towerAlocation + 1)
	ld	b, (hl)
	ld	hl, #(_enemyspawn8 + 1)
	ld	l, (hl)
;	spillPairReg hl
	ld	a, b
	sub	a, l
	add	a, c
	ld	(#_tAted8),a
;Variable_pckg.c:140: tAted9 = (towerAlocation[0] - enemyspawn9[0]) + (towerAlocation[1] - enemyspawn9[1]);
	ld	hl, #_towerAlocation
	ld	c, (hl)
	ld	hl, #_enemyspawn9
	ld	b, (hl)
	ld	a, c
	sub	a, b
	ld	c, a
	ld	hl, #(_towerAlocation + 1)
	ld	b, (hl)
	ld	hl, #(_enemyspawn9 + 1)
	ld	l, (hl)
;	spillPairReg hl
	ld	a, b
	sub	a, l
	add	a, c
	ld	(#_tAted9),a
;Variable_pckg.c:141: tAted10 = (towerAlocation[0] - enemyspawn10[0]) + (towerAlocation[1] - enemyspawn10[1]);
	ld	hl, #_towerAlocation
	ld	c, (hl)
	ld	hl, #_enemyspawn10
	ld	b, (hl)
	ld	a, c
	sub	a, b
	ld	c, a
	ld	hl, #(_towerAlocation + 1)
	ld	b, (hl)
	ld	hl, #(_enemyspawn10 + 1)
	ld	l, (hl)
;	spillPairReg hl
	ld	a, b
	sub	a, l
	add	a, c
	ld	(#_tAted10),a
;Variable_pckg.c:144: tBted0 = (towerBlocation[0] - enemyspawn0[0]) + (towerBlocation[1] - enemyspawn0[1]);
	ld	a, (#_towerBlocation + 0)
	ld	hl, #_enemyspawn0
	ld	c, (hl)
	sub	a, c
	ld	c, a
	ld	a, (#(_towerBlocation + 1) + 0)
	ld	hl, #(_enemyspawn0 + 1)
	ld	b, (hl)
	sub	a, b
	add	a, c
	ld	(#_tBted0),a
;Variable_pckg.c:145: tBted1 = (towerBlocation[0] - enemyspawn1[0]) + (towerBlocation[1] - enemyspawn1[1]);
	ld	a, (#_towerBlocation + 0)
	ld	hl, #_enemyspawn1
	ld	c, (hl)
	sub	a, c
	ld	c, a
	ld	a, (#(_towerBlocation + 1) + 0)
	ld	hl, #(_enemyspawn1 + 1)
	ld	b, (hl)
	sub	a, b
	add	a, c
	ld	(#_tBted1),a
;Variable_pckg.c:146: tBted2 = (towerBlocation[0] - enemyspawn2[0]) + (towerBlocation[1] - enemyspawn2[1]);
	ld	a, (#_towerBlocation + 0)
	ld	hl, #_enemyspawn2
	ld	c, (hl)
	sub	a, c
	ld	c, a
	ld	a, (#(_towerBlocation + 1) + 0)
	ld	hl, #(_enemyspawn2 + 1)
	ld	b, (hl)
	sub	a, b
	add	a, c
	ld	(#_tBted2),a
;Variable_pckg.c:147: tBted3 = (towerBlocation[0] - enemyspawn3[0]) + (towerBlocation[1] - enemyspawn3[1]);
	ld	a, (#_towerBlocation + 0)
	ld	hl, #_enemyspawn3
	ld	c, (hl)
	sub	a, c
	ld	c, a
	ld	a, (#(_towerBlocation + 1) + 0)
	ld	hl, #(_enemyspawn3 + 1)
	ld	b, (hl)
	sub	a, b
	add	a, c
	ld	(#_tBted3),a
;Variable_pckg.c:148: tBted4 = (towerBlocation[0] - enemyspawn4[0]) + (towerBlocation[1] - enemyspawn4[1]);
	ld	a, (#_towerBlocation + 0)
	ld	hl, #_enemyspawn4
	ld	c, (hl)
	sub	a, c
	ld	c, a
	ld	a, (#(_towerBlocation + 1) + 0)
	ld	hl, #(_enemyspawn4 + 1)
	ld	b, (hl)
	sub	a, b
	add	a, c
	ld	(#_tBted4),a
;Variable_pckg.c:149: tBted5 = (towerBlocation[0] - enemyspawn5[0]) + (towerBlocation[1] - enemyspawn5[1]);
	ld	a, (#_towerBlocation + 0)
	ld	hl, #_enemyspawn5
	ld	c, (hl)
	sub	a, c
	ld	c, a
	ld	a, (#(_towerBlocation + 1) + 0)
	ld	hl, #(_enemyspawn5 + 1)
	ld	b, (hl)
	sub	a, b
	add	a, c
	ld	(#_tBted5),a
;Variable_pckg.c:150: tBted6 = (towerBlocation[0] - enemyspawn6[0]) + (towerBlocation[1] - enemyspawn6[1]);
	ld	a, (#_towerBlocation + 0)
	ld	hl, #_enemyspawn6
	ld	c, (hl)
	sub	a, c
	ld	c, a
	ld	a, (#(_towerBlocation + 1) + 0)
	ld	hl, #(_enemyspawn6 + 1)
	ld	b, (hl)
	sub	a, b
	add	a, c
	ld	(#_tBted6),a
;Variable_pckg.c:151: tBted7 = (towerBlocation[0] - enemyspawn7[0]) + (towerBlocation[1] - enemyspawn7[1]);
	ld	a, (#_towerBlocation + 0)
	ld	hl, #_enemyspawn7
	ld	c, (hl)
	sub	a, c
	ld	c, a
	ld	a, (#(_towerBlocation + 1) + 0)
	ld	hl, #(_enemyspawn7 + 1)
	ld	b, (hl)
	sub	a, b
	add	a, c
	ld	(#_tBted7),a
;Variable_pckg.c:152: tBted8 = (towerBlocation[0] - enemyspawn8[0]) + (towerBlocation[1] - enemyspawn8[1]);
	ld	a, (#_towerBlocation + 0)
	ld	hl, #_enemyspawn8
	ld	c, (hl)
	sub	a, c
	ld	c, a
	ld	a, (#(_towerBlocation + 1) + 0)
	ld	hl, #(_enemyspawn8 + 1)
	ld	b, (hl)
	sub	a, b
	add	a, c
	ld	(#_tBted8),a
;Variable_pckg.c:153: tBted9 = (towerBlocation[0] - enemyspawn9[0]) + (towerBlocation[1] - enemyspawn9[1]);
	ld	a, (#_towerBlocation + 0)
	ld	hl, #_enemyspawn9
	ld	c, (hl)
	sub	a, c
	ld	c, a
	ld	a, (#(_towerBlocation + 1) + 0)
	ld	hl, #(_enemyspawn9 + 1)
	ld	b, (hl)
	sub	a, b
	add	a, c
	ld	(#_tBted9),a
;Variable_pckg.c:154: tBted10 = (towerBlocation[0] - enemyspawn10[0]) + (towerBlocation[1] - enemyspawn10[1]);
	ld	a, (#_towerBlocation + 0)
	ld	hl, #_enemyspawn10
	ld	c, (hl)
	sub	a, c
	ld	c, a
	ld	a, (#(_towerBlocation + 1) + 0)
	ld	hl, #(_enemyspawn10 + 1)
	ld	b, (hl)
	sub	a, b
	add	a, c
	ld	(#_tBted10),a
;Variable_pckg.c:157: tCted0 = (towerClocation[0] - enemyspawn0[0]) + (towerClocation[1] - enemyspawn0[1]);
	ld	a, (#_towerClocation + 0)
	ld	hl, #_enemyspawn0
	ld	c, (hl)
	sub	a, c
	ld	c, a
	ld	a, (#(_towerClocation + 1) + 0)
	ld	hl, #(_enemyspawn0 + 1)
	ld	b, (hl)
	sub	a, b
	add	a, c
	ld	(#_tCted0),a
;Variable_pckg.c:158: tCted1 = (towerClocation[0] - enemyspawn1[0]) + (towerClocation[1] - enemyspawn1[1]);
	ld	a, (#_towerClocation + 0)
	ld	hl, #_enemyspawn1
	ld	c, (hl)
	sub	a, c
	ld	c, a
	ld	a, (#(_towerClocation + 1) + 0)
	ld	hl, #(_enemyspawn1 + 1)
	ld	b, (hl)
	sub	a, b
	add	a, c
	ld	(#_tCted1),a
;Variable_pckg.c:159: tCted2 = (towerClocation[0] - enemyspawn2[0]) + (towerClocation[1] - enemyspawn2[1]);
	ld	a, (#_towerClocation + 0)
	ld	hl, #_enemyspawn2
	ld	c, (hl)
	sub	a, c
	ld	c, a
	ld	a, (#(_towerClocation + 1) + 0)
	ld	hl, #(_enemyspawn2 + 1)
	ld	b, (hl)
	sub	a, b
	add	a, c
	ld	(#_tCted2),a
;Variable_pckg.c:160: tCted3 = (towerClocation[0] - enemyspawn3[0]) + (towerClocation[1] - enemyspawn3[1]);
	ld	a, (#_towerClocation + 0)
	ld	hl, #_enemyspawn3
	ld	c, (hl)
	sub	a, c
	ld	c, a
	ld	a, (#(_towerClocation + 1) + 0)
	ld	hl, #(_enemyspawn3 + 1)
	ld	b, (hl)
	sub	a, b
	add	a, c
	ld	(#_tCted3),a
;Variable_pckg.c:161: tCted4 = (towerClocation[0] - enemyspawn4[0]) + (towerClocation[1] - enemyspawn4[1]);
	ld	a, (#_towerClocation + 0)
	ld	hl, #_enemyspawn4
	ld	c, (hl)
	sub	a, c
	ld	c, a
	ld	a, (#(_towerClocation + 1) + 0)
	ld	hl, #(_enemyspawn4 + 1)
	ld	b, (hl)
	sub	a, b
	add	a, c
	ld	(#_tCted4),a
;Variable_pckg.c:162: tCted5 = (towerClocation[0] - enemyspawn5[0]) + (towerClocation[1] - enemyspawn5[1]);
	ld	a, (#_towerClocation + 0)
	ld	hl, #_enemyspawn5
	ld	c, (hl)
	sub	a, c
	ld	c, a
	ld	a, (#(_towerClocation + 1) + 0)
	ld	hl, #(_enemyspawn5 + 1)
	ld	b, (hl)
	sub	a, b
	add	a, c
	ld	(#_tCted5),a
;Variable_pckg.c:163: tCted6 = (towerClocation[0] - enemyspawn6[0]) + (towerClocation[1] - enemyspawn6[1]);
	ld	a, (#_towerClocation + 0)
	ld	hl, #_enemyspawn6
	ld	c, (hl)
	sub	a, c
	ld	c, a
	ld	a, (#(_towerClocation + 1) + 0)
	ld	hl, #(_enemyspawn6 + 1)
	ld	b, (hl)
	sub	a, b
	add	a, c
	ld	(#_tCted6),a
;Variable_pckg.c:164: tCted7 = (towerClocation[0] - enemyspawn7[0]) + (towerClocation[1] - enemyspawn7[1]);
	ld	a, (#_towerClocation + 0)
	ld	hl, #_enemyspawn7
	ld	c, (hl)
	sub	a, c
	ld	c, a
	ld	a, (#(_towerClocation + 1) + 0)
	ld	hl, #(_enemyspawn7 + 1)
	ld	b, (hl)
	sub	a, b
	add	a, c
	ld	(#_tCted7),a
;Variable_pckg.c:165: tCted8 = (towerClocation[0] - enemyspawn8[0]) + (towerClocation[1] - enemyspawn8[1]);
	ld	a, (#_towerClocation + 0)
	ld	hl, #_enemyspawn8
	ld	c, (hl)
	sub	a, c
	ld	c, a
	ld	a, (#(_towerClocation + 1) + 0)
	ld	hl, #(_enemyspawn8 + 1)
	ld	b, (hl)
	sub	a, b
	add	a, c
	ld	(#_tCted8),a
;Variable_pckg.c:166: tCted9 = (towerClocation[0] - enemyspawn9[0]) + (towerClocation[1] - enemyspawn9[1]);
	ld	a, (#_towerClocation + 0)
	ld	hl, #_enemyspawn9
	ld	c, (hl)
	sub	a, c
	ld	c, a
	ld	a, (#(_towerClocation + 1) + 0)
	ld	hl, #(_enemyspawn9 + 1)
	ld	b, (hl)
	sub	a, b
	add	a, c
	ld	(#_tCted9),a
;Variable_pckg.c:167: tCted10 = (towerClocation[0] - enemyspawn10[0]) + (towerBlocation[1] - enemyspawn10[1]);
	ld	a, (#_towerClocation + 0)
	ld	hl, #_enemyspawn10
	ld	c, (hl)
	sub	a, c
	ld	c, a
	ld	a, (#(_towerBlocation + 1) + 0)
	ld	hl, #(_enemyspawn10 + 1)
	ld	b, (hl)
	sub	a, b
	add	a, c
	ld	(#_tCted10),a
;Variable_pckg.c:168: }
	ret
;sprite_run.c:64: void performantdelay(UINT8 numloops){
;	---------------------------------
; Function performantdelay
; ---------------------------------
_performantdelay::
;sprite_run.c:66: for(i = 0; i < numloops; i++){
	ld	c, #0x00
00103$:
	ld	a, c
	ldhl	sp,	#2
	sub	a, (hl)
	ret	NC
;sprite_run.c:67: wait_vbl_done();
	call	_wait_vbl_done
;sprite_run.c:66: for(i = 0; i < numloops; i++){
	inc	c
;sprite_run.c:69: }
	jr	00103$
_backgpalette:
	.dw #0x536f
	.dw #0x5ad6
	.dw #0x42db
	.dw #0x4ace
	.dw #0x17bc
	.dw #0x22e7
	.dw #0x19c4
	.dw #0x14e0
	.dw #0x17bc
	.dw #0x22e7
	.dw #0x19c4
	.dw #0x14e0
	.dw #0x17bc
	.dw #0x22e7
	.dw #0x19c4
	.dw #0x14e0
	.dw #0x17bc
	.dw #0x22e7
	.dw #0x19c4
	.dw #0x14e0
	.dw #0x17bc
	.dw #0x22e7
	.dw #0x19c4
	.dw #0x14e0
	.dw #0x17bc
	.dw #0x22e7
	.dw #0x19c4
	.dw #0x14e0
	.dw #0x17bc
	.dw #0x22e7
	.dw #0x19c4
	.dw #0x14e0
_spritepalette:
	.dw #0x7fff
	.dw #0x1421
	.dw #0x4063
	.dw #0x7ce7
;sprite_run.c:71: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;sprite_run.c:73: definevar();
	call	_definevar
;sprite_run.c:76: set_sprite_data(0, 127, GTP);
	ld	de, #_GTP
	push	de
	ld	hl, #0x7f00
	push	hl
	call	_set_sprite_data
	add	sp, #4
;sprite_run.c:78: set_sprite_palette(0, 8, &spritepalette[0]);
	ld	de, #_spritepalette
	push	de
	ld	hl, #0x800
	push	hl
	call	_set_sprite_palette
	add	sp, #4
;sprite_run.c:80: set_bkg_palette(0, 6, &backgpalette[0]);
	ld	de, #_backgpalette
	push	de
	ld	hl, #0x600
	push	hl
	call	_set_bkg_palette
	add	sp, #4
;sprite_run.c:82: set_bkg_data(0, 6, Grassland);
	ld	bc, #_GrasslandPLN0+0
	push	bc
	ld	hl, #0x600
	push	hl
	call	_set_bkg_data
	add	sp, #4
;sprite_run.c:83: VBK_REG = 1;
	ld	a, #0x01
	ldh	(_VBK_REG + 0), a
;sprite_run.c:84: set_bkg_tiles(0, 0, GrasslandWidth, GrasslandHeight, GrasslandPLN1);
	ld	de, #_GrasslandPLN1
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;sprite_run.c:85: VBK_REG = 0;
	xor	a, a
	ldh	(_VBK_REG + 0), a
;sprite_run.c:86: set_bkg_tiles(0, 0, GrasslandWidth, GrasslandHeight, GrasslandPLN0);
	push	bc
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;sprite_run.c:87: set_bkg_palette(0,1,&backgpalette[0]);
	ld	de, #_backgpalette
	push	de
	xor	a, a
	inc	a
	push	af
	call	_set_bkg_palette
	add	sp, #4
;/opt/gbdk/include/gb/gb.h:1326: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x0f
;sprite_run.c:96: move_sprite(0, towerAlocation[0], towerAlocation[1]);
	ld	hl, #(_towerAlocation + 1)
	ld	b, (hl)
	ld	hl, #_towerAlocation
	ld	c, (hl)
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;/opt/gbdk/include/gb/gb.h:1326: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x0e
;/opt/gbdk/include/gb/gb.h:1372: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 3)
	ld	(hl), #0x00
;/opt/gbdk/include/gb/gb.h:1326: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x30
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x31
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x32
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x33
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x34
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x35
	ld	hl, #(_shadow_OAM + 34)
	ld	(hl), #0x36
	ld	hl, #(_shadow_OAM + 38)
	ld	(hl), #0x37
	ld	hl, #(_shadow_OAM + 42)
	ld	(hl), #0x30
	ld	hl, #(_shadow_OAM + 46)
	ld	(hl), #0x31
	ld	hl, #(_shadow_OAM + 50)
	ld	(hl), #0x32
	ld	hl, #(_shadow_OAM + 54)
	ld	(hl), #0x33
	ld	hl, #(_shadow_OAM + 58)
	ld	(hl), #0x34
	ld	hl, #(_shadow_OAM + 62)
	ld	(hl), #0x35
	ld	hl, #(_shadow_OAM + 66)
	ld	(hl), #0x36
	ld	hl, #(_shadow_OAM + 70)
	ld	(hl), #0x37
	ld	hl, #(_shadow_OAM + 74)
	ld	(hl), #0x30
	ld	hl, #(_shadow_OAM + 78)
	ld	(hl), #0x31
	ld	hl, #(_shadow_OAM + 82)
	ld	(hl), #0x32
	ld	hl, #(_shadow_OAM + 86)
	ld	(hl), #0x33
	ld	hl, #(_shadow_OAM + 90)
	ld	(hl), #0x34
	ld	hl, #(_shadow_OAM + 94)
	ld	(hl), #0x35
	ld	hl, #(_shadow_OAM + 98)
	ld	(hl), #0x36
	ld	hl, #(_shadow_OAM + 102)
	ld	(hl), #0x37
	ld	hl, #(_shadow_OAM + 106)
	ld	(hl), #0x00
;sprite_run.c:136: move_sprite(9, towerAlocation[0], towerAlocation[1]);
	ld	hl, #(_towerAlocation + 1)
	ld	b, (hl)
	ld	hl, #_towerAlocation
	ld	c, (hl)
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 36)
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:138: move_sprite(7, towerAlocation[0] - 8, towerAlocation[1]);
	ld	hl, #(_towerAlocation + 1)
	ld	b, (hl)
	ld	a, (#_towerAlocation + 0)
	add	a, #0xf8
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 28)
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:140: move_sprite(8, towerAlocation[0], towerAlocation[1] - 8);
	ld	a, (#(_towerAlocation + 1) + 0)
	add	a, #0xf8
	ld	b, a
	ld	hl, #_towerAlocation
	ld	c, (hl)
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 32)
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:142: move_sprite(6, towerAlocation[0] - 8, towerAlocation[1] - 8);
	ld	a, (#(_towerAlocation + 1) + 0)
	add	a, #0xf8
	ld	b, a
	ld	a, (#_towerAlocation + 0)
	add	a, #0xf8
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 24)
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:144: move_sprite(5, towerAlocation[0], towerAlocation[1] - 16);
	ld	a, (#(_towerAlocation + 1) + 0)
	add	a, #0xf0
	ld	b, a
	ld	hl, #_towerAlocation
	ld	c, (hl)
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 20)
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:146: move_sprite(3, towerAlocation[0] - 8, towerAlocation[1] - 16);
	ld	a, (#(_towerAlocation + 1) + 0)
	add	a, #0xf0
	ld	b, a
	ld	a, (#_towerAlocation + 0)
	add	a, #0xf8
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 12)
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:148: move_sprite(4, towerAlocation[0], towerAlocation[1] - 24);
	ld	a, (#(_towerAlocation + 1) + 0)
	add	a, #0xe8
	ld	b, a
	ld	hl, #_towerAlocation
	ld	c, (hl)
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 16)
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:150: move_sprite(2, towerAlocation[0] - 8, towerAlocation[1] - 24);
	ld	a, (#(_towerAlocation + 1) + 0)
	add	a, #0xe8
	ld	b, a
	ld	a, (#_towerAlocation + 0)
	add	a, #0xf8
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 8)
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:153: move_sprite(17, towerBlocation[0], towerBlocation[1]);
	ld	hl, #(_towerBlocation + 1)
	ld	b, (hl)
	ld	hl, #_towerBlocation
	ld	c, (hl)
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 68)
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:155: move_sprite(15, towerBlocation[0] - 8, towerBlocation[1]);
	ld	hl, #(_towerBlocation + 1)
	ld	b, (hl)
	ld	a, (#_towerBlocation + 0)
	add	a, #0xf8
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 60)
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:157: move_sprite(16, towerBlocation[0], towerBlocation[1] - 8);
	ld	a, (#(_towerBlocation + 1) + 0)
	add	a, #0xf8
	ld	b, a
	ld	hl, #_towerBlocation
	ld	c, (hl)
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 64)
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:159: move_sprite(14, towerBlocation[0] - 8, towerBlocation[1] - 8);
	ld	a, (#(_towerBlocation + 1) + 0)
	add	a, #0xf8
	ld	b, a
	ld	a, (#_towerBlocation + 0)
	add	a, #0xf8
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 56)
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:161: move_sprite(13, towerBlocation[0], towerBlocation[1] - 16);
	ld	a, (#(_towerBlocation + 1) + 0)
	add	a, #0xf0
	ld	b, a
	ld	hl, #_towerBlocation
	ld	c, (hl)
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 52)
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:163: move_sprite(11, towerBlocation[0] - 8, towerBlocation[1] - 16);
	ld	a, (#(_towerBlocation + 1) + 0)
	add	a, #0xf0
	ld	b, a
	ld	a, (#_towerBlocation + 0)
	add	a, #0xf8
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 44)
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:165: move_sprite(12, towerBlocation[0], towerBlocation[1] - 24);
	ld	a, (#(_towerBlocation + 1) + 0)
	add	a, #0xe8
	ld	b, a
	ld	hl, #_towerBlocation
	ld	c, (hl)
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 48)
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:167: move_sprite(10, towerBlocation[0] - 8, towerBlocation[1] - 24);
	ld	a, (#(_towerBlocation + 1) + 0)
	add	a, #0xe8
	ld	b, a
	ld	a, (#_towerBlocation + 0)
	add	a, #0xf8
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 40)
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:170: move_sprite(25, towerClocation[0], towerClocation[1]);
	ld	hl, #(_towerClocation + 1)
	ld	b, (hl)
	ld	hl, #_towerClocation
	ld	c, (hl)
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 100)
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:172: move_sprite(23, towerClocation[0] - 8, towerClocation[1]);
	ld	hl, #(_towerClocation + 1)
	ld	b, (hl)
	ld	a, (#_towerClocation + 0)
	add	a, #0xf8
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 92)
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:174: move_sprite(24, towerClocation[0], towerClocation[1] - 8);
	ld	a, (#(_towerClocation + 1) + 0)
	add	a, #0xf8
	ld	b, a
	ld	hl, #_towerClocation
	ld	c, (hl)
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 96)
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:176: move_sprite(22, towerClocation[0] - 8, towerClocation[1] - 8);
	ld	a, (#(_towerClocation + 1) + 0)
	add	a, #0xf8
	ld	b, a
	ld	a, (#_towerClocation + 0)
	add	a, #0xf8
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 88)
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:178: move_sprite(21, towerClocation[0], towerClocation[1] - 16);
	ld	a, (#(_towerClocation + 1) + 0)
	add	a, #0xf0
	ld	b, a
	ld	hl, #_towerClocation
	ld	c, (hl)
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 84)
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:180: move_sprite(19, towerClocation[0] - 8, towerClocation[1] - 16);
	ld	a, (#(_towerClocation + 1) + 0)
	add	a, #0xf0
	ld	b, a
	ld	a, (#_towerClocation + 0)
	add	a, #0xf8
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 76)
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:182: move_sprite(20, towerClocation[0], towerClocation[1] - 24);
	ld	a, (#(_towerClocation + 1) + 0)
	add	a, #0xe8
	ld	b, a
	ld	hl, #_towerClocation
	ld	c, (hl)
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 80)
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:184: move_sprite(18, towerClocation[0] - 8, towerClocation[1] - 24);
	ld	a, (#(_towerClocation + 1) + 0)
	add	a, #0xe8
	ld	b, a
	ld	a, (#_towerClocation + 0)
	add	a, #0xf8
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 72)
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:186: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;sprite_run.c:187: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;sprite_run.c:188: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;sprite_run.c:190: while (1){
00102$:
;sprite_run.c:191: enemymovement();
	call	_enemymovement
;sprite_run.c:192: selector();
	call	_selector
;sprite_run.c:193: crosshair();
	call	_crosshair
;sprite_run.c:194: status = 0;
	ld	hl, #_status
	ld	(hl), #0x00
;sprite_run.c:195: move_sprite(0, selectorlocation[0], selectorlocation[1]);
	ld	hl, #_selectorlocation + 1
	ld	b, (hl)
	ld	hl, #_selectorlocation
	ld	c, (hl)
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:196: move_sprite(1, outofthefuckingway[0], outofthefuckingway[1]);
	ld	hl, #_outofthefuckingway + 1
	ld	b, (hl)
	ld	hl, #_outofthefuckingway
	ld	c, (hl)
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:196: move_sprite(1, outofthefuckingway[0], outofthefuckingway[1]);
;sprite_run.c:198: } 
	jr	00102$
;sprite_run.c:200: void selector(){
;	---------------------------------
; Function selector
; ---------------------------------
_selector::
;sprite_run.c:201: if(status == 0){
	ld	a, (#_status)
	or	a, a
	ret	NZ
;sprite_run.c:202: if(joypad() & J_DOWN){
	call	_joypad
	bit	3, e
	jr	Z, 00102$
;sprite_run.c:203: selectorlocation[0] = towerAlocation[0];
	ld	bc, #_selectorlocation+0
	ld	de, #_towerAlocation+0
	ld	a, (de)
	ld	(bc), a
;sprite_run.c:204: selectorlocation[1] = towerAlocation[1];
	inc	bc
	inc	de
	ld	a, (de)
	ld	(bc), a
;sprite_run.c:205: mappos = 0;
	ld	hl, #_mappos
	ld	(hl), #0x00
00102$:
;sprite_run.c:207: if(joypad() & J_LEFT){
	call	_joypad
	bit	1, e
	jr	Z, 00104$
;sprite_run.c:208: selectorlocation[0] = towerBlocation[0];
	ld	bc, #_selectorlocation+0
	ld	a, (#_towerBlocation + 0)
	ld	(bc), a
;sprite_run.c:209: selectorlocation[1] = towerBlocation[1];
	inc	bc
	ld	a, (#(_towerBlocation + 1) + 0)
	ld	(bc), a
;sprite_run.c:210: mappos = 1;
	ld	hl, #_mappos
	ld	(hl), #0x01
00104$:
;sprite_run.c:212: if(joypad() & J_RIGHT){
	call	_joypad
	ld	a, e
	rrca
	ret	NC
;sprite_run.c:213: selectorlocation[0] = towerClocation[0];
	ld	bc, #_selectorlocation+0
	ld	a, (#_towerClocation + 0)
	ld	(bc), a
;sprite_run.c:214: selectorlocation[1] = towerClocation[1];
	inc	bc
	ld	a, (#(_towerClocation + 1) + 0)
	ld	(bc), a
;sprite_run.c:215: mappos = 2;
	ld	hl, #_mappos
	ld	(hl), #0x02
;sprite_run.c:218: }
	ret
;sprite_run.c:220: void crosshair(){
;	---------------------------------
; Function crosshair
; ---------------------------------
_crosshair::
;sprite_run.c:221: while(joypad() & J_B){
00115$:
	call	_joypad
	bit	5, e
	ret	Z
;sprite_run.c:222: status = 1;
	ld	hl, #_status
	ld	(hl), #0x01
;sprite_run.c:223: move_sprite(0, outofthefuckingway[0], outofthefuckingway[1]);
	ld	hl, #(_outofthefuckingway + 1)
	ld	b, (hl)
	ld	hl, #_outofthefuckingway
	ld	c, (hl)
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:224: if(joypad() & J_UP && crosshairlocation[1] >= 20){
	call	_joypad
	bit	2, e
	jr	Z, 00102$
	ld	a, (#(_crosshairlocation + 1) + 0)
	cp	a, #0x14
	jr	C, 00102$
;sprite_run.c:225: crosshairlocation[1] = crosshairlocation[1] - 1;
	dec	a
	ld	(#(_crosshairlocation + 1)),a
00102$:
;sprite_run.c:227: if(joypad() & J_DOWN && crosshairlocation[1] <= towerAlocation[1]){
	call	_joypad
	bit	3, e
	jr	Z, 00105$
	ld	hl, #(_crosshairlocation + 1)
	ld	c, (hl)
	ld	a, (#(_towerAlocation + 1) + 0)
	sub	a, c
	jr	C, 00105$
;sprite_run.c:228: crosshairlocation[1] = crosshairlocation[1] + 1;
	inc	c
	ld	hl, #(_crosshairlocation + 1)
	ld	(hl), c
00105$:
;sprite_run.c:230: if(joypad() & J_LEFT && crosshairlocation[0] >= towerBlocation[0]){
	call	_joypad
	bit	1, e
	jr	Z, 00108$
	ld	a, (#_crosshairlocation + 0)
	ld	hl, #_towerBlocation
	ld	c, (hl)
	cp	a, c
	jr	C, 00108$
;sprite_run.c:231: crosshairlocation[0] = crosshairlocation[0] - 1;
	dec	a
	ld	(#_crosshairlocation),a
00108$:
;sprite_run.c:233: if(joypad() & J_RIGHT && crosshairlocation[0] <= towerClocation[0]){
	call	_joypad
	ld	a, e
	rrca
	jr	NC, 00111$
	ld	hl, #_crosshairlocation
	ld	c, (hl)
	ld	a, (#_towerClocation + 0)
	sub	a, c
	jr	C, 00111$
;sprite_run.c:234: crosshairlocation[0] = crosshairlocation[0] + 1;
	inc	c
	ld	hl, #_crosshairlocation
	ld	(hl), c
00111$:
;sprite_run.c:236: if(joypad() & J_A){
	call	_joypad
	bit	4, e
	jr	Z, 00114$
;sprite_run.c:238: move_sprite(0, selectorlocation[0], selectorlocation[1]);
	ld	hl, #(_selectorlocation + 1)
	ld	b, (hl)
	ld	hl, #_selectorlocation
	ld	c, (hl)
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:238: move_sprite(0, selectorlocation[0], selectorlocation[1]);
00114$:
;sprite_run.c:240: move_sprite(1, crosshairlocation[0], crosshairlocation[1]);
	ld	hl, #(_crosshairlocation + 1)
	ld	c, (hl)
	ld	hl, #_crosshairlocation
	ld	b, (hl)
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;sprite_run.c:241: delay(8);
	ld	de, #0x0008
	push	de
	call	_delay
	pop	hl
;sprite_run.c:243: }
	jp	00115$
;sprite_run.c:245: void enemymovement(){
;	---------------------------------
; Function enemymovement
; ---------------------------------
_enemymovement::
;sprite_run.c:246: if(distvectA[0] > distvectB[0]){
	ld	hl, #_distvectA
	ld	c, (hl)
	ld	a, (#_distvectB + 0)
	sub	a, c
	jr	NC, 00102$
;sprite_run.c:247: enemyAttack = 1;
	ld	hl, #_enemyAttack
	ld	(hl), #0x01
	jr	00103$
00102$:
;sprite_run.c:250: enemyAttack = 0;
	ld	hl, #_enemyAttack
	ld	(hl), #0x00
00103$:
;sprite_run.c:252: if (enemyAttack = 1){
	ld	hl, #_enemyAttack
	ld	(hl), #0x01
;sprite_run.c:253: if(enemyspawn0[0] < towerAlocation[0]){
	ld	hl, #_enemyspawn0
	ld	c, (hl)
	ld	hl, #_towerAlocation
	ld	b, (hl)
;sprite_run.c:254: move_sprite(26, enemyspawn0[0], enemyspawn0[1]);
	ld	hl, #_enemyspawn0 + 1
	ld	e, (hl)
;sprite_run.c:253: if(enemyspawn0[0] < towerAlocation[0]){
	ld	a, c
	sub	a, b
	jr	NC, 00105$
;sprite_run.c:254: move_sprite(26, enemyspawn0[0], enemyspawn0[1]);
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 104)
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:255: enemyspawn0[0] += 1; }
	ld	a, (#_enemyspawn0 + 0)
	inc	a
	ld	(#_enemyspawn0),a
	jr	00108$
00105$:
;sprite_run.c:257: move_sprite(26, enemyspawn0[0], enemyspawn0[1]);
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 104)
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:258: enemyspawn0[0] -= 1;
	ld	a, (#_enemyspawn0 + 0)
	dec	a
	ld	(#_enemyspawn0),a
;sprite_run.c:259: delay(50);
	ld	de, #0x0032
	push	de
	call	_delay
	pop	hl
00108$:
;sprite_run.c:262: if (enemyAttack = 1){
	ld	hl, #_enemyAttack
	ld	(hl), #0x01
;sprite_run.c:263: if(enemyspawn0[1] < towerAlocation[1]){
	ld	hl, #(_enemyspawn0 + 1)
	ld	c, (hl)
	ld	hl, #(_towerAlocation + 1)
	ld	b, (hl)
	ld	a, c
	sub	a, b
	jr	NC, 00110$
;sprite_run.c:264: move_sprite(26, enemyspawn0[0], enemyspawn0[1]);
	ld	hl, #_enemyspawn0
	ld	b, (hl)
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 104)
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;sprite_run.c:265: enemyspawn0[1] += 1;
	ld	a, (#(_enemyspawn0 + 1) + 0)
	inc	a
	ld	(#(_enemyspawn0 + 1)),a
	jr	00113$
00110$:
;sprite_run.c:268: move_sprite(26, enemyspawn0[1], enemyspawn0[1]);
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, c
	ld	hl, #(_shadow_OAM + 104)
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:269: enemyspawn0[1] -= 1;
	ld	a, (#(_enemyspawn0 + 1) + 0)
	dec	a
	ld	(#(_enemyspawn0 + 1)),a
;sprite_run.c:270: delay(50);
	ld	de, #0x0032
	push	de
	call	_delay
	pop	hl
00113$:
;sprite_run.c:283: if (enemyAttack = 0){
	ld	hl, #_enemyAttack
	ld	(hl), #0x00
;sprite_run.c:291: delay(50);
;sprite_run.c:293: }
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__status:
	.db #0x00	; 0
__xinit__mappos:
	.db #0x00	; 0
__xinit__spawn:
	.db #0x00	; 0
__xinit__spawnlocal:
	.db #0x00	; 0
__xinit__distvectA:
__xinit__distvectB:
__xinit__distvectC:
__xinit__enemydistvect0:
__xinit__enemydistvect1:
__xinit__enemydistvect2:
__xinit__enemydistvect3:
__xinit__enemydistvect4:
__xinit__enemydistvect5:
__xinit__enemydistvect6:
__xinit__enemydistvect7:
__xinit__enemydistvect8:
__xinit__enemydistvect9:
__xinit__enemydistvect10:
__xinit__enemyAttack:
	.db #0x00	; 0
	.area _CABS (ABS)
