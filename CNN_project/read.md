# CNN Verification Environment

## Project Overview

This project focuses on the **verification of a Convolutional Neural Network (CNN) accelerator** designed in Verilog/SystemVerilog. The CNN architecture performs image classification  of mnist dataset (0 to 9)  using convolution, ReLU activation, max pooling, and fully connected layers.

As part of the verification team, the objective was to validate the functionality of the CNN hardware design by developing a reusable SystemVerilog-based verification environment, generating test scenarios, monitoring DUT behavior, and comparing DUT outputs with expected results.

---

## Project Objectives

- Verify the functionality of the CNN accelerator with mnist dataset.
- Validate weight loading and configuration mechanisms.
- Check convolution, ReLU, pooling, and fully connected operations.
- Compare DUT classification results against a reference model.
- Measure pass/fail statistics across multiple test cases.
- Develop a scalable verification environment using SystemVerilog components.

---

## CNN Architecture

The CNN consists of the following stages:

### 1. Runtime Weight Loader
Loads trained weights into the CNN during runtime.

### 2. Pixel Stream Generator
Converts image data into a streaming format suitable for convolution processing.

### 3. Convolution Layer
Performs feature extraction using programmable kernels.

### 4. ReLU Activation
Applies non-linearity by replacing negative values with zero.

### 5. Max Pooling Layer
Reduces feature map dimensions while preserving important features.

### 6. Fully Connected Layer
Generates classification scores.

### 7. Classification Output
Produces the final predicted class.

---

## Verification Architecture

```text
                 +----------------+
                 |     TEST       |
                 +--------+-------+
                          |
                          v
                 +----------------+
                 |      ENV       |
                 +----------------+
                          |
      -----------------------------------------
      |                 |                     |
      v                 v                     v

+-------------+   +-------------+   +-------------+
| Generator   |-->|   Driver    |-->|     DUT     |
+-------------+   +-------------+   +-------------+
                                        |
                                        v
                                +-------------+
                                |   Monitor   |
                                +-------------+
                                        |
                                        v
                                +-------------+
                                | Scoreboard  |
                                +-------------+
```


<img width="1083" height="659" alt="image" src="https://github.com/user-attachments/assets/9ddf2a37-c81a-44ee-a205-05ae251e1a8e" />




### Components

#### Transaction Class
Stores randomized stimulus data.

#### Generator
Creates test transactions and sends them to the driver. All the text files for creating test cases are loaded in vivado project folder and randomly select .txt files (eg.mnist_0.txt) by the transaction class itself .And generator  class send this to driver using transaction and also send expected data to scoreboard .

#### Driver
Drives stimulus to the DUT through the interface.

#### Monitor
Captures DUT outputs and forwards them to the scoreboard.

#### Scoreboard
Compares DUT outputs with expected reference outputs by given by generator class.

#### Interface
Connects verification components with the DUT.

---

## DUT Signals Verified

| Signal | Description |
|----------|------------|
| clk | System Clock |
| rst_n | Active Low Reset |
| start | CNN Start Signal |
| wr_data | Weight Data |
| wr_addr | Weight Address |
| wr_en | Weight Write Enable |
| o_valid | Output Valid |
| o_img_done | Image Processing Complete |
| classes | Classification Scores |
| frame_done | Frame Processing Complete |
| status_reg | CNN Status Register |

---

## Test Flow

### Weight Loading Phase

1. Reset DUT.
2. Load CNN weights through runtime loader.
3. Verify weight memory contents.
4. Check `weights_loaded` flag.

### Image Processing Phase

1. Apply image data.
2. Start CNN operation.
3. Enable convolution stage.
4. Verify ReLU activation.
5. Verify max pooling operation.
6. Verify fully connected outputs.

### Classification Phase

1. Capture class scores.
2. Determine maximum score.
3. Compare predicted class with expected class.
4. Record PASS or FAIL.

---

## Simulation Results

### CNN Internal Status

Observed signals during simulation:

| Signal | Status |
|----------|---------|
| weights_loaded | Asserted |
| cfg_busy | Functional |
| relu_en | Functional |
| pool_en | Functional |
| fc_en | Functional |
| frame_done | Functional |
| o_valid | Functional |

The waveform confirms proper execution of the CNN pipeline.



<img width="1600" height="1027" alt="image" src="https://github.com/user-attachments/assets/70e87378-b82c-4ac5-aa89-0a9b6f2140d8" />


<img width="1600" height="1017" alt="image" src="https://github.com/user-attachments/assets/5f4139d2-4ed6-4b16-b941-2afb62a0cadf" />


---

## Classification Results

Example output:

```text
Class Scores:

Class[0] = 4294966972
Class[1] = 4294967165
Class[2] = 4294967176
Class[3] = 151
Class[4] = 278
Class[5] = 4294967198
Class[6] = 4294967038
Class[7] = 4294967189
Class[8] = 4294967208
Class[9] = 4294967281
```

Expected Class:

```text
4
```

DUT Prediction:

```text
4
```

Result:

```text
PASS
```





<img width="1600" height="903" alt="image" src="https://github.com/user-attachments/assets/05a0e2fa-ca57-4f4d-803d-032c106f9fb1" />




<img width="1419" height="802" alt="image" src="https://github.com/user-attachments/assets/3b6c686b-164a-4444-aa58-9bec7e4d538c" />

---

## Verification Summary

| Metric | Value |
|----------|---------|
| Total Test Cases | 10 |
| Passed Cases | 5 |
| Failed Cases | 5 |
| Verification Method | SystemVerilog |
| Simulation Tool | Vivado 2023.2 |

---

## RTL Schematic

The synthesized RTL schematic contains:

- Runtime Weight Loader
- Pixel Stream Generator
- Convolution Engine
- ReLU Layer
- Max Pooling Unit
- Fully Connected Layer
- Classification Logic
- Status Register

The RTL view confirms successful integration of all CNN processing blocks.






<img width="1600" height="717" alt="image" src="https://github.com/user-attachments/assets/3182e747-1e92-4b64-8606-36f48c4d0870" />

---

## Key Features Verified

### Weight Loading
- Runtime programmable weights
- Address-based loading

### Convolution
- Kernel multiplication
- Accumulation operation

### ReLU
- Negative clipping

### Pooling
- Maximum value selection

### Fully Connected Layer
- Score computation

### Classification
- Maximum score detection
- Final class prediction

---

## Technologies Used

- Verilog HDL
- SystemVerilog
- Vivado 2023.2
- RTL Simulation
- Functional Verification

---

## Learning Outcomes

- CNN Hardware Architecture
- RTL Design Understanding
- SystemVerilog Verification
- Transaction-Based Verification
- Driver and Monitor Design
- Scoreboard Implementation
- Interface-Based Connectivity
- Waveform Debugging
- Functional Coverage Concepts
- CNN Accelerator Verification Flow

---

## Future Improvements

- Complete UVM-based verification environment.
- Add functional coverage collection.
- Integrate Python/C golden reference model.
- Automate regression testing.
- Improve test pass percentage.
- Add assertions for protocol and timing checks.

---

## Conclusion

A complete verification environment was developed to validate the functionality of a CNN hardware accelerator. The verification flow successfully exercised weight loading, convolution, ReLU activation, pooling, and classification stages. Simulation results confirmed correct operation for multiple test scenarios and provided valuable insight into CNN hardware verification methodologies used in modern VLSI design flows.
