; ssize_t write(int fd, void, const void *buf, size_t count)

section .data
        msg: db "hello world", 0x0a
        tam: equ $-msg

section .text
        global _start

_start:

        mov edx, tam ; count
        mov ecx, msg ; *buf
        mov ebx, 1 ; fd
        mov eax, 4 ;write
        int 0x80

        ; void _exit(int status)

        mov ebx, 0 ; valor do retorno de exit()
        mov eax, 1 ; codigo da syscall exit()
        int 0x80
