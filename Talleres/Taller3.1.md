# Homework 3

Given the following code in C language, You will need to translate it to the correspondend code in **asm** for the Sparc v8 computer architecture. 

```C
int main(){
int a[5],b[5];
a[0] = 4, a[1]=5;
a[2] = 10, a[4] = -14;
b[0] =a[2] +42;
b[1] =b[0] + a[4];
b[2] =-4722;
return b[0] + b[1] - b[2]*16; 
}
```

In order to do the previous exercise, we need to use the official SPARCV8 [Manual](www.gaisler.com/doc/sparcv8.pdf) and check what is the apropiate way to translate the previous code using the instruction set.
The following code is the result of the translation:

The following is the list of the register file used during the translation:

a→ %i0

b→%l0

tmp1,tmp2→%l3,%l2..

```asm
.global main 
!comment are with ! according to sparcv8 wiki

main: 
0x0000    mov 0, %i0      !a is %i0 
0x0004    mov 0, %l0      !b is %l0
0x0008    mov 4, %l3
0x000c    st %l3, %i0, 0  !a[0] = 4
0x0010    mov 5, %l3
0x0014    st %l3, %i0, 4  !a[1] = 5
0x0018    mov 10, %l3
0x001c    st %l3, %i0, 8  !a[2] = 10
0x0020    mov -14, %l3
0x0024    st %l3, %i0, 16 !a[4] = -14
0x0028    ld %i0, 8, %l3
0x002c    add 42, %l3, %l3  ! a[2] +42
0x0030    st %l3, %l0, 0    !b[0]=a[2] +42
0x0034    ld %l0, 0, %l1 
0x0038    ld %i0, 16, %l3
0x003c    add %l1,%l3,%l3
0x0040    st %l3, %l0, 4   !b[1]=b[0]+a[4]
0x0044    sethi -5, %l3
0x0048    or %l3, 398,%l3 
0x004c    st %l3, %l0, 8   !b[2] = -4722
0x0050    ld %l0, 0, %l3
0x0054    ld %l0, 4, %l2
0x0058    ld %l0, 8, %l3
0x005c    add %l3, %l2, %l3 
0x0060    sll %l1,4,%l1    
0x0064    sub %l3,%l1, %l3
```
# Machine Code Generated :

**ToDo** Complete Translation in the night
format3
format3
| op  | rd  | op3  | rs1  | i=1  | imm13   |
|---|---|---|---|---|---:|
| 10  | 11000  |000010   |00000   | 1  |0000000000000 |
| 10  | 10000  |000010   |00000   | 1  |0000000000000 |
| 10  | 10011  |000010   |00000   | 1  |0000000000100 |

**continue and ask about st to machine language. **