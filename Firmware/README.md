# Firmware Notes

Owner: Ege Özdemir

Firmware target: KMK on CircuitPython for Seeed XIAO RP2040.

## Files

- `main.py`: primary firmware copied to the board root.

## Matrix

| Row | Pin |
| --- | --- |
| Row 0 | D0 |
| Row 1 | D1 |

| Column | Pin |
| --- | --- |
| Col 0 | D2 |
| Col 1 | D3 |
| Col 2 | D4 |

Diode orientation: `COL2ROW`.

## Encoder

| Encoder function | Pin |
| --- | --- |
| A | D8 |
| B | D9 |
| Switch | D10 |

## Default Keymap

| Position | Key |
| --- | --- |
| Top left | Esc |
| Top middle | Ctrl+C |
| Top right | Ctrl+V |
| Bottom left | Ctrl+Z |
| Bottom middle | Ctrl+S |
| Bottom right | Enter |
| Encoder left | Volume down |
| Encoder right | Volume up |
| Encoder press | Mute |

## Manual Test Plan

1. Install CircuitPython on the XIAO RP2040.
2. Install KMK on the board.
3. Copy `Firmware/main.py` to the board root.
4. Open a keyboard tester.
5. Press all six switches.
6. Rotate encoder left and right.
7. Press encoder switch.

