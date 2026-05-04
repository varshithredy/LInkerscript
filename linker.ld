ENTRY(_start)

/* RPi4 loads kernel at 0x80000 */
SECTIONS
{
    /* Code starts here */
    . = 0x80000;

    /* Text section */
    .text :
    {
        *(.text*)
    }

    /* Read-only data */
    .rodata :
    {
        *(.rodata*)
    }

    /* Data section */
    .data :
    {
        *(.data*)
    }

    /* BSS (zero-initialized) */
    .bss :
    {
        __bss_start = .;
        *(.bss*)
        __bss_end = .;
    }

    /* 🔥 Custom section at fixed address */
    .my_section 0x90000 :
    {
        KEEP(*(.my_section))
    }
}
