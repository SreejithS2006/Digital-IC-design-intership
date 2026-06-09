
## Day 1 – BCD Adder Design and Verification

### Objective

To design and verify a 4-bit Binary Coded Decimal (BCD) Adder using Verilog HDL and simulate its functionality using Vivado.

Introduction

A Binary Coded Decimal (BCD) Adder is a digital circuit used to add two BCD digits. Since BCD represents decimal digits (0–9) using 4-bit binary numbers, the result of adding two BCD digits may exceed 9. In such cases, a correction factor of decimal 6 (0110) must be added to obtain a valid BCD result.

BCD adders are widely used in:

Digital clocks
Calculators
Electronic meters
Financial and accounting systems
Theory
BCD Number System

In BCD, each decimal digit is represented by a 4-bit binary number.

Decimal	BCD
0	0000
1	0001
2	0010
3	0011
4	0100
5	0101
6	0110
7	0111
8	1000
9	1001

Values from 1010 to 1111 are invalid BCD representations.

Working Principle
Add the two BCD digits using a 4-bit Ripple Carry Adder (RCA).
Check whether:
Carry output is generated, or
Sum is greater than 1001 (decimal 9).
If either condition is true, add 0110 (decimal 6) to the intermediate sum.
The corrected output becomes the valid BCD result.
Design Methodology

The BCD Adder was implemented using:

Module 1: Ripple Carry Adder (RCA)

Performs the initial addition of:

Input A[3:0]
Input B[3:0]
Carry Input (Cin)

Produces:

Intermediate Sum
Carry Output
Module 2: Correction Logic

The correction condition is:

Correction = Cout + (S3.S2) + (S3.S1)

where:

Cout = Carry from first RCA
S3, S2, S1 are bits of intermediate sum

If Correction = 1, then 0110 is added.

Module 3: Second RCA

Adds:

Intermediate Sum
0110 (when correction is required)

Produces:

Final BCD Sum
Final Carry
Block Diagram

The BCD Adder consists of:

First Ripple Carry Adder
Correction Logic (AND and OR Gates)
Second Ripple Carry Adder

The architecture is shown in the synthesized RTL schematic generated in Vivado.

<img width="1536" height="770" alt="image" src="https://github.com/user-attachments/assets/8ca86a9f-7d86-430c-93a5-b8ed6f2a0733" />


Verilog Implementation

The design was coded in Verilog HDL and structured using hierarchical modules.

Major modules used:

Full Adder
Ripple Carry Adder
BCD Adder

The correction logic automatically detects invalid BCD outputs and performs decimal correction.

Simulation and Verification

A testbench was developed to verify the functionality of the BCD Adder.

Test Case 1
Input	Value
A	3
B	4
Cin	0

Expected Result:

3 + 4 = 7

Output:

Sum = 7
Carry = 0

Result: PASS ✅

Test Case 2
Input	Value
A	5
B	6
Cin	0

Expected Result:

5 + 6 = 11
BCD Output = 0001 0001

Output:

Sum = 1
Carry = 1

Result: PASS ✅

<img width="1536" height="814" alt="image" src="https://github.com/user-attachments/assets/9d52390d-8fe9-495e-8596-c23b118c533b" />

Observations
The first RCA correctly generated the intermediate binary sum.
The correction logic successfully detected invalid BCD outputs.
Adding decimal 6 converted invalid binary sums into valid BCD format.
Simulation results matched expected decimal outputs.
