section .text
  global _start
    _start:
      ; The following code calls execve("/bin/sh", ...)
      xor  rdx, rdx       ; 3rd argument
      push rdx
      mov rax,'hhhhhhhh'
      shl rax,56
      shr rax,56
      push rax
      mov rdi, rsp        ; 1st argument
      mov rax, '/bin/bas'
      push rax
      mov rdi, rsp        ; 1st argument
      push rdx 
      push rdi
      mov rsi, rsp        ; 2nd argument
      xor  rax, rax
      mov al, 0x3b        ; execve()
      syscall
