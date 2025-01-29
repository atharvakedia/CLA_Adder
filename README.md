# 16-bit Carry Lookahead Adder (CLA)

## Overview
This project involves designing, implementing, and simulating a **Carry Lookahead Adder (CLA)** using Verilog. The CLA is a fast adder that improves upon the Ripple Carry Adder by reducing propagation delay using a lookahead carry generator.

The project includes the following modules:
- **TwoLevelCLA**: The top-level 16-bit CLA module.
- **LookAhead Block**: Computes carry signals for fast addition.
- **PG Generator**: Generates propagate (`p`) and generate (`g`) signals to assist in carry computation.

---

## Theory & Background
Addition is a fundamental arithmetic operation, and reducing its delay is critical for high-speed computations. The **Carry Lookahead Adder (CLA)** achieves this by computing carry signals in parallel rather than sequentially, significantly reducing propagation delay.

The CLA works by computing:
- **Generate Signal (g)**: `gᵢ = aᵢ * bᵢ` (Indicates carry is generated at bit `i`)
- **Propagate Signal (p)**: `pᵢ = aᵢ ⊕ bᵢ` (Indicates carry propagates to the next bit if there is an incoming carry)
- **Carry Lookahead Equation**: `cᵢ₊₁ = gᵢ + (pᵢ * cᵢ)` (Precomputes carry signals to minimize delay)

This approach allows faster addition as compared to the traditional **Ripple Carry Adder**.

---

## Main Module: TwoLevelCLA
This is the top-level module implementing a **16-bit CLA** using hierarchical lookahead units.

#### **Ports Table**
| **Port Direction** | **Port Name** | **Port Width (bits)** | **Description** |
|--------------------|--------------|----------------------|----------------|
| **INPUT**         | `X`          | 16                   | 16-bit unsigned input value |
| **INPUT**         | `Y`          | 16                   | 16-bit unsigned input value |
| **INPUT**         | `Cin`        | 1                    | Carry-in to the adder |
| **OUTPUT**        | `S`          | 16                   | 16-bit unsigned sum output |
| **OUTPUT**        | `Cout`       | 1                    | Carry-out from the adder |

---

## Embedded Modules

### **PG Generator**
The **PG Generator** computes the propagate (`p`) and generate (`g`) signals for the lookahead computation.

#### **Ports Table**
| **Port Direction** | **Port Name** | **Port Width (bits)** | **Description** |
|--------------------|--------------|----------------------|----------------|
| **INPUT**         | `X`          | 4                    | 4-bit operand input |
| **INPUT**         | `Y`          | 4                    | 4-bit operand input |
| **OUTPUT**        | `G`          | 4                    | Generate signal output |
| **OUTPUT**        | `P`          | 4                    | Propagate signal output |

---

### **LookAhead Block**
The **LookAhead Block** takes `g` and `p` signals from the PG Generator and efficiently computes carry outputs for fast addition.

#### **Ports Table**
| **Port Direction** | **Port Name** | **Port Width (bits)** | **Description** |
|--------------------|--------------|----------------------|----------------|
| **INPUT**         | `G_in`       | 4                    | Input generate signal |
| **INPUT**         | `P_in`       | 4                    | Input propagate signal |
| **INPUT**         | `Cin`        | 1                    | Carry input from previous stage |
| **OUTPUT**        | `G_out`      | 4                    | Output generate signal |
| **OUTPUT**        | `P_out`      | 4                    | Output propagate signal |
| **OUTPUT**        | `Cout`       | 4                    | Carry output signals |

---
