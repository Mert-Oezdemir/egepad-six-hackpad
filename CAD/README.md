# CAD Notes

Owner: Ege Özdemir

Target case:

- Top plate: 112mm x 80mm x 3mm
- Bottom shell: 112mm x 80mm x 13mm
- Final assembled height target: 18mm before keycaps/encoder knob
- PCB internal clearance target: 92.8mm x 60.8mm, giving 0.4mm per side tolerance around a 92mm x 60mm PCB
- MX switch cutouts: 14mm x 14mm
- Heatset insert holes: 4.7mm diameter, 4mm deep
- Screw pass-through holes: 3.4mm diameter
- USB-C side cutout: 12mm x 8mm on the right edge near the XIAO

The included STEP files are draft/concept STEP files generated as submission placeholders in an environment without a CAD kernel. Open the design in Fusion 360 or another CAD tool and export final STEP geometry before final Hackpad submission.

Source files:

- `egepad_case.scad`: measured case source with switch cutouts, encoder cutout, screw holes, insert pockets, PCB pocket, and USB-C cutout.
- `MECHANICAL_DIMENSIONS.md`: dimension table for manual CAD review.
