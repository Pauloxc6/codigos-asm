section .text
	global _start

;Inicializa o progrma
_start:
	
;Finaliza o programa
_exit:
	mov eax,1 ; codigo da syscall exit()
	mov ebx,0 ; valor do retorno de exit()
	int 0x80
