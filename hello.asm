; hello.asm
section .data
    msg db "Hello, World!", 0xA  ; The string with a newline
    len equ $ - msg              ; Calculate length of the string

section .text
    global _start

_start:
    ; write(int fd, const void *buf, size_t count)
    mov rax, 0x2000004   ; syscall: write (0x2000004 = 4 + 0x2000000)
    mov rdi, 1           ; file descriptor: stdout (1)
    lea rsi, [rel msg]   ; pointer to the message
    mov rdx, len         ; message length
    syscall

    ; exit(int status)
    mov rax, 0x2000001   ; syscall: exit (0x2000001 = 1 + 0x2000000)
    xor rdi, rdi         ; status 0
    syscall
