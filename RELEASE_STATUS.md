# EgePad Six Release Status

Owner: Ege Özdemir

Date: 2026-06-08

## Current Gate

Status: **NO-GO for final Hackpad submission until manual KiCad/CAD validation is completed.**

GitHub repository: https://github.com/Mert-Oezdemir/egepad-six-hackpad

## Completed In This Workspace

- Repository folder structure matches the Hackpad guide.
- README contains owner, design summary, visuals, and BOM.
- Firmware `main.py` is included for KMK/CircuitPython.
- PCB KiCad project/schematic/PCB draft files are included.
- CAD and production STEP draft files are included.
- Hand-authored Gerber draft files are staged for packaging into `production/gerbers.zip`.
- Local git repository was initialized and the project was committed.
- A click helper was added: `Create-GitHub-Repo.url` opens GitHub repo creation with the suggested project name.
- A push helper was added: `PUSH_AFTER_GITHUB_REPO_CREATED.cmd` prompts for the created repo URL and pushes `main`.
- A clean source package helper was added: `scripts/package-source.ps1`.
- GitHub push to `origin/main` has completed.

## Not Verified Here

- KiCad CLI is not installed, so DRC/ERC was not run.
- KiCad CLI is not installed, so production Gerbers were not exported from KiCad.
- FreeCAD/OpenSCAD/Fusion 360 is not installed, so STEP geometry was not generated from a real CAD kernel here.
- KMK is not installed locally, so firmware import/runtime validation was not run.
- GitHub CLI (`gh`) is not installed, so future GitHub automation should use plain `git` or the browser helpers unless `gh` is installed.

## Final Manual Checks

1. Open `PCB/egepad.kicad_pro` in KiCad.
2. Reassign symbols/footprints using the Hackpad care package libraries.
3. Run ERC and DRC.
4. Export real Gerbers and replace `production/gerbers.zip`.
5. Open/import the case design in Fusion 360 or another CAD tool.
6. Export final `Top.STEP`, `Bottom.STEP`, and `assembled-model.STEP`.
7. Copy `Firmware/main.py` to a CircuitPython XIAO RP2040 with KMK installed and confirm the matrix works.
8. Update this file to GO only after the above checks pass.

## Local Check Commands

Scaffold:

```powershell
powershell -ExecutionPolicy Bypass -File scripts\check-submission.ps1
```

Final readiness:

```powershell
powershell -ExecutionPolicy Bypass -File scripts\check-final-readiness.ps1
```
