[BITS 64]

	global strncmp

	section .text

strncmp:
	push rbp
	mov rbp, rsp

	mov rax, 0
	mov rcx, rdx
	jmp loop

cmp_ok:	
	inc rdi
	inc rsi
	dec rcx
	
loop:
	cmp rcx, 0
	jle end
	
	mov r10b, byte[rdi]
	mov r11b, byte[rsi]

	cmp r10b, 0
	je end

	cmp r11b, 0
	je end

	cmp r10b, r11b
	je  cmp_ok

	mov r8b, byte[rdi]
	mov r9b, byte[rsi]		
	sub r8b, r9b
	movsx rax, r8b

end:
	mov rsp, rbp
	pop rbp
	ret
