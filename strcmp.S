[BITS 64]

	global my_strcmp
	section .text

my_strcmp:

	push rbp
	mov rbp, rsp
	mov rax, 0
	
cmp:
	cmp rdi, rsi
	je match
	jmp mismatch
	
match:
	cmp byte[rdi], 0
	je end
	inc rdi
	inc rsi
	jmp cmp
	
mismatch:
	mov r8b, [rdi]
	mov r9b, [rsi]
	sub r8b, r9b
	movsx rax, r8b

end:
	mov rsp, rbp
	pop rbp

	ret


	