CC=gcc
NASM=nasm

all: exploit_kmod

exploit_kmod: rop_chain.o shellcode.o
	$(CC) -O2 -static -o $@ $^

rop_chain.o: rop_chain.c
	$(CC) -c -O2 -fno-exceptions -g -Wall -m64 rop_chain.c

shellcode.o: shellcode.asm
	$(NASM) -felf -o $@ $^
