# BLDC & PMSM Control Modeling & Simulation

System-level simulation models and control design scripts built in MATLAB and Simulink for the BLDC motor driver family.

---

## Directory Structure

```text
Control_Modeling/
├── Functions/          # Mathematical transformations and helper functions
├── Models/             # Simulink system-level models (.slx)
│   └── BLDC_System_Level.slx # Complete 3-phase inverter, motor, and FOC loop model
├── Scripts/            # Motor parameter setup, PI gain tuning, and analysis scripts
└── Startup.m           # Startup script initializing MATLAB workspace variables
```

---

## Modeling Objectives

1. **System-Level Dynamics:** Model full electrical and mechanical dynamics of 3-phase BLDC/PMSM motors with 3-phase inverter power stage.
2. **Field-Oriented Control (FOC):** Simulate $d$-$q$ axis current control loops, speed PI controllers, and SVPWM modulation.
3. **Sensorless State Estimation:** Develop and validate sliding mode observer (SMO) and extended Kalman filter (EKF) algorithms for sensorless commutation.
4. **Parameter Extraction:** Testbed for identifying motor parameters ($R_s$, $L_d$, $L_q$, $\lambda_{pm}$, $J$, $B$).

---

## Usage

1. Open MATLAB.
2. Set the working directory to `Control_Modeling/`.
3. Run `Startup.m` to load motor parameters and control gains into the workspace.
4. Open `Models/BLDC_System_Level.slx` to simulate.

---

## Project Information

* **Lead Engineer:** Ahmed Aboeita
* **Target Hardware:** [BLDC_MC_V1.0 Hardware](../Hardware/BLDC_MC_V1.0/Readme.md)
