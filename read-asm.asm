section .data
    msg_1 db  "Esreva um numero de 0 a 9",0x0a
    tam_1 equ  $-msg_1
    disnum  db   "O numero é: ",0x0a
    distam  equ $-disnum
    msgper  db  "Voce encontrou um mensagem diferente",0x0a
    lenmsgper   equ   $-msgper    
    input db 0

section .text
    global _start

_start:
    
    ;write 1
    mov eax,4
    mov ebx,1
    mov ecx,msg_1
    mov edx,tam_1
    int 0x80    

    ;read
    mov eax,3
    mov ebx,2
    mov ecx,input
    mov edx,10
    int 0x80    
    
    cmp byte [input], 0x39 
    je msgp
    jz exit    

    ;write msg number
    mov eax,4
    mov ebx,1
    mov ecx,disnum
    mov edx,distam
    int 0x80
    
    ;write number
    mov eax,4
    mov ebx,1
    mov ecx,input
    mov edx,10
    int 0x80
    
    ;testa se o valor é 0    
    ;cmp byte [re],0x48
    ;je _msgp

    ;exit
    mov eax,1
    mov ebx,0
    int 0x80

msgp:

    ;write msgper
    mov eax,4
    mov ebx,1
    mov ecx,msgper
    mov edx,lenmsgper
    int 0x80

    ;exit
    mov eax,1
    mov ebx,0
    int 0x80
    

;section .bss
;    re resb  5
