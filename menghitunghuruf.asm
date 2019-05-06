extern scanf, printf, fflush
   
section .data
    scan db "%s %s", 0
    print1 db "%d", 10, 0
    print2 db "tidak ada", 10, 0
       
section .bss
    string1 resb 40     ;index berkurang terus pas ngebaca satu-satu
    char resb 2
       
section .text
global main
   
main: 
            push char
            push string1
            push scan
            call scanf
            add esp, 12
              
            mov ebx, 0  
            mov ecx, 40
            mov edi, string1
            mov al, [char]
            
luup:
            repne scasb
            add ebx, 1
            cmp ecx, 0
            ja luup
               
               
            sub ebx, 1
               
            push ebx
            push print1
            call printf
            add esp, 8
            jmp exit
               
               
 
exit:
            push 0
            call fflush
            mov eax, 1
            mov ebx, 0
            int 0x80
