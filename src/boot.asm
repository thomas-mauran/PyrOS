bits 16
org 0x7c00


%include "print.asm"

main:
    jmp main

times 510-($-$$) db 0
    db 0x55, 0xAA