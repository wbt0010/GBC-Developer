all:
	/opt/gbdk/bin/lcc -Wa-l -Wl-m -Wl-j -c -o map_v1_1.o map_v1_1.c
	/opt/gbdk/bin/lcc -Wa-l -Wl-m -Wl-j -c -o Grassland.o Grassland.c
	/opt/gbdk/bin/lcc -Wa-l -Wl-m -Wl-j -c -o GTP.o GTP.c
	/opt/gbdk/bin/lcc -Wa-l -Wl-m -Wl-j -c -o sprite_run.o sprite_run.c
	/opt/gbdk/bin/lcc -Wa-l -Wl-m -Wl-j -Wl-yc -o gbcsprites.gbc GTP.o map_v1_1.o Grassland.o sprite_run.o
	rm *.lst
	rm *.o
	rm *.map
	rm *.sym