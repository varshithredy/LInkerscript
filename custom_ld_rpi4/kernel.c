#include <stdint.h>


uint32_t my_var __attribute__((section(".my_section"))) = 0xDEADBEEF;

void kernel_main(void)
{
    while (1)
    {
        
    }
}
