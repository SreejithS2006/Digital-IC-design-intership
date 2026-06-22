# Day 8 – Task 1: APB Protocol Slave Design and Verification

## Objective

To design and verify an **APB (Advanced Peripheral Bus) Slave** module using Verilog HDL and simulate its read/write operations using a testbench in Vivado.

---

# Introduction

The **Advanced Peripheral Bus (APB)** is a low-power, low-complexity bus protocol defined in the ARM AMBA architecture. APB is primarily used for connecting low-bandwidth peripherals such as:

- Timers
- UARTs
- GPIO Controllers
- Watchdog Timers
- Configuration Registers

Unlike high-performance buses such as AHB and AXI, APB provides a simple interface with minimal control signals, making it ideal for peripheral communication.

---

# Theory

## APB Transfer Phases

An APB transaction consists of two phases:

### 1. Setup Phase

During this phase:

- `PSEL` is asserted.
- Address (`PADDR`) is driven.
- Write data (`PWDATA`) is driven for write operations.
- Read/Write direction is specified using `PWRITE`.

### 2. Access Phase

During this phase:

- `PENABLE` is asserted.
- Data transfer occurs.
- Slave responds using `PREADY`.

---

# APB Signals

| Signal | Width | Direction | Description |
|----------|---------|------------|-------------|
| PCLK | 1 | Input | APB Clock |
| PRESETn / rst_n | 1 | Input | Active-Low Reset |
| PADDR | 32 | Input | Address Bus |
| PSEL | 1 | Input | Slave Select |
| PENABLE | 1 | Input | Access Enable |
| PWRITE | 1 | Input | Write Control |
| PWDATA | 32 | Input | Write Data |
| PRDATA | 32 | Output | Read Data |
| PREADY | 1 | Output | Transfer Complete |

---

# Working Principle

## Write Operation

When:

```text
PSEL = 1
PENABLE = 1
PWRITE = 1
```

The slave writes `PWDATA` into the memory location specified by `PADDR`.

### Example

```text
Address = 0x12C
Data    = 0xF0A3655D
```

The value is stored in the APB slave memory.

---

## Read Operation

When:

```text
PSEL = 1
PENABLE = 1
PWRITE = 0
```

The slave reads data from the memory location specified by `PADDR` and places it on `PRDATA`.

### Example

```text
Address = 0xFC
```

Output:

```text
PRDATA = Stored Data
```

---

# Design Methodology

The APB Slave module was implemented using:

### Inputs

```verilog
clk
rst_n
paddr[31:0]
psel
penable
pwrite
pwdata[31:0]
```

### Outputs

```verilog
prdata[31:0]
pready
```

### Internal Memory

A register array is used to emulate peripheral registers.

```verilog
reg [31:0] mem [0:255];
```

---

# RTL Architecture

The synthesized RTL schematic consists of:

- APB Slave Module
- Address Decoder
- Register Memory
- Read Data Path
- Write Data Path
- Ready Signal Generation

### RTL Schematic
<img width="1057" height="470" alt="image" src="https://github.com/user-attachments/assets/1e576b47-8911-4ae5-aca8-94e2b684f845" />


---




# Simulation and Verification

A testbench was created to perform multiple APB write and read transactions.

The simulation waveform verifies:

- Address generation
- Write data transfer
- Read data transfer
- Proper assertion of PSEL and PENABLE
- Correct operation of PREADY

---

# Sample Transactions

## Write Transaction 1

| Signal | Value |
|----------|---------|
| Address | 0x12C |
| Data | 0xF0A3655D |
| Operation | Write |

Result:

```text
Memory[0x12C] = 0xF0A3655D
```

PASS ✅

---

## Write Transaction 2

| Signal | Value |
|----------|---------|
| Address | 0xFC |
| Data | 0x1DF59C7B |
| Operation | Write |

Result:

```text
Memory[0xFC] = 0x1DF59C7B
```

PASS ✅

---

## Read Transaction

| Signal | Value |
|----------|---------|
| Address | 0xFC |
| Operation | Read |

Output:

```text
PRDATA = 0x1DF59C7B
```

PASS ✅

---

# Waveform Analysis


<img width="1161" height="577" alt="image" src="https://github.com/user-attachments/assets/01c4acd1-5cbb-4901-8114-06ea1985e591" />


The simulation waveform shows:

### Write Cycle

```text
PSEL    = 1
PENABLE = 1
PWRITE  = 1
```

Data from `PWDATA` is written into memory.

---

### Read Cycle

```text
PSEL    = 1
PENABLE = 1
PWRITE  = 0
```

Stored data is returned through `PRDATA`.

---

### Ready Signal

```text
PREADY = 1
```

indicates successful completion of the APB transaction.

---

# Observations

- APB write operations successfully stored data into memory.
- APB read operations returned correct stored values.
- Address decoding functioned correctly.
- PREADY correctly indicated transfer completion.
- Read and write cycles followed APB protocol timing.
- Simulation results matched expected behavior.

---

# Advantages of APB

- Simple protocol
- Low power consumption
- Easy implementation
- Suitable for peripheral devices
- Minimal hardware overhead

---

# Applications

- UART Controllers
- GPIO Controllers
- Timers
- Watchdog Modules
- Configuration Registers
- Embedded SoCs

---

# Conclusion

An APB Slave module was successfully designed and verified using Verilog HDL. The design correctly implemented APB read and write transactions, address decoding, and ready signal generation. Simulation results confirmed proper functionality according to the APB protocol specification.

---

# Tools Used

- Verilog HDL
- Vivado Simulator
- Vivado RTL Analysis

---

# Concepts Learned

- AMBA APB Protocol
- Peripheral Bus Communication
- Address Decoding
- Register-Based Memory Design
- APB Read/Write Transactions
- RTL Design and Verification
- Waveform Analysis
