[BITS 64]
	global memset

	section .text

memset:
	push rbp
	mov rbp, rsp

	mov rax, rdi
	mov r8, rdi
	mov rcx, 0
	
next:
	cmp r8b, 0
	je end
	cmp rcx, rdx
	jge end
	mov r8b, sil
	inc rcx
	inc r8
	jmp next

end:
	mov rsp, rbp
	pop rbp

	ret