.global _start

.section .text

_start:
    /* write(1, msg, len) */
    mov $1, %rax        /* syscall: write */
    mov $1, %rdi        /* fd = stdout */
    lea msg(%rip), %rsi /* buffer */
    mov $13, %rdx       /* length */
    syscall

    /* exit(0) */
    mov $60, %rax
    xor %rdi, %rdi
    syscall

.section .data
msg:
    .ascii "Hello World\n"
