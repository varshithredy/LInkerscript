.global _start

_start:
    bl kernel_main

hang:
    b hang
