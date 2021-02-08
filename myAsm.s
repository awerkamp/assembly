extern _puts

section .text  ; this says that we're about to write code (as opposed to data)

  global _sayHello ; this says that "sayHello" is a symbol that the linker needs to know about
  global _myPuts
  global _getTimeOfDay
  
_getTimeOfDay:

    sub rsp, 16
    mov rax, 0x2000074 
    mov rdi, rsp
    mov rsi, 0
    syscall
    mov rax, [rsp]
    mov rdx, [rsp + 8]
    add rsp, 16
    ret

_myPuts:           

    mov rax, 0x02000004 ; to write
    mov rdi, 1 ; 1 is for sdt out
    mov rsi, myPuts ; source (register source index)
    mov rdx, 6
    syscall ; jumps from user mode to kernel mode; checks each register
    ret              

_sayHello:        
    
    push rbp ; base pointer push rbp onto the stack, making it 8 byte aligned
    mov rdi, helloString
    call _puts ; for printing
    pop rbp  ; pop it off the stack so that 
              ; the caller's return address is now on top of the stack
    ret                 ; just return

section .data  ; this is the read only data (hello is a constant) 
  
  helloString: db "hello",0 ; hellostring is the name of our symbol
  myPuts: db "myPuts",0
