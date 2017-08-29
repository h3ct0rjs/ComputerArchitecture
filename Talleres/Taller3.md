# Homework 3

Given the following code in C language, You will need to translate it to the correspondend code in **asm** for the Sparc v8 computer architecture. 

```C
int main(){
int x = -18, y=-7535,z=43,p,v;
p = (x-y) + ( z + 19)
v = p | -17;
return v &-2434;
}
```

In order to do the previous exercise, we need to use the official SPARCV8 [Manual](www.gaisler.com/doc/sparcv8.pdf) and check what is the apropiate way to translate the previous code using the instruction set.
The following code is the result of the translation:

The following is the list of the register file used during the translation:

x→ %o0

y→%o1

z→%o2

p→%o3

v→%o4

tmp→%l0


for the big number **-7532** we need to convert it to binary wich the result is : *00000000000000000001110101101100* now we need to use two's complements operation wich is doing a negation of the number previous binary number *11111111111111111110001010010011* and adding 1 to the end wich give us *11111111111111111110001010010**100***, now we need the first 22 bits most significant of the last binary number wich are **1111111111111111111000** we do again the two's complement again 0000000000000000000111 and don't forget to add the 1 
wich finally is : 0000000000000000001000, that number is 8 now with can use the sethi instruction:

```asm
sethi -8, %o0
or %o0,660,%o0
```


```asm
main: 
  mov -18,%o0
  sethi -8, %o0
  or %o0,660,%o0
  mov 43,%o1
  mov 0,%o3
  mov 0,%o4
  sub %o0,%o1,%l0
  add %o2,19,%o2
  add %o2,%l0,%o3
  and %o3,-17,%o3
  
  
  %%%terminar 
  return v &-2434;

```


| op  | rd  | op3  | rs1  | i=1  | imm13   |
|---|---|---|---|---|---:|
| 10  | 01000  |000010   |00000   | 1  |0000000000101 |
| 10  | 01001  |000010   |00000   | 1  |0000000000011 |
| 10  | 01010  |000010   |00000   | 1  |0000000011101 |

| op  | rd  | op3  | rs1  | i=0  | unused  | rs2|
|---|---|---|---|---|---|---:|
| 10  | 01001  |000000   | 01010   |  0 | 0000000 |  01001 |
| 10  | 01001  |000000   | 01010   |  0 | 0000000 |  01000 |
