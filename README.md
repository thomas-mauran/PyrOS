# PyrOS
PyrOS is a small operating system project for learning about kernel development.

### Goals
- [ ] Bootloader
- [ ] Printing to screen
- [ ] Interrupts
- [ ] Keyboard input
- [ ] Memory management
- [ ] User mode
- [ ] Filesystem
- [ ] Multitasking
- [ ] Syscalls
- [ ] Shell
- [ ] neofetch like
- [ ] ls
- [ ] cd
- [ ] mkdir
- [ ] rm


### Requirements
- [QEMU](https://www.qemu.org/)
- [NASM](https://www.nasm.us/)
- [GCC](https://gcc.gnu.org/)
- [GNU Make](https://www.gnu.org/software/make/)

### How to run

```
make
qemu-system-i386 -fda build/main_floppy.img 
```

