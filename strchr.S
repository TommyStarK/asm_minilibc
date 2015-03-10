[BITS 64]

	;; déclaration des symboles
	global my_strchr

	;; code
	section .text

my_strchr:

	push rbp
	mov rbp, rsp

	mov rax, 0
	
loop:
	cmp [rdi], sil
	je found
	cmp byte[rdi], 0
	je end
	inc rdi
	jmp loop
found:	
	mov rax, rdi 

end:
	mov rsp, rbp
	pop rbp

	ret