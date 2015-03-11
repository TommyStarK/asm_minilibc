[BITS 64]

	global my_strncmp

	section .text

my_strncmp:

	push rbp
	mov rbp, rsp  ;; prologue

	mov rcx, 0 ;; cnt à 0
	mov rax, 0
	
loop:
	cmp byte[rdi], 0	;; on regarde la fin de str1
	je end			;; si on est à la fin de la chaine str1, on retourne
	
	cmp byte[rsi], 0	;; on regarde la fin de str2
	je end			; si fin de str2 , jump to end
			
	cmp rdx, 0		; on regarde si on a fini de comparer n bytes
	je end			;si fin de n, on jump to end

	mov r8b, [rdi]		; apparement necessaire pour comparer deux octets, je les compare via des regitres 8
	mov r9b, [rsi]
	cmp r8b, r9b		;; on compare src_str[cnt] avec dest_str[cnt]

	je  cmp_ok		 ;; si ils sont egaux on execute cmp_ok
	jmp end			 ;;  si ils ne sont pas egaux on jmp end



cmp_ok:				;si les octets sont egaux on incremente str1[i], str2[i], cnt, on decremente n
	inc rcx
	inc rdi
	inc rsi
	dec rdx
	jmp loop

end:				; a la fin on retourne dans tous les cas str1[n] - str2[n],
	mov r8b, 0		; movsx permet de convertir une valeur de retour codee en unsigned char sur un signed int
	mov r9b, 0
	mov r8b, [rdi]
	mov r9b, [rsi]		
	sub r8b, r9b
	movsx rax, r8b
				; epilogue
	mov rsp, rbp
	pop rbp

	ret
