;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module sprite_run
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _special
	.globl _keypress
	.globl _main
	.globl _performantdelay
	.globl _definevar
	.globl _set_sprite_palette
	.globl _set_bkg_palette
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _waitpadup
	.globl _joypad
	.globl _delay
	.globl _spawnlocal
	.globl _spawn
	.globl _mappos
	.globl _status
	.globl _enemyspawn0
	.globl _towerClocation
	.globl _towerBlocation
	.globl _towerAlocation
	.globl _keydown
	.globl _specSel
	.globl _selectorlocation
	.globl _crosshairlocation
	.globl _outofthefuckingway
	.globl _spritepalette
	.globl _backgpalette
	.globl _selector
	.globl _crosshair
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
_specSel::
	.ds 1
_keydown::
	.ds 1
_towerAlocation::
	.ds 2
_towerBlocation::
	.ds 2
_towerClocation::
	.ds 2
_enemyspawn0::
	.ds 2
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
;Variable_pckg.c:28: void definevar() {
;	---------------------------------
; Function definevar
; ---------------------------------
_definevar::
;Variable_pckg.c:30: towerAlocation[0] = 96;
	ld	hl, #_towerAlocation
	ld	(hl), #0x60
;Variable_pckg.c:31: towerAlocation[1] = 148;
	ld	hl, #(_towerAlocation + 1)
	ld	(hl), #0x94
;Variable_pckg.c:34: towerBlocation[0] = 40;
	ld	hl, #_towerBlocation
	ld	(hl), #0x28
;Variable_pckg.c:35: towerBlocation[1] = 88;
	ld	hl, #(_towerBlocation + 1)
	ld	(hl), #0x58
;Variable_pckg.c:38: towerClocation[0] = 125;
	ld	hl, #_towerClocation
	ld	(hl), #0x7d
;Variable_pckg.c:39: towerClocation[1] = 72;
	ld	hl, #(_towerClocation + 1)
	ld	(hl), #0x48
;Variable_pckg.c:42: selectorlocation[0] = towerAlocation[0];
	ld	bc, #_selectorlocation+0
	ld	a, (#_towerAlocation + 0)
	ld	(bc), a
;Variable_pckg.c:43: selectorlocation[1] = towerAlocation[1];
	inc	bc
	ld	a, (#(_towerAlocation + 1) + 0)
	ld	(bc), a
;Variable_pckg.c:44: crosshairlocation[0] = 80;
	ld	hl, #_crosshairlocation
	ld	(hl), #0x50
;Variable_pckg.c:45: crosshairlocation[1] = 72;
	ld	hl, #(_crosshairlocation + 1)
	ld	(hl), #0x48
;Variable_pckg.c:48: enemyspawn0[0] = 60;
	ld	bc, #_enemyspawn0+0
	ld	a, #0x3c
	ld	(bc), a
;Variable_pckg.c:49: enemyspawn0[1] = 0;
	inc	bc
	xor	a, a
	ld	(bc), a
;Variable_pckg.c:51: }
	ret
;sprite_run.c:81: void performantdelay(UINT8 numloops){
;	---------------------------------
; Function performantdelay
; ---------------------------------
_performantdelay::
;sprite_run.c:83: for(i = 0; i < numloops; i++){
	ld	c, #0x00
00103$:
	ld	a, c
	ldhl	sp,	#2
	sub	a, (hl)
	ret	NC
;sprite_run.c:84: wait_vbl_done();
	call	_wait_vbl_done
;sprite_run.c:83: for(i = 0; i < numloops; i++){
	inc	c
;sprite_run.c:86: }
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
	.dw #0x044e
	.dw #0x11a1
	.dw #0x2fdf
	.dw #0x7fff
	.dw #0x1421
	.dw #0x4063
	.dw #0x7ce7
;sprite_run.c:88: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;sprite_run.c:96: definevar();
	call	_definevar
;sprite_run.c:98: set_sprite_data(0, 127, GTP);
	ld	de, #_GTP
	push	de
	ld	hl, #0x7f00
	push	hl
	call	_set_sprite_data
	add	sp, #4
;sprite_run.c:100: set_sprite_palette(0, 8u, &spritepalette[0]);
	ld	de, #_spritepalette
	push	de
	ld	hl, #0x800
	push	hl
	call	_set_sprite_palette
	add	sp, #4
;sprite_run.c:102: set_bkg_palette(0,12u, &backgpalette[0]);
	ld	de, #_backgpalette
	push	de
	ld	hl, #0xc00
	push	hl
	call	_set_bkg_palette
	add	sp, #4
;sprite_run.c:104: set_bkg_data(0,6u, map_v1_1_label);
	ld	de, #_map_v1_1_label
	push	de
	ld	hl, #0x600
	push	hl
	call	_set_bkg_data
	add	sp, #4
;sprite_run.c:106: VBK_REG = 1;
	ld	a, #0x01
	ldh	(_VBK_REG + 0), a
;sprite_run.c:108: set_bkg_tiles(0, 0, Grassland_labelWidth, Grassland_labelHeight, Grassland_labelPLN1);
	ld	de, #_Grassland_labelPLN1
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;sprite_run.c:110: VBK_REG = 0;
	xor	a, a
	ldh	(_VBK_REG + 0), a
;sprite_run.c:112: set_bkg_tiles(0, 0, Grassland_labelWidth, Grassland_labelHeight, Grassland_labelPLN0);
	ld	de, #_Grassland_labelPLN0
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;sprite_run.c:114: set_bkg_palette(0,1,&backgpalette[0]);
	ld	de, #_backgpalette
	push	de
	xor	a, a
	inc	a
	push	af
	call	_set_bkg_palette
	add	sp, #4
;C:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x0f
;C:/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 3)
	ld	(hl), #0x01
;sprite_run.c:128: move_sprite(0, towerAlocation[0], towerAlocation[1]);
	ld	hl, #(_towerAlocation + 1)
	ld	b, (hl)
	ld	hl, #_towerAlocation
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;C:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x0e
;C:/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 7)
	ld	(hl), #0x01
;C:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x30
;C:/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 11)
	ld	(hl), #0x01
;C:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
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
;C:/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 107)
	ld	(hl), #0x00
