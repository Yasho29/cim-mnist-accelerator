# LTspice schematics

Circuit-level schematics for the Phase 2 compute-in-memory macro, simulated in LTspice with the PTM 22 nm high-performance model (`22nm_HP.pm`, nominal V<sub>DD</sub> = 0.8 V). These were built together by Group 12; see the team table in the main README.

| File | Contents |
|---|---|
| `vt_cell.asc` / `.asy` | SRAM compute cell: 6T storage, isolation and access to the compute bit line (CWL / CBL), and a read port (RWL / RBL) |
| `DAC.asc` / `.asy` | 2-bit input DAC: resistor string (1 kΩ) with a two-stage 4:1 multiplexer (inputs S0, S1) |
| `transmissiongate_switch.asc` / `.asy` | Transmission-gate switch, controlled by the cell's CBL, that passes the DAC voltage onto the MAC capacitor |
| `two_bit_weight_row.asc` / `.asy` | Testbench joining the DAC, compute cell and switch onto a 1 fF MAC capacitor; `.step`s a 6-bit code (0–63) and measures V(output) at 5 ns |
| `22nm_HP.pm` | PTM 22 nm high-performance (metal gate / high-k / strained-Si) BSIM4 model |

## Variation modelling

All schematics include a Monte Carlo set-up:

- **Threshold-voltage mismatch:** `gc(mean, sigma) = mean·gauss(sigma)` on V<sub>t0</sub> (nMOS 0.50308 V, pMOS −0.4606 V), with σ scaled by Pelgrom's rule from σ<sub>mos</sub> = 0.1 at the minimum device (L<sub>min</sub> = 22 nm, W<sub>min</sub> = 44 nm): σ = σ<sub>mos</sub>·√(L<sub>min</sub>W<sub>min</sub>) / √(L·W).
- **Capacitor mismatch** (in `two_bit_weight_row.asc`): σ = 5% on the 1 fF and 2 fF capacitors.

## Opening the files

Keep every file in this folder together and open the `.asc` files in LTspice. `two_bit_weight_row.asc` uses the other three as hierarchical blocks through their `.asy` symbols, and every schematic loads the model with `.include 22nm_HP.pm`.

The PTM model is from the Predictive Technology Model project (Nanoscale Integration and Modeling Group, Arizona State University).
