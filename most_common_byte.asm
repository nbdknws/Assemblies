.intel_syntax noprefix
.global most_common_byte

most_common_byte:
        push rbp
        mov rbp, rsp
        sub rsp, 0x300 

        mov rdx, 0
        mov r9, rbp
        sub r9, 0x300

        clear_loop:
                cmp rdx, 0x100
                jge end_clear
                mov word ptr [r9 + rdx*2], 0 
                inc rdx
                jmp clear_loop
        end_clear:

        mov rbx, 0
        calc_freq:
                cmp rbx, rsi
                je end_calc_freq

                movzx r8, byte ptr [rdi + rbx] 
                mov r9, rbp
                sub r9, 0x300 
                sal r8, 1
                add r9, r8 
                inc word ptr [r9] 

                inc rbx 
                jmp calc_freq
        end_calc_freq:


        mov rbx, 0 
        mov rcx, 0  
        mov rax, 0  
        mov r10, 0

        find_max:
                cmp rbx, 0x100
                jge end_find_max

                mov r9, rbp
                sub r9, 0x300  
                mov r10, rbx
                sal r10, 1
                add r9, r10    
                mov r8w, word ptr [r9]  

                cmp r8, rcx
                jle skip_update

                mov rcx, r8  
                mov rax, rbx

                skip_update:
                inc rbx
                jmp find_max

        end_find_max:

        mov rsp, rbp
        pop rbp
        ret