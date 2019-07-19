%define MACHO_SYSCALL(nb) nb | 0x2000000
%define i 5
%ifndef
	%define X i
%endif

section .text
	global start
	extern _dprintf
	extern _fflush
	extern _system

start:
	push rbp
	mov rbp, rsp
	sub rsp, 0x18
	mov BYTE [rel filename + 6], X + 0x30

	;OPEN
	mov rax, MACHO_SYSCALL(5)
	lea rdi, [rel filename]
	mov rsi, 0x201
	syscall
	mov [rsp + 0x8], rax

	;PRINT IN FILE
	mov rdi, rax
	lea rsi, [rel msg]
	mov rdx, 0x25
	mov rcx, 0xa
	mov r8, 0x22
	mov r9, msg
	mov BYTE [rsp], X + 0x30
	call _dprintf
	mov rdi, 0
	call _fflush

	;CLOSE
	mov rdi, [rsp + 0x8]
	mov rax, MACHO_SYSCALL(6)
	syscall

	;SYSTEM
	mov BYTE [rel nasm + 22], X + 0x30
	mov BYTE [rel nasm + 77], X + 0x30
	mov BYTE [rel nasm + 85], X + 0x30
	lea	rdi, [rel nasm]
	call _system

	;EXEC
	mov rdi, X
	cmp rdi, '0' - 0x30
	jle exit_error
	mov BYTE [rel exec + 8], X + 0x30
	lea rdi, [rel exec]
	call _system

	;EXIT
exit:
	mov rsp, rbp
	pop rbp
	mov rdi, 0
	mov rax, MACHO_SYSCALL(1)
	syscall

exit_error:
	mov rsp, rbp
	pop rbp
	mov rdi, 1
	mov rax, MACHO_SYSCALL(1)
	syscall

section .data
	msg: db "%1$cdefine MACHO_SYSCALL(nb) nb | 0x2000000%2$c%1$cdefine i %5$d%2$c%1$cdefine X%2$c%2$csection .text%2$c	global start%2$c	extern _dprintf%2$c	extern _fflush%2$c	extern	_system%2$c%2$cstart:%2$c	push rbp%2$c	mov rbp, rsp%2$c	sub rsp, 0x10%2$cmov BYTE [rel filename + 6], i%2$c%2$c	;OPEN%2$c	mov rax, MACHO_SYSCALL(5)%2$c	lea rdi, [rel filename]%2$c	mov rsi, 0x201%2$c	syscall%2$c	mov [rsp], rax%2$c%2$c	;PRINT IN FILE%2$c	mov rdi, rax%2$c	lea rsi, [rel msg]%2$c	mov rdx, 0x25%2$c	mov rcx, 0xa%2$c	mov r8, 0x22%2$c	mov r9, msg%2$c	call _dprintf%2$c	mov rdi, 0%2$c	call _fflush%2$c%2$c	;CLOSE%2$c	mov rdi, [rsp]%2$c	mov rax, MACHO_SYSCALL(6)%2$c	syscall%2$c%2$c	;SYSTEM%2$c	mov BYTE [rel nasm + 22], i%2$c	mov BYTE [rel nasm + 77], i%2$c	mov BYTE [rel nasm + 85], i%2$c	lea rdi, [rel nasm]%2$c	call _system%2$c%2$c	mov rsp, rbp%2$c	pop rbp%2$c	mov rdi, 0%2$c	mov rax, MACHO_SYSCALL(1)%2$c	syscall%2$c%2$csection .data%2$c	msg: db %3$c%4$s%3$c, 0%2$c	filename: db %3$cSully_X.s%3$c, 0%2$c	nasm: db %3$cnasm -f macho64 Sully_5.s && ld -macosx_version_min 10.7.0 -lSystem -o Sully_X Sully_X.o%3$c, 0", 0
	filename: db "Sully_X.s", 0
	nasm: db "nasm -f macho64 Sully_X.s && ld -macosx_version_min 10.7.0 -lSystem -o Sully_X Sully_X.o", 0
	exec: db "./Sully_X", 0
