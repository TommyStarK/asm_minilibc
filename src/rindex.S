[BITS 64]

	global rindex
	extern strlen
	section .text

rindex:

	push rbp
	mov rbp, rsp

	push rdi
	call strlen wrt ..plt
	pop rdi
	mov r8, rdi
	add rdi, rax
	mov rax, 0 

loop:
	cmp rdi, r8
	je end
	cmp [rdi], sil
	je found
	dec rdi
	jmp loop

found:
	mov rax, rdi
	
end:
	mov rsp, rbp
	pop rbp

	ret
	