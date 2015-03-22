[BITS 64]
	global my_memmove:function
	section .text

my_memmove:
	push rbp
	mov rbp, rsp

	xor rcx, rcx

	cmp rdi, rsi
	je end
	jmp reverse_cpy

cpy:
	cmp rcx, rdx	
	je end		
	mov r8b, [rsi + rcx]
	mov [rdi + rcx], r8b
	inc rcx
	jmp cpy

reverse_cpy:
	cmp rdx, 0
	jl end
	mov r8b, [rsi + rdx]
	mov [rdi + rdx], r8b
	dec rdx
	jmp reverse_cpy

end:
	mov rax, rdi

	mov rsp, rbp
	pop rbp
	ret
