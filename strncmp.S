[BITS 64]

	global my_strncmp

	section .text

my_strncmp:

	push rbp
	mov rbp, rsp

	mov rax, 0
	
loop:
	cmp byte[rdi], 0
	je end
	
	cmp byte[rsi], 0
	je end
			
	cmp rdx, 0
	jle end

	mov r8b, [rdi]
	mov r9b, [rsi]
	cmp r8b, r9b

	je  cmp_ok
	jmp end



cmp_ok:	
	inc rdi
	inc rsi
	dec rdx
	jmp loop

end:
	mov r8b, 0
	mov r9b, 0
	mov r8b, [rdi]
	mov r9b, [rsi]		
	sub r8b, r9b
	movsx rax, r8b

	mov rsp, rbp
	pop rbp

	ret
