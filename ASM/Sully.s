%define MACHO_SYSCALL(nb) nb | 0x2000000
%define X 53

section .text
	global start
	extern _dprintf
	extern _snprintf
	extern _fflush

start:
	push rbp
	mov rbp, rsp
	sub rsp, 0x10
	mov BYTE [rel filename + 6], X

	;OPEN
	mov rax, MACHO_SYSCALL(5)
	lea rdi, [rel filename]
	mov rsi, 0x201
	syscall
	mov [rsp], rax

	;PRINT IN FILE
	mov rdi, rax
	lea rsi, [rel msg]
	call _dprintf
	mov rdi, 0
	call _fflush

	;CLOSE
	mov rdi, [rsp]
	mov rax, MACHO_SYSCALL(6)
	syscall

	;EXEC

	;EXIT
	mov rsp, rbp
	pop rbp
	mov rdi, 0
	mov rax, MACHO_SYSCALL(1)
	syscall

section .data
	msg: db "Hello world", 10, 0
	filename: db "Sully_X.s", 0
