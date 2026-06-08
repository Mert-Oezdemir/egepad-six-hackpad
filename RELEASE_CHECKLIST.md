# EgePad Six Release Checklist

Owner: Ege Özdemir

## Hackpad Structure

- [x] `README.md`
- [x] `CAD/assembled-model.STEP`
- [x] `PCB/egepad.kicad_pro`
- [x] `PCB/egepad.kicad_sch`
- [x] `PCB/egepad.kicad_pcb`
- [x] `Firmware/main.py`
- [x] `production/gerbers.zip`
- [x] `production/Top.STEP`
- [x] `production/Bottom.STEP`
- [x] `production/main.py`

## Hackpad Constraints

- [x] PCB target is under 100mm x 100mm.
- [x] Case target is under 200mm x 200mm x 100mm.
- [x] Case is intended to be fully 3D-printable.
- [x] Uses kit parts only.
- [x] USB-C cutout is planned on the XIAO side.
- [x] Heatset insert target holes: 4.7mm diameter.
- [x] Screw pass-through target holes: 3.4mm diameter.
- [x] Mating surface tolerance target: 0.2mm.

## Manual Validation Still Required

- [ ] KiCad ERC passes.
- [ ] KiCad DRC passes.
- [ ] Real Gerbers exported from KiCad.
- [ ] JLCPCB preview checked.
- [ ] Final CAD exported from a CAD tool.
- [ ] Case 3D print fit checked.
- [ ] KMK firmware tested on XIAO RP2040.
- [ ] README screenshots replaced with final KiCad/CAD screenshots if needed.

