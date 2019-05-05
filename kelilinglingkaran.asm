global main
extern scanf, printf, fflush
 
section .data
    scan db "%f", 0
    print db "%f", 10, 0
      
section .bss
	d resd 1
	luas resq 1
     
section .text

 
main: 
			push d
            push scan
            call scanf
            add esp, 8
			
			finit					;st0
			fldpi 					;st0 jadi π				;2π
			fmul dword[d]			;π * d		
			fstp qword[luas]
			
			push dword[luas+4]		;ngeprint yang belakangnya dulu (4-7)
			push dword[luas]		;ngeprint depannya (0-3)
            push print
            call printf
            add esp, 12

			mov     eax, 0			;return 0
            ret
