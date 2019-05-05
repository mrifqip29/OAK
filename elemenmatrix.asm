global main
extern scanf
extern printf
extern fflush
 
segment .data
    array dd 7, 11, 10, 6
          dd 5, 8, 9, 2
          dd 1, 3, 12, 4
    scan db '%d %d',0
    print db '%d',10,0
     
segment .bss
    row resd 1 
    col resd 1
     
segment .text
 
main:				;cara aksesnya 4*kolom*X + 4*Y, X nya baris, Y nya kolom
    push col
    push row
    push scan
    call scanf
    add esp,12
     
    mov eax,dword[row]
    mov ebx,16
    mul ebx
    mov ecx,eax
     
    mov eax,dword[col]
    mov ebx,4
    mul ebx
    add ecx,eax
     
    mov eax,[array+ecx]
 
exit:   
    push eax
    push print
    call printf
    add esp,8
     
    push 0
    call fflush
    add esp,4
     
    mov eax,1
    mov ebx,0
    int 80H
