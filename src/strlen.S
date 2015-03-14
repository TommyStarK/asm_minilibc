[BITS 64]

	global strlen

	section .text

strlen:

	push rbp
	mov rbp, rsp

	
	mov rcx, 0


loop:	cmp byte[rdi], 0
	
	je end
	inc rcx
	inc rdi
	jmp loop
	

end:
	mov rax, rcx

	mov rsp, rbp
	pop rbp

	ret