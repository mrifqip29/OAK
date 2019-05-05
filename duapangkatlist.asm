extern scanf, printf, fflush
 
section .data
    print   db "%d", 10, 0
    scan    db "%d", 0
     
section .bss
    a resd 4
     
section .text
    global main
         
    pangkat:    
        mul ebx
        LOOP pangkat
        push eax
        push print
        call printf
        add esp, 8
     
    main:   
        push a
        push scan
        call scanf
        add esp, 8
         
        mov eax, 1
        mov ebx, 2
        mov ecx, [a]
        cmp ecx, 0
        je exit
         
        push dword [a]
        call pangkat
        add esp, 4
         
        jmp main
         
    exit:
        push 0
        call fflush
        mov eax, 1
        mov ebx, 0
        int 0x80
