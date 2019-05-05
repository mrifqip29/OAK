global main
extern scanf, printf, fflush
 
section .data
    print   db "%d", 10, 0
    scan    db "%d %d", 0
     
section .bss
    a resd 1
    b resd 2
     
section .text
    main:
     
        push a
        push b
        push scan
        call scanf
        add esp, 12
         
        tambah:
        mov eax, [a]
        mov ebx, [b]
        add eax, ebx
         
        push eax
        push print
        call printf
        add esp, 12
         
        exit:
        push 0
        call fflush
        add esp, 4
        mov eax, 1
        mov ebx, 0
        int 0x80
