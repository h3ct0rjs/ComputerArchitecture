#Homework 2

Given the following code in C language, You will need to translate it to the correspondend code in **asm** for the Sparc v8 computer architecture. 

```C
#include <stdio.h>
int main(){
	int a=5,b=3,c=29;
	return a+b+c
}
```

In order to do the previous exercise, we need to use the official SPARCV8 [Manual](www.gaisler.com/doc/sparcv8.pdf) and check what is the apropiate way to translate the previous code using the instruction set, the following code 
is the result of the translation:

```asm
mov 5,%o0
mov 3,%o1
mov 29,%o2
add %o0,%o1,%o0
add %o0,%o2,%o0
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