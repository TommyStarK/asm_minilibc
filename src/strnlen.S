[BITS 64]

	global strnlen

	section .text

strnlen:

	push rbp
	mov rbp, rsp

	
	mov rcx, 0

loop:
	cmp byte[rdi], 0
	je end
	cmp rsi, 0
	jle end
	
	inc rcx
	inc rdi
	dec rsi
	jmp loop
	

end:
	mov rax, rcx

	mov rsp, rbp
	pop rbp

	ret
