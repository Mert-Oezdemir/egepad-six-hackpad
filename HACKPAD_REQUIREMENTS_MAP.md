# Hackpad Requirements Map

Project: EgePad Six Hackpad

Owner: Ege Özdemir

Repository: https://github.com/Mert-Oezdemir/egepad-six-hackpad

## Requirement Coverage

| Hackpad expectation | Repo evidence | Status |
| --- | --- | --- |
| Public GitHub repository | `README.md`, pushed `main` branch | Done |
| Project owner recorded | `README.md`, `project.json`, `SUBMISSION.md` | Done |
| Original hackpad concept | EgePad Six 2x3 layout + encoder design | Done as concept |
| README with overview | `README.md` | Done |
| Visual previews | `assets/*.svg` referenced in `README.md` | Done as design previews |
| BOM | `BOM.csv` and README BOM table | Done |
| PCB files | `PCB/egepad.kicad_pro`, `PCB/egepad.kicad_sch`, `PCB/egepad.kicad_pcb` | Draft present |
| Firmware | `Firmware/main.py` and `production/main.py` | Draft present |
| CAD / case files | `CAD/*.STEP` | Draft present |
| Production files | `production/gerbers.zip`, `production/*.STEP`, `production/main.py` | Draft present |
| Stardance handoff | `STARDANCE_SUBMISSION.md`, `STARDANCE_SUBMIT_TEXT.md` | Done |

## Honest Gate Split

Ready for Stardance project logging: **YES**

Ready for manufacturing without more work: **NO**

The repo is ready to show the project, intent, structure, and build plan. It is not yet a verified manufacturing package because this environment does not include KiCad CLI, KiCad GUI, Fusion 360, FreeCAD, OpenSCAD, or KMK hardware test access.

## Manual Final Validation Required

1. Open `PCB/egepad.kicad_pro` in KiCad.
2. Replace draft/custom footprints with Hackpad care package footprints where needed.
3. Run ERC.
4. Run DRC.
5. Export real Gerbers and replace `production/gerbers.zip`.
6. Open or rebuild the case in CAD.
7. Export real `Top.STEP`, `Bottom.STEP`, and `assembled-model.STEP`.
8. Install CircuitPython + KMK on a XIAO RP2040.
9. Copy `Firmware/main.py`.
10. Test all six keys and encoder directions/button.

## One-Command Local Checks

Scaffold check:

```powershell
powershell -ExecutionPolicy Bypass -File scripts\check-submission.ps1
```

Final readiness check:

```powershell
powershell -ExecutionPolicy Bypass -File scripts\check-final-readiness.ps1
```

Clean source package:

```powershell
powershell -ExecutionPolicy Bypass -File scripts\package-source.ps1
```

