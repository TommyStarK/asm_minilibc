[BITS 64]

	global strpbrk
	section .text

strpbrk:

	push rbp
	mov rbp, rsp
	mov rax, 0

loop:
	mov r9, rsi
	cmp byte[rdi], 0
	je end
	mov r10b, byte[rsi]
	cmp byte[rdi], r10b
	je match
	jmp test_next_char_accept

test_next_char_accept:
	cmp byte[r9], 0
	je next_char_s
	mov r11b, byte[r9]
	cmp byte[rdi], r11b
	je match
	inc r9
	jmp test_next_char_accept

next_char_s:	
	inc rdi
	jmp loop
	
match:
	mov rax, rdi
	
end:
	mov rsp, rbp
	pop rbp

	ret