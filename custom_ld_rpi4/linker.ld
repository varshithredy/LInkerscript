ENTRY(_start)

/* Memory layout for Raspberry Pi 4 (ARM64) */
SECTIONS
{
    /* Kernel load address */
    . = 0x80000; /*0x40000000 for qemu*/ /*if we are using rpi4 address is 0x80000*/

    /* Code section */
    .text :
    {
        KEEP(*(.text.boot))   /* startup code if separated */
        *(.text*)
    }

    /* Read-only data */
    .rodata :
    {
        *(.rodata*)
    }

    /* Initialized data */
    .data :
    {
        *(.data*)
    }

    /* BSS section (zero-initialized) */
    .bss :
    {
        __bss_start = .;
        *(.bss*)
        *(COMMON)
        __bss_end = .;
    }

    /* Custom section at fixed address */
    .my_section 0x90000 :
    {
        KEEP(*(.my_section))
    }
}
