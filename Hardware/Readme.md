# BLDC Motor Driver Hardware

Hardware designs for the BLDC motor driver family. Each hardware version has its own folder with the complete KiCad design files, documentation, simulations, and generated outputs.

## Versions

### V1.0 - 3-Phase BLDC/PMSM Motor Controller

![BLDC Motor Controller V1.0](BLDC_MC_V1.0/Output_Job_files/3d_Pics/BLDC_MC_V1.0.png)

A high-performance 3-phase motor controller for robotics, e-mobility, and industrial automation. It is designed for sensored or sensorless Field-Oriented Control (FOC).

| Specification | Value |
| --- | --- |
| DC bus voltage | 24-60 V, 60 V maximum |
| Maximum phase current | 30 A maximum |
| PWM switching frequency | Up to 100 kHz |
| Main MCU | STM32G431RBT6, 170 MHz ARM Cortex-M4 |
| Gate driver | TI DRV8353HRTAR |
| Power stage | 6x Infineon BSC027N10NS5, 100 V MOSFETs |
| Current sensing | 3x 1 mOhm low-side shunts with Kelvin sensing |
| PCB | 8-layer high-TG180 FR4, 2 oz outer copper |
| Interfaces | CAN/CAN-FD, USB-C, UART, I2C, SWD, Hall sensors |
| Auxiliary rails | 12 V gate-drive rail, 5 V, and 3.3 V |
| Design revision | Rev 1.0, 2026-08-17 |

- [Open the V1.0 hardware files](BLDC_MC_V1.0/)
- [Read the complete V1.0 documentation](BLDC_MC_V1.0/Readme.md)

---

## Future Versions

Additional hardware versions will be listed here using the same format:

- **V1.1** - _Coming soon_

## Project Information

- Lead hardware engineer: Ahmed Aboeita
- Design tool: KiCad EDA v10.0.5
