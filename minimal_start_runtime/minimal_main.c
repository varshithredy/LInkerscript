typedef long ssize_t;

// syscall: write
ssize_t write(int fd, const void *buf, ssize_t count) {
    ssize_t ret;
    asm volatile (
        "mov $1, %%rax \n"
        "syscall"
        : "=a"(ret)
        : "D"(fd), "S"(buf), "d"(count)
        : "rcx", "r11", "memory"
    );
    return ret;
}

int my_main(int argc, char **argv) {
    const char msg[] = "Custom _start execution!\n";

    write(1, msg, sizeof(msg) - 1);

    return argc; // return argc as exit code
}
