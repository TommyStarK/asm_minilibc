[BITS 64]

	global memcpy

	section .text

memcpy:

	push rbp
	mov rbp, rsp

	mov rcx, 0
	mov rax, rdi
	
loop:
	cmp rdi, rsi
	je end
	cmp rcx, rdx
	jge end
	mov r8b, [rsi]
	mov [rdi], r8b
	inc rdi
	inc rsi
	inc rcx
	jmp loop
	

end:
	mov rsp, rbp
	pop rbp

	ret