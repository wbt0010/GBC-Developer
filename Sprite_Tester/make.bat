C:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -c -o dia.o dia.c
C:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j  -c -o sprite_run.o sprite_run.c
c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -Wl-yp0x143=0x80 -o gbcsprites.gbc dia.o sprite_run.o

DEL *.lst
DEL *.o
DEL *.map
DEL *.sym