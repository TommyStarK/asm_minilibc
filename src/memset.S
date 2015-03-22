[BITS 64]

	global memset
	section .text

memset:
	push rbp
	mov rbp, rsp

	mov rax, rdi
	
loop:
	cmp rdx, 0	
	jle end
	mov byte[rdi], sil
	dec rdx		
	inc rdi
	jmp loop

end:
	mov rsp, rbp
	pop rbp

	ret
