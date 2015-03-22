[BITS 64]

	global strrchr

	section .text

strrchr:

	push rbp
	mov rbp, rsp

	mov rax, 0
	
loop:
	cmp [rdi], sil
	je assign
	cmp byte[rdi], 0
	je end
	inc rdi
	jmp loop

assign:
	mov rax, rdi
	cmp byte[rdi], 0
	je end
	inc rdi
	jmp loop

end:
	mov rsp, rbp
	pop rbp

	ret
