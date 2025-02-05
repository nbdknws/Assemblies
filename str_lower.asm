.intel_syntax noprefix
.global _start

_start:

str_lower:

mov rsi, 0 
cmp rdi, 0
je end
mov rbx, rdi

while_loop:
    cmp byte ptr [rbx], 0x00
    je end

    cmp byte ptr [rbx], 0x5a
    jg default

    mov dil, byte ptr [rbx]
    call 0x403000
    mov cl, al
    mov byte ptr [rbx], cl
    
    inc rsi

    default:
        inc rbx
        jmp while_loop

end:
    mov rax, rsi
    ret