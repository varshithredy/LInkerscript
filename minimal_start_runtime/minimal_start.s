.global _start

_start:
    # argc → rdi
    mov (%rsp), %rdi

    # argv → rsi
    lea 8(%rsp), %rsi

    call my_main

    # exit syscall
    mov %rax, %rdi      # return value → exit code
    mov $60, %rax       # sys_exit
    syscall
