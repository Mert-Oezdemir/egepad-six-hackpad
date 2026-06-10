$ErrorActionPreference = "Stop"

$requiredFiles = @(
  "README.md",
  "BOM.csv",
  "project.json",
  "START_STARDANCE.html",
  "CAD/assembled-model.STEP",
  "CAD/Top.STEP",
  "CAD/Bottom.STEP",
  "PCB/egepad.kicad_pro",
  "PCB/egepad.kicad_sch",
  "PCB/egepad.kicad_pcb",
  "Firmware/main.py",
  "production/gerbers.zip",
  "production/Top.STEP",
  "production/Bottom.STEP",
  "production/main.py"
)

$missing = @()
foreach ($file in $requiredFiles) {
  if (-not (Test-Path $file -PathType Leaf)) {
    $missing += $file
  }
}

if ($missing.Count -gt 0) {
  Write-Host "Missing required files:"
  $missing | ForEach-Object { Write-Host " - $_" }
  exit 1
}

$metadata = Get-Content "project.json" -Raw | ConvertFrom-Json
if ($metadata.owner -ne "Ege Özdemir") {
  Write-Host "Unexpected owner in project.json: $($metadata.owner)"
  exit 1
}

Write-Host "Submission scaffold check passed."
