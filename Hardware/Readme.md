# 100V / 32A High-Performance BLDC & PMSM Motor Controller (ESC)

![Top-side 3D render of BLDC MC V1.0](BLDC_MC_V1.0/Output_Job_files/3d_Pics/BLDC_MC_V1.0.png)

![Bottom-side 3D render of BLDC MC V1.0](BLDC_MC_V1.0/Output_Job_files/3d_Pics/BLDC_MC_V1.0-1.png)

A compact, high-efficiency, 3-phase Field-Oriented Control (FOC) motor controller designed for high-power robotics, e-mobility, and industrial automation. Built on the **STM32G431RBT6** ARM Cortex-M4 MCU and the **TI DRV8353HRTAR** smart gate driver, this board supports high-frequency switching up to 100 kHz with extensive hardware protection, sensor feedback, and connectivity.

---

## Technical Specifications

| Parameter | Specification | Notes / Details |
| :--- | :--- | :--- |
| **Input DC Bus Voltage ($V_{BUS}$)** | **24V – 60V Nominal** (100V Max Bus Headroom) | High-voltage bulk capacitor bank + TVS clamping |
| **Continuous Phase Current** | **32A – 50A Continuous** | Dependent on external heatsinking and thermal interface |
| **Maximum Switching Frequency** | Up to **100 kHz PWM** | Hardware-accelerated CORDIC/FMAC trigonometric engine |
| **Operating Temperature ($T_A$)** | **$-40^\circ\text{C}$ to $+125^\circ\text{C}$** | Designed for High-TG180 PCB substrates |
| **Main Processing Unit** | **STM32G431RBT6** (170 MHz) | ARM Cortex-M4 with FPU, 128KB Flash, 32KB SRAM |
| **Gate Driver IC** | **TI DRV8353HRTAR** | Smart Gate Drive ($1.4\text{A}$ source / $700\text{mA}$ sink) |
| **Power MOSFETs** | 6x **Infineon BSC027N10NS5** | 100V, $2.7\text{ m}\Omega$, SuperSO-8 (TDSON-8) |
| **Current Sense Shunts** | 3x **$1\text{ m}\Omega$ Metal Plate** | Low-side 3-shunt topology with Kelvin Sensing |
| **PCB Form Factor / Layers** | **8-Layer High-TG180 FR4** | 2 oz outer copper / 1 oz inner planes |

---

## Key Hardware Features

### 1. Processing & Control Core
* **STM32G431RBT6 MCU:** High-performance motor control MCU with integrated CORDIC co-processor for near-zero latency Park/Clarke transformations.
* **Dual Clock Source:** 24 MHz primary oscillator (`Y1`) for the main system PLL and 32.768 kHz crystal (`Y2`) for precise real-time timing.
* **Onboard Memory:** 256 Kbit SPI EEPROM (**25LC256-E/SN**) for non-volatile calibration parameters, PID coefficients, and motor profiles.

### 2. Inverter Power Stage & Gate Drive
* **Smart Gate Driver (DRV8353H):** Eliminates external gate resistors via software-tunable `IDRIVE` configuration. Features integrated $V_{DS}$ monitoring for cross-conduction and shoot-through protection.
* **Optimized Power Stage:** Low $R_{DS(on)}$ ($2.7\text{ m}\Omega$) 100V OptiMOS 5 MOSFETs paired with localized **1 nF + 4.7 $\Omega$ switch-node RC snubbers** to eliminate high-frequency parasitic ringing.
* **DC-Link Decoupling:** Low-ESR parallel ceramic capacitor bank ($4\times 47\,\mu\text{F} + 2\times 100\text{ nF}$) placed immediately across the inverter bridge for fast switching transient absorption.

### 3. Sensing & Signal Conditioning
* **3-Phase Low-Side Current Sensing:** $1\text{ m}\Omega$ shunts routed via strict 4-wire Kelvin differential pairs directly into the DRV8353 current sense amplifiers.
* **Phase Voltage / Sensorless BEMF Sensing:** Three buffered resistor divider networks ($100\text{ k}\Omega / 2.7\text{ k}\Omega$) with an active **+1.65V Virtual Ground buffer (TLV9061)** to allow full bidirectional phase voltage sampling across the MCU's ADC dynamic range.
* **Sensored Hall Interface:** Isolated Hall-effect inputs with hardware low-pass filtering and **TLV9061** op-amp buffers shifting 5V Hall signals safely to 3.125V/3.3V logic levels.

### 4. Auxiliary Power Architecture
* **Active Reverse Polarity Protection:** High-side Ideal Diode controller (**TI LM74700-Q1**) driving a power MOSFET to block reverse connection with zero diode forward-voltage drops.
* **Step-Down Buck Converter:** Converts high-voltage DC input down to an intermediate **+12V rail** for gate drive supplies.
* **Dual Linear Regulators (LDOs):**
  * **NCV4274 (5.0V):** Powers external Hall sensors and peripheral pull-ups.
  * **LDL1117S33R (3.3V):** Ultra-clean, low-noise supply for the STM32G4 MCU, analog references, and transceivers.

