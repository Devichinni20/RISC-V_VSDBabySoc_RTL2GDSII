# RISC-V_VSDBabySoc_RTL2GDSII

## Table of Contents
- [Part 1: Introduction to SoC & Pre-synthesis and Post-synthesis verification flow for a minimal RISC-V System-on-Chip (SoC) )](#part-2-Introduction-to-SoC-&-Pre-synthesis-&-Post-synthesis-verification-for-RISC-V)                                                      
- [Part 2:Introduction to STA & Timing Graphs using openSTA)](#part-2-Introduction-to-STA-&-Timing-Graphs-using-openSTA)
- [Part 3: )](#part-3-)
- [Part 4: )](#part-4-)



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





































  
</details>


