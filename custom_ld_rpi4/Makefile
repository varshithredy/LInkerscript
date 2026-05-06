CC = aarch64-linux-gnu-gcc
LD = aarch64-linux-gnu-ld
OBJCOPY = aarch64-linux-gnu-objcopy

CFLAGS = -ffreestanding -nostdlib -nostartfiles -Wall
LDFLAGS = -T linker.ld

all: kernel8.img

kernel.o: kernel.c
	$(CC) $(CFLAGS) -c kernel.c -o kernel.o

startup.o: startup.s
	$(CC) -c startup.s -o startup.o

kernel.elf: kernel.o startup.o
	$(LD) $(LDFLAGS) startup.o kernel.o -o kernel.elf

kernel8.img: kernel.elf
	$(OBJCOPY) kernel.elf -O binary kernel8.img

clean:
	rm -f *.o *.elf *.img
