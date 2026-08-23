# BLDC Motor Driver Firmware

Embedded firmware development for the BLDC motor driver family.

---

## Projects

### `BLDC_MC_V1` — STM32G431RBT6 Firmware
Firmware targeting the **BLDC_MC_V1.0** hardware board.

* **Target Microcontroller:** STM32G431RBT6 (170 MHz ARM Cortex-M4 with FPU, CORDIC & FMAC)
* **IDE / Toolchain:** STM32CubeIDE / GCC ARM Embedded
* **Configuration:** STM32CubeMX (`BLDC_MC_V1.ioc`)

### Core Firmware Architecture & Features

1. **Space Vector PWM (SVPWM):** High-frequency (up to 100 kHz) complementary PWM generation with dead-time insertion via `TIM1` advanced motor timer.
2. **Current Sensing & FOC Loop:** Synchronized ADC sampling triggered by `TIM1` center-aligned counter for accurate 3-phase current sensing and Clarke / Park transformations.
3. **CORDIC Hardware Acceleration:** Offloads trigonometric sine/cosine and vector rotation calculations from the main CPU.
4. **Position Feedback:** Support for 3-phase Hall effect sensors (via `TIM3` / input capture) and sensorless BEMF / observer modes.
5. **Communications:** CAN / CAN-FD, USB-C telemetry, and UART debugging.
6. **Hardware Protection:** Overcurrent protection, thermal throttling, undervoltage/overvoltage lockout.

---

## Project Information

* **Lead Engineer:** Ahmed Aboeita
* **Hardware Reference:** [BLDC_MC_V1.0 Hardware Documentation](../Hardware/BLDC_MC_V1.0/Readme.md)
