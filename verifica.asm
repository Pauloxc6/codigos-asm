; ssize_t write(int fd, const void *buf, size_t count)
section .data
	input db 0
	input_prompt db "Digite um numero: ",0

section .text
	global _start


;inicia o programa
_start:

	;imprime a prompt da input
	mov eax,4
	mov ebx,1 ; fd
	mov ecx,input_prompt ; *buf
	mov edx,20 ; count
	int 0x80


	;le a entrada do usuario
	mov eax,3
	mov ebx,0
	mov ecx,input
	mov ebx,1
	int 0x80

	;testa se valor 0 foi digitado
	cmp byte [input], 48
	je _exit

	;retorna para o inicio do loop
	jmp _start

;finaliza o programa
_exit:
	mov eax,1
	xor ebx,ebx
	int 0x80
