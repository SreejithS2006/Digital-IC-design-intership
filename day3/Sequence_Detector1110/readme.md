# Day 3 – Task 1: Sequence Detector (1110) Design and Verification

## Objective

To design and verify a **Sequence Detector for the binary sequence 1110** using Verilog HDL and simulate its functionality using Xilinx Vivado.

---

## Introduction

A **Sequence Detector** is a sequential circuit used to detect a specific pattern of bits from a serial input stream. When the desired sequence is detected, the circuit generates an output signal indicating successful detection.

In this task, a sequence detector was designed to identify the binary sequence:

```text
1110
```

The design was implemented using a **Finite State Machine (FSM)** approach in Verilog HDL.

### Applications

* Digital Communication Systems
* Pattern Recognition Circuits
* Data Stream Monitoring
* Error Detection Systems
* Protocol Controllers

---

## Theory

Sequence detectors are implemented using Finite State Machines (FSMs), where each state represents the progress toward detecting the desired sequence.

For detecting the sequence **1110**, the FSM transitions through a series of states based on the incoming serial data.

### State Description

| State | Description              |
| ----- | ------------------------ |
| S0    | Initial State            |
| S1    | First '1' detected       |
| S2    | Sequence '11' detected   |
| S3    | Sequence '111' detected  |
| S4    | Sequence '1110' detected |

When the complete sequence **1110** is received, the output signal **detected** becomes HIGH.

---

## Working Principle

The detector continuously monitors the serial input bit stream.

### State Transitions

* S0 → S1 when input = 1
* S1 → S2 when another 1 is received
* S2 → S3 when another 1 is received
* S3 → S4 when input = 0
* Detection output becomes HIGH in S4

After detection, the FSM returns to the appropriate state depending on whether overlapping detection is implemented.

---

## Design Methodology

The Sequence Detector was implemented using a Moore FSM architecture.

### Inputs

| Signal | Description       |
| ------ | ----------------- |
| clk    | Clock Signal      |
| rst    | Reset Signal      |
| din    | Serial Data Input |

### Output

| Signal   | Description               |
| -------- | ------------------------- |
| detected | Sequence Detection Output |

### Functional Blocks

1. Present State Register
2. Next State Logic
3. Detection Logic
4. Reset Logic

The FSM transitions between states according to the input sequence and generates the detection output when the pattern 1110 is recognized.

---

## State Diagram

### Sequence: 1110

```text
S0 --1--> S1
S1 --1--> S2
S2 --1--> S3
S3 --0--> S4 (Detected)
```

The output is asserted when the FSM reaches the detection state.

---

## RTL Analysis

The RTL schematic generated in Vivado shows:

* State Register (Present State Register)
* Next State Logic implemented using multiplexers
* Detection Logic
* Clock and Reset circuitry

The synthesized RTL confirms the FSM-based implementation of the sequence detector.

### RTL Diagram

<img width="850" height="556" alt="WhatsApp Image 2026-06-10 at 4 17 06 PM" src="https://github.com/user-attachments/assets/5d9a9c2a-4355-48aa-86be-2c63b6b0c9e3" />
<img width="850" height="864" alt="WhatsApp Image 2026-06-10 at 3 50 44 PM" src="https://github.com/user-attachments/assets/8b5e9aae-8239-42b8-bef0-8fb796f28e37" />



---

## Verilog Implementation

The design was coded using Verilog HDL and implemented as a Finite State Machine.

### Features

* FSM-based sequence detection
* Synchronous clock operation
* Reset functionality
* Detection output generation
* Serial data monitoring

---

## Simulation and Verification

A Verilog testbench was developed to verify the operation of the sequence detector.

### Test Sequence

```text
Input Stream : 1110
```

### Expected Output

```text
Detected = 1
```

when the complete sequence is received.

### Simulation Observation

The waveform confirms:

* Correct clock generation.
* Proper reset operation.
* Successful state transitions.
* Detection signal generation upon receiving the sequence 1110.

**Result:** PASS ✅

### Simulation Waveform

<img width="1600" height="773" alt="WhatsApp Image 2026-06-10 at 3 51 15 PM" src="https://github.com/user-attachments/assets/ca1af8e1-b759-4e4b-ad93-20735a641a02" />


---

## Observations

* The FSM successfully tracked the incoming serial data.
* State transitions occurred correctly according to the input sequence.
* Detection output was asserted only when the complete sequence 1110 was received.
* Reset returned the FSM to the initial state.
* Simulation results matched the expected behavior.

---

## Conclusion

A **1110 Sequence Detector** was successfully designed, implemented, and verified using Verilog HDL. The FSM correctly detected the desired bit pattern and generated the detection output at the appropriate time. RTL analysis and simulation results confirmed the correctness of the implementation. This task provided practical experience in FSM design, state transition logic, sequence detection techniques, and hardware verification using Xilinx Vivado.

---

## Tools Used

* Xilinx Vivado
* Verilog HDL

## Concepts Learned

* Finite State Machines (FSM)
* Moore State Machine Design
* Sequence Detection
* State Transition Logic
* RTL Analysis
* Testbench Development
* Functional Simulation

