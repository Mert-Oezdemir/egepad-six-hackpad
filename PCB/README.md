# PCB Notes

Owner: Ege Özdemir

Design target:

- Board: 92mm x 60mm, 2 layers.
- MCU: Seeed XIAO RP2040, bottom side, USB-C toward right-side case cutout.
- Matrix: 2 rows x 3 columns, six 1N4148 diodes, COL2ROW.
- Encoder: one EC11 on the right side.

Pin map:

| Net | XIAO pin |
| --- | --- |
| ROW0 | D0 |
| ROW1 | D1 |
| COL0 | D2 |
| COL1 | D3 |
| COL2 | D4 |
| ENCA | D8 |
| ENCB | D9 |
| ENCSW | D10 |

The KiCad files are hand-authored draft files because KiCad CLI is not installed in this environment. Open in KiCad, assign the Hackpad care package XIAO/MX footprints, run ERC/DRC, and export real Gerbers before final submission.

