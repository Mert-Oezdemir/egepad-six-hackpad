# EgePad Six Project Rules

Owner: Ege Özdemir

## Working Discipline

- Keep this repo focused on the Hackpad submission package.
- Do not copy files or implementation details from MAIAS or KilitMesaj; only reuse their release discipline.
- Keep proof and uncertainty visible: build/check status belongs in `RELEASE_STATUS.md`.
- Do not mark the project production-ready until KiCad DRC, Gerber export, CAD export, and firmware validation are complete.
- Keep hardware constraints explicit: PCB under 100mm x 100mm, case under 200mm x 200mm x 100mm, kit parts only unless noted.

## Submission Gates

- README includes design render, schematic preview, PCB preview, case preview, and BOM.
- PCB design files exist under `PCB/`.
- CAD/STEP files exist under `CAD/` and `production/`.
- Firmware exists under `Firmware/` and `production/`.
- Gerber archive exists under `production/`.
- Final manual KiCad/Fusion review is still required before Hackpad submission.

