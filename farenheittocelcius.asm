global main
extern printf, fflush, scanf
 
section .data
    print db "%.2f", 10, 0
    scan db "%f", 0
    pengali dd 1.8
    penambah dd 32.0
 
segment .bss
    a resq 1
    hasil resq 1
    

section .text
 
main:

    push a
    push scan
    call scanf
    add esp, 8
	
	finit						;st0			st1
    fld 	dword[a]			;26.4		
    fmul 	dword[pengali]		;26.4*1.8
    fld 	dword[penambah]	
    faddp 						;26.4*1.8+32
    fstp 	qword[hasil]
    
     
    push dword[hasil+4]
    push dword[hasil]
    push print
    call printf
    add esp, 12
     
     
    mov eax, 0          ;exit(0)
    ret
