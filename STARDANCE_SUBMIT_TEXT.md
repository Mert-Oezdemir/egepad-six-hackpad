# Stardance Submit Text

Use this when creating the Stardance project.

## Project Title

EgePad Six Hackpad

## Project Owner

Ege Özdemir

## GitHub Link

https://github.com/Mert-Oezdemir/egepad-six-hackpad

## Short Description

EgePad Six is a compact Hackpad macropad project by Ege Özdemir. It has a 2x3 MX switch matrix, one EC11 rotary encoder, a Seeed XIAO RP2040 controller, KMK firmware, PCB draft files, CAD/STEP draft files, BOM, visual previews, and the production folder structure requested by the Hackpad guide.

## Longer Build Log / Notes

I created the repository structure required for the Hackpad mission:

- `CAD/` for the case files and STEP drafts.
- `PCB/` for KiCad project, schematic, and PCB draft files.
- `Firmware/` for KMK firmware.
- `production/` for Gerber zip, STEP copies, and firmware copy.
- `README.md` for visuals, wiring plan, BOM, and project notes.

The design target is a 92mm x 60mm PCB with a 112mm x 80mm 3D-printable sandwich case. The input layout is six MX switches plus one rotary encoder.

## Honest Status

Ready to log on Stardance with the GitHub repo link: yes.

Still needs manual final validation before manufacturing:

- KiCad ERC/DRC.
- KiCad-generated Gerbers.
- CAD-tool-generated STEP files.
- Firmware test on a XIAO RP2040 with KMK installed.

## Links To Open

- GitHub repo: https://github.com/Mert-Oezdemir/egepad-six-hackpad
- Hackpad mission: https://stardance.hackclub.com/missions/hackpad
- Hackpad guide: https://hackpad.hackclub.com/guide
