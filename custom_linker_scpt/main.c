#include <stdio.h>

int g_init = 10;      // .data
int g_uninit;         // .bss

void func(void)       // .text
{
    //printf("Inside func\n");
    g_uninit=g_init;
}

int main(void)
{
    func();
    return 0;
}
