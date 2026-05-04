in startup.s, I define the program entry _start and control the execution flow by branching to kernel_main.
In the linker script, I define the memory layout and create a custom section .my_section at a fixed address 0x90000.
In kernel.c, I declare a global variable my_var and place it into this custom section using the section attribute. As a result, the variable with value 0xDEADBEEF is stored at address 0x90000.
