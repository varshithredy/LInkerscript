# Bare Metal Style Runtime (_start without libc)

##Objective
Demonstrate how a Linux ELF binary starts execution without libc.

##Features
- Custom `_start` entry point
- Manual parsing of `argc`, `argv`
- No `main()`
- No libc
- Direct syscalls (write, exit)
- Custom linker script

##Structure
