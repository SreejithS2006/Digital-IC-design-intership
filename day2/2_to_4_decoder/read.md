# Day 2 – Task 1: 2-to-4 Decoder Design and Verification

## Objective

Design and verify a **2-to-4 Decoder** using Verilog HDL and simulate its functionality using **Xilinx Vivado**.

---

## Introduction

A **Decoder** is a combinational logic circuit that converts binary information from *n* input lines into a maximum of *2ⁿ* output lines.

A **2-to-4 Decoder** accepts a 2-bit binary input and activates one of four output lines corresponding to the binary value of the input. At any given time, only one output remains HIGH while all others remain LOW.

### Applications

* Memory address decoding
* Data routing
* Instruction decoding in processors
* Digital communication systems
* Control unit design

---

## Theory

A 2-to-4 Decoder maps a 2-bit input to one of four output lines.

### Truth Table

| Input (I1 I0) | Output (Y3 Y2 Y1 Y0) |
| ------------- | -------------------- |
| 00            | 0001                 |
| 01            | 0010                 |
| 10            | 0100                 |
| 11            | 1000                 |

Only one output is active for each input combination.

---

## Working Principle

The decoder continuously monitors the input signal and activates the corresponding output.

* **00 → Y0 = 1**
* **01 → Y1 = 1**
* **10 → Y2 = 1**
* **11 → Y3 = 1**

Thus, the binary input is decoded into a unique output line.

---

## Verilog Implementation

### Inputs

| Signal | Description |
| ------ | ----------- |
| i[1:0] | 2-bit input |

### Outputs

| Signal | Description          |
| ------ | -------------------- |
| Y[3:0] | 4-bit decoded output |

### Decoder Logic

```verilog
case(i)
    2'b00 : Y = 4'b0001;
    2'b01 : Y = 4'b0010;
    2'b10 : Y = 4'b0100;
    2'b11 : Y = 4'b1000;
endcase
```

---

## RTL Schematic

The RTL schematic generated in Vivado shows:

* Multiplexer-based implementation
* Four constant output values
* Input lines acting as select signals

The synthesized circuit correctly realizes the functionality of a 2-to-4 Decoder.

### RTL Diagram
<img width="1536" height="798" alt="image" src="https://github.com/user-attachments/assets/86530200-c15b-496a-b3f5-49d69096f2fa" />


---

## Simulation and Verification

A testbench was developed to verify all possible input combinations.

### Test Cases

| Input | Expected Output |
| ----- | --------------- |
| 00    | 0001            |
| 01    | 0010            |
| 10    | 0100            |
| 11    | 1000            |

### Sample Verification

| Input | Output   |
| ----- | -------- |
| 10    | 0100 (4) |
| 11    | 1000 (8) |

**Result:** PASS ✅

### Simulation Waveform

<img width="1536" height="765" alt="image" src="https://github.com/user-attachments/assets/fe6d2970-0da2-45fa-9604-2ff8967beb5c" />


---

## Observations

* Only one output remained HIGH for each input combination.
* Output changed immediately when the input changed.
* Simulation results matched the theoretical truth table.
* RTL schematic verified correct hardware synthesis.
* Decoder functionality was successfully implemented and verified.

---

## Conclusion

A **2-to-4 Decoder** was successfully designed, implemented, and verified using Verilog HDL in Xilinx Vivado. The simulation results matched the expected truth table, confirming the correctness of the design. This task provided practical experience in combinational logic design, Verilog coding, simulation, and RTL analysis.

---

## Tools Used

* Xilinx Vivado
* Verilog HDL

## Concepts Learned

* Combinational Logic Design
* Decoder Architecture
* Verilog Case Statements
* RTL Analysis
* Functional Simulation
* Testbench Development
