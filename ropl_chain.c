/* rop_chain.c – 32 bytes total (4 gadgets × 8‑byte) */
#pragma once
#include <stdint.h>

__attribute__((naked)) void rop_chain()
{
    __asm__(
        /* gadget #1 : mov rax, [rax]   ;  mov rbx, [rbx]           */ 
        "mov     rax, [rax]\n"
        "mov     rbx, [rbx]\n"

        /* gadget #2 : mov rcx, [rcx]   ;  mov rdx, [rdx]           */ 
        "mov     rcx, [rcx]\n"
        "mov     rdx, [rdx]\n"

        /* gadget #3 : push rdi; add rsi, [rsi]; jmp 0x3f8    */
        "push   rdi\n"
        "add    rsi, [rsi]\n"
        "jmp    0x3f8\n"
    );
}
