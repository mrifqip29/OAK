global main
extern scanf, printf, fflush
 
section .data
    scanbiasa db "%d", 0
    scansuhu db "%f", 0
    print db "%.1f", 10, 0
      
section .bss
	n resd 4
	t resd 4
	rata resd 4
     
section .text

main: 
			push n
            push scanbiasa
            call scanf
            add esp, 8
            
			mov esi, dword[n]

			finit			;st0	st1
			push dword 0
			fld dword[esp]  ;0
			add esp, 4
			
			cmp esi, 0
			je exit
			ja sum
			
			
sum:
			push t
            push scansuhu
            call scanf
            add esp, 8	
									;	st0			st1
			fld	 dword[t]			;	t1			0
			faddp					;	t1+0			null
			dec esi
			cmp esi, 0
			je hitung
			ja sum
			
hitung:
			fidiv dword[n]
			fstp qword[rata]

exit:
			push dword[rata+4]		;ngeprint yang belakangnya dulu (4-7)
			push dword[rata]		;ngeprint depannya (0-3)
            push print
            call printf
            add esp, 12
            
			mov     eax, 0			;return 0
            ret

