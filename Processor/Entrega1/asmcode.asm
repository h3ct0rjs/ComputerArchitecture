main :
    mov 8,%g1
    mov -2,%g2
    add %g1,%g2,%o0
    xor %g1,%g2,%o1
    andn %g1,%g2,%o2
    xnor %g1,%g2,%o3
    sub %g1,%g2,%o3