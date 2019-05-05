global main
extern scanf
extern printf
extern fflush
  
segment .data
    scan db '%d',0
    print db '%d',10,0
      
segment .bss
	x resd 4
      
segment .text

pangkat:
	push ebp
	mov ebp, esp
	sub esp, 4
	
	mov eax, dword[ebp+8]
	mul eax
	
	mov esp, ebp
	pop ebp
	ret

 
main:               
    push x
    push scan
    call scanf
    add esp, 8
      
	cmp dword[x], 0
	je exit
	
	push dword[x]
	call pangkat
	
	push eax
	push print
	call printf
	add esp, 8
	
	jmp main
	
  
exit:   
    push 0
    call fflush
    add esp,4
      
    mov eax,1
    mov ebx,0
    int 80H
