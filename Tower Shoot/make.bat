C:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -c -o map_v1_1.o map_v1_1.c
C:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -c -o Grassland.o Grassland.c
C:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -c -o GTP.o GTP.c
C:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -c -o sprite_run.o sprite_run.c
c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -Wl-yc-o gbcsprites.gbc GTP.o map_v1_1.o Grassland.o sprite_run.o

DEL *.lst
DEL *.o
DEL *.sym