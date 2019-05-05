extern scanf, printf, fflush
 
section .data
    dibaca db "%s", 0
    diprint db "%d", 10, 0
     
section .bss
    string1 resb 21 ;index berkurang terus pas ngebaca satu-satu
     
section .text
global main
 
main: 
            push string1
            push dibaca
            call scanf
            add esp, 8
             
            mov ecx, 20
            mov edi, string1
            mov al, ""
            repne scasb
             
            mov eax, 19
            sub eax, ecx
            mov ebx, 0
            cmp ecx, ebx
            je exit
             
                 
            push eax
            push diprint
            call printf
            add esp, 8
            jmp exit
             
exit:
            push 0
            call fflush
            mov eax, 1
            mov ebx, 0
            int 0x80
