## Custom Linker Script for Memory Control

##  Objective

Demonstrate precise memory control in a firmware-like environment using a custom linker script.
The goal is to manually place different sections of a program (`.text`, `.data`, `.bss`) at fixed memory addresses.



##  Concepts Covered

* Linker script (`SECTIONS`) usage
* Memory mapping in embedded systems
* ELF section structure
* Difference between `.text`, `.data`, and `.bss`



##  Project Structure

```
.
├── main.c        # C program with variables and function
├── linker.ld     # Custom linker script
└── README.md
```



##  Code Explanation

###  main.c

```c
#include <stdio.h>

int g_init = 10;      // Stored in .data (initialized global variable)
int g_uninit;         // Stored in .bss (uninitialized global variable)

void func(void)       // Stored in .text (code section)
{
    g_uninit = g_init;
}

int main(void)
{
    func();
    return 0;
}
```



###  linker.ld

```ld
ENTRY(main)

SECTIONS
{
    /* Code section */
    . = 0x10000;
    .text :
    {
        *(.text*)
    }

    /* Initialized data */
    . = 0x20000;
    .data :
    {
        *(.data*)
    }

    /* Uninitialized data */
    . = 0x30000;
    .bss :
    {
        __bss_start = .;
        *(.bss*)
        *(COMMON)
        __bss_end = .;
    }
}
```



##  Build Instructions

### Step 1: Compile

```bash
gcc -c main.c -o main.o
```

## Step 2: Link using custom linker script

```bash
ld -T linker.ld main.o -o output.elf
```



##  Verification

Check section placement using:

```bash
objdump -h output.elf
```

###  Expected Output

```
Idx Name      Size     VMA
 0 .text      xxxx     00010000
 1 .data      xxxx     00020000
 2 .bss       xxxx     00030000
```



##  Key Learnings

###  Section Roles

 Section    Purpose                                      

 `.text`  Contains executable code                     
 `.data`  Stores initialized global/static variables   
 `.bss`   Stores uninitialized global/static variables 


###  Why Custom Linker Script?

* Enables precise memory layout control
* Required in embedded systems (bootloader, RTOS, kernel)
* Helps separate memory regions (e.g., FLASH vs RAM)



###  Important Notes

* `printf()` is avoided because linking is done using `ld` without standard libraries
* This ELF is **not intended to run on Linux** (bare-metal style linking)
* In real systems:

  * `.data` is copied from FLASH to RAM during startup
  * `.bss` is zero-initialized by startup code



##  Future Improvements

* Add startup code (`_start`)
* Initialize `.bss` manually
* Simulate execution using QEMU
* Extend to bootloader + application memory separation



##  Summary

This project demonstrates how a linker script can control memory placement of program sections, which is a fundamental concept in embedded systems and firmware development.


