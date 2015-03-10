[BITS 64]
	;; symboles
	global my_memset

	;; code
	section .text

my_memset:
	push rbp
	mov rbp, rsp

	mov rax, 0
	mov rcx, 0
	mov rbx, rdi
	
next:	cmp rcx, rdx
	je end
	mov [rbx], sil
	;;mov [rbx], rsi
	inc rcx
	inc rbx
	;; inc rbx
	jmp next

end:	mov rax, rdi

	;; Epilogue
	mov rsp, rbp
	pop rbp

	ret