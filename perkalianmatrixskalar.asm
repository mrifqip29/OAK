global main
extern scanf
extern printf
extern fflush

segment .data
    array dd 7, 11, 10, 6
          dd 5, 8, 9, 12
          dd 11, 13, 12, 15
          
          ;0,4,8,12
          ;16,20,24,28
          ;32,36,40,44
    scan db '%d',0
    printbiasa db '%d ',0	;spasi doang
	printakhir db '%d',10,0	;ada newline
	
segment .bss
    n resd 4

segment .text

main:
    push n
    push scan
    call scanf
    add esp,8

    mov edi,0	;edi jadi counter

cek:
    CMP edi,44	;kalo edi nya udh di akhir, ke exit
    JA exit

kali:
    mov eax,[array+edi]
    mul dword[n]
    
    CMP edi,12 	;kalo diujung tiap baris, ke newline
    JE newline
    CMP edi,28	;kalo diujung tiap baris, ke newline
    JE newline
    CMP edi,44	;kalo diujung tiap baris, ke newline
    JE newline

    push eax
    push printbiasa	;ini yang pake spasi
    call printf
    add esp,8

    push 0
    call fflush
    add esp,4

    add edi,4	;tambahin edi nya 4
    JMP cek		;cek edi nya udah 44 belom
    
newline:
	push eax
	push printakhir	;print pake newline
    call printf
    add esp,8

    push 0
    call fflush
    add esp,4
    
    add edi,4
    JMP cek
exit:
    mov eax,1
    mov ebx,0
    int 80H

