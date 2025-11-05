#CARACOLJS
# Kernel Exploit - Escalacao de Privilegios via kmod

**Target**: Kernel 6.8.0-86-generic #87-Ubuntu SMP PREEMPT_DYNAMIC

## Estrutura

- `shellcode.asm` - Shellcode que chama kmod_exec e prepara bash
- `ropl_chain.c` - ROP chain com gadgets reais (32 bytes: 4 gadgets × 8 bytes)
- `exploit_kmod.c` - Exploit principal (escala e entrega bash)

## Como Funciona

1. **ROP Chain**: Usa gadgets reais do kernel para preparar ambiente
2. **Shellcode**: Chama `kmod_exec` no endereco `0x4c00000` (kernel)
3. **Bash**: Prepara argumentos para executar /bin/bash

## Compilacao

```bash
make clean && make
```

## Aviso

- Endereco `0x4c00000` (kmod_exec) precisa ser ajustado para o kernel target
- Offset `0x3f8` na ROP chain precisa apontar para o shellcode real
- Este exploit escala privilegios e entrega um shell bash valido como root

**Aviso**: Apenas para testes autorizados e bug bounty.

