[BITS 64]

	global strchrnul

	section .text

strchrnul:

	push rbp
	mov rbp, rsp
	
loop:
	cmp [rdi], sil
	je end
	cmp byte[rdi], 0
	je end
	inc rdi
	jmp loop

end:
	mov rax, rdi
	mov rsp, rbp
	pop rbp

	ret
