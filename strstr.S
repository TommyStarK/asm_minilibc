[BITS 64]

	global my_strstr

	section .text

my_strstr:

	push rbp
	mov rbp, rsp

	mov rax, 0

find:
	cmp byte[rdi], 0
	je end

	mov r8b, [rdi]
	mov r9b, [rsi]

	cmp r8b, r9b

	je test_match
	inc rdi
	jmp find

test_match:
	mov r10, rdi
	mov r11, rsi
	jmp test

test:

	mov r8b, [rdi]
	mov r9b, [rsi]

	cmp r8b, r9b
	je success
	jmp fail

success:
	inc rdi
	inc rsi

	mov r9b, [rsi]
	cmp r9b, 0
	je match
	jmp test

fail:
	mov rdi, r10
	mov rsi, r11
	jmp find

match:
	mov rax, r10
	jmp end
end:
	mov rsp, rbp
	pop rbp

	ret
