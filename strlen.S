[BITS 64]

	;; déclaration des symboles
	global my_strlen

	;; code
	section .text

my_strlen:
	;;prologue
	push rbp
	mov rbp, rsp

	
	mov rcx, 0		;valeur de retour à 0


loop:	cmp byte[rdi], 0	;derefenrecement de mon ptr pour comparé la valeur 
	
	je end			; si cmp equal jmp to end
	inc rcx			; incremente compteur
	inc rdi			; incremente mon ptr
	jmp loop
	

end:
	mov rax, rcx		;mets dans rax mon compteur ! RAX sert à  stocker le retour de fonction

	;; Epilogue
	mov rsp, rbp
	pop rbp

	ret