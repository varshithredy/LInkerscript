# ARM64 Bare-Metal Kernel with Custom Linker Script

##  Overview

This project demonstrates a minimal **bare-metal kernel for ARM64**, focusing on **custom linker script usage and memory section control**.
It shows how to control program layout in memory and place variables at fixed addresses using compiler attributes and linker scripts.

---

##  Objectives

* Understand bare-metal program flow (`_start → kernel_main`)
* Control memory layout using a custom linker script
* Place variables in custom sections
* Generate a bootable binary (`kernel8.img`)
* Inspect ELF structure using low-level tools

---

##  Project Structure

```
custom_ld_rpi4/
│
├── kernel.c        # Main kernel code
├── startup.s       # Entry point (_start)
├── linker.ld       # Custom linker script
├── Makefile        # Build system
│
├── kernel.o        # Object file (generated)
├── startup.o       # Object file (generated)
├── kernel.elf      # ELF output (generated)
└── kernel8.img     # Final binary image (generated)
```



##  Build Instructions

###  Clean build

```
make clean
```

###  Build project

```
make
```

###  Output files

* `kernel.elf` → ELF with symbols and sections
* `kernel8.img` → Raw binary for booting

---

##  Key Concepts

###  1. Entry Point

Defined in `startup.s`:

```asm
.global _start
_start:
    bl kernel_main
hang:
    b hang
```


###  2. Custom Section in C

```c
uint32_t my_var __attribute__((section(".my_section"))) = 0xDEADBEEF;
```

 Places `my_var` into a custom section



###  3. Linker Script Control

```ld
ENTRY(_start)

SECTIONS
{
    . = 0x40000000;

    .text : { *(.text*) }
    .rodata : { *(.rodata*) }
    .data : { *(.data*) }

    .bss :
    {
        __bss_start = .;
        *(.bss*)
        *(COMMON)
        __bss_end = .;
    }

    .my_section 0x90000 :
    {
        KEEP(*(.my_section))
    }
}
```



##  Verification

###  Check sections

```
aarch64-linux-gnu-readelf -S kernel.elf
```

###  Check symbol

```
aarch64-linux-gnu-nm kernel.elf | grep my_var
```

### Dump section data

```
aarch64-linux-gnu-objdump -s -j .my_section kernel.elf
```

Expected output:

```
ef be ad de
```

 Confirms `0xDEADBEEF` stored correctly (little-endian)



##  Execution Flow

```
Bootloader / QEMU
        ↓
_start (startup.s)
        ↓
kernel_main (kernel.c)
        ↓
Infinite loop
```



##  Important Notes

* No stack initialization (minimal setup)
* No `.bss` zeroing implemented
* No UART or output (silent execution)
* Custom section placed at fixed address (0x90000)



## Learning Outcomes

* Understanding of **compiler → linker → memory mapping**
* Experience with **ELF inspection tools**
* Knowledge of **bare-metal execution flow**
* Hands-on with **custom memory sections**



conclusion

> This project demonstrates how to build a minimal ARM64 bare-metal kernel and control memory layout using a custom linker script. It includes placing variables in fixed memory locations and verifying their placement using ELF analysis tools.

---


