extern scanf, printf, fflush
 
section .data
    dibaca db "%s", 0
    printday db "weekday", 10, 0
    printend db "weekend", 10, 0 
    sun  db "Sun", 0
    sat  db "Sat", 0
     
section .bss
    string1 resb 10
    string2 resb 10
     
section .text
global main
 
main:
            push string1
            push dibaca
            call scanf
            add esp, 8
             
            mov esi, string1
            mov edi, sun
             
            cmpsb
            je benar
             
            mov edi, sat
            cmpsb
            je benar
             
            push printday
            call printf
            add esp, 4
            jmp exit
             
benar:
            push printend
            call printf
            add esp, 4
            jmp exit
             
exit :
            push 0
            call fflush
            mov eax, 1
            mov ebx, 0
            int 0x80
            
