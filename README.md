# RISC-V_VSDBabySoc_RTL2GDSII

## Table of Contents
- [Part 1: Introduction to SoC & Pre-synthesis and Post-synthesis verification flow for a minimal RISC-V System-on-Chip (SoC) )](#part-2-Introduction-to-SoC-&-Pre-synthesis-&-Post-synthesis-verification-for-RISC-V)                                                      
- [Part 2: )](#part-2-)
- [Part 3: )](#part-3-)
- [Part 4: )](#part-4-)



## Part 1 : 
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


# VSD Hardware Design Program: VSDBabySoC Post-Synthesis Simulation

  

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

























  
</details>


