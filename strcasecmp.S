[BITS 64]

	global my_strcasecmp

my_strcasecmp:
	
	push rbp
	mov rbp, rsp

	mov rcx, 0
	mov rax, 0

loop:

	cmp byte[rdi], 0
	je end

	cmp byte[rsi], 0
	je end

	mov r8b, [rdi]
	mov r9b, [rsi]

	jmp compare_str1_minalpha_1

compare_str1_minalpha_1:	

	cmp r8b, 97
	jge compare_str1_minalpha_2
	jmp compare_str2_minalpha_1

compare_str1_minalpha_2:

	cmp r8b, 122
	jle modify_str1
	jmp compare_str2_minalpha_1

modify_str1:
	sub r8b, 32
	jmp compare_str2_minalpha_1

compare_str2_minalpha_1:	
	
	cmp r9b, 97
	jge compare_str2_minalpha_2
	jmp compare_ignore

compare_str2_minalpha_2:

	cmp r9b, 122
	jle modify_str2
	jmp compare_ignore

modify_str2:

	sub r9b, 32
	jmp compare_ignore

compare_ignore:

	cmp r8b, r9b
	je success
	jmp end

success:
	inc rsi
	inc rdi
	jmp loop
end:
	sub r8b, r9b
	movsx rax, r8b
	
	mov rsp, rbp
	pop rbp

	ret
