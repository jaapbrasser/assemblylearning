    .section    __TEXT,__text,regular,pure_instructions
    .globl      _start
    .align      2

_start:
    // write(1, message, 14)
    // x0 = file descriptor (1 = stdout)
    // x1 = pointer to our message
    // x2 = length of the message (14 bytes for "Hello, World!\n")
    mov     x0, 1
    adrp    x1, message
    add     x1, x1, :lo12:message
    mov     x2, 14
    bl      _write

    // exit(0)
    mov     x0, 0
    bl      _exit

    // (Normally, the linker sets _start as our entry point.)
    
    .section    __TEXT,__cstring,cstring_literals
message:
    .asciz "Hello, World!\n"
