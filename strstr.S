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

	je test
	inc rdi
	jmp find

test:
	mov r10, rdi
	mov r11, rsi

	mov r8b, [rdi]
	jmp end
