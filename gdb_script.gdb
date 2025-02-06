set pagination off 
set confirm off 

continue
break *main+596
commands
    silent
    set $result = *(unsigned long long *)($rbp - 0x18)
    continue
end

catch syscall read
commands
    silent
    if ($rdi == 0)
        set $rdi = 3
    end
    continue
end

break *main+630
commands
    silent
    set $place = $rbp - 0x10
    set *((uint64_t *) $place) = $result
    continue
end

continue
