%define MACHO_SYSCALL(nb) nb | 0x2000000
%define my_msg msg
%macro print 0
	sub rsp, 0x10
	mov rax, MACHO_SYSCALL(5)
	lea rdi, [rel filename]
	mov rsi, 0x201
	syscall
	jc end
	mov rdi, rax
	lea rsi, [rel msg]
	mov [rsp], rax
	mov rdx, 10
	mov rcx, 37
	mov r8, 34
	lea r9, [rel msg]
	call _dprintf
	mov rdi, 0
	call _fflush
	mov rax, MACHO_SYSCALL(6)
	mov rdi, [rsp]
	syscall
end:
	add rsp, 0x10
	mov rax, MACHO_SYSCALL(1)
	mov rdi, 0
	syscall
%endmacro

section .text
	global start
	extern _dprintf
	extern _fflush

;My comment
start:
	and rsp, 0xfffffffffffffff0
	print

section .data
	msg: db "%2$cdefine MACHO_SYSCALL(nb) nb | 0x2000000%1$c%2$cdefine my_msg msg%1$c%2$cmacro print 0%1$c	sub rsp, 0x10%1$c	mov rax, MACHO_SYSCALL(5)%1$c	lea rdi, [rel filename]%1$c	mov rsi, 0x201%1$c	syscall%1$c	jc end%1$c	mov rdi, rax%1$c	lea rsi, [rel msg]%1$c	mov [rsp], rax%1$c	mov rdx, 10%1$c	mov rcx, 37%1$c	mov r8, 34%1$c	lea r9, [rel msg]%1$c	call _dprintf%1$c	mov rdi, 0%1$c	call _fflush%1$c	mov rax, MACHO_SYSCALL(6)%1$c	mov rdi, [rsp]%1$c	syscall%1$cend:%1$c	add rsp, 0x10%1$c	mov rax, MACHO_SYSCALL(1)%1$c	mov rdi, 0%1$c	syscall%1$c%2$cendmacro%1$c%1$csection .text%1$c	global start%1$c	extern _dprintf%1$c	extern _fflush%1$c%1$c;My comment%1$cstart:%1$c	and rsp, 0xfffffffffffffff0%1$c	print%1$c%1$csection .data%1$c	msg: db %3$c%4$s%3$c, 0%1$c	filename: db %3$cGrace_kid.s%3$c, 0%1$c", 0
	filename: db "Grace_kid.s", 0
