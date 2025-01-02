section .data
    fizz db 'Fizz', 0    
    buzz db 'Buzz', 0    
    nl db 10             
    num dq 1             
    max dq 100           
    fmt db '%d', 10, 0   
    fizz_fmt db 'Fizz', 0
    buzz_fmt db 'Buzz', 10, 0
    fizzbuzz_fmt db 'FizzBuzz', 10, 0

section .text
global _main
extern _printf

_main:
    push    rbp
    mov     rbp, rsp
    mov     rcx, [rel num]   
    
counting_loop:
    cmp     rcx, [rel max]   
    jg      exit_program     
    
    ; Test if divisible by both 3 and 5 (15)
    mov     rax, rcx
    xor     rdx, rdx
    mov     r8, 15
    div     r8
    cmp     rdx, 0
    je      print_fizzbuzz
    
    ; Test if divisible by 3
    mov     rax, rcx
    xor     rdx, rdx
    mov     r8, 3
    div     r8
    cmp     rdx, 0
    je      print_fizz
    
    ; Test if divisible by 5
    mov     rax, rcx
    xor     rdx, rdx
    mov     r8, 5
    div     r8
    cmp     rdx, 0
    je      print_buzz
    
    ; If not divisible by 3 or 5, print number
    push    rcx             
    lea     rdi, [rel fmt]   
    mov     rsi, rcx        
    xor     eax, eax        
    call    _printf
    pop     rcx             
    
next_number:
    inc     rcx             
    jmp     counting_loop   

print_fizzbuzz:
    push    rcx
    lea     rdi, [rel fizzbuzz_fmt]
    xor     eax, eax
    call    _printf
    pop     rcx
    jmp     next_number

print_fizz:
    push    rcx
    lea     rdi, [rel fizz_fmt]
    xor     eax, eax
    call    _printf
    lea     rdi, [rel nl]
    call    _printf
    pop     rcx
    jmp     next_number

print_buzz:
    push    rcx
    lea     rdi, [rel buzz_fmt]
    xor     eax, eax
    call    _printf
    pop     rcx
    jmp     next_number

exit_program:
    mov     rax, 0x2000001  
    xor     rdi, rdi        
    syscall