;sprite_run.c:169: move_sprite(9, towerAlocation[0], towerAlocation[1]);
	ld	hl, #(_towerAlocation + 1)
	ld	b, (hl)
	ld	hl, #_towerAlocation
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 36)
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:171: move_sprite(7, towerAlocation[0] - 8, towerAlocation[1]);
	ld	hl, #(_towerAlocation + 1)
	ld	b, (hl)
	ld	a, (#_towerAlocation + 0)
	add	a, #0xf8
	ld	c, a
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 28)
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:173: move_sprite(8, towerAlocation[0], towerAlocation[1] - 8);
	ld	a, (#(_towerAlocation + 1) + 0)
	add	a, #0xf8
	ld	b, a
	ld	hl, #_towerAlocation
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 32)
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:175: move_sprite(6, towerAlocation[0] - 8, towerAlocation[1] - 8);
	ld	a, (#(_towerAlocation + 1) + 0)
	add	a, #0xf8
	ld	b, a
	ld	a, (#_towerAlocation + 0)
	add	a, #0xf8
	ld	c, a
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 24)
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:177: move_sprite(5, towerAlocation[0], towerAlocation[1] - 16);
	ld	a, (#(_towerAlocation + 1) + 0)
	add	a, #0xf0
	ld	b, a
	ld	hl, #_towerAlocation
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 20)
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:179: move_sprite(3, towerAlocation[0] - 8, towerAlocation[1] - 16);
	ld	a, (#(_towerAlocation + 1) + 0)
	add	a, #0xf0
	ld	b, a
	ld	a, (#_towerAlocation + 0)
	add	a, #0xf8
	ld	c, a
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 12)
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:181: move_sprite(4, towerAlocation[0], towerAlocation[1] - 24);
	ld	a, (#(_towerAlocation + 1) + 0)
	add	a, #0xe8
	ld	b, a
	ld	hl, #_towerAlocation
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 16)
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:183: move_sprite(2, towerAlocation[0] - 8, towerAlocation[1] - 24);
	ld	a, (#(_towerAlocation + 1) + 0)
	add	a, #0xe8
	ld	b, a
	ld	a, (#_towerAlocation + 0)
	add	a, #0xf8
	ld	c, a
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 8)
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:186: move_sprite(17, towerBlocation[0], towerBlocation[1]);
	ld	hl, #(_towerBlocation + 1)
	ld	b, (hl)
	ld	hl, #_towerBlocation
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 68)
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:188: move_sprite(15, towerBlocation[0] - 8, towerBlocation[1]);
	ld	hl, #(_towerBlocation + 1)
	ld	b, (hl)
	ld	a, (#_towerBlocation + 0)
	add	a, #0xf8
	ld	c, a
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 60)
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:190: move_sprite(16, towerBlocation[0], towerBlocation[1] - 8);
	ld	a, (#(_towerBlocation + 1) + 0)
	add	a, #0xf8
	ld	b, a
	ld	hl, #_towerBlocation
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 64)
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:192: move_sprite(14, towerBlocation[0] - 8, towerBlocation[1] - 8);
	ld	a, (#(_towerBlocation + 1) + 0)
	add	a, #0xf8
	ld	b, a
	ld	a, (#_towerBlocation + 0)
	add	a, #0xf8
	ld	c, a
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 56)
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:194: move_sprite(13, towerBlocation[0], towerBlocation[1] - 16);
	ld	a, (#(_towerBlocation + 1) + 0)
	add	a, #0xf0
	ld	b, a
	ld	hl, #_towerBlocation
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 52)
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:196: move_sprite(11, towerBlocation[0] - 8, towerBlocation[1] - 16);
	ld	a, (#(_towerBlocation + 1) + 0)
	add	a, #0xf0
	ld	b, a
	ld	a, (#_towerBlocation + 0)
	add	a, #0xf8
	ld	c, a
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 44)
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:198: move_sprite(12, towerBlocation[0], towerBlocation[1] - 24);
	ld	a, (#(_towerBlocation + 1) + 0)
	add	a, #0xe8
	ld	b, a
	ld	hl, #_towerBlocation
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 48)
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:200: move_sprite(10, towerBlocation[0] - 8, towerBlocation[1] - 24);
	ld	a, (#(_towerBlocation + 1) + 0)
	add	a, #0xe8
	ld	b, a
	ld	a, (#_towerBlocation + 0)
	add	a, #0xf8
	ld	c, a
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 40)
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:204: move_sprite(25, towerClocation[0], towerClocation[1]);
	ld	hl, #(_towerClocation + 1)
	ld	b, (hl)
	ld	hl, #_towerClocation
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 100)
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:206: move_sprite(23, towerClocation[0] - 8, towerClocation[1]);
	ld	hl, #(_towerClocation + 1)
	ld	b, (hl)
	ld	a, (#_towerClocation + 0)
	add	a, #0xf8
	ld	c, a
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 92)
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:208: move_sprite(24, towerClocation[0], towerClocation[1] - 8);
	ld	a, (#(_towerClocation + 1) + 0)
	add	a, #0xf8
	ld	b, a
	ld	hl, #_towerClocation
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 96)
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:210: move_sprite(22, towerClocation[0] - 8, towerClocation[1] - 8);
	ld	a, (#(_towerClocation + 1) + 0)
	add	a, #0xf8
	ld	b, a
	ld	a, (#_towerClocation + 0)
	add	a, #0xf8
	ld	c, a
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 88)
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:212: move_sprite(21, towerClocation[0], towerClocation[1] - 16);
	ld	a, (#(_towerClocation + 1) + 0)
	add	a, #0xf0
	ld	b, a
	ld	hl, #_towerClocation
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 84)
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:214: move_sprite(19, towerClocation[0] - 8, towerClocation[1] - 16);
	ld	a, (#(_towerClocation + 1) + 0)
	add	a, #0xf0
	ld	b, a
	ld	a, (#_towerClocation + 0)
	add	a, #0xf8
	ld	c, a
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 76)
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:216: move_sprite(20, towerClocation[0], towerClocation[1] - 24);
	ld	a, (#(_towerClocation + 1) + 0)
	add	a, #0xe8
	ld	b, a
	ld	hl, #_towerClocation
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 80)
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:218: move_sprite(18, towerClocation[0] - 8, towerClocation[1] - 24);
	ld	a, (#(_towerClocation + 1) + 0)
	add	a, #0xe8
	ld	b, a
	ld	a, (#_towerClocation + 0)
	add	a, #0xf8
	ld	c, a
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 72)
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:220: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;sprite_run.c:221: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;sprite_run.c:222: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;sprite_run.c:224: while (1){
00102$:
;sprite_run.c:226: selector();
	call	_selector
;sprite_run.c:227: crosshair();
	call	_crosshair
;sprite_run.c:228: status = 0;
	ld	hl, #_status
	ld	(hl), #0x00
;sprite_run.c:229: move_sprite(0, selectorlocation[0], selectorlocation[1]);
	ld	hl, #_selectorlocation + 1
	ld	b, (hl)
	ld	hl, #_selectorlocation
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:230: move_sprite(1, outofthefuckingway[0], outofthefuckingway[1]);
	ld	hl, #_outofthefuckingway + 1
	ld	b, (hl)
	ld	hl, #_outofthefuckingway
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:230: move_sprite(1, outofthefuckingway[0], outofthefuckingway[1]);
;sprite_run.c:232: } 
	jr	00102$
;sprite_run.c:234: void selector(){
;	---------------------------------
; Function selector
; ---------------------------------
_selector::
;sprite_run.c:235: if(status == 0){
	ld	a, (#_status)
	or	a, a
	ret	NZ
;sprite_run.c:236: switch(joypad()){
	call	_joypad
	ld	a, e
	cp	a, #0x01
	jr	Z, 00103$
	cp	a, #0x02
	jr	Z, 00102$
	sub	a, #0x08
	ret	NZ
;sprite_run.c:238: selectorlocation[0] = towerAlocation[0];
	ld	bc, #_selectorlocation+0
	ld	de, #_towerAlocation+0
	ld	a, (de)
	ld	(bc), a
;sprite_run.c:239: selectorlocation[1] = towerAlocation[1];
	inc	bc
	inc	de
	ld	a, (de)
	ld	(bc), a
;sprite_run.c:240: mappos = 0;
	ld	hl, #_mappos
	ld	(hl), #0x00
;sprite_run.c:241: break;
	ret
;sprite_run.c:243: case J_LEFT:
00102$:
;sprite_run.c:244: selectorlocation[0] = towerBlocation[0];
	ld	bc, #_selectorlocation+0
	ld	de, #_towerBlocation+0
	ld	a, (de)
	ld	(bc), a
;sprite_run.c:245: selectorlocation[1] = towerBlocation[1];
	inc	bc
	inc	de
	ld	a, (de)
	ld	(bc), a
;sprite_run.c:246: mappos = 1;
	ld	hl, #_mappos
	ld	(hl), #0x01
;sprite_run.c:247: break;
	ret
;sprite_run.c:249: case J_RIGHT:
00103$:
;sprite_run.c:250: selectorlocation[0] = towerClocation[0];
	ld	bc, #_selectorlocation+0
	ld	de, #_towerClocation+0
	ld	a, (de)
	ld	(bc), a
;sprite_run.c:251: selectorlocation[1] = towerClocation[1];
	inc	bc
	inc	de
	ld	a, (de)
	ld	(bc), a
;sprite_run.c:252: mappos = 2;
	ld	hl, #_mappos
	ld	(hl), #0x02
;sprite_run.c:254: }
;sprite_run.c:257: }
	ret
;sprite_run.c:259: void crosshair(){
;	---------------------------------
; Function crosshair
; ---------------------------------
_crosshair::
;sprite_run.c:260: while(joypad() & J_B){
00115$:
	call	_joypad
	bit	5, e
	ret	Z
;sprite_run.c:261: status = 1;
	ld	hl, #_status
	ld	(hl), #0x01
;sprite_run.c:262: move_sprite(0, outofthefuckingway[0], outofthefuckingway[1]);
	ld	hl, #(_outofthefuckingway + 1)
	ld	b, (hl)
	ld	hl, #_outofthefuckingway
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:264: if(joypad() & J_UP && crosshairlocation[1] >= 20){
	call	_joypad
	bit	2, e
	jr	Z, 00102$
	ld	a, (#(_crosshairlocation + 1) + 0)
	cp	a, #0x14
	jr	C, 00102$
;sprite_run.c:265: crosshairlocation[1] = crosshairlocation[1] - 1;
	dec	a
	ld	(#(_crosshairlocation + 1)),a
00102$:
;sprite_run.c:267: if(joypad() & J_DOWN && crosshairlocation[1] <= towerAlocation[1]){
	call	_joypad
	bit	3, e
	jr	Z, 00105$
	ld	hl, #(_crosshairlocation + 1)
	ld	c, (hl)
	ld	a, (#(_towerAlocation + 1) + 0)
	sub	a, c
	jr	C, 00105$
;sprite_run.c:268: crosshairlocation[1] = crosshairlocation[1] + 1;
	inc	c
	ld	hl, #(_crosshairlocation + 1)
	ld	(hl), c
00105$:
;sprite_run.c:270: if(joypad() & J_LEFT && crosshairlocation[0] >= towerBlocation[0]){
	call	_joypad
	bit	1, e
	jr	Z, 00108$
	ld	a, (#_crosshairlocation + 0)
	ld	hl, #_towerBlocation
	ld	c, (hl)
	cp	a, c
	jr	C, 00108$
;sprite_run.c:271: crosshairlocation[0] = crosshairlocation[0] - 1;
	dec	a
	ld	(#_crosshairlocation),a
00108$:
;sprite_run.c:273: if(joypad() & J_RIGHT && crosshairlocation[0] <= towerClocation[0]){
	call	_joypad
	ld	a, e
	rrca
	jr	NC, 00111$
	ld	hl, #_crosshairlocation
	ld	c, (hl)
	ld	a, (#_towerClocation + 0)
	sub	a, c
	jr	C, 00111$
;sprite_run.c:274: crosshairlocation[0] = crosshairlocation[0] + 1;
	inc	c
	ld	hl, #_crosshairlocation
	ld	(hl), c
00111$:
;sprite_run.c:277: if(joypad() & J_A){
	call	_joypad
	bit	4, e
	jr	Z, 00114$
;sprite_run.c:279: move_sprite(26,  crosshairlocation[0], crosshairlocation[1]);
	ld	hl, #(_crosshairlocation + 1)
	ld	b, (hl)
	ld	hl, #_crosshairlocation
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 104)
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;sprite_run.c:279: move_sprite(26,  crosshairlocation[0], crosshairlocation[1]);
00114$:
;sprite_run.c:281: move_sprite(1, crosshairlocation[0], crosshairlocation[1]);
	ld	hl, #(_crosshairlocation + 1)
	ld	c, (hl)
	ld	hl, #_crosshairlocation
	ld	b, (hl)
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;sprite_run.c:282: delay(8);
	ld	de, #0x0008
	push	de
	call	_delay
	pop	hl
;sprite_run.c:284: }
	jp	00115$
;sprite_run.c:287: void keypress(){
;	---------------------------------
; Function keypress
; ---------------------------------
_keypress::
;sprite_run.c:288: if (keydown){
	ld	a, (#_keydown)
	or	a, a
	ret	Z
;sprite_run.c:289: waitpadup();
	call	_waitpadup
;sprite_run.c:290: keydown = 0;
	ld	hl, #_keydown
	ld	(hl), #0x00
;sprite_run.c:292: }
	ret
;sprite_run.c:307: void special(){
;	---------------------------------
; Function special
; ---------------------------------
_special::
;sprite_run.c:309: keypress(); 
	call	_keypress
;sprite_run.c:310: specSel = 1;
	ld	hl, #_specSel
	ld	(hl), #0x01
;sprite_run.c:312: if(joypad() & J_SELECT){
	call	_joypad
	bit	6, e
	jr	Z, 00102$
;sprite_run.c:313: keydown = 1;
	ld	hl, #_keydown
	ld	(hl), #0x01
;sprite_run.c:314: specSel += 1;
	ld	hl, #_specSel
	inc	(hl)
00102$:
;sprite_run.c:319: if (specSel > 3){
	ld	a, #0x03
	ld	hl, #_specSel
	sub	a, (hl)
	ret	NC
;sprite_run.c:320: specSel = 1;
	ld	(hl), #0x01
;sprite_run.c:322: }
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
	.area _CABS (ABS)
