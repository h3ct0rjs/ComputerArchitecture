# HomeWork 1

## Principle Design Goals
Here are four underlying principles of hardware design, according to the [Ref1](https://github.com/MicBrain/Great-Ideas-in-Computer-Architecture/wiki/Underlying-Principles-of-Hardware-Design) and [R1ef2](https://bigganjogot.wordpress.com/2011/12/18/design-principles-of-computer-hardware-design/)

**Design Principle 1**: Simplicity favors regularity: fixed size instructions, 3 register operands in every arithmetic operation, keeping the register fields at the same place in every instruction format.

**Design Principle 2**: Smaller is faster: 32 registers only.

**Design Principle 3**: Make the common case fast: Larger addresses and constants in instructions and keeping all instructions the same length.

**Design Principle 4**: Good design demands good compromises: - PC-relative addressing for branches and immediate addressing for constant operands.

## Translate to Sparc v8 asm

`int a = 15;`

according to the Sparc v8 [Manual](www.gaisler.com/doc/sparcv8.pdf), there are different forms to translate the previous line of C code to asm:

```asm 
add %g0,15,%l0
or %g0,15,%l0
mov 15,%l0
```