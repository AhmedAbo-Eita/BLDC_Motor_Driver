# BLDC Motor Driver Hardware

Hardware designs for the BLDC motor driver family. Each hardware version contains complete KiCad 10 design files, schematic hierarchy, stackup definitions, circuit simulations, and production fabrication outputs.

---

## Hardware Versions

### V1.0 - 3-Phase BLDC/PMSM Motor Controller (ESC)
**Status:** **Completed & Fabrication Ready** (Rev 1.0, 2026-08-17)

![BLDC_MC_V1.0 Top View](BLDC_MC_V1.0/Output_Job_files/3d_Pics/BLDC_MC_V1.0.png)

![BLDC_MC_V1.0 Bottom View](BLDC_MC_V1.0/Output_Job_files/3d_Pics/BLDC_MC_V1.0-1.png)


A high-performance 3-phase motor controller designed for robotics, e-mobility, and industrial automation, tailored for sensored and sensorless Field-Oriented Control (FOC).

#### Technical Specifications Summary

| Specification | Value | Notes |
| :--- | :--- | :--- |
| **DC Bus Voltage** | **24 V – 60 V** (60 V max) | Bulk capacitor bank + TVS transient surge clamping |
| **Maximum Phase Current** | **30 A maximum** | Low $R_{DS(on)}$ MOSFETs + 8-layer thermal distribution |
| **PWM Switching Frequency** | Up to **100 kHz** | High-speed gate drive + STM32 advanced motor timer |
| **Main Processing Unit** | **STM32G431RBT6** | 170 MHz ARM Cortex-M4 with hardware CORDIC / FMAC |
| **Gate Driver IC** | **TI DRV8353HRTAR** | Smart Gate Drive ($1.4\,\text{A}$ source / $700\,\text{mA}$ sink) + $V_{DS}$ monitor |
| **Power Stage** | 6x **Infineon BSC027N10NS5** | 100 V, $2.7\,\text{m}\Omega$, SuperSO-8 with RC snubbers |
| **Current Sensing** | 3x **$1\,\text{m}\Omega$ Shunts** | Low-side 3-shunt sensing with Kelvin differential routing |
| **Phase Voltage Sensing** | 3-Phase Divider + Buffer | Active $+1.65\,\text{V}$ virtual ground (TLV9061) for BEMF / FOC |
| **Sensored Feedback** | 3-Channel Hall Interface | Buffered 5 V to 3.3 V with RC filtering |
| **PCB Stackup** | **8-Layer High-TG180 FR4** | 2 oz outer copper, controlled impedance (50 $\Omega$ / 100 $\Omega$) |
| **Auxiliary Rails** | **12 V, 5 V, 3.3 V** | LM74700 Ideal Diode, 12V Buck, NCV4274 (5V), LDL1117 (3.3V) |
| **Communication** | **CAN/CAN-FD, USB-C, UART, I2C** | TCAN334DR transceiver + USBLC6-2SC6 ESD protection |

#### Deliverables & Manufacturing Files

* **[Comprehensive Technical Documentation](BLDC_MC_V1.0/Readme.md)**
* **[Schematic PDF](BLDC_MC_V1.0/Output_Job_files/Board_SCH/BLDC_MC_V1.0.pdf)**
* **[Bill of Materials (BOM PDF)](BLDC_MC_V1.0/Output_Job_files/BOM_File/BLDC_MC_V1.0_PDF.pdf)** | **[BOM CSV](BLDC_MC_V1.0/Output_Job_files/BOM_File/BLDC_MC_V1.0_CSV.csv)**
* **[Fabrication Files (Gerbers & Drill)](BLDC_MC_V1.0/Output_Job_files/Fabrication_Files/)**
* **[Pick & Place Centroid Data (PnP)](BLDC_MC_V1.0/Output_Job_files/PnP_File/BLDC_MC_V1.0-all-pos.csv)**
* **[LTspice Circuit Simulations](Simulation/)**

---

## Directory Structure

```text
Hardware/
├── BLDC_MC_V1.0/               # V1.0 KiCad design files, schematics, and stackup
│   ├── Output_Job_files/       # Fabrication Gerbers, BOM, PnP, and 3D renders
│   └── Readme.md               # Detailed technical documentation & pinouts
└── Simulation/                 # LTspice circuit simulation models & testbenches
```

---



## Project Information

* **Lead Hardware Engineer:** Ahmed Aboeita
* **Design Tool:** KiCad EDA v10.0.5
* **Revision:** Rev 1.0 (Released: 2026-08-17)
