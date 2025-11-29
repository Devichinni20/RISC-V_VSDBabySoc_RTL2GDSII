# RISC-V_VSDBabySoc_RTL2GDSII

## Table of Contents
- [Part 1: Introduction to SoC & Pre-synthesis and Post-synthesis verification flow for a minimal RISC-V System-on-Chip (SoC)](#part-2-Introduction-to-SoC-&-Pre-synthesis-&-Post-synthesis-verification-for-RISC-V)                                                      
- [Part 2:Introduction to STA & Timing Graphs using openSTA](#part-2-Introduction-to-STA-&-Timing-Graphs-using-openSTA)
- [Part 3: Theory & Implementation of BabySoC Physical Design](#part-3-Theory-&-Implementation-of-BabySoC-Physical-Design)
- [Part 4: SPEF & Post-Layout STA & Timing Graphs Across PVT Corners for Routed VSDBabySoC](#part-4-SPEF-&-Post-Layout-STA-&-Timing-Graphs-Across-PVT-Corners-for-Routed-VSDBabySoC)



## Part 1 : Introduction to SoC & Pre-synthesis and Post-synthesis verification flow for a minimal RISC-V System-on-Chip (SoC) 
<details>
  <summary>
     SoC Fundamentals (Theory)
   </summary>
  
  # 🧠 VSDBabySoC — RISC-V Based Open-Source System on Chip

A compact and educational **System on Chip (SoC)** built around the **RVMYTH RISC-V processor**, featuring a **Phase-Locked Loop (PLL)** for stable clock generation and a **10-bit Digital-to-Analog Converter (DAC)** for digital-to-analog interfacing.  
Fabricated using **Sky130 technology**, this project serves as a hands-on platform for learning and experimenting with **open-source hardware design**.

---

## 📘 Table of Contents

1. [Overview](#overview)
2. [Understanding System on Chip (SoC)](#understanding-system-on-chip-soc)
3. [Types of SoCs](#types-of-socs)
4. [Introduction to VSDBabySoC](#introduction-to-vsdbabysoc)
5. [Phase-Locked Loop (PLL)](#phase-locked-loop-pll)
6. [Digital-to-Analog Converter (DAC)](#digital-to-analog-converter-dac)
7. [Key Takeaways](#key-takeaways)

---

## 🧩 Overview

**VSDBabySoC** integrates three essential IP cores — the **RVMYTH CPU**, **PLL**, and **10-bit DAC** — to form a minimal, functional SoC that demonstrates real-world **digital-to-analog conversion** and **clock synchronization**.

The system flow is as follows:
1. The **PLL** generates a precise, stable clock signal.
2. The **RVMYTH processor** cycles data through its registers (e.g., `r17`) for DAC input.
3. The **DAC** converts this digital stream into analog output (stored in `OUT`), which can drive analog devices such as TVs or mobile speakers.

---

## ⚙️ Understanding System on Chip (SoC)

A **System on a Chip (SoC)** is essentially a complete computing system built into a single integrated circuit. It contains everything a standalone computer would need — CPU, memory, I/O, and more.

### 🧠 Core Components

| Component | Function |
|------------|-----------|
| **CPU** | Executes instructions, handles data processing |
| **Memory (RAM/ROM)** | Temporary & permanent storage |
| **I/O Ports** | Interface for sensors, displays, etc. |
| **GPU** | Handles visual rendering and graphics |
| **DSP** | Processes audio and video efficiently |
| **Power Management** | Controls voltage and power distribution |

### 📸 SoC Architecture

<img width="1226" height="569" alt="Screenshot 2025-10-01 204256" src="https://github.com/user-attachments/assets/e0209a37-14ec-4500-894c-3f393104a9da" />

### 💡 Why SoCs Matter

- 🧱 **Compact** – Combines multiple functions into one chip  
- ⚡ **Energy Efficient** – Reduces interconnect distances and power loss    
- 🚀 **High Performance** – Faster internal communication  
- 💰 **Cost Effective** – Fewer components, lower production cost  
- 🧩 **Reliable** – Fewer failure points

---

## 🧱 Types of SoCs

SoCs can be broadly categorized based on their design intent and application:

| Type | Description | Common Use |
|------|--------------|-------------|
| **Microcontroller-based SoC** | Focused on control and automation | IoT devices, appliances |
| **Microprocessor-based SoC** | Designed for high-level processing and multitasking | Smartphones, tablets |
| **Application-Specific SoC** | Optimized for targeted high-performance tasks | AI accelerators, GPUs |

### 📸 SoC Design Flow
<img width="1080" height="741" alt="Screenshot 2025-10-01 204519" src="https://github.com/user-attachments/assets/6393abff-c9c2-46d1-8b06-19043c113f9e" />
<img width="1072" height="801" alt="Screenshot 2025-10-01 204800" src="https://github.com/user-attachments/assets/9481ae97-06b5-4455-9899-8becbc149e69" />


## 🧮 Introduction to VSDBabySoC

**VSDBabySoC** is a simple, open-source RISC-V-based SoC designed to integrate three open hardware IPs in a single layout for testing and learning.

### 🧠 Components

| Component | Description |
|------------|-------------|
| **RVMYTH (CPU)** | A RISC-V microprocessor responsible for data handling and control |
| **PLL (Phase-Locked Loop)** | Generates and stabilizes the SoC’s clock signal |
| **DAC (10-bit)** | Converts digital data from RVMYTH into analog output |

### 🔄 Functional Flow

1. **Initialization** – PLL activates upon receiving the reference signal.  
2. **Data Processing** – RVMYTH updates the `r17` register with values.  
3. **Analog Output** – DAC converts digital data into an analog waveform for external output.

### 📸 VSDBabySoC Block Diagram

<img width="1155" height="683" alt="Screenshot 2025-10-01 210517" src="https://github.com/user-attachments/assets/c516812c-00db-4118-a1f3-ccb3665885a3" />

## ⏱️ Phase-Locked Loop (PLL)

A **Phase-Locked Loop (PLL)** synchronizes an internal oscillator’s output frequency with a reference input signal to maintain a constant phase relationship.

### 🔧 Key Components

- **Phase Detector (PD)** – Compares input & output phase  
- **Loop Filter (LF)** – Smoothens the phase error signal  
- **Voltage-Controlled Oscillator (VCO)** – Adjusts frequency to maintain lock

### 📸 PLL Block Diagram
<img width="1105" height="663" alt="Screenshot 2025-10-01 211339" src="https://github.com/user-attachments/assets/c16fe61e-9285-4e92-9c87-f0edb6187754" />


### ⚙️ Why PLLs Are Crucial in SoCs

| Challenge | Solution via PLL |
|------------|------------------|
| Off-chip clock delay | On-chip synchronization |
| Clock jitter | Stable frequency generation |
| Multiple frequency domains | Frequency multiplication/division |
| Crystal deviation | Auto-correction of drift |
| Temperature drift | Frequency stability through feedback |

---

## 🎚️ Digital-to-Analog Converter (DAC)

A **DAC** transforms digital (binary) signals into analog voltage or current — enabling SoCs to communicate with analog systems.

### 🔍 Types of DACs

1. **Weighted Resistor DAC**  
   Converts digital input using resistors of different values.  

<img width="746" height="688" alt="Screenshot 2025-10-01 222017" src="https://github.com/user-attachments/assets/1d63cf0a-99c8-4719-8026-d2b230184f25" />

   
2. **R-2R Ladder DAC**  
   Simplifies design using repeating resistor structures.  
<img width="698" height="240" alt="Screenshot 2025-10-01 222210" src="https://github.com/user-attachments/assets/9c71d9cd-0a77-4ff1-8ebd-c57931c658fe" />


  
### 🧩 In VSDBabySoC

- **10-bit DAC** allows 1024 discrete analog levels.  
- It converts RVMYTH register data (`r17`) into a continuous analog waveform.  
- The generated analog output can drive **audio/video** devices like TVs or speakers.

---

## 🧾 Key Takeaways

✅ **Open-Source Hardware** — Built using RISC-V and Sky130 PDK  
✅ **Compact Design** — Combines CPU, PLL, and DAC in one chip  
✅ **Educational Purpose** — Ideal for digital-analog interface experiments  
✅ **Practical Outputs** — Capable of generating audio/video analog signals  

---

## 📂 Repository Structure

```bash
VSDBabySoC/
│
├── docs/                  # Documentation and images
├── rtl/                   # Verilog source files
├── sim/                   # Testbench and simulation scripts
├── synth/                 # Synthesis setup
├── results/               # Waveforms and output data
├── LICENSE
└── README.md
```
</details>

## Pre-synthesis and Post-synthesis verification flow for a minimal RISC-V System-on-Chip (SoC)


A hands-on guide for **VSDBabySoC**, a RISC-V-based open-source SoC integrating the **RVMYTH core**, **PLL**, and **DAC** modules.  
Covers project setup, TL-Verilog to Verilog conversion, simulation, waveform analysis, and DAC output visualization.

---

## 📘 Table of Contents

1. [Project Structure](#project-structure)
2. [Environment Setup](#environment-setup)
3. [TLV to Verilog Conversion](#tlv-to-verilog-conversion)
4. [Simulation Workflow](#simulation-workflow)
    - [Pre-Synthesis Simulation](#pre-synthesis-simulation)
    - [Waveform Viewing in GTKWave](#waveform-viewing-in-gtkwave)
    - [DAC Output in Analog Mode](#dac-output-in-analog-mode)
5. [Troubleshooting Tips](#troubleshooting-tips)
6. [Why Pre-Synthesis vs Post-Synthesis?](#why-pre-synthesis-vs-post-synthesis)
7. [Summary](#summary)

---

## 🧱 Project Structure

```txt
VSDBabySoC/
├── src/
│   ├── include/             # Header files (*.vh)
│   │   └── sandpiper.vh
│   ├── module/              # Design & simulation modules
│   │   ├── vsdbabysoc.v     # Top-level SoC
│   │   ├── rvmyth.v         # RISC-V core (from TLV)
│   │   ├── rvmyth.tlv       # TL-Verilog source
│   │   ├── avsdpll.v        # PLL module
│   │   ├── avsddac.v        # DAC module
│   │   └── testbench.v      # Simulation testbench
├── output/                  # Simulation outputs
└── compiled_tlv/            # Optional intermediate files
````

---

## ⚙️ Environment Setup

Clone the project and navigate to the working directory:

```bash
cd ~/Desktop/vsdflow/VLSI
git clone https://github.com/manili/VSDBabySoC.git
cd ~/Desktop/vsdflow/VLSI/VSDBabySoC/
```

Check modules:

```bash
ls src/module/
```

---

## 🔧 TLV to Verilog Conversion

The RVMYTH core is in TL-Verilog (rvmyth.tlv) and must be converted to `.v` for simulation.

```bash
# 1️⃣ Install virtual environment & pip
sudo apt update
sudo apt install python3-venv python3-pip

# 2️⃣ Create & activate virtual environment
cd ~/Desktop/vsdflow/VLSI/VSDBabySoC/
python3 -m venv sp_env
source sp_env/bin/activate

# 3️⃣ Install SandPiper-SaaS
pip install pyyaml click sandpiper-saas

# 4️⃣ Convert TLV → Verilog
sandpiper-saas -i ./src/module/*.tlv -o rvmyth.v --bestsv --noline -p verilog --outdir ./src/module/
```

<img width="1920" height="923" alt="VirtualBox_opensource_tool_ubuntu_02_10_2025_15_37_38" src="https://github.com/user-attachments/assets/cd254fde-dfba-403b-8405-6998be07dd40" />



✅ Output: `rvmyth.v` in `src/module/`.

```bash
ls src/module/ | grep rvmyth
```

💡 Activate env before every session:

```bash
source sp_env/bin/activate
```

Deactivate when done:

```bash
deactivate
```

---

## 🧠 Simulation Workflow

### 🔹 Pre-Synthesis Simulation

```bash
cd ~/Desktop/vsdflow/VLSI/VSDBabySoC/
mkdir -p output/pre_synth_sim

iverilog -o output/pre_synth_sim/pre_synth_sim.out \
  -DPRE_SYNTH_SIM \
  -I src/include \
  -I src/module \
  src/module/testbench.v

cd output/pre_synth_sim
./pre_synth_sim.out
```

* `-DPRE_SYNTH_SIM`: Enables pre-synthesis macros
* Generates `pre_synth_sim.vcd` for GTKWave
<img width="1920" height="923" alt="VirtualBox_opensource_tool_ubuntu_02_10_2025_16_03_07" src="https://github.com/user-attachments/assets/454dfd83-0943-4ed3-81d2-a7bd204e2cd6" />


---

### 🔹 Waveform Viewing in GTKWave

```bash
cd ~/Desktop/vsdflow/VLSI/VSDBabySoC/
gtkwave output/pre_synth_sim/pre_synth_sim.vcd
```

Drag these signals:

* `CLK` → Clock (from PLL)
* `reset` → Reset input
* `RV_TO_DAC[9:0]` → 10-bit data bus
* `OUT` → DAC output

<img width="1920" height="923" alt="VirtualBox_opensource_tool_ubuntu_02_10_2025_16_02_30" src="https://github.com/user-attachments/assets/da4f213d-72c5-454f-9685-67c1efdada2e" />

---

### 🔹 DAC Output in Analog Mode

Open VCD in GTKWave, then:

* Select `OUT` → Right-click → Data Format → Analog (Step)
* Add `CLK`, `reset`, `RV_TO_DAC[9:0]` for reference

<img width="1920" height="923" alt="VirtualBox_opensource_tool_ubuntu_02_10_2025_16_06_27" src="https://github.com/user-attachments/assets/bd541703-ff1c-4e2b-a4d5-50a5ea7bf52e" />

---

## 🚑 Troubleshooting Tips

| Issue               | Cause               | Solution                               |
| ------------------- | ------------------- | -------------------------------------- |
| Module redefinition | Duplicate inclusion | Include module once (testbench or CLI) |
| File not found      | Wrong include path  | Use absolute paths with `-I`           |
| Virtual env missing | Not activated       | `source sp_env/bin/activate`           |

---

## 🎯 Why Pre-Synthesis vs Post-Synthesis?

| Stage                | Description           | Purpose                                        |
| -------------------- | --------------------- | ---------------------------------------------- |
| Pre-Synthesis        | RTL-level simulation  | Verify logic correctness                       |
| Post-Synthesis (GLS) | Gate-level simulation | Detect timing violations & hardware mismatches |
| Goal                 | Combined verification | Ensures final hardware matches design intent   |

---

✅ Next Step: Add post-synthesis workflow, timing analysis, and corresponding waveforms for complete documentation.

## Post-Synthesis Simulation

Post-synthesis simulation is critical for validating both **functionality and timing** after RTL code has been synthesized into standard cells.

---

## Table of Contents

1. [Introduction](#introduction)
2. [Pre-Synthesis vs Post-Synthesis Simulation](#pre-synthesis-vs-post-synthesis-simulation)
3. [Synthesis Flow](#synthesis-flow)
   - [Step 1: Load RTL Modules](#step-1-load-rtl-modules)
   - [Step 2: Load Liberty Files](#step-2-load-liberty-files)
   - [Step 3: Synthesize the Design](#step-3-synthesize-the-design)
   - [Step 4: Map Flip-Flops to Standard Cells](#step-4-map-flip-flops-to-standard-cells)
   - [Step 5: Optimization & Technology Mapping](#step-5-optimization--technology-mapping)
   - [Step 6: Clean-Up & Renaming](#step-6-clean-up--renaming)
   - [Step 7: Check Statistics](#step-7-check-statistics)
   - [Step 8: Write Synthesized Netlist](#step-8-write-synthesized-netlist)
4. [Post-Synthesis Simulation](#post-synthesis-simulation)
   - [Step 1: Compile Testbench](#step-1-compile-testbench)
   - [Step 2: Navigate to Simulation Directory](#step-2-navigate-to-simulation-directory)
   - [Step 3: Run Simulation](#step-3-run-simulation)
   - [Step 4: View Waveforms in GTKWave](#step-4-view-waveforms-in-gtkwave)
5. [Comparing Pre- and Post-Synthesis Outputs](#comparing-pre--and-post-synthesis-outputs)

---

## Introduction

Post-synthesis simulation validates that the **synthesized gate-level netlist** behaves identically to the original RTL, both logically and in terms of timing.  

It identifies issues such as:

- Unintended latches or glitches
- Race conditions due to gate delays
- Timing violations

This ensures a robust design before hardware implementation.

---

## Pre-Synthesis vs Post-Synthesis Simulation

- **Pre-Synthesis Simulation**  
  Focuses on **logical correctness** of RTL. Fast and ideal for detecting functional errors early.

- **Post-Synthesis Simulation**  
  Validates **logic and timing** of the synthesized netlist, including gate delays and technology-specific constraints.

Performing both ensures the final design is functionally correct and meets timing requirements.

---

## Synthesis Flow

All commands assume the working directory:  

```bash
devichinni20@devi-VirtualBox:~Desktop/vsdflow/VLSI/VSDBabySoC/
````

### Step 1: Load RTL Modules

1. Launch Yosys:

```bash
yosys
```

2. Read top-level module:

```yosys
read_verilog src/module/vsdbabysoc.v
```
<img width="1477" height="761" alt="Screenshot from 2025-10-03 19-57-42" src="https://github.com/user-attachments/assets/d88dad91-602f-4297-b932-0138b1a7fa72" />

3. Copy include files:

```bash
cp -r src/include/sp_verilog.vh .
cp -r src/include/sandpiper.vh .
cp -r src/include/sandpiper_gen.vh .
```
<img width="1464" height="708" alt="Screenshot from 2025-10-03 19-56-08 (Copy)" src="https://github.com/user-attachments/assets/31b7d1cb-06c7-4e61-a711-fb03ab869fa2" />

4. Read dependent modules:

```yosys
read_verilog -I src/include/ src/module/rvmyth.v
read_verilog -I src/include/ src/module/clk_gate.v
```

> ⚠️ Ensure include files are in the working directory to avoid parsing errors.

---

### Step 2: Load Liberty Files

```yosys
read_liberty -lib src/lib/avsdpll.lib
read_liberty -lib src/lib/avsddac.lib
read_liberty -lib src/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
```

---
<img width="1433" height="519" alt="Screenshot from 2025-10-03 19-58-09" src="https://github.com/user-attachments/assets/10daa49a-f63c-4472-b48f-e8bae2b05e45" />

### Step 3: Synthesize the Design

```yosys
synth -top vsdbabysoc
```

---

### Step 4: Map Flip-Flops to Standard Cells

```yosys
dfflibmap -liberty src/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
```

---
<img width="665" height="809" alt="Screenshot from 2025-10-03 20-00-10" src="https://github.com/user-attachments/assets/1a5aa57a-c2ff-44fb-b40d-838f1758af75" />


### Step 5: Optimization & Technology Mapping

```yosys
opt
abc -liberty src/lib/sky130_fd_sc_hd__tt_025C_1v80.lib -script +strash;scorr;ifraig;retime;{D};strash;dch,-f;map,-M,1,{D}
```
<img width="1718" height="830" alt="Screenshot from 2025-10-03 20-06-39" src="https://github.com/user-attachments/assets/3cccb08e-1382-417f-afaf-051ec2752d06" />
<img width="1920" height="923" alt="Screenshot from 2025-10-03 20-06-55" src="https://github.com/user-attachments/assets/cd352a8f-381a-412f-a5a7-4d0c5138603e" />


**Optimization Steps:**

| Command      | Purpose                                                    |
| ------------ | ---------------------------------------------------------- |
| strash       | Reduce logic redundancy                                    |
| scorr        | Sequential sweeping to remove redundant logic              |
| ifraig       | Equivalence checking & incremental optimization            |
| retime;{D}   | Move registers to optimize timing                          |
| dch,-f       | Delay-aware combinational optimization                     |
| map,-M,1,{D} | Map logic to standard cells minimizing area & timing-aware |

---
![](https://github.com/Devichinni20/VSDBabySoC_Week2/blob/50d77c4df705b8d04dc50609ef74c10a4014d2f9/Labs_Part_2/Images/Screenshot%20from%202025-10-03%2020-06-12.png)
### Step 6: Clean-Up & Renaming

```yosys
flatten
setundef -zero
clean -purge
rename -enumerate
```

| Command           | Purpose                                       |
| ----------------- | --------------------------------------------- |
| flatten           | Flatten hierarchy into a single-level netlist |
| setundef -zero    | Replace undefined values (`x`) with `0`       |
| clean -purge      | Remove unused wires, cells, and modules       |
| rename -enumerate | Unique numbering for internal wires and cells |

---
<img width="742" height="382" alt="Screenshot from 2025-10-03 20-08-45" src="https://github.com/user-attachments/assets/a561439b-d4ef-477b-ac3d-0c40869660f0" />

### Step 7: Check Statistics

```yosys
stat
```
<img width="1920" height="923" alt="Screenshot from 2025-10-03 20-13-19" src="https://github.com/user-attachments/assets/05431a58-bbab-4d13-aac0-fac135dce43f" />

<img width="1920" height="923" alt="Screenshot from 2025-10-03 20-13-29" src="https://github.com/user-attachments/assets/8773d623-9421-41de-99ca-17583c9cebed" />

> Review the number of cells, wires, memories, and other statistics.

---

### Step 8: Write Synthesized Netlist

```yosys
write_verilog -noattr output/post_synth_sim/vsdbabysoc.synth.v
```

---
<img width="1675" height="249" alt="Screenshot from 2025-10-03 20-30-45" src="https://github.com/user-attachments/assets/020052f2-f299-475f-9dc4-d1240bdb184e" />

## Post-Synthesis Simulation

### Step 1: Compile Testbench

1. Copy standard cell and primitive models:

```bash
cp -r ~/VLSI/sky130RTLDesignAndSynthesisWorkshop/my_lib/verilog_model/sky130_fd_sc_hd.v src/module/
cp -r ~/VLSI/sky130RTLDesignAndSynthesisWorkshop/my_lib/verilog_model/primitives.v src/module/
```

2. Copy synthesized netlist to module directory:

```bash
cp -r output/post_synth_sim/vsdbabysoc.synth.v src/module/
```

3. Compile testbench:

```bash
iverilog -o output/post_synth_sim/post_synth_sim.out \
-DPOST_SYNTH_SIM -DFUNCTIONAL -DUNIT_DELAY=#1 \
-I src/include -I src/module src/module/testbench.v
```

> ⚠️ Fix any syntax errors in `sky130_fd_sc_hd.v` if encountered, e.g.:

```verilog
`endif // SKY130_FD_SC_HD__LPFLOW_BLEEDER_FUNCTIONAL_V
```

---
<img width="1920" height="923" alt="Screenshot from 2025-10-04 01-21-42" src="https://github.com/user-attachments/assets/8ca9194a-8912-4d15-bd64-ad194bd2b847" />

### Step 2: Navigate to Simulation Directory

```bash
cd output/post_synth_sim/
```

---

### Step 3: Run Simulation

```bash
./post_synth_sim.out
```

---

### Step 4: View Waveforms in GTKWave

```bash
gtkwave post_synth_sim.vcd
```

---
<img width="1920" height="923" alt="Screenshot from 2025-10-04 01-31-27" src="https://github.com/user-attachments/assets/2cb2afa8-1223-496e-aa02-5b5791524c3e" />

## Comparing Pre- and Post-Synthesis Outputs

To verify **functional equivalence**, compare the GTKWave outputs from pre-synthesis and post-synthesis simulations.
<img width="1920" height="923" alt="VirtualBox_opensource_tool_ubuntu_02_10_2025_16_06_27" src="https://github.com/user-attachments/assets/7450d3c5-ca79-4517-84a7-888e8a520022" />

<img width="1920" height="923" alt="Screenshot from 2025-10-04 01-41-19" src="https://github.com/user-attachments/assets/7e8a6300-075a-42f1-bada-b3a277f14418" />



✅ Matching waveforms confirm that the synthesis process **preserves functionality**.

---

---

## 🏁 **Conclusion: **

### ✅ **Key Outcome**

- **The SoC is functionally correct**
  - The CPU core (**RVMYTH**), **PLL**, and **DAC** interact seamlessly.  
  - Clock generation, signal flow, and synchronization operate as intended.

- **Synthesis preserved functionality**
  - Logic was successfully mapped to **Sky130 standard cells**.  
  - Optimization maintained behavior without altering logical correctness.

- **The SoC is now gate-level ready**
  - The synthesized netlist is ready for:
    - **Static Timing Analysis (STA)**
    - **Place & Route**
    - **Final GDSII fabrication**

- **The design flow is fully verified end-to-end**
  - Demonstrated a **complete open-source ASIC design flow**:  
    **RTL → Synthesis → Post-Synthesis Simulation**

---

### 💡 **In Simpler Words**

We have effectively **built and verified a miniature open-source RISC-V SoC**, integrating:

- A **RISC-V CPU core (RVMYTH)**  
- A **PLL** for stable clock generation  
- A **DAC** for digital-to-analog signal conversion  

All using **open-source EDA tools** like **Yosys**, **Icarus Verilog**, and **GTKWave** with **Sky130 technology**.

---

### 🧩 **Final Verification Insight**

By observing **matching pre- and post-synthesis waveforms**, you have proven that:

> My design is **functionally stable**, **logically sound**, and **synthesis-ready** for real-world hardware realization.
---

## Part 2 :  Introduction to STA & Timing Graphs using openSTA

<details>
  <summary>
     STA (Theory)
   </summary>
  
# 📘 Table of Contents

# 📌 Timing Analysis 

1. [Introduction](#introduction)  
2. [Timing Paths](#timing-paths) – start/end points, types (in→reg, reg→reg, etc.)  
3. [Setup & Hold Checks](#setup--hold-checks) – setup, hold, slack  
4. [Types of Analysis](#types-of-analysis) – reg2reg, in2reg, reg2out, in2out, clock gating, recovery/removal, latch  
5. [Additional Analysis](#additional-analysis) – slew/transition, load, clock (skew, pulse width)  
6. [Reg2Reg Setup Timing](#reg2reg-setup-timing) – single clock, skew, GBA/PBA, pin-node, setup condition  
7. [Flip-Flop Timing](#flip-flop-timing) – launch/capture, clk→Q, setup/hold, jitter, uncertainty, eye diagram  
8. [Hold Timing Concepts](#hold-timing-concepts) – hold condition, slack, OCV, clock push/pull, CPPR  
9. [Summary](#summary) – setup vs hold, OCV, jitter, real-chip timing

## Introduction

**Static Timing Analysis** is one of the many techniques available to verify the timing of a digital design. 

An alternate approach used to verify the timing is the timing simulation which can verify the functionality as well as the timing of the design. 

The term timing analysis is used to refer to either of these two methods - static timing analysis, or the timing simulation. 

Thus, timing analysis simply refers to the analysis of the design for timing issues.

The STA is static since the analysis of the design is carried out statically and does not depend upon the data values being applied at the input pins. 

This is in contrast to simulation based timing analysis where a stimulus is applied on input signals, resulting behavior is observed and verified, then time is advanced with new input stimulus applied, and the new behavior is observed and verified and so on.



In a CMOS digital design flow, the static timing analysis can be performed at many different stages of the implementation. Figure below shows a typical flow.



**OpenSTA** is an open source static timing analyzer (STA) tool used in digital design. It is utilized to analyze and verify the timing performance of digital circuits at the gate level.

OpenSTA uses a TCL command interpreter to read the design, specify timing constraints and print timing reports.
<img width="623" height="582" alt="image" src="https://github.com/user-attachments/assets/42497ef1-2929-48c5-bd23-555acc49a31f" />


#### Input Files

- `*.v`  : Gate-level Verilog Netlist  
- `*.lib` : Liberty Timing Libraries  
- `*.sdc` : Synopsys Design Constraints (clocks, delays, false paths)  
- `*.sdf` : Annotated Delay File (optional)  
- `*.spef`: Parasitics (RC extraction)  
- `*.vcd` / `*.saif` : Switching Activity for Power Analysis 

#### Clock Modeling Features

- `Generated Clocks`: Derived from existing clocks  
- `Latency`: Clock propagation delay  
- `Source Latency`: Insertion delay from clock source to input  
- `Uncertainty`: Jitter or skew margins  
- `Propagated vs. Ideal`: Real vs. ideal clock network modeling  
- `Gated Clock Checks`: Verifies clocks that are enabled conditionally  
- `Multi-Frequency Clocks`: Analyzes multiple domains  

#### Timing Analysis and Reporting

OpenSTA provides a rich set of commands for analyzing timing paths, delays, and setup/hold checks:

- `report_checks`  
  Reports timing violations across specified paths using options like `-from`, `-through`, and `-to`. Supports multi-path analysis to any endpoint.

  ```tcl
  report_checks -from [get_pins U1/Q] -to [get_pins U2/D]
  ```
#### Timing Paths 

`What do you mean by Timing Paths?`
* It Refer to the logical paths a signal takes through a digital circuit from its source to its destination, including sequential and combinational elements. STA analyzes timing paths to determine their delay, setup and hold times, and other timing parameters specified in the constraints. Timing paths are categorized into combinatorial and sequential, and the critical path is the longest path in the design with the maximum operating frequency.

#### Timing Path Elements
   
Timing path elements in STA are the start point, where a signal originates, the end point, where it terminates, and the combinational logic elements, such as gates, that the signal passes through. Timing paths are traced to determine the overall delay and timing performance of the digital circuit.
<img width="1920" height="1080" alt="Screenshot (133)" src="https://github.com/user-attachments/assets/9409fe0c-59b5-49fc-b4d7-4dcc78b7838e" />




**Start Point**: Is the point where the signal originates or enters the digital circuit. This point is typically an input port of the design, where the signal is first introduced to the circuit.

The start point of a timing path can be either:

- An input port, where data enters the design, or

- The clock pin of a register, where data is launched on a clock edge.

**End Point:** Is the point where the signal terminates or leaves the digital circuit. This point is typically an output port of the design, where the signal is outputted from the circuit.

The end point of a timing path can be either:

- A register's data input pin (D pin), where data is captured by the clock edge, or

- An output port, where data must be available at a specific time.

**Combinational Logic:** Combinational logic elements are the building blocks of a digital circuit and are used to perform logic operations on the signals passing through the circuit. These elements do not store any information, and the output of a combinational logic element is solely determined by the input values at that moment.

The diagram illustrates four distinct timing paths:

Path 1: Input to Register (in2reg)

Path 2: Register to Register (reg2reg)

Path 3: Register to Output (reg2out)

Path 4: Input to Output (in2out)



#### Setup and Hold Checks

-> **What is Setup Check?**
* Is the minimum time that the data must be stable before the clock edge, and if this time is not met, it can lead to setup violations, resulting in incorrect data being stored in the sequential element. The setup check is essential to ensure correct timing behavior of a digital circuit and prevent data loss or other timing-related issues.
* The setup time of a flip-flop depends on the technology node, operating conditions, and other factors. The value of the setup time is usually provided in the logic libraries.

-> **What is Hold Check?**
* Is the minimum amount of time that the data must remain stable after the clock edge, and if this time is not met, it can lead to hold violations, resulting in incorrect data being stored in the sequential element. The hold check is necessary to prevent issues such as data corruption, metastability, and other timing-related problems in digital circuits.

#### Slack Calculation 

Setup and hold slack is defined as the difference between data required time and data arrivals time. 

>Setup slack = Data required time - Data arrival time

>Hold slack = Data arrival time - Data required time

-> **What is Data Arrival Time?**
* The time taken by the signal to travel from the start point to the end point of the digital circuit. 

-> **What is Data Required Time?** 
* The time for the clock to traverse through the clock path of the digital circuit. 

-> **What is Slack?** 
* It is difference between the desired arrival times and the actual arrival time for a signal. 
* Positive Slack indicates that the design is meeting the timing and still it can be improved. 
* Zero slack means that the design is critically working at the desired frequency. 
* Negative slack means, design has not achieved the specified timings at the specified frequency.
* Slack has to be positive always and negative slack indicates a violation in timing.

# 🧮 Types of Setup / Hold Timing Analysis

This section covers various types of **timing analyses** performed in Static Timing Analysis (STA).

---

## 🔹 Types of Setup / Hold Paths
1. **Reg → Reg**  
   (Register to Register path)

2. **In → Reg**  
   (Input port to Register path)

3. **Reg → Out**  
   (Register to Output port path)

4. **In → Out**  
   (Input port to Output port path)

5. **Clock Gating Path**  
   (Used to verify enable paths in gated clock circuits)

6. **Recovery / Removal Path**  
   (Checks for asynchronous signals like reset or clear)

7. **Data → Data Path**  
   (Used for combinational logic timing checks)

8. **Latch Path**  
   (Includes **time borrowing** in latch-based designs)

---

## ⚙️ Additional Timing Analyses

### 1. **Slew / Transition Analysis**
Analyzes **signal transition time (rise/fall time)** for both data and clock paths.

- **For Data (max / min):**  
  - Based on data path transition rate.  
  - Ensures data changes within valid limits.

- **For Clock (max / min):**  
  - Clock should switch at regular intervals.  
  - Ensures reliable triggering without distortion.

---

### 2. **Load Analysis**
Examines loading effects on each node in the design.

- **Fanout (max / min):**  
  - Number of loads driven by a single output.  

- **Capacitance (max / min):**  
  - Total capacitive load seen by a driver.  

---

### 3. **Clock Analysis**
Verifies clock network parameters critical to timing.

- **Skew:**  
  - Difference in clock arrival times between flops.  

- **Pulse Width:**  
  - Ensures clock high/low times are within limits.  

---

📘 **In summary:**  
These analyses (setup, hold, slew, load, and clock) collectively ensure that all signal transitions, delays, and clock timings in the design meet the required performance and reliability constraints.

# 🧩 Reg2Reg Setup Timing Analysis (Single Clock Domain)

## 🔹 Overview
In a **register-to-register (reg2reg)** timing path, data is launched from one flip-flop (**launch flop**) and captured by another (**capture flop**) through **combinational logic**.  
Both flip-flops are triggered by the **same clock**.
Clock → Launch FF → Combinational Logic → Capture FF → Clock


---

## 🔹 Key Timing Points
1. **Launch Edge** – Clock edge that triggers data output from the launch flop.  
2. **Capture Edge** – Next active clock edge that captures the data at the capture flop.

---

## 🔹 Setup Time Condition
For correct data capture, the data must arrive **before** the next active clock edge minus the setup time of the capture flop.
Tclk ≥ Tcq + Tcomb + Tsetup + Tskew




<img width="1920" height="1080" alt="Screenshot (135)" src="https://github.com/user-attachments/assets/3a141deb-6ad5-40c4-99c2-1d67784ca996" />

**Where:**
- `Tclk` → Clock period  
- `Tcq` → Clock-to-Q delay of launch flop  
- `Tcomb` → Combinational delay  
- `Tsetup` → Setup time of capture flop  
- `Tskew` → Clock skew between capture and launch clocks  

If this condition is violated → **Setup violation** occurs.

---

## 🔹 Clock Skew
- **Positive skew** → Capture clock arrives later → Helps setup (more time for data).  
- **Negative skew** → Capture clock arrives earlier → Hurts setup (less time for data).

---

## 🔹 Timing Analysis Types
### 1. **GBA (Graph-Based Analysis)**
- Uses **worst-case delay** for each path.  
- Fast but **pessimistic**.

### 2. **PBA (Path-Based Analysis)**
- Calculates timing **per specific path** end-to-end.  
- More **accurate** but slower.

---

## 🔹 Pin / Node Convention
- A **pin** (or **node**) represents a connection point in the timing graph (e.g., Q pin of launch flop or D pin of capture flop).  
- Each node has:
  - **Arrival Time (AT)**
  - **Required Arrival Time (RAT)**

---

## 🔹 Setup Analysis Equation
Slack = RAT - AT
If `Slack ≥ 0` → No setup violation.  
If `Slack < 0` → Setup violation.

---

### 📘 Summary Formula:
Tclk ≥ Tcq + Tcomb + Tsetup + Tskew


Ensures that data launched by one flip-flop reaches the next flip-flop **within one clock period**, considering **delays, setup time, and skew**, using either **GBA or PBA** timing models.
# 🧩 Flip-Flop Internal Timing & Advanced STA Concepts

## 🔹 Opening Up the Flip-Flop
A flip-flop can act as either:
- **Launch Flip-Flop:** Sends data on the active clock edge.  
- **Capture Flip-Flop:** Receives and stores data on the next active edge.

Inside a flip-flop, there are two **latches**:
- **Positive Latch:** Active during the high phase of the clock.  
- **Negative Latch:** Active during the low phase of the clock.

---

## 🔹 Key Timing Parameters
- **Setup Time (Tsetup):**  
  Minimum time before the active clock edge during which data must remain stable.

- **Hold Time (Thold):**  
  Minimum time after the clock edge during which data must stay stable.

- **Clock-to-Q Delay (Tcq):**  
  Time from the clock edge to the output data transition at Q.

---

## 🔹 Setup Time Condition (Effect of Setup)
The setup condition ensures that data arrives before the capture clock edge:

Tclk ≥ Tcq + Tcomb + Tsetup + Tskew + Tuncertainty
<img width="1920" height="1080" alt="Screenshot (142)" src="https://github.com/user-attachments/assets/9fdf967a-a68c-46c8-9ea0-e536750ecefb" />


If setup time increases → available **timing margin** decreases, reducing maximum operating frequency.

---

## 🔹 Jitter & Uncertainty
- **Jitter:** Variation in clock edge timing from its ideal position.  
- **Uncertainty:** Accounts for combined effects of jitter, skew, and variations.  
- **Impact:** Increases setup time requirement and reduces effective clock period.
<img width="1920" height="1080" alt="Screenshot (143)" src="https://github.com/user-attachments/assets/5c23b97b-fdd0-4345-9800-6b7b3a9fbe4d" />
<img width="1920" height="1080" alt="Screenshot (149)" src="https://github.com/user-attachments/assets/27869d0b-099a-492e-903f-378068e3c54d" />

---

## 🔹 Steps for Jitter Analysis
1. Define clock source and reference period.  
2. Measure edge-to-edge variation (cycle-to-cycle jitter).  
3. Compute RMS or peak jitter.  
4. Include jitter value as **clock uncertainty** in STA.

---

## 🔹 Eye Diagram & Window Creation
- **Eye Diagram:**  
  Overlay of multiple bit periods showing signal integrity and timing margins.  
  - Eye opening → indicates good timing and low noise.  
  - Eye closure → indicates jitter, noise, or skew issues.
<img width="1920" height="1080" alt="Screenshot (146)" src="https://github.com/user-attachments/assets/fbd8c7cc-0549-414d-88e7-8eae50e29437" />

- **Timing Window:**  
  Defines valid region for data sampling based on setup/hold and jitter limits.

---

## 🔹 Graphical to Textual Conversion
- Graphical waveforms (clock, data) are represented in text form using:  
  - **Arrival Time (AT)**  
  - **Required Arrival Time (RAT)**  
  - **Slack = RAT – AT**

This allows STA tools to perform timing analysis numerically rather than visually.

---

📘 **In short:**  
Flip-flop internal timing (setup, hold, Tcq), along with jitter, uncertainty, and eye diagram analysis, ensures reliable data capture by verifying that timing windows are not violated in the presence of real-world variations.


# ⚙️ Setup & Hold Timing Concepts — STA Overview

## 🔹 Hold Analysis
Hold analysis checks **minimum delay paths** to ensure data does **not change too early** after the capture clock edge.

- **Hold Time (Thold):**  
  Minimum time after the clock edge during which input data must remain stable.

- **Hold Condition:**
Tcq + Tcomb ≥ Thold + Tskew + Tuncertainty
<img width="1920" height="1080" alt="Screenshot (148)" src="https://github.com/user-attachments/assets/4bd1413c-0b86-4a31-bd02-3b0b324a31bb" />

If violated → **Hold violation** (data captured incorrectly).

---

## 🔹 Slack (Timing Margin)
Slack indicates whether a path meets timing requirements.

- **For Setup:**
Slack = (Tclk - (Tcq + Tcomb + Tsetup + Tskew + Tuncertainty))
- **For Hold:**
Slack = (Tcq + Tcomb - (Thold + Tskew + Tuncertainty))
<img width="1920" height="1080" alt="Screenshot (149)" src="https://github.com/user-attachments/assets/c1ac4f54-f2cb-412a-ad7f-c10072ae3908" />

If `Slack ≥ 0` → timing met.  
If `Slack < 0` → violation.

---

## 🔹 Graphical to Textual Conversion
Timing waveforms are represented numerically using:
- **AT (Arrival Time)** – actual time signal reaches capture point.  
- **RAT (Required Arrival Time)** – latest (for setup) or earliest (for hold) allowable arrival.  
- **Slack = RAT – AT**

This enables **automated STA** instead of manual waveform inspection.

---

## 🔹 On-Chip Variation (OCV)
OCV models **timing variation** due to manufacturing process differences, voltage, or temperature across the chip.

- Each path (data or clock) may vary independently.  
- Delays are adjusted using derating factors:

Delay_actual = Nominal_delay × (1 ± derate)


---

## 🔹 OCV-Based Setup & Hold Analysis
- **Setup OCV:**  
- Launch path → faster (– derate)  
- Capture path → slower (+ derate)  
→ Ensures worst-case **late data** arrival.

- **Hold OCV:**  
- Launch path → slower (+ derate)  
- Capture path → faster (– derate)  
→ Ensures worst-case **early data** arrival.

---

## 🔹 Clock Path Effects

### 1. **Clock Push-Out**
- Launch clock arrives **later** (positive skew).  
- Increases setup margin, reduces hold margin.

### 2. **Clock Pull-In**
- Launch clock arrives **earlier** (negative skew).  
- Reduces setup margin, increases hold margin.

### 3. **Clock Path Pessimism (CPPR)**
- Common clock segments may be double-counted as uncertainty.  
- **Clock Path Pessimism Removal (CPPR):**  
Removes shared path delay between launch and capture clocks to reduce pessimism and improve timing accuracy.

---

📘 **Summary**
Setup analysis ensures data arrives **before** capture edge;  
Hold analysis ensures data **stays stable after** capture edge.  
OCV, jitter, and clock path adjustments refine these checks for **real silicon behavior**.


</details>


## Timing Graphs using openSTA

### 📚 Contents


- [Installation of OpenSTA](#installation-of-opensta)
  - [Step 1: Clone the Repository](#step-1-clone-the-repository)
  - [Step 2: Build the Docker Image](#step-2-build-the-docker-image)
  - [Step 3: Run the OpenSTA Container](#step-3-run-the-opensta-container)
- [Timing Analysis Using Inline Commands](#timing-analysis-using-inline-commands)
  - [Analyzing report outcomes](#analyzing-report-outcomes)
  - [SPEF-Based Timing Analysis](#spef-based-timing-analysis)
  - [more options to explore](#more-options-to-explore)
- [Timing Analysis Using a TCL Script](#timing-analysis-using-a-tcl-script)
- [VSDBabySoC basic timing analysis](#vsdbabysoc-basic-timing-analysis)
- [VSDBabySoC PVT Corner Analysis (Post-Synthesis Timing)](#vsdbabysoc-pvt-corner-analysis-post-synthesis-timing)
- [Timing Summary Across PVT Corners (Post-Synthesis STA Results)](#timing-summary-across-pvt-corners-post-synthesis-sta-results)
- [Timing Plots Across PVT Corners](#timing-plots-across-pvt-corners)(GRAPH PENDING)

## Installation of OpenSTA

**Note:** Installation instructions are adapted from the official OpenSTA repository:
🔗 https://github.com/parallaxsw/OpenSTA

#### Step 1: Clone the Repository

```bash
git clone https://github.com/parallaxsw/OpenSTA.git
cd OpenSTA
```


<img width="1920" height="923" alt="VirtualBox_opensource_tool_ubuntu_11_10_2025_11_38_54" src="https://github.com/user-attachments/assets/b35d2a0c-c70f-4616-926e-13d9ce03caa4" />



<img width="1920" height="923" alt="VirtualBox_opensource_tool_ubuntu_11_10_2025_12_32_49" src="https://github.com/user-attachments/assets/7d16ee1e-d291-4db2-a36c-0c242b07f924" />


#### Step 2: Build the Docker Image
```bash
docker build --file Dockerfile.ubuntu22.04 --tag opensta .
```
This builds a Docker image named opensta using the provided Ubuntu 22.04 Dockerfile. All dependencies are installed during this step.

<img width="1920" height="923" alt="VirtualBox_opensource_tool_ubuntu_11_10_2025_12_34_00" src="https://github.com/user-attachments/assets/1a39af82-d795-4658-b5de-aa02de573429" />


#### Step 3: Run the OpenSTA Container
To run a docker container using the OpenSTA image, use the -v option to docker to mount direcories with data to use and -i to run interactively.
```bash
docker run -i -v $HOME:/data opensta
```
<img width="1920" height="923" alt="VirtualBox_opensource_tool_ubuntu_11_10_2025_12_36_46" src="https://github.com/user-attachments/assets/bd78ba1c-3352-4dd8-bfdf-d97c47f8b565" />


You now have OpenSTA installed and running inside a Docker container. After successful installation, you will see the % prompt—this indicates that the OpenSTA interactive shell is ready for use.

### Timing Analysis Using Inline Commands

Once inside the OpenSTA shell (% prompt), you can perform a basic static timing analysis using the following inline commands:
```shell
# Instructs OpenSTA to read and load the Liberty file "nangate45_slow.lib.gz".
read_liberty /OpenSTA/examples/nangate45_slow.lib.gz

# Intructs OpenSTA to read and load the Verilog file (gate level verilog netlist) "example1.v"
read_verilog /OpenSTA/examples/example1.v

# Using "top," which stands for the main module, links the Verilog code with the Liberty timing cells.
link_design top

# Create a 10ns clock named 'clk' for clk1, clk2, and clk3 inputs 
create_clock -name clk -period 10 {clk1 clk2 clk3}

# Set 0ns input delay for inputs in1 and in2 relative to clock 'clk'
set_input_delay -clock clk 0 {in1 in2}

# Report of the timing checks for the design 
report_checks 
```
  
_This flow is useful for quick testing and debugging without writing a full TCL script._




<img width="1920" height="923" alt="VirtualBox_opensource_tool_ubuntu_11_10_2025_12_40_19" src="https://github.com/user-attachments/assets/1c26033a-3a4c-45a3-825c-3a6586c0f977" />


<img width="1920" height="923" alt="VirtualBox_opensource_tool_ubuntu_11_10_2025_13_04_45" src="https://github.com/user-attachments/assets/cd23f9f0-4445-41b0-b139-7aa9e9e98cd4" />




**Note:** We used report_checks here because only the slow liberty file (nangate45_slow.lib.gz) is loaded. 

This represents a setup (max delay) corner, so the analysis focuses on setup timing by default.

🤔**Why Does report_checks Show Only Max (Setup) Paths?**

By default, report_checks reports -path_delay max (i.e., setup checks).

OpenSTA interprets report_checks without arguments as:
```shell
report_checks -path_delay max
```
This reports only max path delays, i.e., setup timing checks.

✅**How to Also Get Hold (min) Paths:**

If you want both setup and hold timing checks (i.e., both max and min path delays), use:
```shell
report_checks -path_delay min_max
```
(Or) if you want to see only hold checks (min path delays):
```shell
report_checks -path_delay min

#### SPEF-Based Timing Analysis

Here’s the same OpenSTA timing analysis flow with added SPEF-based parasitic modeling:

This enables **more realistic delay and slack computation** by including post-layout RC data, improving timing signoff precision.

```shell
docker run -i -v $HOME:/data opensta
```

```shell
read_liberty /OpenSTA/examples/nangate45_slow.lib.gz
read_verilog /OpenSTA/examples/example1.v
link_design top
read_spef /OpenSTA/examples/example1.dspef
create_clock -name clk -period 10 {clk1 clk2 clk3}
set_input_delay -clock clk 0 {in1 in2}
report_checks
```
<img width="1920" height="923" alt="VirtualBox_opensource_tool_ubuntu_11_10_2025_13_05_05" src="https://github.com/user-attachments/assets/8af5efa9-2419-45a2-a0f1-b5bacfd8369d" />



### Timing Analysis Using a TCL Script

To automate the timing flow, you can write the commands into a .tcl script and execute it from the OpenSTA shell.

<details>
<summary><strong>min_max_delays.tcl</strong></summary>

```shell
# Load liberty files for max and min analysis
read_liberty -max /data/VLSI/VSDBabySoC/OpenSTA/examples/nangate45_slow.lib.gz
read_liberty -min /data/VLSI/VSDBabySoC/OpenSTA/examples/nangate45_fast.lib.gz

# Read the gate-level Verilog netlist
read_verilog /data/VLSI/VSDBabySoC/OpenSTA/examples/example1.v

# Link the top-level design
link_design top

# Define clocks and input delays
create_clock -name clk -period 10 {clk1 clk2 clk3}
set_input_delay -clock clk 0 {in1 in2}

# Generate a full min/max timing report
report_checks -path_delay min_max
```
</details>

| **Line of Code**                                     | **Purpose**             | **Explanation**                                                                              |
| ---------------------------------------------------- | ----------------------- | -------------------------------------------------------------------------------------------- |
| `read_liberty -max nangate45_slow.lib.gz`            | Load max delay library  | Loads the **slow corner Liberty file** for **setup (max delay)** analysis.                   |
| `read_liberty -min nangate45_fast.lib.gz`            | Load min delay library  | Loads the **fast corner Liberty file** for **hold (min delay)** analysis.                    |
| `read_verilog example1.v`                            | Load gate-level netlist | Reads the synthesized **Verilog netlist** of the design.                                     |
| `link_design top`                                    | Link design             | Links the netlist using `top` as the **top-level module**, connecting it with Liberty cells. |
| `create_clock -name clk -period 10 {clk1 clk2 clk3}` | Create clock            | Defines a **clock named `clk`** with a 10 ns period on ports `clk1`, `clk2`, and `clk3`.     |
| `set_input_delay -clock clk 0 {in1 in2}`             | Set input delay         | Applies **0 ns input delay** relative to `clk` for inputs `in1` and `in2`.                   |
| `report_checks -path_delay min_max`                  | Run full STA            | Reports both **setup (max)** and **hold (min)** timing paths and checks.                     |

#### Run the Script Using Docker

To run this script non-interactively using Docker:

```shell
docker run -it -v $HOME:/data opensta /data/VLSI/VSDBabySoC/OpenSTA/examples/min_max_delays.tcl
```

🤔**Why use the full path?**

Inside the Docker container, your $HOME directory from the host system is mounted as /data.

_So a file located at `$HOME/VLSI/VSDBabySoC/OpenSTA/examples/min_max_delays.tcl` on your machine becomes accessible at `/data/VLSI/VSDBabySoC/OpenSTA/examples/min_max_delays.tcl` inside the container._

This absolute path ensures that OpenSTA can locate and execute the script correctly within the container's file system.

This method ensures repeatability and makes it easy to maintain reusable timing analysis setups for your designs.
### VSDBabySoC basic timing analysis

#### Prepare Required Files

To begin static timing analysis on the VSDBabySoC design, you must organize and prepare the required files in specific directories.

```bash
# Create a directory to store Liberty timing libraries
devichinni20@devi-VirtualBox:~/VLSI/VSDBabySoC/OpenSTA$ mkdir -p examples/timing_libs/
devichinni20@devi-VirtualBox:~/VLSI/VSDBabySoC/OpenSTA/examples$ ls timing_libs/
avsddac.lib  avsdpll.lib  sky130_fd_sc_hd__tt_025C_1v80.lib

# Create a directory to store synthesized netlist and constraint files
devichinni20@devi-VirtualBox:~/VLSI/VSDBabySoC/OpenSTA$ mkdir -p examples/BabySoC
devichinni20@devi-VirtualBox:~/VLSI/VSDBabySoC/OpenSTA/examples$ ls BabySoC/
gcd_sky130hd.sdc vsdbabysoc_synthesis.sdc  vsdbabysoc.synth.v
```
These files include:

- Standard cell library: sky130_fd_sc_hd__tt_025C_1v80.lib

- IP-specific Liberty libraries: avsdpll.lib, avsddac.lib

- Synthesized gate-level netlist: vsdbabysoc.synth.v

- Timing constraints: vsdbabysoc_synthesis.sdc

Below is the TCL script to run complete min/max timing checks on the SoC:

<details>
<summary><strong>vsdbabysoc_min_max_delays.tcl</strong></summary>
  
  
```shell
# Load Liberty Libraries (standard cell + IPs)
read_liberty -min /data/VLSI/VSDBabySoC/OpenSTA/examples/timing_libs/sky130_fd_sc_hd__tt_025C_1v80.lib
read_liberty -max /data/VLSI/VSDBabySoC/OpenSTA/examples/timing_libs/sky130_fd_sc_hd__tt_025C_1v80.lib

read_liberty -min /data/VLSI/VSDBabySoC/OpenSTA/examples/timing_libs/avsdpll.lib
read_liberty -max /data/VLSI/VSDBabySoC/OpenSTA/examples/timing_libs/avsdpll.lib

read_liberty -min /data/VLSI/VSDBabySoC/OpenSTA/examples/timing_libs/avsddac.lib
read_liberty -max /data/VLSI/VSDBabySoC/OpenSTA/examples/timing_libs/avsddac.lib

# Read Synthesized Netlist
read_verilog /data/VLSI/VSDBabySoC/OpenSTA/examples/BabySoC/vsdbabysoc.synth.v

# Link the Top-Level Design
link_design vsdbabysoc

# Apply SDC Constraints
read_sdc /data/VLSI/VSDBabySoC/OpenSTA/examples/BabySoC/vsdbabysoc_synthesis.sdc

# Generate Timing Report
report_checks
```

</details>

| **Line of Code**                                       | **Purpose**                | **Explanation**                                                                                    |
| ------------------------------------------------------ | -------------------------- | -------------------------------------------------------------------------------------------------- |
| `read_liberty -min ...sky130...` & `-max ...sky130...` | Load standard cell library | Loads the **typical PVT corner** for both min (hold) and max (setup) timing analysis.              |
| `read_liberty -min/-max avsdpll.lib`                   | Load PLL IP Liberty        | Includes Liberty timing views of the **PLL IP** used in the design.                                |
| `read_liberty -min/-max avsddac.lib`                   | Load DAC IP Liberty        | Includes Liberty timing views of the **DAC IP** used in the design.                                |
| `read_verilog vsdbabysoc.synth.v`                      | Load synthesized netlist   | Loads the gate-level Verilog netlist of the **VSDBabySoC** design.                                 |
| `link_design vsdbabysoc`                               | Link top-level module      | Links the hierarchy using `vsdbabysoc` as the **top module** for timing analysis.                  |
| `read_sdc vsdbabysoc_synthesis.sdc`                    | Load constraints           | Loads SDC file specifying **clock definitions, input/output delays, and false paths**.             |
| `report_checks`                                        | Run timing analysis        | Generates a default **setup timing report**. Add `-path_delay min_max` to see both hold and setup. |

execute it inside the Docker container:

```shell
docker run -it -v $HOME:/data opensta /data/VLSI/VSDBabySoC/OpenSTA/examples/BabySoC/vsdbabysoc_min_max_delays.tcl
```
⚠️ **Possible Error Alert**

You may encounter the following error when running the script:

```shell
Warning: /data/VLSI/VSDBabySoC/OpenSTA/examples/timing_libs/sky130_fd_sc_hd__tt_025C_1v80.lib line 23, default_fanout_load is 0.0.
Warning: /data/VLSI/VSDBabySoC/OpenSTA/examples/timing_libs/sky130_fd_sc_hd__tt_025C_1v80.lib line 1, library sky130_fd_sc_hd__tt_025C_1v80 already exists.
Warning: /data/VLSI/VSDBabySoC/OpenSTA/examples/timing_libs/sky130_fd_sc_hd__tt_025C_1v80.lib line 23, default_fanout_load is 0.0.
Error: /data/VLSI/VSDBabySoC/OpenSTA/examples/timing_libs/avsdpll.lib line 54, syntax error
```
<img width="1920" height="923" alt="VirtualBox_opensource_tool_ubuntu_11_10_2025_23_49_18" src="https://github.com/user-attachments/assets/e368d79f-19da-4247-9847-783f8efff52d" />


✅ **Fix:**

This error occurs because Liberty syntax does not support // for single-line comments, and more importantly, the { character appearing after // confuses the Liberty parser. Specifically, check around _line 54 of avsdpll.lib_ and correct any syntax issues such as:

```shell
//pin (GND#2) {
//  direction : input;
//  max_transition : 2.5;
//  capacitance : 0.001;
//}
```
✔️ **Replace with:**
```shell
/*
pin (GND#2) {
  direction : input;
  max_transition : 2.5;
  capacitance : 0.001;
}
*/
```
This should allow OpenSTA to parse the Liberty file without throwing syntax errors.

After fixing the Liberty file comment syntax as shown above, you can rerun the script to perform complete timing analysis for VSDBabySoC:

### VSDBabySoC PVT Corner Analysis (Post-Synthesis Timing)
Static Timing Analysis (STA) is performed across various **PVT (Process-Voltage-Temperature)** corners to ensure the design meets timing requirements under different conditions.

### Critical Timing Corners

**Worst Max Path (Setup-critical) Corners:**
- `ss_LowTemp_LowVolt`
- `ss_HighTemp_LowVolt`  
_These represent the **slowest** operating conditions._

**Worst Min Path (Hold-critical) Corners:**
- `ff_LowTemp_HighVolt`
- `ff_HighTemp_HighVolt`  
_These represent the **fastest** operating conditions._

 **Timing libraries** required for this analysis can be downloaded from:  
🔗 [Skywater PDK - sky130_fd_sc_hd Timing Libraries](https://github.com/efabless/skywater-pdk-libs-sky130_fd_sc_hd/tree/master/timing)

Below is the script that can be used to perform STA across the PVT corners for which the Sky130 Liberty files are available.

<details>
<summary><strong>sta_across_pvt.tcl</strong></summary>

```shell
 set list_of_lib_files(1) "sky130_fd_sc_hd__tt_025C_1v80.lib"
 set list_of_lib_files(2) "sky130_fd_sc_hd__ff_100C_1v65.lib"
 set list_of_lib_files(3) "sky130_fd_sc_hd__ff_100C_1v95.lib"
 set list_of_lib_files(4) "sky130_fd_sc_hd__ff_n40C_1v56.lib"
 set list_of_lib_files(5) "sky130_fd_sc_hd__ff_n40C_1v65.lib"
 set list_of_lib_files(6) "sky130_fd_sc_hd__ff_n40C_1v76.lib"
 set list_of_lib_files(7) "sky130_fd_sc_hd__ss_100C_1v40.lib"
 set list_of_lib_files(8) "sky130_fd_sc_hd__ss_100C_1v60.lib"
 set list_of_lib_files(9) "sky130_fd_sc_hd__ss_n40C_1v28.lib"
 set list_of_lib_files(10) "sky130_fd_sc_hd__ss_n40C_1v35.lib"
 set list_of_lib_files(11) "sky130_fd_sc_hd__ss_n40C_1v40.lib"
 set list_of_lib_files(12) "sky130_fd_sc_hd__ss_n40C_1v44.lib"
 set list_of_lib_files(13) "sky130_fd_sc_hd__ss_n40C_1v76.lib"

 read_liberty /data/VLSI/VSDBabySoC/OpenSTA/examples/timing_libs/avsdpll.lib
 read_liberty /data/VLSI/VSDBabySoC/OpenSTA/examples/timing_libs/avsddac.lib

 for {set i 1} {$i <= [array size list_of_lib_files]} {incr i} {
 read_liberty /data/VLSI/VSDBabySoC/OpenSTA/examples/timing_libs/$list_of_lib_files($i)
 read_verilog /data/VLSI/VSDBabySoC/OpenSTA/examples/BabySoC/vsdbabysoc.synth.v
 link_design vsdbabysoc
 current_design
 read_sdc /data/VLSI/VSDBabySoC/OpenSTA/examples/BabySoC/vsdbabysoc_synthesis.sdc
 check_setup -verbose
 report_checks -path_delay min_max -fields {nets cap slew input_pins fanout} -digits {4} > /data/VLSI/VSDBabySoC/OpenSTA/examples/BabySoC/STA_OUTPUT/min_max_$list_of_lib_files($i).txt

 exec echo "$list_of_lib_files($i)" >> /data/VLSI/VSDBabySoC/OpenSTA/examples/BabySoC/STA_OUTPUT/sta_worst_max_slack.txt
 report_worst_slack -max -digits {4} >> /data/VLSI/VSDBabySoC/OpenSTA/examples/BabySoC/STA_OUTPUT/sta_worst_max_slack.txt

 exec echo "$list_of_lib_files($i)" >> /data/VLSI/VSDBabySoC/OpenSTA/examples/BabySoC/STA_OUTPUT/sta_worst_min_slack.txt
 report_worst_slack -min -digits {4} >> /data/VLSI/VSDBabySoC/OpenSTA/examples/BabySoC/STA_OUTPUT/sta_worst_min_slack.txt

 exec echo "$list_of_lib_files($i)" >> /data/VLSI/VSDBabySoC/OpenSTA/examples/BabySoC/STA_OUTPUT/sta_tns.txt
 report_tns -digits {4} >> /data/VLSI/VSDBabySoC/OpenSTA/examples/BabySoC/STA_OUTPUT/sta_tns.txt

 exec echo "$list_of_lib_files($i)" >> /data/VLSI/VSDBabySoC/OpenSTA/examples/BabySoC/STA_OUTPUT/sta_wns.txt
 report_wns -digits {4} >> /data/VLSI/VSDBabySoC/OpenSTA/examples/BabySoC/STA_OUTPUT/sta_wns.txt
 }
```

</details>

| **Command**               | **Purpose**                       | **Explanation**                                                                                                              |
| ------------------------- | --------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| `report_worst_slack -max` | Report Worst Setup Slack          | Outputs the **most negative setup slack** (WNS) in the design for the current PVT corner.                                    |
| `report_worst_slack -min` | Report Worst Hold Slack           | Outputs the **most negative hold slack** in the design for the current PVT corner.                                           |
| `report_tns`              | Report Total Negative Slack (TNS) | Prints the **sum of all negative slacks** (across all violating paths). Reflects how widespread timing violations are.       |
| `report_wns`              | Report Worst Negative Slack (WNS) | Prints the **single worst slack** (i.e., the most timing-violating path). Indicates severity of the critical path violation. |

execute it inside the Docker container:

```shell
docker run -it -v $HOME:/data opensta /data/VLSI/VSDBabySoC/OpenSTA/examples/BabySoC/sta_across_pvt.tcl
```

After executing the above script, you can find the generated timing reports in the STA_OUTPUT directory:
```shell
devichinni20@devi:Virtual Box:~/VLSI/VSDBabySoC/OpenSTA/examples/BabySoC/STA_OUTPUT$ ls
min_max_sky130_fd_sc_hd__ff_100C_1v65.lib.txt  min_max_sky130_fd_sc_hd__ss_100C_1v40.lib.txt  min_max_sky130_fd_sc_hd__ss_n40C_1v44.lib.txt  sta_worst_max_slack.txt
min_max_sky130_fd_sc_hd__ff_100C_1v95.lib.txt  min_max_sky130_fd_sc_hd__ss_100C_1v60.lib.txt  min_max_sky130_fd_sc_hd__ss_n40C_1v76.lib.txt  sta_worst_min_slack.txt
min_max_sky130_fd_sc_hd__ff_n40C_1v56.lib.txt  min_max_sky130_fd_sc_hd__ss_n40C_1v28.lib.txt  min_max_sky130_fd_sc_hd__tt_025C_1v80.lib.txt
min_max_sky130_fd_sc_hd__ff_n40C_1v65.lib.txt  min_max_sky130_fd_sc_hd__ss_n40C_1v35.lib.txt  sta_tns.txt
min_max_sky130_fd_sc_hd__ff_n40C_1v76.lib.txt  min_max_sky130_fd_sc_hd__ss_n40C_1v40.lib.txt  sta_wns.txt
```

| **File**                  | **Description**                                                     |
| ------------------------- | ------------------------------------------------------------------- |
| `min_max_<lib>.txt`       | Detailed timing report for setup and hold paths for each PVT corner |
| `sta_worst_max_slack.txt` | Worst setup slack values across all corners                         |
| `sta_worst_min_slack.txt` | Worst hold slack values across all corners                          |
| `sta_tns.txt`             | Total negative slack values across all corners                      |
| `sta_wns.txt`             | Worst negative slack values across all corners                      |


#### Timing Summary Across PVT Corners (Post-Synthesis STA Results)
The following timing summary table was collected by running STA across 13 PVT corners using OpenSTA. 

Metrics such as Worst Hold Slack, Worst Setup Slack, WNS, and TNS were extracted from the output reports.



## Part 3: Implementation of BabySoC Physical Design

<details>
  <summary>
 THEORY
  </summary>

# PHYSICAL DESIGN (RTL2GDS FLOW)
<img width="1018" height="458" alt="image" src="https://github.com/user-attachments/assets/4789c44e-9396-4ede-b1f7-a5bac01a0f76" />
<img width="1023" height="93" alt="image" src="https://github.com/user-attachments/assets/a6f20dc6-76a0-4f1d-9f44-733af9bfac48" />

## Inception of open-source EDA, OpenLANE and Sky130 PDK 
  
  #### Package

* In any embedded board we have seen, the part of the board we consider as the chip is only the ***PACKAGE*** of the chip which is nothing but a protective layer or packet bound over the actual chip and the actual manufatured chip is usually present at the center of a package wherein, the connections from package is fed to the chip by ***WIRE BOUND*** method which is none other than basic wired connection.
<img width="1920" height="1080" alt="Screenshot (225)" src="https://github.com/user-attachments/assets/813cdc24-e0af-4c6c-a259-3ca1a7b5d903" />



#### Chip

* Now, taking a look inside the chip, all the signals from the external world to the chip and vice versa is passed through ***PADS***. The area bound by the pads is ***CORE*** where all the digital logic of the chip is placed. Both the core and pads make up the ***DIE*** which is the basic manufacturing unit in regards to semiconductor chips.

<img width="1920" height="1080" alt="Screenshot (226)" src="https://github.com/user-attachments/assets/5043c5dd-b998-47de-b729-91b7600d0349" />

<img width="1920" height="1080" alt="Screenshot (227)" src="https://github.com/user-attachments/assets/d1fd3ccb-675e-41d6-b8fc-910ea257cd1d" />

<img width="1920" height="1080" alt="Screenshot (228)" src="https://github.com/user-attachments/assets/b6517494-4483-4642-8a90-8bf6850e8c35" />



* ***FOUNDRY*** is the place where the semiconductor chips are manufactured and ***FOUNDRY IP's*** are Intellectual Properties based on a specific foundry and these IP's require a specific level of intelligence to be produced whereas, repeatable digital logic blocks are called ***MACROS***.


<img width="1920" height="1080" alt="Screenshot (229)" src="https://github.com/user-attachments/assets/23ffc29e-e62a-4dda-a96b-d06047fe2885" />

<img width="1920" height="1080" alt="Screenshot (230)" src="https://github.com/user-attachments/assets/e832ce18-14e5-47ad-8a8a-211c639b75c4" />


#### ISA (Intruction Set Architecture)

* A C program which has to be run on a specific hardware layout which is the interior of a chip in your laptop, there is certain flow to be followed.
* Initially, this particular C program is compiled in it's assembly language program which is nothing but ***RISC-V ISA (Reduced Instruction Set Compting - V Intruction Set Architecture)***.
* Following this, the assembly language program is then converted to machine language program which is the binary language logic 0 and 1 which is understood by the hardware of the computer.
* Directly after this, we've to implement this RISC-V specification using some ***RTL (a Hardware Description Language)***. Finally, from the RTL to ***Layout*** it is a standard PnR or RTL to GDSII flow.


<img width="1920" height="1080" alt="Screenshot (231)" src="https://github.com/user-attachments/assets/1a12eeb1-a99c-4253-82f4-8b2adcdd07ea" />



* For an application software to be run on a hardware there are several processes taking place. To begin with, the apps enters into a block called system software and it converts the application program to binary language. There are various layers in system software in which the major layers or components are OS (Operating System), Compiler and Assembler.
* At first the OS outputs are small function in C, C++, VB or Java language which are taken by the respective compiler and converted into instructions and the syntax of these instructions varies with the hardware architecture on which the system is implemented.
* Then, the job of the assembler is to take these instructions and convert it into it's binary format which is basically called as a machine language program. Finally, this binary language is fed to the hardware and it understands the specific functions it has to perform based on the binary code it receives.
<img width="1920" height="1080" alt="Screenshot (232)" src="https://github.com/user-attachments/assets/df707b86-b84c-449b-aea3-e0f85169adf8" />






* For example, if we take a stopwatch app on RISC-V core, then the output of the OS could be a small C function which enters into the compiler and we get output RISC-V instructions following this, the output of the assembler will be the binary code which enters into your chip layout.


<img width="1920" height="1080" alt="Screenshot (234)" src="https://github.com/user-attachments/assets/d3bc947f-5d05-4070-881c-7cc940f41593" />


 For the above stopwatch the following are the input and output of the compiler and assembler.
<img width="776" height="444" alt="image" src="https://github.com/user-attachments/assets/70967e2b-fc4d-4eef-a30b-810f0fb44ec5" />




* The output of the compiler are instructions and the output of the assembler is the binary pattern. Now, we need some RTL (a Hardware Description Language) which understands and implements the particular instructions. Then, this RTL is synthesised into a netlist in form of gates which is fabricated into the chip through a physical design implementation.

<img width="1920" height="1080" alt="Screenshot (235)" src="https://github.com/user-attachments/assets/c597b1f0-2be9-45b5-92ce-b2b52433d042" />

<img width="1920" height="1080" alt="Screenshot (236)" src="https://github.com/user-attachments/assets/5a26d3ff-b6b5-43ce-a402-0bd9388f0690" />




* There are mainly 3 different parts in this course. They are:
1. RISC-V ISA
2. RTL and synthesis of RISC-V based CPU core - picorv32
3. Physical design implementation of picorv32

<img width="778" height="450" alt="image" src="https://github.com/user-attachments/assets/25dadcf1-ac25-473e-8f85-fd05cc915c93" />



#### Open-source Implementation

* For open-source ASIC design implemantation, we require the following enablers to be readily available as open-source versions. They are:-
1. RTL Designs
2. EDA Tools
3. PDK Data
<img width="1920" height="1080" alt="Screenshot (237)" src="https://github.com/user-attachments/assets/aefff7b6-55c5-49d5-8fd0-3986b7da7e9e" />


* Initially in the early ages, the design and fabrication of IC's were tightly coupled and were only practiced by very few companies like TI, Intel, etc.
* In 1979, Lynn Conway and Carver Mead came up with an idea to saperate the design from the fabrication and to do this they inroduced structured design methodologies based on the λ-based design rules and published the first VLSI book "Introduction to VLSI System" which started the VLSI education.
* This methodology resulted in the emergence of the design only companies or ***"Fabless Companies"*** and fabrication only companies that we usually refer to as ***"Pure Play Fabs"***.
* The inteface between the designers and the fab by now became a set of data files and documents, that are reffered to as the ***"Process Design Kits (PDKs)"***.
* The PDK include but not limited to Device Models, Technology Information, Design Rules, Digital Standard Cell Libraries, I/O Libraries and many more.
* Since, the PDK contained variety of informations, and so they were distributed only under NDAs (Non-Disclosure Agreements) which made it in-accessible to the public.
* Recently, Google worked out an agreement with skywater to open-source the PDK for the 130nm process by skywater Technology, as a result on 30 June 2020 Google released the first ever open-source PDK.

<img width="805" height="429" alt="image" src="https://github.com/user-attachments/assets/2efdc7c3-6b1a-4733-b7d6-a925eb59ae98" />




* ASIC design is a complex step that involves tons of steps, various methodologies and respective EDA tools which are all required for successful ASIC implementation which is achieved though an ASIC flow which is nothing but a piece of software that pulls different tools togather to carry out the design process.

<img width="1920" height="1080" alt="Screenshot (240)" src="https://github.com/user-attachments/assets/48829eb1-4b87-4d89-bd94-4026957e75d9" />

#### OpenLANE Open-source ASIC Design Implementation Flow

* The main objective of the ASIC Design Flow is to take the design from the RTL (Register Transfer Level) all the way to the GDSII, which is the format used for the final fabrication layout.

<img width="1920" height="1080" alt="Screenshot (241)" src="https://github.com/user-attachments/assets/7bf08217-08ea-486e-a462-8a1be5df6d63" />

* Synthesis is the process of convertion or translation of design RTL into circuits made out of Standard Cell Libraries (SCL) the resultant circuit is described in HDL and is usually reffered to as the Gate-Level Netlist.
* Gate-Level Netlist is functionally equivalent to the RTL.
<img width="1732" height="526" alt="Screenshot 2025-10-28 192530" src="https://github.com/user-attachments/assets/d317a8f3-e98e-4e8f-a420-dcc296776160" />


* The fundemental building blocks which are the standard cells have regular layouts.
* Each cell has different views/models which are utilised by different EDA tools like liberty view with electrical models of the cells, HDL behavioral models, SPICE or CDL views of the cells, Layout view which include GDSII view which is the detailed view and LEF view which is the abstract view.
<img width="1192" height="448" alt="Screenshot 2025-10-28 193039" src="https://github.com/user-attachments/assets/60ac3b39-1d0a-42e0-85b0-99f3ce7f4970" />



* Chip Floor Planning

<img width="1920" height="1080" alt="Screenshot (242)" src="https://github.com/user-attachments/assets/6108a29a-2cc5-4a5b-9784-6a29ab9dc675" />

* Macro Floor Planning
<img width="1121" height="439" alt="Screenshot 2025-10-29 000246" src="https://github.com/user-attachments/assets/0b29cd47-7d31-4108-bc2e-b1fe5cd3ae8f" />


* Power Planning typically uses upper metal layers for power distribution since thay are thicker than lower metal layers and so have lower resistance and PP is done to avoid electron migration and IR drops.
<img width="1034" height="461" alt="Screenshot 2025-10-29 000305" src="https://github.com/user-attachments/assets/c3c346d1-35ea-4bcf-aa21-bb386c595e55" />


* Placement
<img width="1920" height="1080" alt="Screenshot (243)" src="https://github.com/user-attachments/assets/e08a4ab0-5289-4984-9ac9-80b282ad50ad" />


* Global placement provide approximate locations for all cells based on connectivity but in this stage the cells may be overlapped on each other and in detailed placement the positions obtained from global placements are minimally altered to make it legal (non-overlapping and in site-rows)
<img width="1095" height="467" alt="Screenshot 2025-10-29 001138" src="https://github.com/user-attachments/assets/b89f48f0-4539-4f3e-9807-e4bcbe228fc7" />



* Clock Tree Synthesis

<img width="1920" height="1080" alt="Screenshot (244)" src="https://github.com/user-attachments/assets/8494515d-b6ad-4773-acbf-6f7fe94e6db3" />


* Clock skew is the time difference in arrival of clock at different components.
* Routing
<img width="1920" height="1080" alt="Screenshot (246)" src="https://github.com/user-attachments/assets/9ae0f046-c05b-4db4-a0d2-3faeb314d5cc" />


* skywater PDK has 6 routing layers in which the lowest layer is called the local interconnect layer which is a Titanium Nitride layer the following 5 layers are all Aluminium layers.

<img width="801" height="661" alt="image" src="https://github.com/user-attachments/assets/dfd14b0a-e5a7-4cae-9fff-4d917ba3d43a" />

* Global and Detailed Routing
<img width="1095" height="467" alt="Screenshot 2025-10-29 001138" src="https://github.com/user-attachments/assets/e36135e6-9359-422d-a5b1-375de0f08cb4" />

<img width="1154" height="442" alt="Screenshot 2025-10-29 002455" src="https://github.com/user-attachments/assets/0936fbc3-26b5-4f20-93e4-16e5087b64d8" />

* Once done with the routing the final layout can be generated which undergoes various Sign-Off checks.
* Design Rules Checking (DRC) which verifies that the final layout honours all design fabrication rules.
* Layout Vs Schematic (LVS) which verifies that the final layout functionality matches the gate-level netlist that we started with.
* Static Timing Analysis (STA) to verify that the design runs at the designated clock frequency.
<img width="1920" height="1080" alt="Screenshot (248)" src="https://github.com/user-attachments/assets/0dd6c6ef-6cd5-448e-985c-d4339dcc86ad" />

* OPENLANE
OpenLane is an open-source digital ASIC design flow that automates the process from RTL to GDSII (chip layout). It integrates several tools like Yosys, OpenROAD, Magic, and KLayout to perform synthesis, floorplanning, placement, routing, and signoff checks.
It’s widely used for academic and research purposes to design and tape-out chips using open-source PDKs such as SkyWater 130nm (Sky130).

<img width="1920" height="1080" alt="Screenshot (249)" src="https://github.com/user-attachments/assets/31e15d15-d5dc-4f2a-b9d6-b1f6a73ddb9e" />


<img width="1920" height="1080" alt="Screenshot (250)" src="https://github.com/user-attachments/assets/a0de2fb4-af8f-4c2d-bad4-baec70ce5a5b" />

<img width="1920" height="1080" alt="Screenshot (251)" src="https://github.com/user-attachments/assets/62d68625-d7b4-41b8-9a61-c48d9a87e1a6" />


<img width="1536" height="864" alt="Screenshot (252)" src="https://github.com/user-attachments/assets/142fb8fd-3a78-433e-b839-0297b3f85c7f" />

 ## OpenLane ASIC Design Flow

The OpenLane flow automates the complete RTL-to-GDSII process for ASIC design using open-source tools. It covers all major design stages — from logic synthesis to final layout generation — ensuring Design Rule Check (DRC) and Layout vs. Schematic (LVS) clean results.

 ## Major Stages in the Flow:

Synthesis – Converts RTL (Verilog) into a gate-level netlist using Yosys.

Floorplanning – Defines chip area, power grid, and placement regions.

Placement – Places standard cells optimally using OpenROAD.

Clock Tree Synthesis (CTS) – Builds a balanced clock distribution network.

Routing – Connects all placed cells following design rules.

Physical Verification – Performs DRC and LVS checks using Magic and Netgen.

GDSII Generation – Produces the final mask layout file for fabrication.

<img width="1920" height="1080" alt="Screenshot (253)" src="https://github.com/user-attachments/assets/2e2a5a00-d3a2-48b7-ba8e-40178ffedc20" />


<img width="1920" height="1080" alt="Screenshot (254)" src="https://github.com/user-attachments/assets/44203437-d539-4c5f-9de3-1b08a916e421" />

<img width="1920" height="1080" alt="Screenshot (255)" src="https://github.com/user-attachments/assets/978529ba-5f1d-4f47-a4ce-d3bf929551d8" />


<img width="1920" height="1080" alt="Screenshot (256)" src="https://github.com/user-attachments/assets/9b32c8c7-cdaa-4a6c-bfc4-f88d6dc45d5d" />

<img width="1920" height="1080" alt="Screenshot (257)" src="https://github.com/user-attachments/assets/473afd04-bfea-4df2-a813-bf380b8e5c1b" />


<img width="1920" height="1080" alt="Screenshot (258)" src="https://github.com/user-attachments/assets/53c1a484-db32-4b4b-a7a7-2c2c472a4e41" />


<img width="1920" height="1080" alt="Screenshot (259)" src="https://github.com/user-attachments/assets/39dd9889-18d1-44ca-b832-c335156c91b7" />
<img width="1920" height="1080" alt="Screenshot (260)" src="https://github.com/user-attachments/assets/7adda883-9019-4047-b1e8-9488a87ba780" />
<img width="1920" height="1080" alt="Screenshot (261)" src="https://github.com/user-attachments/assets/928bf520-85ac-442d-922e-49243daaa8f4" />

<img width="1920" height="1080" alt="Screenshot (262)" src="https://github.com/user-attachments/assets/7d70e54b-68a0-412a-a5b1-44ea746d5ecc" />
<img width="1920" height="1080" alt="Screenshot (263)" src="https://github.com/user-attachments/assets/67f5a23f-6398-4f3b-b42e-b4076ec3f442" />


##  Good floorplan vs bad floorplan and introduction to library cells 


<img width="1920" height="1080" alt="Screenshot (264)" src="https://github.com/user-attachments/assets/e0478ef9-b2b6-4e81-9602-744cf7c5f39b" />
<img width="1920" height="1080" alt="Screenshot (265)" src="https://github.com/user-attachments/assets/44631b06-ef5d-4e54-b03b-6642fdd66b57" />
<img width="1920" height="1080" alt="Screenshot (266)" src="https://github.com/user-attachments/assets/1a70e625-de23-4860-bf8a-7713e66e7f0b" />
<img width="1920" height="1080" alt="Screenshot (267)" src="https://github.com/user-attachments/assets/d52a0b12-22f5-4690-b266-a783a27e3209" />

<img width="1920" height="1080" alt="Screenshot (268)" src="https://github.com/user-attachments/assets/24f2784c-e62b-4c25-9017-dbf4289bb687" />

<img width="1920" height="1080" alt="Screenshot (269)" src="https://github.com/user-attachments/assets/0d466fee-aab7-41dd-a32b-cfb87503d9c3" />

<img width="1920" height="1080" alt="Screenshot (270)" src="https://github.com/user-attachments/assets/3a0bd81e-8858-418e-ae81-d5eb922ce683" />
<img width="1920" height="1080" alt="Screenshot (271)" src="https://github.com/user-attachments/assets/e7b5c9eb-feaa-46ed-86a2-bbcfe79bc23c" />
<img width="1920" height="1080" alt="Screenshot (272)" src="https://github.com/user-attachments/assets/395f9bb0-abfa-4335-aeeb-03438c7be908" />
<img width="1920" height="1080" alt="Screenshot (273)" src="https://github.com/user-attachments/assets/e3d8d7c6-2aa4-4b48-89ae-092061198350" />
<img width="1920" height="1080" alt="Screenshot (274)" src="https://github.com/user-attachments/assets/9d80bbaa-c9ad-4a46-b99f-a1c3bf7ffe0f" />

<img width="1920" height="1080" alt="Screenshot (275)" src="https://github.com/user-attachments/assets/8c3d519d-e38f-4f71-bed0-2cb3ed0ef00e" />
<img width="1920" height="1080" alt="Screenshot (276)" src="https://github.com/user-attachments/assets/4430cd21-462a-44b3-a219-86a7fd9ebd52" />

<img width="1920" height="1080" alt="Screenshot (277)" src="https://github.com/user-attachments/assets/1bd3984f-3162-46c1-8e38-da17357d3de2" />
<img width="1920" height="1080" alt="Screenshot (278)" src="https://github.com/user-attachments/assets/85a87e97-3515-44a8-ac04-0f9f03e34433" />

<img width="1920" height="1080" alt="Screenshot (279)" src="https://github.com/user-attachments/assets/6fd1890b-0e0e-46a3-b532-cd8b48bd9c88" />

<img width="1920" height="1080" alt="Screenshot (280)" src="https://github.com/user-attachments/assets/e83787cd-08c0-4493-9d15-ceb5eaa2571e" />
<img width="1920" height="1080" alt="Screenshot (281)" src="https://github.com/user-attachments/assets/594c30ea-4ff8-4c84-a1fa-2fb4f5831f65" />
<img width="1920" height="1080" alt="Screenshot (283)" src="https://github.com/user-attachments/assets/124a8320-2af8-4148-9507-59b97f836d80" />

<img width="1920" height="1080" alt="Screenshot (285)" src="https://github.com/user-attachments/assets/f56ad165-915e-4153-aafe-99b534de6649" />


<img width="1920" height="1080" alt="Screenshot (287)" src="https://github.com/user-attachments/assets/22aaf824-35fa-43d4-9b1f-e46fb745a200" />

<img width="1920" height="1080" alt="Screenshot (289)" src="https://github.com/user-attachments/assets/d970c0ff-7db2-485f-b10c-2d602c912614" />
<img width="1920" height="1080" alt="Screenshot (290)" src="https://github.com/user-attachments/assets/435b648a-0341-43c6-a314-19f33d9bc960" />

<img width="1920" height="1080" alt="Screenshot (292)" src="https://github.com/user-attachments/assets/8b352953-3748-4455-b2e6-733f0a4e5760" />


<img width="1920" height="1080" alt="Screenshot (296)" src="https://github.com/user-attachments/assets/62e8805d-7eb8-4424-bdc9-d76f423cdc33" />
<img width="1920" height="1080" alt="Screenshot (297)" src="https://github.com/user-attachments/assets/b1d23179-8406-4cbe-a026-11436e449779" />
<img width="1920" height="1080" alt="Screenshot (298)" src="https://github.com/user-attachments/assets/573fcf68-3cee-484c-8fc2-d1a99157a6d4" />


<img width="1920" height="1080" alt="Screenshot (300)" src="https://github.com/user-attachments/assets/dc69232d-0759-4d52-b8e0-c30185652ea3" />

<img width="1920" height="1080" alt="Screenshot (301)" src="https://github.com/user-attachments/assets/0f7de176-e59f-4182-9581-ba3257ddbfd5" />
<img width="1920" height="1080" alt="Screenshot (302)" src="https://github.com/user-attachments/assets/e5b23699-99ca-447a-b09c-47f7e63c7ea5" />

<img width="1920" height="1080" alt="Screenshot (304)" src="https://github.com/user-attachments/assets/cd2b2ca6-57df-48d1-8534-01dc786bbe7c" />

<img width="1920" height="1080" alt="Screenshot (305)" src="https://github.com/user-attachments/assets/f526c532-62a2-4548-9e44-98ab0de9ea3f" />

<img width="1920" height="1080" alt="Screenshot (307)" src="https://github.com/user-attachments/assets/1b22e900-859f-4050-b493-0d6331d30400" />

<img width="1920" height="1080" alt="Screenshot (308)" src="https://github.com/user-attachments/assets/dc0491af-25c6-4282-8cda-9c4570a81c3a" />

<img width="1920" height="1080" alt="Screenshot (309)" src="https://github.com/user-attachments/assets/d0c9dd40-5561-42f8-a067-af85543a87f9" />


<img width="1920" height="1080" alt="Screenshot (310)" src="https://github.com/user-attachments/assets/69ffdbd2-6e35-4008-a3e4-4bace218bcac" />



<img width="1920" height="1080" alt="Screenshot (311)" src="https://github.com/user-attachments/assets/49e34309-e4fe-4f38-b27c-029c5f100e43" />
<img width="1920" height="1080" alt="Screenshot (312)" src="https://github.com/user-attachments/assets/52d798cd-6187-4127-9e8c-e717f25e31c1" />
<img width="1920" height="1080" alt="Screenshot (313)" src="https://github.com/user-attachments/assets/54b0ae39-e1f2-4ae1-b3a5-89308f07e9ed" />


<img width="1920" height="1080" alt="Screenshot (315)" src="https://github.com/user-attachments/assets/69c470fb-cfcd-49a7-b809-2d9964d89f1e" />
<img width="1920" height="1080" alt="Screenshot (316)" src="https://github.com/user-attachments/assets/fe73e580-41a7-4f25-8944-1a84d2158926" />

<img width="1920" height="1080" alt="Screenshot (317)" src="https://github.com/user-attachments/assets/f49279db-1820-4522-9e52-a1acbbe47f51" />

## Design library cell using Magic Layout and ngspice characterization 


<img width="1920" height="1080" alt="Screenshot (318)" src="https://github.com/user-attachments/assets/15491376-4659-477c-beb3-7dc060354366" />


<img width="1920" height="1080" alt="Screenshot (319)" src="https://github.com/user-attachments/assets/1438d96e-9366-4e46-b0f6-42be3a14ad9d" />
<img width="1920" height="1080" alt="Screenshot (320)" src="https://github.com/user-attachments/assets/60d6796a-fa13-429e-891a-d86cd3336ac8" />

<img width="1920" height="1080" alt="Screenshot (321)" src="https://github.com/user-attachments/assets/535acf49-4cf2-4db1-aaae-a17588dabdf2" />

<img width="1920" height="1080" alt="Screenshot (322)" src="https://github.com/user-attachments/assets/c9baf1e3-cbe1-4bb8-880f-4bc12ac4c077" />
<img width="1920" height="1080" alt="Screenshot (323)" src="https://github.com/user-attachments/assets/96b4891b-eef7-4e2f-8717-8cc6f18d9d63" />

<img width="1920" height="1080" alt="Screenshot (325)" src="https://github.com/user-attachments/assets/162a2b02-a957-42bb-a242-f52205f8aa34" />

<img width="1920" height="1080" alt="Screenshot (326)" src="https://github.com/user-attachments/assets/bba966e0-c8ea-4443-9605-8d11c71c52db" />

<img width="1920" height="1080" alt="Screenshot (327)" src="https://github.com/user-attachments/assets/25b73c76-9e6d-4978-b8f5-3c0e3db0e3d0" />

<img width="1920" height="1080" alt="Screenshot (328)" src="https://github.com/user-attachments/assets/617fd5a9-b2d9-408f-9dd7-12ebab2b10ff" />

<img width="1920" height="1080" alt="Screenshot (329)" src="https://github.com/user-attachments/assets/e1208c89-d4bc-43e3-a6a4-adc42aec5196" />

<img width="1920" height="1080" alt="Screenshot (330)" src="https://github.com/user-attachments/assets/55f11332-ac98-4623-b646-b192f6f63743" />
<img width="1920" height="1080" alt="Screenshot (332)" src="https://github.com/user-attachments/assets/e1cff6ac-fa48-4cbd-823a-62411c4f93b8" />

<img width="1920" height="1080" alt="Screenshot (333)" src="https://github.com/user-attachments/assets/45bac8b8-a040-444c-9ba6-8a6960f6fb5f" />
<img width="1920" height="1080" alt="Screenshot (334)" src="https://github.com/user-attachments/assets/f360a2b8-99ac-4841-bf0c-107bbac95108" />


<img width="1920" height="1080" alt="Screenshot (335)" src="https://github.com/user-attachments/assets/978bb083-fea1-4751-b1c7-f25bafea5882" />


<img width="1920" height="1080" alt="Screenshot (336)" src="https://github.com/user-attachments/assets/633a32aa-271f-40d0-a71d-dcfddab447bf" />

<img width="1920" height="1080" alt="Screenshot (338)" src="https://github.com/user-attachments/assets/e90837af-91db-4d7a-8bfb-2aa2d5380f84" />

## Pre-layout timing analysis and importance of good clock tree 

#### 1. POWER ANALAYSIS
<img width="1920" height="1080" alt="Screenshot (350)" src="https://github.com/user-attachments/assets/c0b90c48-0404-41cb-8bf1-cce43729c40e" />

<img width="1920" height="1080" alt="Screenshot (351)" src="https://github.com/user-attachments/assets/dedde3a1-fcb5-4049-a72e-efaeb38ee66b" />
<img width="1920" height="1080" alt="Screenshot (352)" src="https://github.com/user-attachments/assets/942659a5-ca8d-49fd-b9be-195852bc40ce" />

<img width="1920" height="1080" alt="Screenshot (353)" src="https://github.com/user-attachments/assets/6883024d-4b3f-47e5-8a00-7f670c3f7369" />

<img width="1920" height="1080" alt="Screenshot (354)" src="https://github.com/user-attachments/assets/b881b5e0-aa73-4d2b-88d1-63e7639702a6" />
<img width="1920" height="1080" alt="Screenshot (355)" src="https://github.com/user-attachments/assets/02ecaf0d-2b89-4b5f-9df7-4e2969ef6017" />
<img width="1920" height="1080" alt="Screenshot (356)" src="https://github.com/user-attachments/assets/19c0454e-a81b-4655-83f0-d546112971ca" />

<img width="1920" height="1080" alt="Screenshot (357)" src="https://github.com/user-attachments/assets/c65618b1-0564-4ba2-b36a-e0e5cd0cf69c" />


<img width="1920" height="1080" alt="Screenshot (359)" src="https://github.com/user-attachments/assets/9f7f4d92-55f8-487f-a1ad-06e5053869f2" />

#### 2.TIMING DELAYS


<img width="1920" height="1080" alt="Screenshot (360)" src="https://github.com/user-attachments/assets/ca8dd3ff-0d1e-42c8-9bc0-929657dd8a05" />

<img width="1920" height="1080" alt="Screenshot (361)" src="https://github.com/user-attachments/assets/3f05cdb0-6128-4175-a222-78312436bab7" />

#### 3.CTS
This image shows the Clock Tree Synthesis (CTS) stage, highlighting a placed clock buffer (clkbuf_leaf_209_CLK) with its properties displayed in the Inspector, including position, orientation, and connectivity details.

<img width="1591" height="772" alt="image" src="https://github.com/user-attachments/assets/e29870a9-7a47-4095-87d6-ac6c6ceb8ba0" />


<img width="1920" height="1080" alt="Screenshot (362)" src="https://github.com/user-attachments/assets/72aad87e-6497-4b9a-b7aa-d33e2830d820" />
<img width="1920" height="1080" alt="Screenshot (365)" src="https://github.com/user-attachments/assets/91c523d3-d1da-4ed2-9a51-da3a7560eb22" />
<img width="1920" height="1080" alt="Screenshot (366)" src="https://github.com/user-attachments/assets/b6cef188-c83b-45e8-ad48-cd702f1b656a" />
<img width="1920" height="1080" alt="Screenshot (362)" src="https://github.com/user-attachments/assets/2ad934f3-505e-4eb8-93ed-02e227f1ab81" />
<img width="1920" height="1080" alt="Screenshot (367)" src="https://github.com/user-attachments/assets/e8fcd43a-6b93-46f7-9205-e596ddc3e94f" />
<img width="1920" height="1080" alt="Screenshot (368)" src="https://github.com/user-attachments/assets/435ca3d7-5391-41bb-a199-7f8616c35bb2" />
<img width="1920" height="1080" alt="Screenshot (366)" src="https://github.com/user-attachments/assets/6fe78bac-c6c5-4cbb-91db-cf6fd07f874d" />
<img width="1920" height="1080" alt="Screenshot (365)" src="https://github.com/user-attachments/assets/0455b062-2a4d-4c2e-84f7-a9063bbed8e6" />
<img width="1920" height="1080" alt="Screenshot (370)" src="https://github.com/user-attachments/assets/ae7129ee-870a-4076-8476-e82e165c3996" />
<img width="1920" height="1080" alt="Screenshot (366)" src="https://github.com/user-attachments/assets/c6f1e4a0-ca45-4659-94d5-6039eb5adc40" />
<img width="1920" height="1080" alt="Screenshot (362)" src="https://github.com/user-attachments/assets/5990a73b-fe3d-4afc-a799-afcf66b3b192" />
<img width="1920" height="1080" alt="Screenshot (365)" src="https://github.com/user-attachments/assets/b2f063de-54ca-462c-bf99-df9d61b3fdd0" />
<img width="1920" height="1080" alt="Screenshot (371)" src="https://github.com/user-attachments/assets/6bd0bd9e-1585-4323-bbe8-0ae25483e692" />
<img width="1920" height="1080" alt="Screenshot (372)" src="https://github.com/user-attachments/assets/65f5f54e-296c-4381-b3c5-835f8903c1f8" />
<img width="1920" height="1080" alt="Screenshot (373)" src="https://github.com/user-attachments/assets/1ef9de46-fcfd-4400-a2d9-b50b97eadd09" />
<img width="1920" height="1080" alt="Screenshot (374)" src="https://github.com/user-attachments/assets/5b170b5f-85a4-4396-8297-d6d76166fab6" />
<img width="1920" height="1080" alt="Screenshot (375)" src="https://github.com/user-attachments/assets/2d0841a4-f8cd-4717-ab2a-95ddf6cef489" />
<img width="1920" height="1080" alt="Screenshot (376)" src="https://github.com/user-attachments/assets/b9358443-ce55-4b24-bab4-9e1b20c94885" />

<img width="1920" height="1080" alt="Screenshot (377)" src="https://github.com/user-attachments/assets/3f645e13-df4c-4937-b807-2a75e7c9ec95" />

<img width="1920" height="1080" alt="Screenshot (378)" src="https://github.com/user-attachments/assets/86cd6e52-52a7-4fea-8552-0eeca09d98df" />

<img width="1920" height="1080" alt="Screenshot (379)" src="https://github.com/user-attachments/assets/20318628-984a-4209-acc4-8ff9470fa90e" />
<img width="1920" height="1080" alt="Screenshot (380)" src="https://github.com/user-attachments/assets/d8cc3803-2923-4237-9028-b1a0949d37a1" />

<img width="1920" height="1080" alt="Screenshot (381)" src="https://github.com/user-attachments/assets/c7d81e00-2296-4cf7-b833-2d4bf60f67ae" />

<img width="1920" height="1080" alt="Screenshot (382)" src="https://github.com/user-attachments/assets/33305da7-9c3b-47ec-ab4a-0274972104aa" />

##  Final steps for RTL2GDS using tritonRoute and openSTA 


#### 1.ROUTING

<img width="1920" height="1080" alt="Screenshot (383)" src="https://github.com/user-attachments/assets/8781aa31-f59a-46a0-94c2-e5f02fcf4aab" />
<img width="1920" height="1080" alt="Screenshot (384)" src="https://github.com/user-attachments/assets/535b8566-13bd-49c9-9eaf-f19b838d0fe4" />
<img width="1920" height="1080" alt="Screenshot (385)" src="https://github.com/user-attachments/assets/8939060a-2afd-40c5-9e17-df3319ca0c4f" />

<img width="1920" height="1080" alt="Screenshot (386)" src="https://github.com/user-attachments/assets/90805716-02ac-4fe1-9fde-6cff5e874b05" />


(Some SS failed to upload)


</details>

## Implementation of BabySoC Physical Design

This project demonstrates a full RTL-to-GDSII physical design flow using OpenROAD of BabySoC.
The final output includes:

-Floorplan
-Placement
-Clock Tree Synthesis
-Routing
-SPEF (Standard Parasitic Exchange Format) extraction
-Post-route Static Timing Analysis

## Why This Task Is Important

This week’s task integrates all prior concepts into a complete physical design flow for a real System-on-Chip, the BabySoC.

* **End-to-End Flow Mastery**: It provides hands-on experience with the entire RTL-to-GDSII process, connecting logical design with physical implementation.
* **Impact of Physical Constraints**: You will learn how floorplan decisions, placement density, and routing choices directly affect the chip's timing, power, and area (PPA).
* **Parasitic Extraction and STA**: This task highlights the importance of post-route parasitic extraction (SPEF) for accurate static timing analysis (STA), which is crucial for verifying that the chip will function at the desired speed. SPEF captures real parasitic R and C values for signoff-level timing analysis.
* **Mixed-Signal Integration**: VSDBabySoC includes analog macros (PLL and DAC), making this a comprehensive example of mixed-signal physical design.

This project was developed using GitHub Codespaces.

### **OpenROAD + noVNC Cloud Environment**

This repository launches a **ready-to-use GitHub Codespace** with OpenROAD tools, an XFCE desktop, and browser-based **noVNC** access.  
It is designed for testing and learning **physical design (PD) flows** in a cloud-based environment — without needing any local installation.

---
### 🧩What It Is

This repository provides a cloud-based environment (like GitHub Codespaces or VSCode in the browser) that runs:

OpenROAD tools – used for ASIC physical design automation (placement, routing, timing, etc.)

XFCE Desktop – a lightweight Linux desktop environment

noVNC – a browser-based remote desktop viewer

So, instead of installing OpenROAD locally, you can run and view it directly in your browser.
### 🔍 Why It’s Useful

✅ No need to install OpenROAD or GUI tools locally
✅ Works directly in your browser
✅ Ideal for learning and experimenting with ASIC design flow
✅ Perfect for education, workshops, or testing small designs

## 🚀 Launch the Codespace

A Codespace is a personal cloud-based development environment provided by GitHub.
Think of it as your own mini Linux computer running in the cloud, automatically created for a specific repository.

1. Go to this repository in your browser:
 ```  bash
🔗 https://github.com/vsdip/vsd-pd
```
2. Click **Code → Codespaces → Create codespace on main**
   
When you open the repository in GitHub → click “Code → Open with Codespaces → New codespace”.
GitHub spins up a virtual machine (VM) in the cloud, running Ubuntu or Debian.

This VM includes:
All required tools (like OpenROAD, Yosys, Magic, KLayout)
A Linux desktop environment (XFCE)
noVNC server setup for browser-based GUI access
 <img width="572" height="570" alt="image" src="https://github.com/user-attachments/assets/67978026-7374-4f7f-b66d-3815e77f3868" />


2. Wait for the setup to complete.  
   The log will show: **“Finished configuring codespace.”**  
   <img width="973" height="99" alt="image" src="https://github.com/user-attachments/assets/403a6bd6-ba57-4f85-8d74-5ca0513851d4" />

  <img width="1023" height="148" alt="image" src="https://github.com/user-attachments/assets/4165780f-7119-48ca-b6d0-498149a2b6c9" />
<img width="1878" height="587" alt="Screenshot 2025-11-25 025825" src="https://github.com/user-attachments/assets/0ce1c265-c181-4950-ae1c-db0817af49e6" />



##  Run OpenROAD Flow Scripts
   **Installing and setting up ORFS**
Once inside the Codespace terminal (or through the noVNC desktop terminal):

```bash
cd ~/Desktop
git clone https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts.git
cd OpenROAD-flow-scripts/flow
make
````
This downloads and runs the official OpenROAD physical design flow (synthesis → placement → routing).

⏳ This process can take 10–20 minutes depending on system size.

When the process finishes successfully, you’ll see a log summary similar to this:
<img width="966" height="238" alt="image" src="https://github.com/user-attachments/assets/1b61d93b-258b-4bac-9a9b-9b40bd94a526" />
<img width="875" height="613" alt="image" src="https://github.com/user-attachments/assets/20711244-5143-448e-930f-1143d7e7c186" />


## Access the GUI via noVNC

1. Open the **PORTS** tab in the Codespace.
2. Click the 🌐 icon next to **port 6080** to open the noVNC desktop.
   → This opens a new browser tab showing the XFCE desktop using noVNC.
  You’ll now see a Linux desktop GUI inside your browser!
```bash
# 🌐 Accessing the GUI (Port 6080)
# Use the following URL format to open the VNC GUI in your browser:
# 6080 → open in browser
# https://yourusername-vsd-pd-xxxx-6080.app.github.dev/vnc.html
#
# Replace:
#   yourusername → your GitHub username
#   xxxx → the unique Codespace ID
```
   
<img width="1670" height="319" alt="image" src="https://github.com/user-attachments/assets/c43fb369-e517-4db2-9e3c-a4dbd0b04756" />    

You’ll see the browser-based desktop environment:
<img width="397" height="317" alt="image" src="https://github.com/user-attachments/assets/e6b8ee9d-db76-4fe6-a251-d3a5736fb462" />

## View the Final Layout in GUI
Inside the noVNC desktop terminal, launch the final GUI view:
```bash
cd OpenROAD-flow-scripts/flow
make gui_final
```
This launches the OpenROAD GUI where you can view your chip layout and final routing results.

<img width="1486" height="717" alt="Screenshot (441)" src="https://github.com/user-attachments/assets/80daccfa-809b-4bb0-abe4-a89fd7b9ea38" />

<img width="1783" height="922" alt="Screenshot (444)" src="https://github.com/user-attachments/assets/502842bd-b5c7-449f-bc7b-3128ea9c5703" />

<img width="1753" height="853" alt="Screenshot (446)" src="https://github.com/user-attachments/assets/6cb50f8e-73c6-4935-8d61-79f52ceec1d3" />




### ⚠️ Notes

- Everything runs in the cloud — **no installation is required on your PC**.  
- All files, logs, and intermediate outputs are **saved automatically inside your Codespace**.  
- If you close the Codespace, you can **reopen it anytime** as long as it has not been deleted.

## ⚠️ Important Notice

This Codespace setup uses the official
👉 [**OpenROAD Flow Scripts**](https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts)
from the **OpenROAD Project**.

It is intended **only for educational and testing purposes** as part of the **VSD Cloud Codespace Environment**.
For official documentation, updates, and support, please refer to the OpenROAD repository linked above.


# PHYSICAL DESIGN OF BABYSOC

**ORFS Directory Structure and File formats**

``` 
├── OpenROAD-flow-scripts             
│   ├── docker           -> It has Docker based installation, run scripts and all saved here
│   ├── docs             -> Documentation for OpenROAD or its flow scripts.  
│   ├── flow             -> Files related to run RTL to GDS flow  
|   ├── jenkins          -> It contains the regression test designed for each build update
│   ├── tools            -> It contains all the required tools to run RTL to GDS flow
│   ├── etc              -> Has the dependency installer script and other things
│   ├── setup_env.sh     -> Its the source file to source all our OpenROAD rules to run the RTL to GDS flow
```

Now, go to flow directory

``` 
├── flow           
│   ├── design           -> It has built-in examples from RTL to GDS flow across different technology nodes
│   ├── makefile         -> The automated flow runs through makefile setup
│   ├── platform         -> It has different technology note libraries, lef files, GDS etc 
|   ├── tutorials        
│   ├── util            
│   ├── scripts             
```

<img width="1866" height="251" alt="Screenshot (447)" src="https://github.com/user-attachments/assets/cf292d2c-2912-4fc8-9924-4f0c3ec3ca41" />

### Automated RTL2GDS Flow for VSDBabySoC:

**Below are the mandatory setup steps.**

```bash
OpenROAD-flow-scripts/
└── flow/
    └── designs/
        └── sky130hd/
            └── vsdbabysoc/
                │
                ├── config.mk                   # Main OpenROAD flow config
                ├── vsdbabysoc_synthesis.sdc    # Synthesis constraints file
                ├── macro.cfg                   # Macro placement configuration
                ├── pin_order.cfg               # Pin placement order file
                │
                ├── src/                        # RTL source files for VSDBabySoC
                │   ├── vsdbabysoc.v
                │   ├── rvmyth.v
                │   ├── rvmyth_gen.v
                │   ├── clk_gate.v
                │   ├── avsddac.v
                │   └── avsdpll.v
                │
                ├── include/                    # SandPiper-generated header files
                │   ├── sandpiper.vh
                │   ├── sandpiper_gen.vh
                │   ├── sp_default.vh
                │   └── sp_verilog.vh
                │
                ├── gds/                        # Macro GDS files
                │   ├── avsddac.gds
                │   └── avsdpll.gds
                │
                ├── lef/                        # Macro LEF files
                │   ├── avsddac.lef
                │   └── avsdpll.lef
                │
                └── lib/                        # Macro Liberty timing files
                    ├── avsddac.lib
                    └── avsdpll.lib
```


Initial Steps:

- We need to create a directory `vsdbabysoc` inside `OpenROAD-flow-scripts/flow/designs/sky130hd`
- Now create a directory `vsdbabysoc` inside `OpenROAD-flow-scripts/flow/designs/src` and include all the verilog files here.
- Now copy the folders `gds`, `include`, `lef` and `lib` from the VSDBabySoC folder in your system into this directory.
  - The `gds` folder would contain the files `avsddac.gds` and `avsdpll.gds`
  - The `include` folder would contain the files `sandpiper.vh`, `sandpiper_gen.vh`, `sp_default.vh` and `sp_verilog.vh`
  - The `gds` folder would contain the files `avsddac.lef` and `avsdpll.lef`
  - The `lib` folder would contain the files `avsddac.lib` and `avsdpll.lib`
- Now copy the constraints file(`vsdbabysoc_synthesis.sdc`) from the VSDBabySoC folder in your system into this directory.
- Now copy the files(`macro.cfg` and `pin_order.cfg`) from the VSDBabySoC folder in your system into this directory.

 ```bash
    OpenROAD-flow-scripts/
 └── flow/
     └── designs/
         ├── sky130hd/
         │    └── vsdbabysoc/
         └── src/
              └── vsdbabysoc/
   ```


Step1-
```bash
cd ~/Desktop
git clone https://github.com/your-username/VSDBabySoC.git
```   
```bash
     cp -r VSDBabySoC/gds OpenROAD-flow-scripts/flow/designs/sky130hd/vsdbabysoc/
     cp -r VSDBabySoC/include OpenROAD-flow-scripts/flow/designs/sky130hd/vsdbabysoc/
     cp -r VSDBabySoC/lef OpenROAD-flow-scripts/flow/designs/sky130hd/vsdbabysoc/
     cp -r VSDBabySoC/lib OpenROAD-flow-scripts/flow/designs/sky130hd/vsdbabysoc/
     cp VSDBabySoC/vsdbabysoc_synthesis.sdc OpenROAD-flow scripts/flow/designs/sky130hd/vsdbabysoc/
     cp VSDBabySoC/macro.cfg OpenROAD-flow-scripts/flow/designs/sky130hd/vsdbabysoc/
     cp VSDBabySoC/pin_order.cfg OpenROAD-flow-scripts/flow/designs/sky130hd/vsdbabysoc/
     cp -r VSDBabySoC/src OpenROAD-flow-scripts/flow/designs/src/vsdbabysoc/
 ```
### So By Absolute Paths
```bash
cp -r ~/Desktop/VSDBabySoC/src/gds /workspaces/vsd-pd/OpenROAD-flow-scripts/flow/designs/sky130hd/vsdbabysoc/
cp -r ~/Desktop/VSDBabySoC/src/include /workspaces/vsd-pd/OpenROAD-flow-scripts/flow/designs/sky130hd/vsdbabysoc/
cp -r ~/Desktop/VSDBabySoC/src/lef /workspaces/vsd-pd/OpenROAD-flow-scripts/flow/designs/sky130hd/vsdbabysoc/
cp -r ~/Desktop/VSDBabySoC/src/lib /workspaces/vsd-pd/OpenROAD-flow-scripts/flow/designs/sky130hd/vsdbabysoc/
cp -r ~/Desktop/VSDBabySoC/src/layout_conf /workspaces/vsd-pd/OpenROAD-flow-scripts/flow/designs/sky130hd/vsdbabysoc/

cp ~/Desktop/VSDBabySoC/src/sdc/vsdbabysoc_synthesis.sdc /workspaces/vsd-pd/OpenROAD-flow-scripts/flow/designs/sky130hd/vsdbabysoc/
cp ~/Desktop/VSDBabySoC/src/layout_conf/vsdbabysoc/macro.cfg /workspaces/vsd-pd/OpenROAD-flow-scripts/flow/designs/sky130hd/vsdbabysoc/
cp ~/Desktop/VSDBabySoC/src/layout_conf/vsdbabysoc/pin_order.cfg /workspaces/vsd-pd/OpenROAD-flow-scripts/flow/designs/sky130hd/vsdbabysoc/
```
Step2-

Before starting the physical design (back-end flow) in OpenROAD, the tool must know what design we are working on, where all the design files are kept, and what external IPs or macros the SoC uses.
This information is not detected automatically — we have to explicitly specify it.

This is done using a file called `config.mk`.

The `config.mk` file acts as the central configuration file for a custom design inside OpenROAD-flow-scripts. It provides all the paths and parameters required for:

a. RTL synthesis
b. Macro integration (DAC, PLL, etc.)
c. Constraint loading
d. Placement and routing setup
e. Output directory creation

**In simple words:**

* `config.mk` is the file that tells OpenROAD “this is my design, these are my RTL files, these are my macros, and this is how you should run the flow.”

* Without this file, OpenROAD will not know:
    Which Verilog files to synthesize
    Which IP blocks (macros) to include
    Where LEF/GDS/LIB files are stored
    What timing constraints to apply
    What top module to pick

Thus, `config.mk` is essential to correctly registering your design inside the OpenROAD-flow-scripts directory structure and ensuring that the entire PnR flow runs with the right inputs.

[Complete config.mk file used for VSDBabySoC:](config.mk)

- Now, create a `config.mk` file whose contents are shown below:
  
1️⃣ In the Codespaces file explorer (left sidebar), navigate to:
```bash
OpenROAD-flow-scripts
└── flow
└── designs
└── sky130hd
└── vsdbabysoc
```
2️⃣ Inside the **vsdbabysoc** folder, click **“New File”**.

3️⃣ Name the file

4️⃣ Paste the entire `config.mk` content into this file and save it.


```
export DESIGN_NICKNAME = vsdbabysoc
export DESIGN_NAME = vsdbabysoc
export PLATFORM    = sky130hd

# export VERILOG_FILES_BLACKBOX = $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/IPs/*.v
# export VERILOG_FILES = $(sort $(wildcard $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/*.v))
# Explicitly list the Verilog files for synthesis
export VERILOG_FILES = $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/vsdbabysoc.v \
                       $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/rvmyth.v \
                       $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/clk_gate.v

export SDC_FILE      = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/vsdbabysoc_synthesis.sdc

export vsdbabysoc_DIR = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)

export VERILOG_INCLUDE_DIRS = $(wildcard $(vsdbabysoc_DIR)/include/)
# export SDC_FILE      = $(wildcard $(vsdbabysoc_DIR)/sdc/*.sdc)
export ADDITIONAL_GDS  = $(wildcard $(vsdbabysoc_DIR)/gds/*.gds.gz)
export ADDITIONAL_LEFS  = $(wildcard $(vsdbabysoc_DIR)/lef/*.lef)
export ADDITIONAL_LIBS = $(wildcard $(vsdbabysoc_DIR)/lib/*.lib)
# export PDN_TCL = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/pdn.tcl

# Clock Configuration (vsdbabysoc specific)
# export CLOCK_PERIOD = 20.0
export CLOCK_PORT = CLK
export CLOCK_NET = $(CLOCK_PORT)

# Floorplanning Configuration (vsdbabysoc specific)
export FP_PIN_ORDER_CFG = $(wildcard $(DESIGN_DIR)/pin_order.cfg)
# export FP_SIZING = absolute

export DIE_AREA   = 0 0 1600 1600
export CORE_AREA  = 20 20 1590 1590

# Placement Configuration (vsdbabysoc specific)
export MACRO_PLACEMENT_CFG = $(wildcard $(DESIGN_DIR)/macro.cfg)
export PLACE_PINS_ARGS = -exclude left:0-600 -exclude left:1000-1600: -exclude right:* -exclude top:* -exclude bottom:*
# export MACRO_PLACEMENT = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/macro_placement.cfg

export TNS_END_PERCENT = 100
export REMOVE_ABC_BUFFERS = 1

# Magic Tool Configuration
export MAGIC_ZEROIZE_ORIGIN = 0
export MAGIC_EXT_USE_GDS = 1

# CTS tuning
export CTS_BUF_DISTANCE = 600
export SKIP_GATE_CLONING = 1

# export CORE_UTILIZATION=0.1  # Reduce this value to allow more whitespace for routing.
```

<img width="1920" height="825" alt="Screenshot (448)" src="https://github.com/user-attachments/assets/7fe35dba-492e-432f-b186-7fb2da0afafd" />

<img width="1850" height="907" alt="Screenshot (450)" src="https://github.com/user-attachments/assets/abefed0b-6939-4d93-b08a-52daf01efbc7" />
<img width="1507" height="726" alt="Screenshot (459)" src="https://github.com/user-attachments/assets/e970ce82-2286-4241-a6f5-f1a9efdbc26a" />

### 📂 Adding VSDBabySoC Verilog Files to OpenROAD
 1. create the following directory inside your Codespace:
```bash
mkdir -p /workspaces/vsd-pd/OpenROAD-flow-scripts/flow/designs/src/vsdbabysoc

```
2️. Copy all Verilog .v files into this new folder
Your original Verilog files are located at:
```bash
~/Desktop/VSDBabySoC/src/vsdbabysoc/
```
Run this command to copy them:
```bash
cp ~/Desktop/VSDBabySoC/src/module/*.v \
/workspaces/vsd-pd/OpenROAD-flow-scripts/flow/designs/src/vsdbabysoc/

```

If you have additional Verilog files in other folders (e.g., rtl/, IP folders), copy them as well.


### Now go to terminal and run the following commands:

```
cd OpenROAD-flow-scripts
source env.sh
cd flow
```
## No need of seperate ' make ' for each flow as this

```
make DESIGN_CONFIG=./designs/sky130hd/vsdbabysoc/config.mk synth
```
This error pop ups-
```bash
make: *** No rule to make target 'synth'.  Stop.
```
means your OpenROAD-flow-scripts version does NOT support running make synth directly.
since in Codespaces,

```bash
make
```
This executes the full OpenROAD physical design flow, which includes:

-Logic synthesis (Yosys)
->Floorplanning
->Placement
->Clock tree synthesis
->Routing
->GDSII generation

All of this uses the Nangate45 PDK (Process Design Kit) —
that’s the 45nm open-source standard-cell library used for educational PD flows.

### CORRECT COMMAND IN CODESPACES

```bash
cd /workspaces/vsd-pd/OpenROAD-flow-scripts/flow
make DESIGN_CONFIG=./designs/sky130hd/vsdbabysoc/config.mk
```
You can confirm this by 
```bash
grep -i "all:" Makefile
```
You will see something like:
```bash
all: run_flow
```
which explains why default target = full flow.

<img width="1465" height="398" alt="Screenshot (453)" src="https://github.com/user-attachments/assets/b4ee3841-90ee-4c37-87b7-49f8b7944a85" />


### ERROR
```bash
 make DESIGN_CONFIG=./designs/sky130hd/vsdbabysoc/config.mk
designs/sky130hd/vsdbabysoc/config.mk:11: *** missing separator (did you mean TAB instead of 8 spaces?).  Stop.
```
<img width="1519" height="672" alt="Screenshot (455)" src="https://github.com/user-attachments/assets/7ad8a51b-9977-4b1e-a9d1-d5bea3597ac8" />

This error 100% means your config.mk has spaces instead of a TAB on line 11.
Makefiles strictly require TAB before every command.

-Remove all spaces at the beginning
-Use TAB instead.
❌ Wrong (8 spaces)

Here is your fixed, valid OpenLane config.mk (safe version):
```bash
set ::env(DESIGN_NAME) "vsdbabysoc"

# --- Verilog Sources (explicit list, required for BabySoC) ---
set ::env(VERILOG_FILES) "\
$::env(DESIGN_DIR)/src/vsdbabysoc.v \
$::env(DESIGN_DIR)/src/rvmyth.v \
$::env(DESIGN_DIR)/src/rvmyth_gen.v \
$::env(DESIGN_DIR)/src/avsdpll.v \
$::env(DESIGN_DIR)/src/avsddac.v \
$::env(DESIGN_DIR)/src/clk_gate.v \
"

# --- Includes ---
set ::env(VERILOG_INCLUDE_DIRS) "$::env(DESIGN_DIR)/src/include"

# --- Additional Macro Files ---
set ::env(EXTRA_LIBS)  [glob $::env(DESIGN_DIR)/src/lib/*.lib]
set ::env(EXTRA_LEFS)  [glob $::env(DESIGN_DIR)/src/lef/*.lef]
set ::env(EXTRA_GDS_FILES) [glob $::env(DESIGN_DIR)/src/gds/*.gds]

# --- Timing ---
set ::env(BASE_SDC_FILE) "$::env(DESIGN_DIR)/src/vsdbabysoc_synthesis.sdc"
set ::env(CLOCK_PORT) "CLK"
set ::env(CLOCK_NET)  "CLK"
set ::env(CLOCK_PERIOD) "20.0"

# --- Floorplan ---
set ::env(FP_PIN_ORDER_CFG) "$::env(DESIGN_DIR)/pin_order.cfg"
set ::env(MACRO_PLACEMENT_CFG) "$::env(DESIGN_DIR)/macro.cfg"

set ::env(FP_SIZING) "absolute"
set ::env(DIE_AREA) "0 0 1500 1500"

set ::env(BOTTOM_MARGIN_MULT) 20
set ::env(TOP_MARGIN_MULT) 20
set ::env(LEFT_MARGIN_MULT) 100
set ::env(RIGHT_MARGIN_MULT) 100

# --- Magic ---
set ::env(MAGIC_ZEROIZE_ORIGIN) 0
set ::env(MAGIC_EXT_USE_GDS) 1

```

### ERROR
```bash
14. Executing ABC pass (technology mapping using ABC).
14.1. Extracting gate netlist of module `\vsdbabysoc' to `<abc-temp-dir>/input.blif'..
yosys-abc: src/map/scl/sclLibUtil.c:77: void abc::Abc_SclHashCells(SC_Lib *): Assertion `*pPlace == -1' failed.
ERROR: ABC failed with status 86Command exited with non-zero status 1
Elapsed time: 0:07.64[h:]min:sec. CPU time: user 4.93 sys 0.22 (67%). Peak memory: 92568KB.
make[1]: *** [Makefile:262: do-yosys] Error 1
make: *** [Makefile:272: results/sky130hd/vsdbabysoc/base/1_2_yosys.v] Error 2
again this error
```


<img width="1538" height="808" alt="Screenshot (463)" src="https://github.com/user-attachments/assets/0bcdbd72-858b-4fe5-a042-cf32083b3ae1" />



SOLUTION-
Your config file has:
```bash
export ADDITIONAL_LIBS = $(wildcard $(vsdbabysoc_DIR)/lib/*.lib)
```

⚠️ This is wrong
OpenROAD already loads the platform .lib files.
This line may be overwriting them → ABC crashes.So,Comment out that line .

```bash
#export ADDITIONAL_LIBS = $(wildcard $(vsdbabysoc_DIR)/lib/*.lib)
```
### 📌 Before running OpenROAD, verify files exist

Run this in terminal:
```bash
ls designs/sky130hd/vsdbabysoc/src/
```

You MUST see:
```bash
vsdbabysoc.v
rvmyth.v
rvmyth_gen.v
clk_gate.v
avsdpll.v
avsddac.v
```
If anything missing → synthesis will fail.


### 🚀 Now run the Entire Flow-RTL2GDSII
```bash
cd /workspaces/vsd-pd/OpenROAD-flow-Scripts/flow
make DESIGN_CONFIG=./designs/sky130hd/vsdbabysoc/config.mk

```

### SYNTHESIS
Synthesis translates the RTL Verilog code into a gate-level netlist using standard cells from the Sky130 library. Use the OpenROAD flow for synthesis.


This generates the gate-level netlist and reports synthesis statistics, including cell count and area.

<img width="1526" height="808" alt="Screenshot (461)" src="https://github.com/user-attachments/assets/56477bf9-fca1-4072-b1ab-37fc3c1327dc" />
<img width="1529" height="815" alt="Screenshot (462)" src="https://github.com/user-attachments/assets/ba4609a8-2f8b-4d3f-a3ef-59e8ecb47eac" />

### FLOORPLAN
Floorplanning defines the die and core areas, places I/O pads, and sets up the power distribution network.

<img width="1368" height="806" alt="Screenshot (464)" src="https://github.com/user-attachments/assets/6f4e0143-d4a2-4285-a3cf-9b7111ef7ad5" />
<img width="1432" height="819" alt="Screenshot (465)" src="https://github.com/user-attachments/assets/07e4de19-be84-47f5-a767-bf4e3048c45c" />
<img width="1420" height="800" alt="Screenshot (466)" src="https://github.com/user-attachments/assets/eb09327c-cccb-46fc-8d73-83d94304c106" />

To view the floorplan:

```bash
make DESIGN_CONFIG=./designs/sky130hd/vsdbabysoc/config.mk gui_floorplan
```
<img width="1920" height="875" alt="Screenshot (508)" src="https://github.com/user-attachments/assets/933d09aa-d4ba-45f1-89b2-22e6aa37bcad" />

This image shows the floorplan view in OpenROAD where you can see two macros placed: DAC and PLL after the floorplanning step.

<img width="1598" height="860" alt="Screenshot 2025-11-29 113430" src="https://github.com/user-attachments/assets/ec537003-b9c6-4483-beab-af193056a522" />

<img width="1600" height="784" alt="Screenshot 2025-11-29 113556" src="https://github.com/user-attachments/assets/2e224f13-b6e2-4ba7-b993-dcfdd4cd4cf7" />

<img width="1504" height="517" alt="image" src="https://github.com/user-attachments/assets/2d1ab9a8-42ae-4f91-a9bb-608a54d756a8" />

<details>
  <summary>
   2_fllorplan_final.rpt
  </summary>

  ```bash

==========================================================================
floorplan final report_tns
--------------------------------------------------------------------------
tns max 0.00

==========================================================================
floorplan final report_wns
--------------------------------------------------------------------------
wns max 0.00

==========================================================================
floorplan final report_worst_slack
--------------------------------------------------------------------------
worst slack max 0.46

==========================================================================
floorplan final report_clock_min_period
--------------------------------------------------------------------------
clk period_min = 10.54 fmax = 94.84

==========================================================================
floorplan final report_checks -path_delay min
--------------------------------------------------------------------------
Startpoint: core.CPU_imm_a2[10]$_DFF_P_
            (rising edge-triggered flip-flop clocked by clk)
Endpoint: core.CPU_imm_a3[10]$_DFF_P_
          (rising edge-triggered flip-flop clocked by clk)
Path Group: clk
Path Type: min

Fanout     Cap    Slew   Delay    Time   Description
-----------------------------------------------------------------------------
                  0.00    0.00    0.00   clock clk (rise edge)
                          0.00    0.00   clock network delay (ideal)
                  0.00    0.00    0.00 ^ core.CPU_imm_a2[10]$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_1)
     1    0.00    0.03    0.27    0.27 ^ core.CPU_imm_a2[10]$_DFF_P_/Q (sky130_fd_sc_hd__dfxtp_1)
                                         core.CPU_imm_a2[10] (net)
                  0.03    0.00    0.27 ^ core.CPU_imm_a3[10]$_DFF_P_/D (sky130_fd_sc_hd__dfxtp_1)
                                  0.27   data arrival time

                  0.00    0.00    0.00   clock clk (rise edge)
                          0.00    0.00   clock network delay (ideal)
                          0.00    0.00   clock reconvergence pessimism
                                  0.00 ^ core.CPU_imm_a3[10]$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_1)
                         -0.03   -0.03   library hold time
                                 -0.03   data required time
-----------------------------------------------------------------------------
                                 -0.03   data required time
                                 -0.27   data arrival time
-----------------------------------------------------------------------------
                                  0.31   slack (MET)



==========================================================================
floorplan final report_checks -path_delay max
--------------------------------------------------------------------------
Startpoint: core.CPU_valid_load_a5$_DFF_P_
            (rising edge-triggered flip-flop clocked by clk)
Endpoint: core.CPU_src1_value_a3[10]$_DFF_P_
          (rising edge-triggered flip-flop clocked by clk)
Path Group: clk
Path Type: max

Fanout     Cap    Slew   Delay    Time   Description
-----------------------------------------------------------------------------
                  0.00    0.00    0.00   clock clk (rise edge)
                          0.00    0.00   clock network delay (ideal)
                  0.00    0.00    0.00 ^ core.CPU_valid_load_a5$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_1)
     3    0.01    0.04    0.29    0.29 v core.CPU_valid_load_a5$_DFF_P_/Q (sky130_fd_sc_hd__dfxtp_1)
                                         core.CPU_valid_load_a5 (net)
                  0.04    0.00    0.29 v _05505_/A (sky130_fd_sc_hd__or4_1)
    49    0.13    0.62    1.06    1.35 v _05505_/X (sky130_fd_sc_hd__or4_1)
                                         _01114_ (net)
                  0.62    0.00    1.35 v _05507_/A (sky130_fd_sc_hd__inv_2)
    60    0.15    0.71    0.77    2.12 ^ _05507_/Y (sky130_fd_sc_hd__inv_2)
                                         _01116_ (net)
                  0.71    0.00    2.12 ^ _08818_/A2 (sky130_fd_sc_hd__a31oi_1)
     6    0.01    0.22    0.29    2.41 v _08818_/Y (sky130_fd_sc_hd__a31oi_1)
                                         _03802_ (net)
                  0.22    0.00    2.41 v _09874_/B1 (sky130_fd_sc_hd__a2111oi_0)
    56    0.15    9.27    7.14    9.55 ^ _09874_/Y (sky130_fd_sc_hd__a2111oi_0)
                                         _04506_ (net)
                  9.27    0.00    9.55 ^ _09912_/A1 (sky130_fd_sc_hd__o21ai_0)
     1    0.00    0.89    0.56   10.11 v _09912_/Y (sky130_fd_sc_hd__o21ai_0)
                                         core.CPU_src1_value_a2[10] (net)
                  0.89    0.00   10.11 v core.CPU_src1_value_a3[10]$_DFF_P_/D (sky130_fd_sc_hd__dfxtp_1)
                                 10.11   data arrival time

                  0.00   11.00   11.00   clock clk (rise edge)
                          0.00   11.00   clock network delay (ideal)
                          0.00   11.00   clock reconvergence pessimism
                                 11.00 ^ core.CPU_src1_value_a3[10]$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_1)
                         -0.44   10.56   library setup time
                                 10.56   data required time
-----------------------------------------------------------------------------
                                 10.56   data required time
                                -10.11   data arrival time
-----------------------------------------------------------------------------
                                  0.46   slack (MET)



==========================================================================
floorplan final report_checks -unconstrained
--------------------------------------------------------------------------
Startpoint: core.CPU_valid_load_a5$_DFF_P_
            (rising edge-triggered flip-flop clocked by clk)
Endpoint: core.CPU_src1_value_a3[10]$_DFF_P_
          (rising edge-triggered flip-flop clocked by clk)
Path Group: clk
Path Type: max

Fanout     Cap    Slew   Delay    Time   Description
-----------------------------------------------------------------------------
                  0.00    0.00    0.00   clock clk (rise edge)
                          0.00    0.00   clock network delay (ideal)
                  0.00    0.00    0.00 ^ core.CPU_valid_load_a5$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_1)
     3    0.01    0.04    0.29    0.29 v core.CPU_valid_load_a5$_DFF_P_/Q (sky130_fd_sc_hd__dfxtp_1)
                                         core.CPU_valid_load_a5 (net)
                  0.04    0.00    0.29 v _05505_/A (sky130_fd_sc_hd__or4_1)
    49    0.13    0.62    1.06    1.35 v _05505_/X (sky130_fd_sc_hd__or4_1)
                                         _01114_ (net)
                  0.62    0.00    1.35 v _05507_/A (sky130_fd_sc_hd__inv_2)
    60    0.15    0.71    0.77    2.12 ^ _05507_/Y (sky130_fd_sc_hd__inv_2)
                                         _01116_ (net)
                  0.71    0.00    2.12 ^ _08818_/A2 (sky130_fd_sc_hd__a31oi_1)
     6    0.01    0.22    0.29    2.41 v _08818_/Y (sky130_fd_sc_hd__a31oi_1)
                                         _03802_ (net)
                  0.22    0.00    2.41 v _09874_/B1 (sky130_fd_sc_hd__a2111oi_0)
    56    0.15    9.27    7.14    9.55 ^ _09874_/Y (sky130_fd_sc_hd__a2111oi_0)
                                         _04506_ (net)
                  9.27    0.00    9.55 ^ _09912_/A1 (sky130_fd_sc_hd__o21ai_0)
     1    0.00    0.89    0.56   10.11 v _09912_/Y (sky130_fd_sc_hd__o21ai_0)
                                         core.CPU_src1_value_a2[10] (net)
                  0.89    0.00   10.11 v core.CPU_src1_value_a3[10]$_DFF_P_/D (sky130_fd_sc_hd__dfxtp_1)
                                 10.11   data arrival time

                  0.00   11.00   11.00   clock clk (rise edge)
                          0.00   11.00   clock network delay (ideal)
                          0.00   11.00   clock reconvergence pessimism
                                 11.00 ^ core.CPU_src1_value_a3[10]$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_1)
                         -0.44   10.56   library setup time
                                 10.56   data required time
-----------------------------------------------------------------------------
                                 10.56   data required time
                                -10.11   data arrival time
-----------------------------------------------------------------------------
                                  0.46   slack (MET)



==========================================================================
floorplan final report_power
--------------------------------------------------------------------------
Group                  Internal  Switching    Leakage      Total
                          Power      Power      Power      Power (Watts)
----------------------------------------------------------------
Sequential             4.45e-03   2.49e-04   9.26e-09   4.70e-03  76.7%
Combinational          6.93e-04   7.37e-04   8.76e-09   1.43e-03  23.3%
Clock                  0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
Macro                  0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
Pad                    0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
----------------------------------------------------------------
Total                  5.14e-03   9.86e-04   1.80e-08   6.13e-03 100.0%
                          83.9%      16.1%       0.0%



```
</details
  
### GLOBAL PLACE_REPORT_DESIGN_AREA

<img width="1427" height="809" alt="Screenshot (467)" src="https://github.com/user-attachments/assets/9b17e642-95e7-47db-b938-a58550d26f86" />

<details>
  <summary>
    3_global_place.rpt
  </summary>

```bash

  
==========================================================================
global place report_tns
--------------------------------------------------------------------------
tns max 0.00

==========================================================================
global place report_wns
--------------------------------------------------------------------------
wns max 0.00

==========================================================================
global place report_worst_slack
--------------------------------------------------------------------------
worst slack max 4.44

==========================================================================
global place report_clock_min_period
--------------------------------------------------------------------------
clk period_min = 6.56 fmax = 152.54

==========================================================================
global place report_checks -path_delay min
--------------------------------------------------------------------------
Startpoint: core.CPU_Xreg_value_a5[17][9]$_DFF_P_
            (rising edge-triggered flip-flop clocked by clk)
Endpoint: core.OUT[9]$_DFF_P_ (rising edge-triggered flip-flop clocked by clk)
Path Group: clk
Path Type: min

Fanout     Cap    Slew   Delay    Time   Description
-----------------------------------------------------------------------------
                  0.00    0.00    0.00   clock clk (rise edge)
                          0.00    0.00   clock network delay (ideal)
                  0.00    0.00    0.00 ^ core.CPU_Xreg_value_a5[17][9]$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_1)
     1    0.00    0.03    0.28    0.28 ^ core.CPU_Xreg_value_a5[17][9]$_DFF_P_/Q (sky130_fd_sc_hd__dfxtp_1)
                                         core.CPU_Xreg_value_a5[17][9] (net)
                  0.03    0.00    0.28 ^ core.OUT[9]$_DFF_P_/D (sky130_fd_sc_hd__dfxtp_1)
                                  0.28   data arrival time

                  0.00    0.00    0.00   clock clk (rise edge)
                          0.00    0.00   clock network delay (ideal)
                          0.00    0.00   clock reconvergence pessimism
                                  0.00 ^ core.OUT[9]$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_1)
                         -0.03   -0.03   library hold time
                                 -0.03   data required time
-----------------------------------------------------------------------------
                                 -0.03   data required time
                                 -0.28   data arrival time
-----------------------------------------------------------------------------
                                  0.31   slack (MET)



==========================================================================
global place report_checks -path_delay max
--------------------------------------------------------------------------
Startpoint: core.CPU_is_slli_a3$_DFF_P_
            (rising edge-triggered flip-flop clocked by clk)
Endpoint: core.CPU_Xreg_value_a4[10][29]$_SDFFE_PP0P_
          (rising edge-triggered flip-flop clocked by clk)
Path Group: clk
Path Type: max

Fanout     Cap    Slew   Delay    Time   Description
-----------------------------------------------------------------------------
                  0.00    0.00    0.00   clock clk (rise edge)
                          0.00    0.00   clock network delay (ideal)
                  0.00    0.00    0.00 ^ core.CPU_is_slli_a3$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_1)
     1    0.01    0.06    0.30    0.30 ^ core.CPU_is_slli_a3$_DFF_P_/Q (sky130_fd_sc_hd__dfxtp_1)
                                         core.CPU_is_slli_a3 (net)
                  0.06    0.00    0.30 ^ place654/A (sky130_fd_sc_hd__buf_4)
    20    0.10    0.28    0.28    0.58 ^ place654/X (sky130_fd_sc_hd__buf_4)
                                         net653 (net)
                  0.28    0.01    0.59 ^ _07598_/S (sky130_fd_sc_hd__mux2i_4)
     1    0.00    0.12    0.27    0.86 ^ _07598_/Y (sky130_fd_sc_hd__mux2i_4)
                                         _02615_ (net)
                  0.12    0.00    0.86 ^ place582/A (sky130_fd_sc_hd__buf_4)
    33    0.26    0.71    0.58    1.44 ^ place582/X (sky130_fd_sc_hd__buf_4)
                                         net581 (net)
                  0.71    0.01    1.46 ^ _07779_/S0 (sky130_fd_sc_hd__mux4_2)
     2    0.01    0.11    0.64    2.10 v _07779_/X (sky130_fd_sc_hd__mux4_2)
                                         _02793_ (net)
                  0.11    0.00    2.10 v _07780_/SLEEP_B (sky130_fd_sc_hd__lpflow_inputiso0n_1)
     2    0.00    0.04    0.19    2.29 v _07780_/X (sky130_fd_sc_hd__lpflow_inputiso0n_1)
                                         _02794_ (net)
                  0.04    0.00    2.29 v _07781_/B (sky130_fd_sc_hd__nor2_1)
     3    0.02    0.35    0.28    2.57 ^ _07781_/Y (sky130_fd_sc_hd__nor2_1)
                                         _02795_ (net)
                  0.35    0.00    2.57 ^ _08560_/B2 (sky130_fd_sc_hd__o22ai_1)
     1    0.01    0.15    0.19    2.76 v _08560_/Y (sky130_fd_sc_hd__o22ai_1)
                                         _03557_ (net)
                  0.15    0.00    2.76 v _08565_/A (sky130_fd_sc_hd__nor3_1)
     1    0.02    0.54    0.51    3.27 ^ _08565_/Y (sky130_fd_sc_hd__nor3_1)
                                         _03562_ (net)
                  0.54    0.00    3.27 ^ _08566_/B1 (sky130_fd_sc_hd__o32ai_1)
     2    0.01    0.20    0.27    3.55 v _08566_/Y (sky130_fd_sc_hd__o32ai_1)
                                         _03563_ (net)
                  0.20    0.00    3.55 v _08578_/A2 (sky130_fd_sc_hd__a32oi_1)
     1    0.13    2.85    2.19    5.74 ^ _08578_/Y (sky130_fd_sc_hd__a32oi_1)
                                         _03575_ (net)
                  2.85    0.05    5.79 ^ place319/A (sky130_fd_sc_hd__buf_4)
    11    0.08    0.24    0.52    6.31 ^ place319/X (sky130_fd_sc_hd__buf_4)
                                         net318 (net)
                  0.24    0.01    6.32 ^ _08580_/A2 (sky130_fd_sc_hd__a21oi_1)
     1    0.00    0.08    0.10    6.42 v _08580_/Y (sky130_fd_sc_hd__a21oi_1)
                                         _00773_ (net)
                  0.08    0.00    6.42 v core.CPU_Xreg_value_a4[10][29]$_SDFFE_PP0P_/D (sky130_fd_sc_hd__dfxtp_1)
                                  6.42   data arrival time

                  0.00   11.00   11.00   clock clk (rise edge)
                          0.00   11.00   clock network delay (ideal)
                          0.00   11.00   clock reconvergence pessimism
                                 11.00 ^ core.CPU_Xreg_value_a4[10][29]$_SDFFE_PP0P_/CLK (sky130_fd_sc_hd__dfxtp_1)
                         -0.13   10.87   library setup time
                                 10.87   data required time
-----------------------------------------------------------------------------
                                 10.87   data required time
                                 -6.42   data arrival time
-----------------------------------------------------------------------------
                                  4.44   slack (MET)



==========================================================================
global place report_checks -unconstrained
--------------------------------------------------------------------------
Startpoint: core.CPU_is_slli_a3$_DFF_P_
            (rising edge-triggered flip-flop clocked by clk)
Endpoint: core.CPU_Xreg_value_a4[10][29]$_SDFFE_PP0P_
          (rising edge-triggered flip-flop clocked by clk)
Path Group: clk
Path Type: max

Fanout     Cap    Slew   Delay    Time   Description
-----------------------------------------------------------------------------
                  0.00    0.00    0.00   clock clk (rise edge)
                          0.00    0.00   clock network delay (ideal)
                  0.00    0.00    0.00 ^ core.CPU_is_slli_a3$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_1)
     1    0.01    0.06    0.30    0.30 ^ core.CPU_is_slli_a3$_DFF_P_/Q (sky130_fd_sc_hd__dfxtp_1)
                                         core.CPU_is_slli_a3 (net)
                  0.06    0.00    0.30 ^ place654/A (sky130_fd_sc_hd__buf_4)
    20    0.10    0.28    0.28    0.58 ^ place654/X (sky130_fd_sc_hd__buf_4)
                                         net653 (net)
                  0.28    0.01    0.59 ^ _07598_/S (sky130_fd_sc_hd__mux2i_4)
     1    0.00    0.12    0.27    0.86 ^ _07598_/Y (sky130_fd_sc_hd__mux2i_4)
                                         _02615_ (net)
                  0.12    0.00    0.86 ^ place582/A (sky130_fd_sc_hd__buf_4)
    33    0.26    0.71    0.58    1.44 ^ place582/X (sky130_fd_sc_hd__buf_4)
                                         net581 (net)
                  0.71    0.01    1.46 ^ _07779_/S0 (sky130_fd_sc_hd__mux4_2)
     2    0.01    0.11    0.64    2.10 v _07779_/X (sky130_fd_sc_hd__mux4_2)
                                         _02793_ (net)
                  0.11    0.00    2.10 v _07780_/SLEEP_B (sky130_fd_sc_hd__lpflow_inputiso0n_1)
     2    0.00    0.04    0.19    2.29 v _07780_/X (sky130_fd_sc_hd__lpflow_inputiso0n_1)
                                         _02794_ (net)
                  0.04    0.00    2.29 v _07781_/B (sky130_fd_sc_hd__nor2_1)
     3    0.02    0.35    0.28    2.57 ^ _07781_/Y (sky130_fd_sc_hd__nor2_1)
                                         _02795_ (net)
                  0.35    0.00    2.57 ^ _08560_/B2 (sky130_fd_sc_hd__o22ai_1)
     1    0.01    0.15    0.19    2.76 v _08560_/Y (sky130_fd_sc_hd__o22ai_1)
                                         _03557_ (net)
                  0.15    0.00    2.76 v _08565_/A (sky130_fd_sc_hd__nor3_1)
     1    0.02    0.54    0.51    3.27 ^ _08565_/Y (sky130_fd_sc_hd__nor3_1)
                                         _03562_ (net)
                  0.54    0.00    3.27 ^ _08566_/B1 (sky130_fd_sc_hd__o32ai_1)
     2    0.01    0.20    0.27    3.55 v _08566_/Y (sky130_fd_sc_hd__o32ai_1)
                                         _03563_ (net)
                  0.20    0.00    3.55 v _08578_/A2 (sky130_fd_sc_hd__a32oi_1)
     1    0.13    2.85    2.19    5.74 ^ _08578_/Y (sky130_fd_sc_hd__a32oi_1)
                                         _03575_ (net)
                  2.85    0.05    5.79 ^ place319/A (sky130_fd_sc_hd__buf_4)
    11    0.08    0.24    0.52    6.31 ^ place319/X (sky130_fd_sc_hd__buf_4)
                                         net318 (net)
                  0.24    0.01    6.32 ^ _08580_/A2 (sky130_fd_sc_hd__a21oi_1)
     1    0.00    0.08    0.10    6.42 v _08580_/Y (sky130_fd_sc_hd__a21oi_1)
                                         _00773_ (net)
                  0.08    0.00    6.42 v core.CPU_Xreg_value_a4[10][29]$_SDFFE_PP0P_/D (sky130_fd_sc_hd__dfxtp_1)
                                  6.42   data arrival time

                  0.00   11.00   11.00   clock clk (rise edge)
                          0.00   11.00   clock network delay (ideal)
                          0.00   11.00   clock reconvergence pessimism
                                 11.00 ^ core.CPU_Xreg_value_a4[10][29]$_SDFFE_PP0P_/CLK (sky130_fd_sc_hd__dfxtp_1)
                         -0.13   10.87   library setup time
                                 10.87   data required time
-----------------------------------------------------------------------------
                                 10.87   data required time
                                 -6.42   data arrival time
-----------------------------------------------------------------------------
                                  4.44   slack (MET)



==========================================================================
global place report_power
--------------------------------------------------------------------------
Group                  Internal  Switching    Leakage      Total
                          Power      Power      Power      Power (Watts)
----------------------------------------------------------------
Sequential             4.45e-03   4.28e-04   9.26e-09   4.88e-03  57.5%
Combinational          9.05e-04   2.70e-03   1.07e-08   3.61e-03  42.5%
Clock                  0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
Macro                  0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
Pad                    0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
----------------------------------------------------------------
Total                  5.36e-03   3.13e-03   2.00e-08   8.49e-03 100.0%
                          63.1%      36.9%       0.0%
```

</details>


### PLACEMENT ANALYSIS
Placement positions the standard cells and macros within the core area.

<img width="1445" height="809" alt="Screenshot (468)" src="https://github.com/user-attachments/assets/e9fd7254-7e2a-4f00-8a75-284ffd01048b" />

To view placement and congestion:

```bash
make DESIGN_CONFIG=./designs/sky130hd/vsdbabysoc/config.mk gui_place
```
This image shows the placement stage in OpenROAD with the placement density heat map enabled.


<img width="1592" height="913" alt="image" src="https://github.com/user-attachments/assets/3306da81-e544-4b0c-a89e-d5230cd9b030" />
This image shows a zoomed-in view of the Placement Density Heatmap after the placement stage:

Red regions indicate areas with higher cell density, approaching 100%.
Green and blue regions indicate moderate to low cell density.
<img width="1600" height="850" alt="image" src="https://github.com/user-attachments/assets/79288113-316e-4acf-a243-430e0a195c84" />

The highlighted row (ROW_128_2) displays details such as origin coordinates, site count, site spacing, and bounding box dimensions.
❗Note: In the floorplan stage, you do not see any placement density heat maps because standard cells have not yet been placed. The heat map will only appear after the placement step.

The placement density percentage is calculated as:

Placement Density (%) = (Area Occupied by Cells ÷ Total Placement Area) × 100

<img width="1590" height="780" alt="image" src="https://github.com/user-attachments/assets/ba57a4fe-1add-4b3e-bf33-432f06e9fe6f" />


This image shows the Pin Density Heatmap after the placement stage.

The pin density percentage is calculated as:

Pin Density (%) = (Number of Pins in a Region ÷ Total Area of that Region) × 100


<img width="1920" height="926" alt="Screenshot (512)" src="https://github.com/user-attachments/assets/83f96dc6-3f60-401f-a01e-42f29a404959" />
<img width="1920" height="917" alt="Screenshot (513)" src="https://github.com/user-attachments/assets/0e864480-5026-491b-a7a4-eaf3176d74fb" />
<img width="1920" height="936" alt="Screenshot (514)" src="https://github.com/user-attachments/assets/9f50bc72-c6be-44ea-82a8-90345c82b103" />
<img width="1920" height="885" alt="Screenshot (516)" src="https://github.com/user-attachments/assets/fab833a6-bf23-4a84-838a-995e0a1a239d" />
<img width="1920" height="887" alt="Screenshot (517)" src="https://github.com/user-attachments/assets/14e60bb6-e74c-4ff3-b561-120fabebde2b" />

<img width="1920" height="904" alt="Screenshot (518)" src="https://github.com/user-attachments/assets/8f558532-f2fe-472a-bb0b-7b2d387784c5" />

<img width="1920" height="897" alt="Screenshot (519)" src="https://github.com/user-attachments/assets/0f15460e-1a24-4f13-99e0-accbcb8db230" />

<img width="1920" height="898" alt="Screenshot (520)" src="https://github.com/user-attachments/assets/4a95075c-4cbb-4b77-9812-13a3855033eb" />


<img width="1920" height="910" alt="Screenshot (521)" src="https://github.com/user-attachments/assets/4093ee21-5cd6-47e6-99d6-a8f71a0e6d7a" />

<details>
  <summary>
    3_detailed_place.rpt
  </summary>

  ```bash

==========================================================================
detailed place report_tns
--------------------------------------------------------------------------
tns max 0.00

==========================================================================
detailed place report_wns
--------------------------------------------------------------------------
wns max 0.00

==========================================================================
detailed place report_worst_slack
--------------------------------------------------------------------------
worst slack max 5.40

==========================================================================
detailed place report_clock_min_period
--------------------------------------------------------------------------
clk period_min = 5.60 fmax = 178.45

==========================================================================
detailed place report_checks -path_delay min
--------------------------------------------------------------------------
Startpoint: core.CPU_Xreg_value_a5[17][1]$_DFF_P_
            (rising edge-triggered flip-flop clocked by clk)
Endpoint: core.OUT[1]$_DFF_P_ (rising edge-triggered flip-flop clocked by clk)
Path Group: clk
Path Type: min

Fanout     Cap    Slew   Delay    Time   Description
-----------------------------------------------------------------------------
                  0.00    0.00    0.00   clock clk (rise edge)
                          0.00    0.00   clock network delay (ideal)
                  0.00    0.00    0.00 ^ core.CPU_Xreg_value_a5[17][1]$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_1)
     1    0.00    0.03    0.28    0.28 ^ core.CPU_Xreg_value_a5[17][1]$_DFF_P_/Q (sky130_fd_sc_hd__dfxtp_1)
                                         core.CPU_Xreg_value_a5[17][1] (net)
                  0.03    0.00    0.28 ^ core.OUT[1]$_DFF_P_/D (sky130_fd_sc_hd__dfxtp_1)
                                  0.28   data arrival time

                  0.00    0.00    0.00   clock clk (rise edge)
                          0.00    0.00   clock network delay (ideal)
                          0.00    0.00   clock reconvergence pessimism
                                  0.00 ^ core.OUT[1]$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_1)
                         -0.03   -0.03   library hold time
                                 -0.03   data required time
-----------------------------------------------------------------------------
                                 -0.03   data required time
                                 -0.28   data arrival time
-----------------------------------------------------------------------------
                                  0.31   slack (MET)



==========================================================================
detailed place report_checks -path_delay max
--------------------------------------------------------------------------
Startpoint: core.CPU_is_slli_a3$_DFF_P_
            (rising edge-triggered flip-flop clocked by clk)
Endpoint: core.CPU_Xreg_value_a4[8][30]$_SDFFE_PP0P_
          (rising edge-triggered flip-flop clocked by clk)
Path Group: clk
Path Type: max

Fanout     Cap    Slew   Delay    Time   Description
-----------------------------------------------------------------------------
                  0.00    0.00    0.00   clock clk (rise edge)
                          0.00    0.00   clock network delay (ideal)
                  0.00    0.00    0.00 ^ core.CPU_is_slli_a3$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_1)
     1    0.00    0.04    0.28    0.28 ^ core.CPU_is_slli_a3$_DFF_P_/Q (sky130_fd_sc_hd__dfxtp_1)
                                         core.CPU_is_slli_a3 (net)
                  0.04    0.00    0.28 ^ place654/A (sky130_fd_sc_hd__buf_4)
    20    0.10    0.27    0.27    0.55 ^ place654/X (sky130_fd_sc_hd__buf_4)
                                         net653 (net)
                  0.27    0.01    0.56 ^ _07598_/S (sky130_fd_sc_hd__mux2i_4)
     1    0.00    0.11    0.26    0.82 ^ _07598_/Y (sky130_fd_sc_hd__mux2i_4)
                                         _02615_ (net)
                  0.11    0.00    0.82 ^ place582/A (sky130_fd_sc_hd__buf_4)
    33    0.25    0.69    0.57    1.39 ^ place582/X (sky130_fd_sc_hd__buf_4)
                                         net581 (net)
                  0.69    0.03    1.42 ^ _07839_/S0 (sky130_fd_sc_hd__mux4_2)
     2    0.01    0.11    0.64    2.05 v _07839_/X (sky130_fd_sc_hd__mux4_2)
                                         _02852_ (net)
                  0.11    0.00    2.05 v _07840_/A1 (sky130_fd_sc_hd__mux2i_1)
     3    0.02    0.49    0.44    2.49 ^ _07840_/Y (sky130_fd_sc_hd__mux2i_1)
                                         _02853_ (net)
                  0.49    0.00    2.49 ^ _08628_/A1 (sky130_fd_sc_hd__o22ai_1)
     1    0.00    0.10    0.17    2.66 v _08628_/Y (sky130_fd_sc_hd__o22ai_1)
                                         _03623_ (net)
                  0.10    0.00    2.66 v _08632_/B1 (sky130_fd_sc_hd__a311o_1)
     1    0.02    0.14    0.44    3.10 v _08632_/X (sky130_fd_sc_hd__a311o_1)
                                         _03627_ (net)
                  0.14    0.00    3.10 v _08633_/C1 (sky130_fd_sc_hd__a211oi_1)
     1    0.02    0.71    0.60    3.70 ^ _08633_/Y (sky130_fd_sc_hd__a211oi_1)
                                         _03628_ (net)
                  0.71    0.00    3.70 ^ _08634_/C1 (sky130_fd_sc_hd__a2111oi_1)
     2    0.02    0.21    0.23    3.93 v _08634_/Y (sky130_fd_sc_hd__a2111oi_1)
                                         _03629_ (net)
                  0.21    0.00    3.93 v _08640_/A3 (sky130_fd_sc_hd__a31oi_1)
     1    0.06    1.37    1.06    4.99 ^ _08640_/Y (sky130_fd_sc_hd__a31oi_1)
                                         _03635_ (net)
                  1.37    0.01    5.00 ^ place309/A (sky130_fd_sc_hd__buf_4)
    11    0.05    0.16    0.37    5.37 ^ place309/X (sky130_fd_sc_hd__buf_4)
                                         net308 (net)
                  0.16    0.00    5.38 ^ _09675_/A1 (sky130_fd_sc_hd__o21ai_1)
     1    0.00    0.09    0.09    5.46 v _09675_/Y (sky130_fd_sc_hd__o21ai_1)
                                         _01063_ (net)
                  0.09    0.00    5.46 v core.CPU_Xreg_value_a4[8][30]$_SDFFE_PP0P_/D (sky130_fd_sc_hd__dfxtp_1)
                                  5.46   data arrival time

                  0.00   11.00   11.00   clock clk (rise edge)
                          0.00   11.00   clock network delay (ideal)
                          0.00   11.00   clock reconvergence pessimism
                                 11.00 ^ core.CPU_Xreg_value_a4[8][30]$_SDFFE_PP0P_/CLK (sky130_fd_sc_hd__dfxtp_1)
                         -0.14   10.86   library setup time
                                 10.86   data required time
-----------------------------------------------------------------------------
                                 10.86   data required time
                                 -5.46   data arrival time
-----------------------------------------------------------------------------
                                  5.40   slack (MET)



==========================================================================
detailed place report_checks -unconstrained
--------------------------------------------------------------------------
Startpoint: core.CPU_is_slli_a3$_DFF_P_
            (rising edge-triggered flip-flop clocked by clk)
Endpoint: core.CPU_Xreg_value_a4[8][30]$_SDFFE_PP0P_
          (rising edge-triggered flip-flop clocked by clk)
Path Group: clk
Path Type: max

Fanout     Cap    Slew   Delay    Time   Description
-----------------------------------------------------------------------------
                  0.00    0.00    0.00   clock clk (rise edge)
                          0.00    0.00   clock network delay (ideal)
                  0.00    0.00    0.00 ^ core.CPU_is_slli_a3$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_1)
     1    0.00    0.04    0.28    0.28 ^ core.CPU_is_slli_a3$_DFF_P_/Q (sky130_fd_sc_hd__dfxtp_1)
                                         core.CPU_is_slli_a3 (net)
                  0.04    0.00    0.28 ^ place654/A (sky130_fd_sc_hd__buf_4)
    20    0.10    0.27    0.27    0.55 ^ place654/X (sky130_fd_sc_hd__buf_4)
                                         net653 (net)
                  0.27    0.01    0.56 ^ _07598_/S (sky130_fd_sc_hd__mux2i_4)
     1    0.00    0.11    0.26    0.82 ^ _07598_/Y (sky130_fd_sc_hd__mux2i_4)
                                         _02615_ (net)
                  0.11    0.00    0.82 ^ place582/A (sky130_fd_sc_hd__buf_4)
    33    0.25    0.69    0.57    1.39 ^ place582/X (sky130_fd_sc_hd__buf_4)
                                         net581 (net)
                  0.69    0.03    1.42 ^ _07839_/S0 (sky130_fd_sc_hd__mux4_2)
     2    0.01    0.11    0.64    2.05 v _07839_/X (sky130_fd_sc_hd__mux4_2)
                                         _02852_ (net)
                  0.11    0.00    2.05 v _07840_/A1 (sky130_fd_sc_hd__mux2i_1)
     3    0.02    0.49    0.44    2.49 ^ _07840_/Y (sky130_fd_sc_hd__mux2i_1)
                                         _02853_ (net)
                  0.49    0.00    2.49 ^ _08628_/A1 (sky130_fd_sc_hd__o22ai_1)
     1    0.00    0.10    0.17    2.66 v _08628_/Y (sky130_fd_sc_hd__o22ai_1)
                                         _03623_ (net)
                  0.10    0.00    2.66 v _08632_/B1 (sky130_fd_sc_hd__a311o_1)
     1    0.02    0.14    0.44    3.10 v _08632_/X (sky130_fd_sc_hd__a311o_1)
                                         _03627_ (net)
                  0.14    0.00    3.10 v _08633_/C1 (sky130_fd_sc_hd__a211oi_1)
     1    0.02    0.71    0.60    3.70 ^ _08633_/Y (sky130_fd_sc_hd__a211oi_1)
                                         _03628_ (net)
                  0.71    0.00    3.70 ^ _08634_/C1 (sky130_fd_sc_hd__a2111oi_1)
     2    0.02    0.21    0.23    3.93 v _08634_/Y (sky130_fd_sc_hd__a2111oi_1)
                                         _03629_ (net)
                  0.21    0.00    3.93 v _08640_/A3 (sky130_fd_sc_hd__a31oi_1)
     1    0.06    1.37    1.06    4.99 ^ _08640_/Y (sky130_fd_sc_hd__a31oi_1)
                                         _03635_ (net)
                  1.37    0.01    5.00 ^ place309/A (sky130_fd_sc_hd__buf_4)
    11    0.05    0.16    0.37    5.37 ^ place309/X (sky130_fd_sc_hd__buf_4)
                                         net308 (net)
                  0.16    0.00    5.38 ^ _09675_/A1 (sky130_fd_sc_hd__o21ai_1)
     1    0.00    0.09    0.09    5.46 v _09675_/Y (sky130_fd_sc_hd__o21ai_1)
                                         _01063_ (net)
                  0.09    0.00    5.46 v core.CPU_Xreg_value_a4[8][30]$_SDFFE_PP0P_/D (sky130_fd_sc_hd__dfxtp_1)
                                  5.46   data arrival time

                  0.00   11.00   11.00   clock clk (rise edge)
                          0.00   11.00   clock network delay (ideal)
                          0.00   11.00   clock reconvergence pessimism
                                 11.00 ^ core.CPU_Xreg_value_a4[8][30]$_SDFFE_PP0P_/CLK (sky130_fd_sc_hd__dfxtp_1)
                         -0.14   10.86   library setup time
                                 10.86   data required time
-----------------------------------------------------------------------------
                                 10.86   data required time
                                 -5.46   data arrival time
-----------------------------------------------------------------------------
                                  5.40   slack (MET)



==========================================================================
detailed place report_check_types -max_slew -max_cap -max_fanout -violators
--------------------------------------------------------------------------

==========================================================================
detailed place max_slew_check_slack
--------------------------------------------------------------------------
0.04156219959259033

==========================================================================
detailed place max_slew_check_limit
--------------------------------------------------------------------------
1.510388970375061

==========================================================================
detailed place max_slew_check_slack_limit
--------------------------------------------------------------------------
0.0275

==========================================================================
detailed place max_fanout_check_slack
--------------------------------------------------------------------------
1.0000000150474662e+30

==========================================================================
detailed place max_fanout_check_limit
--------------------------------------------------------------------------
1.0000000150474662e+30

==========================================================================
detailed place max_capacitance_check_slack
--------------------------------------------------------------------------
0.004880447871983051

==========================================================================
detailed place max_capacitance_check_limit
--------------------------------------------------------------------------
0.06592799723148346

==========================================================================
detailed place max_capacitance_check_slack_limit
--------------------------------------------------------------------------
0.0740

==========================================================================
detailed place max_slew_violation_count
--------------------------------------------------------------------------
max slew violation count 0

==========================================================================
detailed place max_fanout_violation_count
--------------------------------------------------------------------------
max fanout violation count 0

==========================================================================
detailed place max_cap_violation_count
--------------------------------------------------------------------------
max cap violation count 0

==========================================================================
detailed place setup_violation_count
--------------------------------------------------------------------------
setup violation count 0

==========================================================================
detailed place hold_violation_count
--------------------------------------------------------------------------
hold violation count 0

==========================================================================
detailed place report_checks -path_delay max reg to reg
--------------------------------------------------------------------------
Startpoint: core.CPU_is_slli_a3$_DFF_P_
            (rising edge-triggered flip-flop clocked by clk)
Endpoint: core.CPU_Xreg_value_a4[8][30]$_SDFFE_PP0P_
          (rising edge-triggered flip-flop clocked by clk)
Path Group: clk
Path Type: max

  Delay    Time   Description
---------------------------------------------------------
   0.00    0.00   clock clk (rise edge)
   0.00    0.00   clock network delay (ideal)
   0.00    0.00 ^ core.CPU_is_slli_a3$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_1)
   0.28    0.28 ^ core.CPU_is_slli_a3$_DFF_P_/Q (sky130_fd_sc_hd__dfxtp_1)
   0.27    0.55 ^ place654/X (sky130_fd_sc_hd__buf_4)
   0.27    0.82 ^ _07598_/Y (sky130_fd_sc_hd__mux2i_4)
   0.57    1.39 ^ place582/X (sky130_fd_sc_hd__buf_4)
   0.67    2.05 v _07839_/X (sky130_fd_sc_hd__mux4_2)
   0.44    2.49 ^ _07840_/Y (sky130_fd_sc_hd__mux2i_1)
   0.17    2.66 v _08628_/Y (sky130_fd_sc_hd__o22ai_1)
   0.44    3.10 v _08632_/X (sky130_fd_sc_hd__a311o_1)
   0.60    3.70 ^ _08633_/Y (sky130_fd_sc_hd__a211oi_1)
   0.23    3.93 v _08634_/Y (sky130_fd_sc_hd__a2111oi_1)
   1.06    4.99 ^ _08640_/Y (sky130_fd_sc_hd__a31oi_1)
   0.38    5.37 ^ place309/X (sky130_fd_sc_hd__buf_4)
   0.09    5.46 v _09675_/Y (sky130_fd_sc_hd__o21ai_1)
   0.00    5.46 v core.CPU_Xreg_value_a4[8][30]$_SDFFE_PP0P_/D (sky130_fd_sc_hd__dfxtp_1)
           5.46   data arrival time

  11.00   11.00   clock clk (rise edge)
   0.00   11.00   clock network delay (ideal)
   0.00   11.00   clock reconvergence pessimism
          11.00 ^ core.CPU_Xreg_value_a4[8][30]$_SDFFE_PP0P_/CLK (sky130_fd_sc_hd__dfxtp_1)
  -0.14   10.86   library setup time
          10.86   data required time
---------------------------------------------------------
          10.86   data required time
          -5.46   data arrival time
---------------------------------------------------------
           5.40   slack (MET)



==========================================================================
detailed place report_checks -path_delay min reg to reg
--------------------------------------------------------------------------
Startpoint: core.CPU_Xreg_value_a5[17][1]$_DFF_P_
            (rising edge-triggered flip-flop clocked by clk)
Endpoint: core.OUT[1]$_DFF_P_ (rising edge-triggered flip-flop clocked by clk)
Path Group: clk
Path Type: min

  Delay    Time   Description
---------------------------------------------------------
   0.00    0.00   clock clk (rise edge)
   0.00    0.00   clock network delay (ideal)
   0.00    0.00 ^ core.CPU_Xreg_value_a5[17][1]$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_1)
   0.28    0.28 ^ core.CPU_Xreg_value_a5[17][1]$_DFF_P_/Q (sky130_fd_sc_hd__dfxtp_1)
   0.00    0.28 ^ core.OUT[1]$_DFF_P_/D (sky130_fd_sc_hd__dfxtp_1)
           0.28   data arrival time

   0.00    0.00   clock clk (rise edge)
   0.00    0.00   clock network delay (ideal)
   0.00    0.00   clock reconvergence pessimism
           0.00 ^ core.OUT[1]$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_1)
  -0.03   -0.03   library hold time
          -0.03   data required time
---------------------------------------------------------
          -0.03   data required time
          -0.28   data arrival time
---------------------------------------------------------
           0.31   slack (MET)



==========================================================================
detailed place critical path target clock latency max path
--------------------------------------------------------------------------
0

==========================================================================
detailed place critical path target clock latency min path
--------------------------------------------------------------------------
0

==========================================================================
detailed place critical path source clock latency min path
--------------------------------------------------------------------------
0

==========================================================================
detailed place critical path delay
--------------------------------------------------------------------------
5.4627

==========================================================================
detailed place critical path slack
--------------------------------------------------------------------------
5.3961

==========================================================================
detailed place slack div critical path delay
--------------------------------------------------------------------------
98.780823

==========================================================================
detailed place report_power
--------------------------------------------------------------------------
Group                  Internal  Switching    Leakage      Total
                          Power      Power      Power      Power (Watts)
----------------------------------------------------------------
Sequential             4.45e-03   4.24e-04   9.26e-09   4.87e-03  57.9%
Combinational          9.09e-04   2.63e-03   1.07e-08   3.54e-03  42.1%
Clock                  0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
Macro                  0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
Pad                    0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
----------------------------------------------------------------
Total                  5.36e-03   3.06e-03   2.00e-08   8.42e-03 100.0%
                          63.7%      36.3%       0.0%



  ```
</details>

### CTS FINAL REPORT
CTS balances clock delays to minimize skew.
Post-CTS timing reports are generated, including WNS, TNS, and violations.



<img width="1431" height="793" alt="Screenshot (469)" src="https://github.com/user-attachments/assets/8a6e7be6-896c-4955-986a-0eeb205a19ad" />

<img width="1452" height="807" alt="Screenshot (470)" src="https://github.com/user-attachments/assets/6686ede5-50ee-401a-acc1-b94072a20d33" />
<img width="1431" height="821" alt="Screenshot (471)" src="https://github.com/user-attachments/assets/173c729c-2996-48c9-beeb-ec54d87fac96" />


To view CTS layout:

```bash
make DESIGN_CONFIG=./designs/sky130hd/vsdbabysoc/config.mk gui_cts
```

This image shows the Clock Tree Synthesis (CTS) stage, highlighting a placed clock buffer (Clk_buf_leaf_7_clk) with its properties displayed in the Inspector, including position, orientation, and connectivity details.
<img width="1591" height="788" alt="image" src="https://github.com/user-attachments/assets/0d14d7ff-70df-4d9e-bf38-42728cdaaf85" />

<!--
<img width="1920" height="920" alt="Screenshot (527)" src="https://github.com/user-attachments/assets/69741f37-2674-43f0-808f-0f7ed5c86781" />

<img width="1920" height="926" alt="Screenshot (528)" src="https://github.com/user-attachments/assets/d9b3cac7-81c1-4d47-aa99-ba60f4eeba51" />
-->
This image shows the Clock Tree Viewer after CTS, illustrating the clock buffer distribution on the layout and a histogram of clock insertion delays, indicating balanced clock skew across the sinks.
<img width="1584" height="900" alt="image" src="https://github.com/user-attachments/assets/abea464f-5540-4860-93d5-9662cf9de69b" />


<img width="635" height="495" alt="image" src="https://github.com/user-attachments/assets/02dbeef9-c6b3-46a4-970a-58292a76379e" />


This image shows the Clock Tree Viewer after Clock Tree Synthesis (CTS), illustrating the hierarchical structure of the clock network. The root node at the top represents the clock source (pll/CLK), and the branches show the inserted clock buffers used to distribute the clock signal across the design. The vertical axis represents the clock arrival times (in nanoseconds) at each stage. The endpoints at the bottom represent the registers (clock sinks), where the clock reaches after passing through multiple buffer levels. The balanced branching and closely aligned arrival times indicate low clock skew and a well-optimized clock tree.


<img width="1324" height="816" alt="image" src="https://github.com/user-attachments/assets/6822fc73-bc2f-46d1-8bac-5ac4068f37ec" />

This image shows the Setup Timing Report, presenting a list of timing paths with key metrics such as:

Required Time
Arrival Time
Slack
Skew
Logic Delay
Logic Depth
Fanout
All paths have positive slack, confirming that the design meets setup timing requirements.

<img width="1598" height="860" alt="image" src="https://github.com/user-attachments/assets/023b480b-4509-4e8a-a9d4-df1074bcbf72" />

This image displays the Hold Timing Report, showing timing paths with details such as:

Required Time
Arrival Time
Slack
Skew
Logic Delay
Fanout
All paths listed have positive slack, indicating that the design meets hold timing requirements and is free from hold violations.

<img width="1594" height="858" alt="image" src="https://github.com/user-attachments/assets/e24fadd8-21e1-4106-aeb2-cea112b70398" />

This image shows the Setup Slack Histogram after CTS. The histogram represents the distribution of endpoint slack values, all of which are positive, indicating that there are no setup timing violations.

<img width="1601" height="858" alt="image" src="https://github.com/user-attachments/assets/0c1a82e8-0d29-45cf-a026-83c2394de56c" />

This image shows the Hold Slack Histogram after CTS. The histogram represents the distribution of hold slack values for all endpoints. All values are positive, confirming that the design meets hold timing requirements without any violations.


<img width="1500" height="815" alt="image" src="https://github.com/user-attachments/assets/3fa7e032-dd44-488b-9626-1e55ce97f648" />

Zoomed-in view of the design after CTS, showing inserted clock buffers and routing connections.

<img width="1499" height="810" alt="image" src="https://github.com/user-attachments/assets/dca45093-edc2-429d-b482-7d3446737ee2" />

<img width="1497" height="817" alt="image" src="https://github.com/user-attachments/assets/46d957aa-0693-4ff7-b308-c565667ccd90" />

<img width="1587" height="864" alt="image" src="https://github.com/user-attachments/assets/397c2082-fe81-449c-83a4-6f4fb62b887a" />
<img width="1598" height="878" alt="image" src="https://github.com/user-attachments/assets/7106c5c6-d14d-43c4-89ac-9e460f68cd93" />



<!--
<img width="1920" height="901" alt="Screenshot (530)" src="https://github.com/user-attachments/assets/56009502-6a59-48e3-8814-fcabb6a5eeaf" />


<img width="1920" height="901" alt="Screenshot (531)" src="https://github.com/user-attachments/assets/fead1ac6-7a87-4aa6-b56c-955da89b2550" />
<img width="1920" height="907" alt="Screenshot (532)" src="https://github.com/user-attachments/assets/e2ce790f-73b1-4073-8290-32a54fad47eb" />


<img width="1920" height="913" alt="Screenshot (533)" src="https://github.com/user-attachments/assets/7ccfae75-efab-4677-9041-a1e33f7357f2" />

-->


<details>
  <summary>
    4_cts_final.rpt
  </summary>

  ```bash


==========================================================================
cts final report_tns
--------------------------------------------------------------------------
tns max 0.00

==========================================================================
cts final report_wns
--------------------------------------------------------------------------
wns max 0.00

==========================================================================
cts final report_worst_slack
--------------------------------------------------------------------------
worst slack max 5.29

==========================================================================
cts final report_clock_min_period
--------------------------------------------------------------------------
clk period_min = 5.71 fmax = 175.02

==========================================================================
cts final report_clock_skew
--------------------------------------------------------------------------
Clock clk
   1.06 source latency core.CPU_src2_value_a3[19]$_DFF_P_/CLK ^
  -0.85 target latency core.CPU_Xreg_value_a4[2][29]$_SDFFE_PP0P_/CLK ^
   0.00 CRPR
--------------
   0.20 setup skew


==========================================================================
cts final report_checks -path_delay min
--------------------------------------------------------------------------
Startpoint: core.CPU_is_sll_a2$_DFF_P_
            (rising edge-triggered flip-flop clocked by clk)
Endpoint: core.CPU_is_sll_a3$_DFF_P_
          (rising edge-triggered flip-flop clocked by clk)
Path Group: clk
Path Type: min

Fanout     Cap    Slew   Delay    Time   Description
-----------------------------------------------------------------------------
                          0.00    0.00   clock clk (rise edge)
                          0.00    0.00   clock source latency
     1    0.20    0.00    0.00    0.00 ^ pll/CLK (avsdpll)
                                         CLK (net)
                  0.02    0.01    0.01 ^ clkbuf_0_CLK/A (sky130_fd_sc_hd__clkbuf_16)
     8    0.33    0.34    0.33    0.34 ^ clkbuf_0_CLK/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_0_CLK (net)
                  0.34    0.01    0.35 ^ clkbuf_3_3_0_CLK/A (sky130_fd_sc_hd__clkbuf_16)
    13    0.24    0.25    0.37    0.72 ^ clkbuf_3_3_0_CLK/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_3_3_0_CLK (net)
                  0.25    0.01    0.72 ^ clkbuf_leaf_55_CLK/A (sky130_fd_sc_hd__clkbuf_16)
    12    0.07    0.09    0.23    0.95 ^ clkbuf_leaf_55_CLK/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_leaf_55_CLK (net)
                  0.09    0.00    0.95 ^ core.CPU_is_sll_a2$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_1)
     1    0.00    0.04    0.31    1.27 ^ core.CPU_is_sll_a2$_DFF_P_/Q (sky130_fd_sc_hd__dfxtp_1)
                                         core.CPU_is_sll_a2 (net)
                  0.04    0.00    1.27 ^ core.CPU_is_sll_a3$_DFF_P_/D (sky130_fd_sc_hd__dfxtp_1)
                                  1.27   data arrival time

                          0.00    0.00   clock clk (rise edge)
                          0.00    0.00   clock source latency
     1    0.20    0.00    0.00    0.00 ^ pll/CLK (avsdpll)
                                         CLK (net)
                  0.02    0.01    0.01 ^ clkbuf_0_CLK/A (sky130_fd_sc_hd__clkbuf_16)
     8    0.33    0.34    0.33    0.34 ^ clkbuf_0_CLK/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_0_CLK (net)
                  0.34    0.02    0.36 ^ clkbuf_3_5_0_CLK/A (sky130_fd_sc_hd__clkbuf_16)
    14    0.31    0.32    0.42    0.77 ^ clkbuf_3_5_0_CLK/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_3_5_0_CLK (net)
                  0.32    0.01    0.78 ^ clkbuf_leaf_54_CLK/A (sky130_fd_sc_hd__clkbuf_16)
    11    0.06    0.08    0.24    1.02 ^ clkbuf_leaf_54_CLK/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_leaf_54_CLK (net)
                  0.08    0.00    1.02 ^ core.CPU_is_sll_a3$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_1)
                          0.00    1.02   clock reconvergence pessimism
                         -0.03    0.99   library hold time
                                  0.99   data required time
-----------------------------------------------------------------------------
                                  0.99   data required time
                                 -1.27   data arrival time
-----------------------------------------------------------------------------
                                  0.28   slack (MET)



==========================================================================
cts final report_checks -path_delay max
--------------------------------------------------------------------------
Startpoint: core.CPU_is_slli_a3$_DFF_P_
            (rising edge-triggered flip-flop clocked by clk)
Endpoint: core.CPU_Xreg_value_a4[27][30]$_SDFFE_PP0P_
          (rising edge-triggered flip-flop clocked by clk)
Path Group: clk
Path Type: max

Fanout     Cap    Slew   Delay    Time   Description
-----------------------------------------------------------------------------
                          0.00    0.00   clock clk (rise edge)
                          0.00    0.00   clock source latency
     1    0.20    0.00    0.00    0.00 ^ pll/CLK (avsdpll)
                                         CLK (net)
                  0.02    0.01    0.01 ^ clkbuf_0_CLK/A (sky130_fd_sc_hd__clkbuf_16)
     8    0.33    0.34    0.33    0.34 ^ clkbuf_0_CLK/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_0_CLK (net)
                  0.34    0.02    0.36 ^ clkbuf_3_5_0_CLK/A (sky130_fd_sc_hd__clkbuf_16)
    14    0.31    0.32    0.42    0.77 ^ clkbuf_3_5_0_CLK/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_3_5_0_CLK (net)
                  0.32    0.01    0.78 ^ clkbuf_leaf_54_CLK/A (sky130_fd_sc_hd__clkbuf_16)
    11    0.06    0.08    0.24    1.02 ^ clkbuf_leaf_54_CLK/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_leaf_54_CLK (net)
                  0.08    0.00    1.02 ^ core.CPU_is_slli_a3$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_1)
     1    0.00    0.04    0.31    1.33 ^ core.CPU_is_slli_a3$_DFF_P_/Q (sky130_fd_sc_hd__dfxtp_1)
                                         core.CPU_is_slli_a3 (net)
                  0.04    0.00    1.33 ^ place654/A (sky130_fd_sc_hd__buf_4)
    20    0.10    0.27    0.27    1.60 ^ place654/X (sky130_fd_sc_hd__buf_4)
                                         net653 (net)
                  0.27    0.01    1.61 ^ _07598_/S (sky130_fd_sc_hd__mux2i_4)
     1    0.00    0.11    0.26    1.87 ^ _07598_/Y (sky130_fd_sc_hd__mux2i_4)
                                         _02615_ (net)
                  0.11    0.00    1.87 ^ place582/A (sky130_fd_sc_hd__buf_4)
    33    0.26    0.69    0.57    2.44 ^ place582/X (sky130_fd_sc_hd__buf_4)
                                         net581 (net)
                  0.70    0.03    2.47 ^ _07839_/S0 (sky130_fd_sc_hd__mux4_2)
     2    0.01    0.11    0.64    3.11 v _07839_/X (sky130_fd_sc_hd__mux4_2)
                                         _02852_ (net)
                  0.11    0.00    3.11 v _07840_/A1 (sky130_fd_sc_hd__mux2i_1)
     3    0.02    0.49    0.44    3.54 ^ _07840_/Y (sky130_fd_sc_hd__mux2i_1)
                                         _02853_ (net)
                  0.49    0.00    3.55 ^ _08628_/A1 (sky130_fd_sc_hd__o22ai_1)
     1    0.00    0.10    0.17    3.72 v _08628_/Y (sky130_fd_sc_hd__o22ai_1)
                                         _03623_ (net)
                  0.10    0.00    3.72 v _08632_/B1 (sky130_fd_sc_hd__a311o_1)
     1    0.02    0.15    0.44    4.16 v _08632_/X (sky130_fd_sc_hd__a311o_1)
                                         _03627_ (net)
                  0.15    0.00    4.16 v _08633_/C1 (sky130_fd_sc_hd__a211oi_1)
     1    0.02    0.71    0.61    4.77 ^ _08633_/Y (sky130_fd_sc_hd__a211oi_1)
                                         _03628_ (net)
                  0.71    0.00    4.77 ^ _08634_/C1 (sky130_fd_sc_hd__a2111oi_1)
     2    0.02    0.20    0.23    5.00 v _08634_/Y (sky130_fd_sc_hd__a2111oi_1)
                                         _03629_ (net)
                  0.20    0.00    5.00 v _08640_/A3 (sky130_fd_sc_hd__a31oi_1)
     1    0.06    1.38    1.07    6.06 ^ _08640_/Y (sky130_fd_sc_hd__a31oi_1)
                                         _03635_ (net)
                  1.38    0.01    6.07 ^ place309/A (sky130_fd_sc_hd__buf_4)
    11    0.05    0.16    0.37    6.45 ^ place309/X (sky130_fd_sc_hd__buf_4)
                                         net308 (net)
                  0.16    0.00    6.45 ^ _09404_/A1 (sky130_fd_sc_hd__o21ai_1)
     1    0.00    0.07    0.09    6.54 v _09404_/Y (sky130_fd_sc_hd__o21ai_1)
                                         _00967_ (net)
                  0.07    0.00    6.54 v core.CPU_Xreg_value_a4[27][30]$_SDFFE_PP0P_/D (sky130_fd_sc_hd__dfxtp_1)
                                  6.54   data arrival time

                         11.00   11.00   clock clk (rise edge)
                          0.00   11.00   clock source latency
     1    0.20    0.00    0.00   11.00 ^ pll/CLK (avsdpll)
                                         CLK (net)
                  0.02    0.01   11.01 ^ clkbuf_0_CLK/A (sky130_fd_sc_hd__clkbuf_16)
     8    0.33    0.34    0.33   11.34 ^ clkbuf_0_CLK/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_0_CLK (net)
                  0.34    0.01   11.35 ^ clkbuf_3_3_0_CLK/A (sky130_fd_sc_hd__clkbuf_16)
    13    0.24    0.25    0.37   11.72 ^ clkbuf_3_3_0_CLK/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_3_3_0_CLK (net)
                  0.25    0.01   11.72 ^ clkbuf_leaf_56_CLK/A (sky130_fd_sc_hd__clkbuf_16)
    12    0.05    0.08    0.22   11.94 ^ clkbuf_leaf_56_CLK/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_leaf_56_CLK (net)
                  0.08    0.00   11.94 ^ core.CPU_Xreg_value_a4[27][30]$_SDFFE_PP0P_/CLK (sky130_fd_sc_hd__dfxtp_1)
                          0.00   11.94   clock reconvergence pessimism
                         -0.12   11.83   library setup time
                                 11.83   data required time
-----------------------------------------------------------------------------
                                 11.83   data required time
                                 -6.54   data arrival time
-----------------------------------------------------------------------------
                                  5.29   slack (MET)



==========================================================================
cts final report_checks -unconstrained
--------------------------------------------------------------------------
Startpoint: core.CPU_is_slli_a3$_DFF_P_
            (rising edge-triggered flip-flop clocked by clk)
Endpoint: core.CPU_Xreg_value_a4[27][30]$_SDFFE_PP0P_
          (rising edge-triggered flip-flop clocked by clk)
Path Group: clk
Path Type: max

Fanout     Cap    Slew   Delay    Time   Description
-----------------------------------------------------------------------------
                          0.00    0.00   clock clk (rise edge)
                          0.00    0.00   clock source latency
     1    0.20    0.00    0.00    0.00 ^ pll/CLK (avsdpll)
                                         CLK (net)
                  0.02    0.01    0.01 ^ clkbuf_0_CLK/A (sky130_fd_sc_hd__clkbuf_16)
     8    0.33    0.34    0.33    0.34 ^ clkbuf_0_CLK/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_0_CLK (net)
                  0.34    0.02    0.36 ^ clkbuf_3_5_0_CLK/A (sky130_fd_sc_hd__clkbuf_16)
    14    0.31    0.32    0.42    0.77 ^ clkbuf_3_5_0_CLK/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_3_5_0_CLK (net)
                  0.32    0.01    0.78 ^ clkbuf_leaf_54_CLK/A (sky130_fd_sc_hd__clkbuf_16)
    11    0.06    0.08    0.24    1.02 ^ clkbuf_leaf_54_CLK/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_leaf_54_CLK (net)
                  0.08    0.00    1.02 ^ core.CPU_is_slli_a3$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_1)
     1    0.00    0.04    0.31    1.33 ^ core.CPU_is_slli_a3$_DFF_P_/Q (sky130_fd_sc_hd__dfxtp_1)
                                         core.CPU_is_slli_a3 (net)
                  0.04    0.00    1.33 ^ place654/A (sky130_fd_sc_hd__buf_4)
    20    0.10    0.27    0.27    1.60 ^ place654/X (sky130_fd_sc_hd__buf_4)
                                         net653 (net)
                  0.27    0.01    1.61 ^ _07598_/S (sky130_fd_sc_hd__mux2i_4)
     1    0.00    0.11    0.26    1.87 ^ _07598_/Y (sky130_fd_sc_hd__mux2i_4)
                                         _02615_ (net)
                  0.11    0.00    1.87 ^ place582/A (sky130_fd_sc_hd__buf_4)
    33    0.26    0.69    0.57    2.44 ^ place582/X (sky130_fd_sc_hd__buf_4)
                                         net581 (net)
                  0.70    0.03    2.47 ^ _07839_/S0 (sky130_fd_sc_hd__mux4_2)
     2    0.01    0.11    0.64    3.11 v _07839_/X (sky130_fd_sc_hd__mux4_2)
                                         _02852_ (net)
                  0.11    0.00    3.11 v _07840_/A1 (sky130_fd_sc_hd__mux2i_1)
     3    0.02    0.49    0.44    3.54 ^ _07840_/Y (sky130_fd_sc_hd__mux2i_1)
                                         _02853_ (net)
                  0.49    0.00    3.55 ^ _08628_/A1 (sky130_fd_sc_hd__o22ai_1)
     1    0.00    0.10    0.17    3.72 v _08628_/Y (sky130_fd_sc_hd__o22ai_1)
                                         _03623_ (net)
                  0.10    0.00    3.72 v _08632_/B1 (sky130_fd_sc_hd__a311o_1)
     1    0.02    0.15    0.44    4.16 v _08632_/X (sky130_fd_sc_hd__a311o_1)
                                         _03627_ (net)
                  0.15    0.00    4.16 v _08633_/C1 (sky130_fd_sc_hd__a211oi_1)
     1    0.02    0.71    0.61    4.77 ^ _08633_/Y (sky130_fd_sc_hd__a211oi_1)
                                         _03628_ (net)
                  0.71    0.00    4.77 ^ _08634_/C1 (sky130_fd_sc_hd__a2111oi_1)
     2    0.02    0.20    0.23    5.00 v _08634_/Y (sky130_fd_sc_hd__a2111oi_1)
                                         _03629_ (net)
                  0.20    0.00    5.00 v _08640_/A3 (sky130_fd_sc_hd__a31oi_1)
     1    0.06    1.38    1.07    6.06 ^ _08640_/Y (sky130_fd_sc_hd__a31oi_1)
                                         _03635_ (net)
                  1.38    0.01    6.07 ^ place309/A (sky130_fd_sc_hd__buf_4)
    11    0.05    0.16    0.37    6.45 ^ place309/X (sky130_fd_sc_hd__buf_4)
                                         net308 (net)
                  0.16    0.00    6.45 ^ _09404_/A1 (sky130_fd_sc_hd__o21ai_1)
     1    0.00    0.07    0.09    6.54 v _09404_/Y (sky130_fd_sc_hd__o21ai_1)
                                         _00967_ (net)
                  0.07    0.00    6.54 v core.CPU_Xreg_value_a4[27][30]$_SDFFE_PP0P_/D (sky130_fd_sc_hd__dfxtp_1)
                                  6.54   data arrival time

                         11.00   11.00   clock clk (rise edge)
                          0.00   11.00   clock source latency
     1    0.20    0.00    0.00   11.00 ^ pll/CLK (avsdpll)
                                         CLK (net)
                  0.02    0.01   11.01 ^ clkbuf_0_CLK/A (sky130_fd_sc_hd__clkbuf_16)
     8    0.33    0.34    0.33   11.34 ^ clkbuf_0_CLK/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_0_CLK (net)
                  0.34    0.01   11.35 ^ clkbuf_3_3_0_CLK/A (sky130_fd_sc_hd__clkbuf_16)
    13    0.24    0.25    0.37   11.72 ^ clkbuf_3_3_0_CLK/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_3_3_0_CLK (net)
                  0.25    0.01   11.72 ^ clkbuf_leaf_56_CLK/A (sky130_fd_sc_hd__clkbuf_16)
    12    0.05    0.08    0.22   11.94 ^ clkbuf_leaf_56_CLK/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_leaf_56_CLK (net)
                  0.08    0.00   11.94 ^ core.CPU_Xreg_value_a4[27][30]$_SDFFE_PP0P_/CLK (sky130_fd_sc_hd__dfxtp_1)
                          0.00   11.94   clock reconvergence pessimism
                         -0.12   11.83   library setup time
                                 11.83   data required time
-----------------------------------------------------------------------------
                                 11.83   data required time
                                 -6.54   data arrival time
-----------------------------------------------------------------------------
                                  5.29   slack (MET)



==========================================================================
cts final report_check_types -max_slew -max_cap -max_fanout -violators
--------------------------------------------------------------------------

==========================================================================
cts final max_slew_check_slack
--------------------------------------------------------------------------
0.04156219959259033

==========================================================================
cts final max_slew_check_limit
--------------------------------------------------------------------------
1.510388970375061

==========================================================================
cts final max_slew_check_slack_limit
--------------------------------------------------------------------------
0.0275

==========================================================================
cts final max_fanout_check_slack
--------------------------------------------------------------------------
1.0000000150474662e+30

==========================================================================
cts final max_fanout_check_limit
--------------------------------------------------------------------------
1.0000000150474662e+30

==========================================================================
cts final max_capacitance_check_slack
--------------------------------------------------------------------------
0.004288162104785442

==========================================================================
cts final max_capacitance_check_limit
--------------------------------------------------------------------------
0.06592799723148346

==========================================================================
cts final max_capacitance_check_slack_limit
--------------------------------------------------------------------------
0.0650

==========================================================================
cts final max_slew_violation_count
--------------------------------------------------------------------------
max slew violation count 0

==========================================================================
cts final max_fanout_violation_count
--------------------------------------------------------------------------
max fanout violation count 0

==========================================================================
cts final max_cap_violation_count
--------------------------------------------------------------------------
max cap violation count 0

==========================================================================
cts final setup_violation_count
--------------------------------------------------------------------------
setup violation count 0

==========================================================================
cts final hold_violation_count
--------------------------------------------------------------------------
hold violation count 0

==========================================================================
cts final report_checks -path_delay max reg to reg
--------------------------------------------------------------------------
Startpoint: core.CPU_is_slli_a3$_DFF_P_
            (rising edge-triggered flip-flop clocked by clk)
Endpoint: core.CPU_Xreg_value_a4[27][30]$_SDFFE_PP0P_
          (rising edge-triggered flip-flop clocked by clk)
Path Group: clk
Path Type: max

  Delay    Time   Description
---------------------------------------------------------
   0.00    0.00   clock clk (rise edge)
   0.00    0.00   clock source latency
   0.00    0.00 ^ pll/CLK (avsdpll)
   0.34    0.34 ^ clkbuf_0_CLK/X (sky130_fd_sc_hd__clkbuf_16)
   0.43    0.77 ^ clkbuf_3_5_0_CLK/X (sky130_fd_sc_hd__clkbuf_16)
   0.24    1.02 ^ clkbuf_leaf_54_CLK/X (sky130_fd_sc_hd__clkbuf_16)
   0.00    1.02 ^ core.CPU_is_slli_a3$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_1)
   0.31    1.33 ^ core.CPU_is_slli_a3$_DFF_P_/Q (sky130_fd_sc_hd__dfxtp_1)
   0.27    1.60 ^ place654/X (sky130_fd_sc_hd__buf_4)
   0.27    1.87 ^ _07598_/Y (sky130_fd_sc_hd__mux2i_4)
   0.57    2.44 ^ place582/X (sky130_fd_sc_hd__buf_4)
   0.67    3.11 v _07839_/X (sky130_fd_sc_hd__mux4_2)
   0.44    3.54 ^ _07840_/Y (sky130_fd_sc_hd__mux2i_1)
   0.17    3.72 v _08628_/Y (sky130_fd_sc_hd__o22ai_1)
   0.44    4.16 v _08632_/X (sky130_fd_sc_hd__a311o_1)
   0.61    4.77 ^ _08633_/Y (sky130_fd_sc_hd__a211oi_1)
   0.23    5.00 v _08634_/Y (sky130_fd_sc_hd__a2111oi_1)
   1.07    6.06 ^ _08640_/Y (sky130_fd_sc_hd__a31oi_1)
   0.38    6.45 ^ place309/X (sky130_fd_sc_hd__buf_4)
   0.09    6.54 v _09404_/Y (sky130_fd_sc_hd__o21ai_1)
   0.00    6.54 v core.CPU_Xreg_value_a4[27][30]$_SDFFE_PP0P_/D (sky130_fd_sc_hd__dfxtp_1)
           6.54   data arrival time

  11.00   11.00   clock clk (rise edge)
   0.00   11.00   clock source latency
   0.00   11.00 ^ pll/CLK (avsdpll)
   0.34   11.34 ^ clkbuf_0_CLK/X (sky130_fd_sc_hd__clkbuf_16)
   0.38   11.72 ^ clkbuf_3_3_0_CLK/X (sky130_fd_sc_hd__clkbuf_16)
   0.23   11.94 ^ clkbuf_leaf_56_CLK/X (sky130_fd_sc_hd__clkbuf_16)
   0.00   11.94 ^ core.CPU_Xreg_value_a4[27][30]$_SDFFE_PP0P_/CLK (sky130_fd_sc_hd__dfxtp_1)
   0.00   11.94   clock reconvergence pessimism
  -0.12   11.83   library setup time
          11.83   data required time
---------------------------------------------------------
          11.83   data required time
          -6.54   data arrival time
---------------------------------------------------------
           5.29   slack (MET)



==========================================================================
cts final report_checks -path_delay min reg to reg
--------------------------------------------------------------------------
Startpoint: core.CPU_is_sll_a2$_DFF_P_
            (rising edge-triggered flip-flop clocked by clk)
Endpoint: core.CPU_is_sll_a3$_DFF_P_
          (rising edge-triggered flip-flop clocked by clk)
Path Group: clk
Path Type: min

  Delay    Time   Description
---------------------------------------------------------
   0.00    0.00   clock clk (rise edge)
   0.00    0.00   clock source latency
   0.00    0.00 ^ pll/CLK (avsdpll)
   0.34    0.34 ^ clkbuf_0_CLK/X (sky130_fd_sc_hd__clkbuf_16)
   0.38    0.72 ^ clkbuf_3_3_0_CLK/X (sky130_fd_sc_hd__clkbuf_16)
   0.24    0.95 ^ clkbuf_leaf_55_CLK/X (sky130_fd_sc_hd__clkbuf_16)
   0.00    0.95 ^ core.CPU_is_sll_a2$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_1)
   0.31    1.27 ^ core.CPU_is_sll_a2$_DFF_P_/Q (sky130_fd_sc_hd__dfxtp_1)
   0.00    1.27 ^ core.CPU_is_sll_a3$_DFF_P_/D (sky130_fd_sc_hd__dfxtp_1)
           1.27   data arrival time

   0.00    0.00   clock clk (rise edge)
   0.00    0.00   clock source latency
   0.00    0.00 ^ pll/CLK (avsdpll)
   0.34    0.34 ^ clkbuf_0_CLK/X (sky130_fd_sc_hd__clkbuf_16)
   0.43    0.77 ^ clkbuf_3_5_0_CLK/X (sky130_fd_sc_hd__clkbuf_16)
   0.24    1.02 ^ clkbuf_leaf_54_CLK/X (sky130_fd_sc_hd__clkbuf_16)
   0.00    1.02 ^ core.CPU_is_sll_a3$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_1)
   0.00    1.02   clock reconvergence pessimism
  -0.03    0.99   library hold time
           0.99   data required time
---------------------------------------------------------
           0.99   data required time
          -1.27   data arrival time
---------------------------------------------------------
           0.28   slack (MET)



==========================================================================
cts final critical path target clock latency max path
--------------------------------------------------------------------------
0

==========================================================================
cts final critical path target clock latency min path
--------------------------------------------------------------------------
0

==========================================================================
cts final critical path source clock latency min path
--------------------------------------------------------------------------
0

==========================================================================
cts final critical path delay
--------------------------------------------------------------------------
6.5416

==========================================================================
cts final critical path slack
--------------------------------------------------------------------------
5.2865

==========================================================================
cts final slack div critical path delay
--------------------------------------------------------------------------
80.813562

==========================================================================
cts final report_power
--------------------------------------------------------------------------
Group                  Internal  Switching    Leakage      Total
                          Power      Power      Power      Power (Watts)
----------------------------------------------------------------
Sequential             4.35e-03   4.30e-04   9.26e-09   4.78e-03  37.7%
Combinational          9.10e-04   2.65e-03   1.07e-08   3.56e-03  28.0%
Clock                  2.19e-03   2.15e-03   1.81e-09   4.34e-03  34.2%
Macro                  0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
Pad                    0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
----------------------------------------------------------------
Total                  7.45e-03   5.23e-03   2.18e-08   1.27e-02 100.0%
                          58.8%      41.2%       0.0%




```

</details>






### 6. Routing

Routing connects all nets using metal layers.

```bash
make DESIGN_CONFIG=./designs/sky130hd/vsdbabysoc/config.mk route
```

To view the routed layout:

```bash
make DESIGN_CONFIG=./designs/sky130hd/vsdbabysoc/config.mk gui_route
```





This is the most critical phase. The design fails with [ERROR GRT-0116] Global routing finished with congestion.

* After making changes into the [config.mk](config.mk) managed to reduce to the following:

* Finally, the routing was completed successfully without congestion errors.




## The Fix:

<details>
<summary>Expand to Read Fix Details</summary>
  
  A VSDBabySoC design using OpenROAD-flow-scripts with Sky130 PDK was failing at the global routing stage (5_1_grt) with congestion overflow errors. The root cause was identified as **pin accessibility obstructions in the analog macro LEF files**, specifically metal layer obstructions blocking router access to macro pins.


### ERROR
```bash
[INFO GRT-0018] Total wirelength: 494454 um
[INFO GRT-0014] Routed nets: 6595
[ERROR GRT-0116] Global routing finished with congestion. Check the congestion regions in the DRC Viewer.
Error: global_route.tcl, 120 GRT-0116
Command exited with non-zero status 1
Elapsed time: 3:59.59[h:]min:sec. CPU time: user 406.93 sys 4.59 (171%). Peak memory: 465120KB.
make[1]: *** [Makefile:547: do-5_1_grt] Error 1
make: *** [Makefile:547: results/sky130hd/vsdbabysoc/base/5_1_grt.odb] Error 2
error after cts
```

 Completed CTS, but global routing failed due to congestion:
```bash
[ERROR GRT-0116] Global routing finished with congestion.
```
You hit a GRT-0116: Global Routing Congestion error after CTS.
This is very common for SoC-scale designs like BabySoC on Sky130HD, especially when the floorplan is too tight or macros are blocking routing channels.

<img width="1461" height="815" alt="Screenshot (474)" src="https://github.com/user-attachments/assets/b21595df-5467-4c64-a1ae-0ceca44ac013" />
<img width="1507" height="802" alt="Screenshot (475)" src="https://github.com/user-attachments/assets/cd6637dd-143b-46e7-8636-1cafc89b0f5d" />

<img width="1395" height="811" alt="Screenshot (476)" src="https://github.com/user-attachments/assets/ffe7cdd3-7bf8-44e4-b739-e2d727cc1f50" />



### Why congestion happens after CTS

Common causes:

✔ 1. Die area too small

Your earlier config had:
```bash
set ::env(DIE_AREA) "0 0 1500 1500"
```

For vsdbabysoc, 1500×1500 µm is too small.

✔ 2. Macros are placed too close

(avsdpll, avsddac) → block routing channels.

✔ 3. Utilization too high

Default is ~50%, but with BabySoC it becomes effectively 70–80%.

### ✅ Fix (Guaranteed to remove congestion)

Open your config.tcl and update these:
1. Increase DIE size
2. Lower target density
3. Add more routing tracks (huge improvement)
4. Increase macro spacing

```bash

# ROUTING + PLACEMENT FIXES
set ::env(DIE_AREA) "0 0 2000 2000"
set ::env(PL_TARGET_DENSITY) "0.45"
set ::env(GRT_ALLOW_CONGESTION) 1
set ::env(GRT_ADJUSTMENT) 0.3
set ::env(MACRO_PLACE_CHANNEL) 20
set ::env(MACRO_PLACE_HALO) "20 20"
```
🚀 After modifying config.tcl, run:
```bash
make DESIGN_CONFIG=designs/sky130hd/vsdbabysoc/config.tcl clean_floorplan
make DESIGN_CONFIG=designs/sky130hd/vsdbabysoc/config.tcl -j4

```
Do NOT skip clean_floorplan.

The updated version with die area expansion, lower density, macro padding, and CTS buffer adjustments applied:
```bash

set ::env(DESIGN_NAME) "vsdbabysoc"

# --- Verilog Sources (explicit list, required for BabySoC) ---
set ::env(VERILOG_FILES) "\
$::env(DESIGN_DIR)/src/vsdbabysoc.v \
$::env(DESIGN_DIR)/src/rvmyth.v \
$::env(DESIGN_DIR)/src/rvmyth_gen.v \
$::env(DESIGN_DIR)/src/avsdpll.v \
$::env(DESIGN_DIR)/src/avsddac.v \
$::env(DESIGN_DIR)/src/clk_gate.v \
"

# --- Includes ---
set ::env(VERILOG_INCLUDE_DIRS) "$::env(DESIGN_DIR)/src/include"

# --- Additional Macro Files ---
set ::env(EXTRA_LIBS)  [glob $::env(DESIGN_DIR)/src/lib/*.lib]
set ::env(EXTRA_LEFS)  [glob $::env(DESIGN_DIR)/src/lef/*.lef]
set ::env(EXTRA_GDS_FILES) [glob $::env(DESIGN_DIR)/src/gds/*.gds]

# --- Timing ---
set ::env(BASE_SDC_FILE) "$::env(DESIGN_DIR)/src/vsdbabysoc_synthesis.sdc"
set ::env(CLOCK_PORT) "CLK"
set ::env(CLOCK_NET)  "CLK"
set ::env(CLOCK_PERIOD) "20.0"

# --- Floorplan ---
set ::env(FP_PIN_ORDER_CFG) "$::env/DESIGN_DIR/pin_order.cfg"
set ::env(MACRO_PLACEMENT_CFG) "$::env/DESIGN_DIR/macro.cfg"

set ::env(FP_SIZING) "absolute"

# --- ✅ Updated DIE AREA for congestion relief ---
set ::env(DIE_AREA) "0 0 2200 2200"

# --- Margins ---
set ::env(BOTTOM_MARGIN_MULT) 20
set ::env(TOP_MARGIN_MULT) 20
set ::env(LEFT_MARGIN_MULT) 100
set ::env(RIGHT_MARGIN_MULT) 100

# --- Density / Utilization (Sky130 prefers <0.5) ---
set ::env(CORE_UTILIZATION) "28"
set ::env(PL_TARGET_DENSITY) "0.45"

# --- Macro placement padding to open routing channels ---
set ::env(MACRO_PLACE_HALO) "20 20"
set ::env(MACRO_PLACE_CHANNEL) "30 30"

# --- Allow more global routing iterations to tolerate congestion ---
set ::env(GRT_ALLOW_CONGESTION) 1
set ::env(GRT_MAX_DENSITY) 0.95
set ::env(GRT_ADJUSTMENT) 0.15

# --- CTS buffer tuning (less aggressive) ---
set ::env(CTS_ROOT_BUFFER) "sky130_fd_sc_hd__clkbuf_2"

# --- Magic ---
set ::env(MAGIC_ZEROIZE_ORIGIN) 0
set ::env(MAGIC_EXT_USE_GDS) 1
```

so on running 
```bash
make DESIGN_CONFIG=./designs/sky130hd/vsdbabysoc/config.tcl \PLATFORM=sky130hd \DESIGN_NAME=vsdbabysoc \-j2
```
### ERROR

```bash
designs/sky130hd/vsdbabysoc/config.tcl:4: *** multiple target patterns. Stop.
```

SOLUTION
```bash
make DESIGN_CONFIG=./designs/sky130hd/vsdbabysoc/config.tcl \
     PLATFORM=sky130hd \
     DESIGN_NAME=vsdbabysoc \
     -j2
```
### 1.Practical ways to fix GRT-0116

1.Increase die area further

-If feasible, increase it gradually (e.g., 2200–2500) and rerun placement & GRT.

2.Adjust GRT congestion thresholds
-In global_route.tcl or config.tcl, look for options like:
```bash
set_max_congestion 0.8
```
-Increasing the allowed congestion may let routing complete.

3.Enable layer assignment / route layer optimization

-Check your OpenROAD GRT settings for vertical_layer_bias or route_layers and increase number of available routing layers if possible.

4.Run incremental placement optimization
-Sometimes re-running cts → placement → legalization with slightly looser spacing helps.

5.Check macros / IO placement

-Congestion often happens near the IO pads or large macros.
-Move large macros or spread them out.

Quick checks you can do
```bash
openroad -gui
read_def <your_def_file>
view_congestion
```
But the files exist in .odb not .db as follows
```bash
/workspaces/vsd-pd/OpenROAD-flow-scripts/flow/results/s
ky130hd/vsdbabysoc/base$ ls
1_1_yosys_canonicalize.rtlil  2_4_floorplan_pdn.odb     3_place.odb
1_2_yosys.v                   2_floorplan.odb           3_place.sdc
1_synth.sdc                   2_floorplan.sdc           4_1_cts.odb
1_synth.v                     3_1_place_gp_skip_io.odb  4_cts.odb
2_1_floorplan.odb             3_2_place_iop.odb         4_cts.sdc
2_1_floorplan.sdc             3_2_place_iop.tcl         5_1_grt-failed.odb
2_2_floorplan_macro.odb       3_3_place_gp.odb          clock_period.txt
2_2_floorplan_macro.tcl       3_4_place_resized.odb     mem.json
2_3_floorplan_tapcell.odb     3_5_place_dp.odb
```
1. .odb → OpenROAD Design Binary database (ODB), used internally by OpenROAD for placement, CTS, and routing.

2. .def → optional export from ODB; OpenROAD can read/write DEF, but the flow doesn’t always export it by default.

So the absence of .def is normal if the flow only produces ODB files.

<img width="1421" height="801" alt="Screenshot (478)" src="https://github.com/user-attachments/assets/ad99d079-ee69-4376-a46f-934d27de1966" />


## 2. Investigation Process

### Phase 1: Initial Configuration Analysis

The original `config.mk` had aggressive routing settings:

```makefile
export PLACE_DENSITY   = 0.30
export MACRO_PLACE_HALO    = 20 20
export MACRO_PLACE_CHANNEL = 40 40
export GRT_LAYER_ADJUSTMENTS = {met1:0.15,met2:0.12,met3:0.10,met4:0.08,met5:0.05}
```

These settings appeared reasonable for a 13% utilization design.

### Phase 2: Congestion Report Analysis

The congestion report revealed the critical insight:

```rpt
violation type: Horizontal congestion
    srcs: net:RV_TO_DAC\[9\]
    comment: capacity:0 usage:1 overflow:1
    bbox = (1090.2000, 579.6000) - (1097.1000, 586.5000) on Layer -
```

**Key observation:** `capacity:0` indicated the router had **zero legal routing tracks** in these regions, not just high congestion.

### Phase 3: LEF File Inspection

Examining `avsddac.lef` revealed the root cause:

#### Problem 1: OUT Pin Access Blocked by met4 OBS

```lef
PIN OUT
    PORT
      LAYER met4 ;
        RECT 1172.680 1127.710 1173.730 1175.360 ;
    END
END OUT

OBS
    LAYER met4 ;
        RECT 154.520 1171.010 1172.280 1175.050 ;  ← Ends at x=1172.280
        RECT 1174.130 1127.310 1188.200 1175.050 ; ← Starts at x=1174.130
```

The OUT pin (x: 1172.680-1173.730) was squeezed between obstructions with only ~0.4µm clearance on each side—insufficient for routing.

#### Problem 2: D[8] and D[9] Pins Only on li1 Layer

```lef
PIN D[8]
    PORT
      LAYER li1 ;
        RECT 1117.200 613.050 1117.850 709.180 ;
    END

PIN D[9]
    PORT
      LAYER li1 ;
        RECT 1150.220 613.050 1151.250 755.620 ;
    END
```

The li1 layer has effectively **zero routing capacity** in Sky130:

```lef
li1        Vertical            0            10          0.00%
```

#### Problem 3: Massive met1 Obstruction

```lef
LAYER met1 ;
    RECT 140.750 613.050 1313.360 1168.430 ;  ← Covers entire macro interior
```

This blocked any met1 access to the li1-only pins.

---

## 3. Resolution Strategy

### Fix 1: Widen met4 OBS Gap for OUT Pin

**Before:**

```lef
LAYER met4 ;
    RECT 154.520 1171.010 1172.280 1175.050 ;
    RECT 1174.130 1127.310 1188.200 1175.050 ;
```

**After:**

```lef
LAYER met4 ;
    RECT 154.520 1171.010 1168.000 1175.050 ;  ← Moved left edge back
    RECT 1178.000 1127.310 1188.200 1175.050 ; ← Moved right edge forward
```

This created a ~10µm routing corridor around the OUT pin instead of ~1.85µm.

### Fix 2: Add met1 Access Points for D[8] and D[9] Pins

**Before:**

```lef
PIN D[8]
    PORT
      LAYER li1 ;
        RECT 1117.200 613.050 1117.850 709.180 ;
    END
END D[8]
```

**After:**

```lef
PIN D[8]
    PORT
      LAYER li1 ;
        RECT 1117.200 613.050 1117.850 709.180 ;
      LAYER met1 ;
        RECT 1115.000 608.000 1120.000 613.050 ;  ← NEW: Access below OBS
    END
END D[8]
```

The new met1 shapes extend **below** y=613.050, outside the met1 obstruction boundary, giving the router legal access paths.

---

## 4. Technical Explanation

### Why This Happens

Analog macros (DAC, PLL) are often created with:

1. **Pins on lower metal layers (li1)** for analog signal integrity
2. **Large obstructions** to protect internal routing from interference
3. **Minimal consideration for digital router requirements**

OpenROAD's TritonRoute requires:

1. Legal access points to every pin
2. Sufficient routing capacity on accessible layers
3. Clear paths from pin access points to the routing grid

### The Pin Access Problem Illustrated

```text
                    ┌─────────────────────────────────┐
                    │         met1 OBS                │
                    │   (blocks entire interior)      │
                    │                                 │
    Router cannot   │    ┌──────┐                     │
    reach pin! ─────│───►│D[8]  │ (li1 only)          │
                    │    │ pin  │                     │
                    │    └──────┘                     │
                    │                                 │
                    └─────────────────────────────────┘
                    y = 613.050 ─────────────────────────

    SOLUTION: Add met1 shape BELOW y=613.050

                    ┌─────────────────────────────────┐
                    │         met1 OBS                │
                    │                                 │
                    │    ┌──────┐                     │
                    │    │D[8]  │ (li1)               │
                    │    │ pin  │                     │
                    │    └─┬────┘                     │
                    └──────│──────────────────────────┘
                    ═══════╪═══════  y = 613.050
                        ┌──┴───┐
    Router can now ────►│ met1 │ (new access point)
    reach pin!          │access│
                        └──────┘
```

---

## 5. Results

### Before Fix

```bash
[ERROR GRT-0116] Global routing finished with congestion.
Total Overflow: 29 violations
```



### After Fix

```bash
[INFO GRT-0018] Total wirelength: 407106 um
[INFO GRT-0014] Routed nets: 6450
[INFO ANT-0002] Found 0 net violations.
[INFO ANT-0001] Found 0 pin violations.
Design area 728556 um^2 13% utilization.
```


---

## 6. Key Lessons Learned

### For Physical Design Engineers

1. **Always verify macro pin accessibility** - Check that pins have routing access on layers the router can use

2. **Understand layer routing capacity** - li1 in Sky130 has near-zero routing capacity; pins must have met1+ access

3. **Inspect OBS sections carefully** - Obstructions can inadvertently block pin access even with sufficient apparent clearance

4. **Use congestion reports effectively** - `capacity:0` indicates physical blockage, not just high utilization

### For Analog Macro Designers

1. **Provide multi-layer pin definitions** - Include met1 or met2 access shapes for all pins

2. **Create routing channels** - Leave gaps in obstructions near pin locations

3. **Document routing requirements** - Specify minimum halo sizes and routing layer requirements

---

## 7. Verification Commands

To verify the fix worked:

```bash
# View the routed design
make gui_route DESIGN_CONFIG=designs/sky130hd/VSDBabySoC/config.mk

# Check for DRC violations
make drc DESIGN_CONFIG=designs/sky130hd/VSDBabySoC/config.mk

# Generate final reports
make report DESIGN_CONFIG=designs/sky130hd/VSDBabySoC/config.mk
```

---

## 8. Files Modified

| File | Change |
|------|--------|
| `avsddac.lef` | Widened met4 OBS gap around OUT pin; Added met1 access shapes to D[8], D[9] pins |
| `config.mk` | Increased MACRO_PLACE_HALO and MACRO_PLACE_CHANNEL (optional) |
| `macro.cfg` | Repositioned macros away from die edges (optional) |

---

## 9. Conclusion

This routing failure exemplifies a common challenge in mixed-signal SoC design: analog macros created without consideration for digital place-and-route requirements. The fix required understanding both the analog macro's physical structure and the digital router's access requirements. By adding appropriate metal layer access points and clearing obstruction blockages, the design achieved zero routing violations with minimal impact to the original macro functionality.

</details>



### Part 4: SPEF & Post-Layout STA & Timing Graphs Across PVT Corners for Routed VSDBabySoC

<details>
  <summary>
    THEORY
  </summary>



### SPEF (Standard Parasitic Exchange Format) extraction
It is a file that contains parasitic extraction information of your routed design — mainly:
Resistance (R)
Capacitance (C)
Net connectivity
Parasitic nodes created after routing

SPEF is used for Post-Route Static Timing Analysis (STA) to get accurate timing numbers because after routing, wires have real RC delay.

### ✅ What SPEF Contains (Simple Explanation)

For each net in your design, SPEF stores:

*Total capacitance of the net
*Capacitance of each sub-node
*Resistances between wire segments
*Coupling capacitances between signals

Example small snippet:

```bash
*D_NET N1 0.025
*CAP
1 N1 0.010
2 N1 N2 0.015
*RES
1 N1 N1_1 50.0
2 N1_1 N2 40.0
```

### ✅ Why SPEF Is Important

After routing, wires create delay.
SPEF gives actual delays to STA tools like OpenSTA or PrimeTime.

Without SPEF → STA uses ideal wires → wrong timing.

With SPEF → Real RC delay → accurate timing report.

### 🚀 How to Generate SPEF in OpenROAD (exact steps)

You should be at post-route stage (detailed routing completed).

In the OpenROAD Tcl terminal, run:

1️⃣ Load your design (DEF + LIB + SDC)

Example:
```bash
read_lef tech.lef
read_lef stdcell.lef
read_def routed.def
read_liberty typical.lib
read_sdc design.sdc
```

2️⃣ Run the SPEF extraction

OpenROAD command:
```bash
estimate_parasitics -spef design.spef
```

OR, in newer flows:
```bash
write_spef design.spef
```
3️⃣ Verify SPEF was generated
```bash
report_parasitics
```

You will see resistance and capacitance values per net.

4️⃣ Use SPEF for Post-Route STA
```bash
read_spef design.spef
report_checks -path_delay max
report_tns
report_wns
```

Now STA will show real timing after routing.

### 🎯 Where to run the commands?

Run inside OpenROAD Tcl command window (terminal inside GUI or openroad executable in shell).

Not inside Linux terminal.
Inside OpenROAD only.


###  Post-Route STA
```bash
read_liberty tech/typical.lib
read_sdc constraints/design.sdc
read_spef results/design.spef

report_checks -path_delay max
report_tns
report_wns

```
 Understanding how the generated SPEF is used for post-route STA in real design flows.


To perform Post-Layout Static Timing Analysis (STA) using the SPEF generated after 
routing , analyze timing across all PVT corners, and compare post-route results 
with post-synthesis timing data from Part-2.

### Why This Task Is Important 
This final step closes the full ASIC flow. 
We have moved from 
### RTL → Synthesis → Physical Design → Parasitic Extraction. 
Now, by performing post-layout STA, you will see: 
• How routing parasitics (SPEF) change the path delays compared to the ideal 
netlist. 
• The impact of PVT (Process, Voltage, Temperature) variations on timing. 
• How design optimization improves or worsens timing after layout. 
Understanding these timing differences is critical for tape-out readiness — this is how 
real silicon accuracy is verified before fabrication.


### Tasks

### 1. Load Post-Route Design into OpenSTA 
• Import: 
o Gate-level netlist 
o Library files for all PVT corners 
o Extracted SPEF file 
o Timing constraints (SDC) 
• Use the provided TCL script to run STA across multiple corners (TT, SS, FF, etc.). 

### 2. Generate Post-Route Timing Reports and Graphs 
• Use report_checks with appropriate switches (-path_delay, -fields, -nosplit, etc.) to 
display SPEF annotation. 
• Generate and plot timing graphs for each corner (similar to the examples in Day 26 
repo). 
• Capture key metrics for each corner: 
o Worst Negative Slack (WNS) 
o Total Negative Slack (TNS) 
o Worst Hold Slack (WHS) 
o Total Hold Slack (THS) 

### 3. Compare with Post-Synthesis Results (Week 3) 
• Retrieve Part-2 timing reports and graphs. 
• Create a comparison table showing Week 3 vs Week 8 values for each corner: 
Corner WNS 

WNS 

TNS 

TNS 

WHS 

WHS 

THS 

THS 

• Highlight the improvements or regressions after routing (e.g., better setup slack but 
worse hold due to added RC effects). 

### 4. Interpret Results 
• Discuss why post-route timing differs from pre-route timing. 
• Explain how SPEF annotation affects path delays. 
• Comment on how physical effects (capacitance, resistance, coupling) impact



</details>






























































  
# Acknowledgements

* [Kunal Ghosh](https://github.com/kunalg123), Co-founder, VSD Corp. Pvt. Ltd.
* [Nickson P Jose](https://github.com/nickson-jose), Physical Design Engineer, Intel Corporation.
* [R. Timothy Edwards](https://github.com/RTimothyEdwards), Senior Vice President of Analog and Design, efabless Corporation.




