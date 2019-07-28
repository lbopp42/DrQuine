%define MACHO_SYSCALL(nb) nb | 0x2000000
%define i 5
%ifndef X
	%define X i
%endif

section .text
	global start
	extern _dprintf
	extern _sprintf
	extern _fflush
	extern _system
	extern _malloc
	extern _free

start:
	push rbp
	mov rbp, rsp
	and rsp, 0xfffffffffffffff0
	mov r12, i
	cmp r12, 0
	jle exit_error
	mov rdi, rsp
	lea rsi, [rel filename]
	mov rdx, X
	call _sprintf

	;OPEN
	mov rax, MACHO_SYSCALL(5)
	lea rdi, [rsp]
	mov rsi, 0x201
	mov rdx, 777o
	syscall
	jc exit_error
	mov [rsp + 0x8], rax

	;PRINT IN FILE
	mov rdi, rax
	lea rsi, [rel msg]
	mov rdx, 0x0a
	mov rcx, 0x22
	lea r8, [rel msg]
	mov r9, X
	call _dprintf
	mov rdi, 0
	call _fflush

	;CLOSE
	mov rdi, [rsp + 0x8]
	mov rax, MACHO_SYSCALL(6)
	syscall

	;COMPILE + EXEC
	mov rdi, 256
	call _malloc
	mov r12, rax
	mov rdi, rax
	lea rsi, [rel nasm]
	mov rdx, X
	call _sprintf
	mov	rdi, r12
	call _system
	mov rdi, r12
	call _free

	;EXIT
exit:
	mov rsp, rbp
	pop rbp
	mov rdi, rax
	mov rax, MACHO_SYSCALL(1)
	syscall

exit_error:
	mov rsp, rbp
	pop rbp
	mov rdi, 1
	mov rax, MACHO_SYSCALL(1)
	syscall

section .data
	msg: db "%%define MACHO_SYSCALL(nb) nb | 0x2000000%1$c%%define i %4$d%1$c%%ifndef X%1$c	%%define X i%1$c%%endif%1$c%1$csection .text%1$c	global start%1$c	extern _dprintf%1$c	extern _sprintf%1$c	extern _fflush%1$c	extern _system%1$c	extern _malloc%1$c	extern _free%1$c%1$cstart:%1$c	push rbp%1$c	mov rbp, rsp%1$c	and rsp, 0xfffffffffffffff0%1$c	mov r12, i%1$c	cmp r12, 0%1$c	jle exit_error%1$c	mov rdi, rsp%1$c	lea rsi, [rel filename]%1$c	mov rdx, X%1$c	call _sprintf%1$c%1$c	;OPEN%1$c	mov rax, MACHO_SYSCALL(5)%1$c	lea rdi, [rsp]%1$c	mov rsi, 0x201%1$c	mov rdx, 777o%1$c	syscall%1$c	jc exit_error%1$c	mov [rsp + 0x8], rax%1$c%1$c	;PRINT IN FILE%1$c	mov rdi, rax%1$c	lea rsi, [rel msg]%1$c	mov rdx, 0x0a%1$c	mov rcx, 0x22%1$c	lea r8, [rel msg]%1$c	mov r9, X%1$c	call _dprintf%1$c	mov rdi, 0%1$c	call _fflush%1$c%1$c	;CLOSE%1$c	mov rdi, [rsp + 0x8]%1$c	mov rax, MACHO_SYSCALL(6)%1$c	syscall%1$c%1$c	;COMPILE + EXEC%1$c	mov rdi, 256%1$c	call _malloc%1$c	mov r12, rax%1$c	mov rdi, rax%1$c	lea rsi, [rel nasm]%1$c	mov rdx, X%1$c	call _sprintf%1$c	mov	rdi, r12%1$c	call _system%1$c	mov rdi, r12%1$c	call _free%1$c%1$c	;EXIT%1$cexit:%1$c	mov rsp, rbp%1$c	pop rbp%1$c	mov rdi, rax%1$c	mov rax, MACHO_SYSCALL(1)%1$c	syscall%1$c%1$cexit_error:%1$c	mov rsp, rbp%1$c	pop rbp%1$c	mov rdi, 1%1$c	mov rax, MACHO_SYSCALL(1)%1$c	syscall%1$c%1$csection .data%1$c	msg: db %2$c%3$s%2$c, 0%1$c	filename: db %2$cSully_%%d.s%2$c, 0%1$c	nasm: db %2$cnasm -f macho64 -D X=i-1 Sully_%%1$d.s && ld -macosx_version_min 10.7.0 -lSystem -o Sully_%%1$d Sully_%%1$d.o && rm -f *.o && ./Sully_%%1$d%2$c, 0%1$c", 0
	filename: db "Sully_%d.s", 0
	nasm: db "nasm -f macho64 -D X=i-1 Sully_%1$d.s && ld -macosx_version_min 10.7.0 -lSystem -o Sully_%1$d Sully_%1$d.o && rm -f *.o && ./Sully_%1$d", 0
