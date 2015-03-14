[BITS 64]

	global strcmp
	section .text

strcmp:

	push rbp
	mov rbp, rsp
	mov rax, 0
	
cmp:
	mov r10b, byte[rdi]
	mov r11b, byte[rsi]
	cmp r10b, 0
	je mismatch
	cmp r11b, 0
	je mismatch
	cmp r10b, r11b
	je match
	jmp mismatch
	
match:
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


	