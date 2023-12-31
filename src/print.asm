cld                 ; sets df to 0 
mov     ax, 0012h   ; Select 640x480 16-color graphics video mode
int 10h             ; here we switch the vidéo mode and we switch to what is in ax
mov si, msg
mov bl, 0xF
mov ah, 0Eh         ; when using the interupt 0x10 (vidéo interupt) we will put in ah the specific video service function to be executed
                    ; in this case 0x0E is used to write a teletype character
mov bh, 0       ; here bh is used to specify the display page so 0 is on the default one

jmp ch_loop


hang:
    jmp hang

msg db 'The one who walks along side flamme', 13, 10, 'Shall one day meet the road of destined death', 13, 10, 0  


ch_loop:
    lodsb           ; lodsb will charge a byte from memory at the current index of the si register (source index), it will also automatically
                    ; increment si to point to the next byte
    or al, al       ; if we encouter a null value, the result will be 0 and the 
    jz done         ; jump if zero, this instruction will jump if the result of the last operation is zero

    cmp al, 10

    int 0x10        ; we send a interupt vidéo signal
    jne next     ; jump if not equal, if not

    mov al, 13
    int 0x10

next: 
    jmp ch_loop

done:
    ret