### 5. Robust Industrial Connectivity & Protection
* **CAN / CAN-FD Bus:** High-speed **TCAN334DR** transceiver with an **ACT1210** common-mode choke, split $60\Omega$ termination, and dedicated **PESD2CANFD24V-QCZ** ESD diode protection.
* **USB Type-C Interface:** USB 2.0 Type-C port with **USBLC6-2SC6** high-speed TVS diode array for diagnostics, firmware flashing, and PC telemetry.
* **Series Damping Resistors:** $33\,\Omega$ series termination resistors placed on all high-speed digital lines (PWM, SPI, SWD, UART, I2C) to ensure signal integrity and eliminate trace reflections.

---

## Schematic Sheet Architecture

The schematic is organized into 10 modular hierarchical sheets:

| Sheet ID | Sheet Name | Description & Subsystems |
| :---: | :--- | :--- |
| **01/10** | `BLDC_MC.kicad_sch` | Top-level hierarchical block interconnections and system bus mapping. |
| **02/10** | `BLDC_MC_V1.0_Power.kicad_sch` | LM74700 Ideal Diode, 12V Buck regulator, 5V/3.3V LDOs, status LEDs. |
| **03/10** | `BLDC_MC_V1.0_MCU.kicad_sch` | STM32G431RBT6, decoupling network, SWD debug port, USB-C interface. |
| **04/10** | `BLDC_MC_V1.0_Gate_Drive.kicad_sch` | DRV8353HRTAR smart gate driver, IDRIVE, VDS, and shunt amplifier tuning. |
| **05/10** | `BLDC_MC_V1.0_3Phase_Inverter_legs.kicad_sch` | 3-Phase MOSFET half-bridges, RC snubbers, $1\text{ m}\Omega$ current shunts. |
| **06/10** | `BLDC_MC_V1.0_HallSensor.kicad_sch` | 3-Channel Hall-effect sensor level-shifter and TLV9061 buffer circuitry. |
| **07/10** | `BLDC_MC_V1.0_Voltage_Sensor.kicad_sch` | 3-Phase BEMF divider network and +1.65V active virtual ground op-amp. |
| **08/10** | `BLDC_MC_V1.0_Memory.kicad_sch` | 25LC256 256Kbit SPI EEPROM and line termination resistors. |
| **09/10** | `BLDC_MC_V1.0_CAN_Transceiver.kicad_sch` | TCAN334DR CAN/CAN-FD transceiver, split termination, common-mode filter. |
| **10/10** | `BLDC_MC_V1.0_Connectors.kicad_sch` | High-current power pads, J8 comms header, J5 Hall header, TVS arrays. |

---

## Connector Pinout Definitions

### 1. Main Power & Motor Terminals (High Current)
* **`J6 / J9`:** DC Bus Input Power (`Vin_DC` [+] and `PGND` [-]).
* **`J1`:** Motor Phase A Output (`Phase_A`).
* **`J2`:** Motor Phase B Output (`Phase_B`).
* **`J7`:** Motor Phase C Output (`Phase_C`).

### 2. Communication Header (`J8` - 10-Pin S10B-PHDSS)
| Pin # | Net Name | Type | Description |
| :---: | :--- | :---: | :--- |
| **1** | `+3.3V` | Power | 3.3V Auxiliary Output Rail |
| **2** | `CAN_N` | Diff I/O | CAN Bus Dominant Low Line |
| **3** | `CAN_P` | Diff I/O | CAN Bus Dominant High Line |
| **4** | `I2C3_SCL` | Bidirectional | I2C Clock (STM32 Pin 40 / PC8) |
| **5** | `GND` | Ground | System Ground Return |
| **6** | `+5V` | Power | 5.0V Auxiliary Output Rail |
| **7** | `UART4_RX` | Input | UART4 Receive Line (STM32 Pin 53 / PC11) |
| **8** | `UART4_TX` | Output | UART4 Transmit Line (STM32 Pin 52 / PC10) |
| **9** | `I2C3_SDA` | Bidirectional | I2C Data (STM32 Pin 41 / PC9) |
| **10** | `GND` | Ground | System Ground Return |

### 3. Hall Sensor Header (`J5` - 6-Pin S6B-PH-K-S)
| Pin # | Net Name | Type | Description |
| :---: | :--- | :---: | :--- |
| **1** | `+5V` | Power | Hall Sensor Power Supply (5V) |
| **2** | `Hall_A` | Input | Phase A Hall Sensor Signal |
| **3** | `Hall_B` | Input | Phase B Hall Sensor Signal |
| **4** | `Hall_C` | Input | Phase C Hall Sensor Signal |
| **5** | `+3.3V` | Power | Optional 3.3V Pull-up / Supply |
| **6** | `GND` | Ground | Sensor Ground Return |

### 4. Debug & Programming (`J4` - 6-Pin SWD Header)
* **Pin 1:** `+3.3V` | **Pin 2:** `NRST` | **Pin 3:** `SWDIO` (PA13) | **Pin 4:** `SWCLK` (PA14) | **Pin 5:** `SWO` (PB3) | **Pin 6:** `GND`

---

## Author & Project Information
* **Lead Hardware Engineer:** Ahmed Aboeita
* **Design Suite:** KiCad E.D.A. v10.0.5
* **Design Revision:** Rev 1.0 (2026-08-17)
