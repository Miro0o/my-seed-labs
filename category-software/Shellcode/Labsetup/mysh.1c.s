section .text
  global _start
    _start:
      ; Store the argument string on stack
      xor  eax, eax 
      push eax          ; Use 0 to terminate the string
      push "//sh"
      push "/bin"
      mov  ebx, esp     ; argv[0] Get the string address

      push eax
      mov eax, "##-c"
      shr eax, 16
      push eax
      xor  eax, eax
      mov  ecx, esp     ; argv[1]

      mov eax, "##la"
      shr eax, 16
      push eax
      xor  eax, eax
      push "ls -"
      mov  edx, esp     ; argv[2]

      ; Construct the argument array argv[]
      push eax
      push edx
      push ecx
      push ebx
      mov  ecx, esp     ; Get the address of argv[]
   
      ; For environment variable 
      xor  edx, edx     ; No env variables 

      ; Invoke execve()
      xor  eax, eax     ; eax = 0x00000000
      mov   al, 0x0b    ; eax = 0x0000000b
      int 0x80
