[BITS 64]

	global strspn

	section .text

strspn:

	push rbp
	mov rbp, rsp

	mov rax, 0
	jmp loop
	
loop:
	cmp byte[rdi], 0
	je end

	mov r10, rsi	
	jmp loop_compare

found:

	inc rax
	mov rsi, r10
	inc rdi
	jmp loop
	
loop_compare:

	cmp byte[rsi], 0
	je end
	
	mov r8b, [rdi]	
	mov r9b, [rsi]
	cmp r8b, r9b
	je found

	inc rsi
	jmp loop_compare
end:

	mov rsp, rbp
	pop rbp

	ret
