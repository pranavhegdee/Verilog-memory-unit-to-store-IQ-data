# Verilog-memory-unit-to-store-IQ-data
This project implements a Verilog-based memory module designed to store **In-phase (I)** and **Quadrature (Q)** signal data. It's useful in DSP systems, SDR pipelines, and any digital signal processing that requires IQ sample storage and retrieval.

---

## 🧠 Module: `iq_memory.v`

### Description

- Stores IQ data samples
- Parameterizable for bit width and address space
- Supports separate read and write ports
- Stores `{I, Q}` as a single data word

---

## ⚙️ Parameters

```verilog
parameter DATA_WIDTH = 16;  // Width of I or Q signal
parameter ADDR_WIDTH = 10;  // Address width (2^ADDR_WIDTH depth)


---