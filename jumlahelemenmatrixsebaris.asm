global main
extern scanf
extern printf
extern fflush
 
segment .data
    array dd 7, 11, 10, 6
          dd 5, 8, 9, 2
          dd 1, 3, 12, 4
          
          ;0,4,8,12
          ;16,20,24,28
          ;32,36,40,44
    scan db '%d',0
    print db '%d',10,0
     
segment .bss
    row resd 1 
    col resd 1
     
segment .text
 
main:				
    push row
    push scan
    call scanf
    add esp,8
    
    mov eax,dword[row] 	;eax = 1
    mov ebx,16 			;ebx = 1
    mul ebx				;eax = 16 ---> [indeks] pertama di baris itu
    mov edi,eax 		;edi = 16
    mov edx,[array+edi] ;masukin indeks pertama di baris itu ke edx
    
    mov ecx, 4			;loop nya ncolom kali
    loop sum			;loop sekali soalnya elemen pertama udah masuk ke edx, sisanya jadi ecx = 3 --> 3 kali loop
    
    sum:
    add edi,4			;edi nya ditambah 4 tiap loop, biar bisa akses [indeks] yang lain
    add edx,[array+edi]	;tambahin ke edx
    loop sum			;loop lg
     
 
exit:   
    push edx
    push print
    call printf
    add esp,8
     
    push 0
    call fflush
    add esp,4
     
    mov eax,1
    mov ebx,0
    int 80H

