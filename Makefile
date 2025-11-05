CC=gcc
NASM=nasm
CFLAGS=-O2 -fno-exceptions -g -Wall -m64
LDFLAGS=-static

all: exploit_kmod

exploit_kmod: exploit_kmod.o rop_chain.o shellcode.o
	$(CC) $(LDFLAGS) -o $@ $^

exploit_kmod.o: exploit_kmod.c
	$(CC) -c $(CFLAGS) exploit_kmod.c

rop_chain.o: rop_chain.c
	$(CC) -c $(CFLAGS) rop_chain.c

shellcode.o: shellcode.asm
	$(NASM) -felf64 -o $@ $^

clean:
	rm -f *.o exploit_kmod

.PHONY: all clean

