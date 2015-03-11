[BITS 64]

	global my_strcspn

	section .text

my_strcspn:

	push rbp
	mov rbp, rsp

	mov rax, 0
	jmp loop
	
loop:
	cmp byte[rdi], 0
	je end

	jmp rejected

rejected:

	mov r10, rsi
	
	jmp loop_compare

no_match:

	inc rax
	mov rsi, r10
	inc rdi
	jmp loop	
	
loop_compare:

	cmp byte[rsi], 0
	je no_match
	
	mov r8b, [rdi]	
	mov r9b, [rsi]
	cmp r8b, r9b
	je end

	inc rsi
	jmp loop_compare
end:

	mov rsp, rbp
	pop rbp

	ret
