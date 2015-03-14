[BITS 64]
	global memset

	section .text

memset:
	push rbp
	mov rbp, rsp

	mov rax, 0
	mov rcx, 0
	mov rbx, rdi
	
next:	cmp rcx, rdx
	jge end
	mov [rbx], sil
	inc rcx
	inc rbx
	jmp next

end:	mov rax, rdi

	mov rsp, rbp
	pop rbp

	ret