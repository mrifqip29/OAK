global main
extern scanf, printf, fflush
 
section .data
    scan db "%lf %lf", 0
    print db "%lf", 10, 0
      
section .bss
	x resq 1
	y resq 1
	z resq 1
     
section .text

main: 
			push x
			push y
            push scan
            call scanf
            add esp, 12

			
			finit					;	st0			st1
			fld	 qword[x]			;	x
			fmul qword[x]			;	x*x
			fld	 qword[y]			;	y			y*y	
			fmul qword[y]			;	y*y			y*y
			faddp			
			fsqrt					;sqrt
			fstp qword[z]
			
			
			push dword[z+4]		;ngeprint yang belakangnya dulu (4-7)
			push dword[z]		;ngeprint depannya (0-3)
            push print
            call printf
            add esp, 12

			mov     eax, 0			;return 0
            ret

