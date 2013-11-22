; Just messing around in nasm 64bit 
 
global _start     ;entry point for ld
 
section .text 
_start:
 
    ; sys_write(stdout, message, length)
 
    mov    rax, 1        ; sys_write
    mov    rdi, 1        ; stdout
    mov    rsi, message    ; message address
	mov	   rsi, messagetwo
    mov    rdx, length    ; message string length
	mov    rdx, lengthtwo
    syscall
	
 ;still trying to understand this shit below -___-
    ; sys_exit(return_code)
 
    mov    rax, 60        ; sys_exit
    mov    rdi, 0        ; return 0 (success)
    syscall
	
 ; this stuff is self-explanatory
section .data
    message: db 'Hello, world test!',0x0A    ; message and newline
	messagetwo: db 'BLAH', 0x0B
    length:    equ    $-message        ; NASM definition pseudo-instruction
    lengthtwo: equ    $-messagetwo