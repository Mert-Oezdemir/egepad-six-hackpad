# Stardance Submission Handoff

Project: EgePad Six Hackpad

Owner: Ege Özdemir

GitHub repository:

https://github.com/Mert-Oezdemir/egepad-six-hackpad

Hackpad guide:

https://hackpad.hackclub.com/guide

## What To Submit On Stardance

Use the GitHub repository link above as the project link.

Suggested short description:

```text
EgePad Six is a compact Hackpad macropad by Ege Özdemir with a 2x3 MX switch matrix, an EC11 rotary encoder, XIAO RP2040 controller, KMK firmware, PCB files, CAD files, BOM, and production package structure.
```

## Current Evidence

- GitHub repository exists and `main` has been pushed.
- Required Hackpad folders are present: `CAD/`, `PCB/`, `Firmware/`, and `production/`.
- README includes project owner, BOM, wiring plan, and visual previews.
- Local submission scaffold check passes with `scripts/check-submission.ps1`.
- Clean source zip can be generated with `scripts/package-source.ps1`.

## Honest Status

Ready for Stardance project logging / repo link submission: **YES**

Ready for final PCB manufacturing without manual review: **NO**

Final manual checks still required:

- KiCad ERC/DRC.
- KiCad-generated Gerbers replacing the draft `production/gerbers.zip`.
- CAD-kernel-generated STEP exports replacing the draft STEP placeholders.
- Firmware test on XIAO RP2040 with KMK installed.

