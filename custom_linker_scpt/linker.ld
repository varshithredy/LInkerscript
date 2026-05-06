ENTRY(main)

SECTIONS
{
    /* Place .text at 0x10000 */
    . = 0x10000;
    .text :
    {
        *(.text*)
    }

    /* Place .data at 0x20000 */
    . = 0x20000;
    .data :
    {
        *(.data*)
    }

    /* Place .bss at 0x30000 */
    . = 0x30000;
    .bss :
    {
        __bss_start = .;
        *(.bss*)
        *(COMMON)
        __bss_end = .;
    }
}
