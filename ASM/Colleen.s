section .text
	global start
	extern _printf
	extern _fflush

;Need it to compile
main:
	;in main
	mov rdi, msg
	mov rsi, 10
	mov rdx, 59
	mov rcx, 34
	mov r8, msg
	call _printf
	mov	rdi, 0
	call _fflush
	ret

start:
	push rbp
	mov rbp, rsp
	call main
	mov rsp, rbp
	pop rbp
	mov rax, 0x2000001
	mov rdi, 0
	syscall

section .data
	msg: db "section .text%1$c	global start%1$c	extern _printf%1$c	extern _fflush%1$c%1$c%2$cNeed it to compile%1$cmain:%1$c	;in main%1$c	mov rdi, msg%1$c	mov rsi, 10%1$c	mov rdx, 59%1$c	mov rcx, 34%1$c	mov r8, msg%1$c	call _printf%1$c	mov	rdi, 0%1$c	call _fflush%1$c	ret%1$c%1$cstart:%1$c	push rbp%1$c	mov rbp, rsp%1$c	call main%1$c	mov rsp, rbp%1$c	pop rbp%1$c	mov rax, 0x2000001%1$c	mov rdi, 0%1$c	syscall%1$c%1$csection .data%1$c	msg: db %3$c%4$s%3$c%1$c"
