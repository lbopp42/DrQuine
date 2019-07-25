%define MACHO_SYSCALL(nb) nb | 0x2000000
%define i 5
%ifndef X
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
	mov rdx, 777o
	syscall
	mov [rsp + 0x8], rax

	;PRINT IN FILE
	mov rdi, rax
	lea rsi, [rel msg]
	mov rdx, 0x0a
	mov rcx, 0x25
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
	mov BYTE [rel nasm + 31], X + 0x30
	mov BYTE [rel nasm + 86], X + 0x30
	mov BYTE [rel nasm + 94], X + 0x30
	lea	rdi, [rel nasm]
	call _system

	;EXEC
	mov rdi, X
	cmp rdi, 0
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
	msg: db "%2$cdefine MACHO_SYSCALL(nb) nb | 0x2000000%1$c%2$cdefine i %5$c%1$c%2$cifndef X%1$c	%2$cdefine X i%1$c%2$cendif%1$c%1$csection .text%1$c	global start%1$c	extern _dprintf%1$c	extern _fflush%1$c	extern _system%1$c%1$cstart:%1$c	and rsp, 0xfffffffffffffff0%1$c	mov BYTE [rel filename + 6], X + 0x30%1$c%1$c	;OPEN%1$c	mov rax, MACHO_SYSCALL(5)%1$c	lea rdi, [rel filename]%1$c	mov rsi, 0x201%1$c	mov rdx, 777o%1$c	syscall%1$c	mov [rsp + 0x8], rax%1$c%1$c	;PRINT IN FILE%1$c	mov rdi, rax%1$c	lea rsi, [rel msg]%1$c	mov rdx, 0x0a%1$c	mov rcx, 0x25%1$c	mov r8, 0x22%1$c	mov r9, msg%1$c	mov BYTE [rsp], X + 0x30%1$c	call _dprintf%1$c	mov rdi, 0%1$c	call _fflush%1$c%1$c	;CLOSE%1$c	mov rdi, [rsp + 0x8]%1$c	mov rax, MACHO_SYSCALL(6)%1$c	syscall%1$c%1$c	;SYSTEM%1$c	mov BYTE [rel nasm + 31], X + 0x30%1$c	mov BYTE [rel nasm + 86], X + 0x30%1$c	mov BYTE [rel nasm + 94], X + 0x30%1$c	lea	rdi, [rel nasm]%1$c	call _system%1$c%1$c	;EXEC%1$c	mov rdi, X%1$c	cmp rdi, 0%1$c	jle exit_error%1$c	mov BYTE [rel exec + 8], X + 0x30%1$c	lea rdi, [rel exec]%1$c	call _system%1$c%1$c	;EXIT%1$cexit:%1$c	mov rsp, rbp%1$c	pop rbp%1$c	mov rdi, 0%1$c	mov rax, MACHO_SYSCALL(1)%1$c	syscall%1$c%1$cexit_error:%1$c	mov rsp, rbp%1$c	pop rbp%1$c	mov rdi, 1%1$c	mov rax, MACHO_SYSCALL(1)%1$c	syscall%1$c%1$csection .data%1$c	msg: db %3$c%4$s%3$c, 0%1$c	filename: db %3$cSully_X.s%3$c, 0%1$c	nasm: db %3$cnasm -f macho64 -D X=i-1 Sully_X.s && ld -macosx_version_min 10.7.0 -lSystem -o Sully_X Sully_X.o%3$c, 0%1$c	exec: db %3$c./Sully_X%3$c, 0%1$c", 0
	filename: db "Sully_X.s", 0
	nasm: db "nasm -f macho64 -D X=i-1 Sully_X.s && ld -macosx_version_min 10.7.0 -lSystem -o Sully_X Sully_X.o", 0
	exec: db "./Sully_X", 0
