# Minimal Runtime without libc

## Overview
This project demonstrates how a Linux ELF binary executes without libc using a custom `_start` entry point.

## Features
- Custom `_start` entry point
- Manual parsing of argc, argv from stack
- Direct system calls (no libc)
- Custom linker script

## Concepts Covered
- ELF entry point handling
- Process stack layout
- Syscall interface
- Bare-metal style runtime

## Build
make

## Run
./app
