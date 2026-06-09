$ErrorActionPreference = "Stop"

$checks = New-Object System.Collections.Generic.List[object]

function Add-Check($Name, $Status, $Detail) {
  $checks.Add([pscustomobject]@{
    Name = $Name
    Status = $Status
    Detail = $Detail
  })
}

function Test-CommandExists($Name) {
  return [bool](Get-Command $Name -ErrorAction SilentlyContinue)
}

function Test-FileExists($Path) {
  return Test-Path $Path -PathType Leaf
}

$requiredFiles = @(
  "README.md",
  "BOM.csv",
  "HACKPAD_REQUIREMENTS_MAP.md",
  "PCB/egepad.kicad_pro",
  "PCB/egepad.kicad_sch",
  "PCB/egepad.kicad_pcb",
  "CAD/assembled-model.STEP",
  "CAD/Top.STEP",
  "CAD/Bottom.STEP",
  "Firmware/main.py",
  "production/gerbers.zip",
  "production/Top.STEP",
  "production/Bottom.STEP",
  "production/main.py",
  "STARDANCE_SUBMISSION.md"
)

$missing = @()
foreach ($file in $requiredFiles) {
  if (-not (Test-FileExists $file)) {
    $missing += $file
  }
}

if ($missing.Count -eq 0) {
  Add-Check "submission scaffold" "PASS" "All expected repo files exist."
} else {
  Add-Check "submission scaffold" "FAIL" ("Missing: " + ($missing -join ", "))
}

if (Test-CommandExists "kicad-cli") {
  Add-Check "KiCad CLI" "PASS" "kicad-cli is available for ERC/DRC/export."
} else {
  Add-Check "KiCad CLI" "WARN" "kicad-cli is not installed; ERC/DRC/Gerber export not verified here."
}

if ((Test-CommandExists "FreeCADCmd") -or (Test-CommandExists "openscad")) {
  Add-Check "CAD export tooling" "PASS" "A CAD command-line tool is available."
} else {
  Add-Check "CAD export tooling" "WARN" "No FreeCADCmd or openscad found; STEP geometry not regenerated here."
}

if (Test-CommandExists "python") {
  try {
    python -m py_compile Firmware\main.py production\main.py
    Add-Check "firmware syntax" "PASS" "Python syntax check passed."
  } catch {
    Add-Check "firmware syntax" "FAIL" "Python syntax check failed."
  }
} else {
  Add-Check "firmware syntax" "WARN" "Python is not available."
}

$gerberZip = Get-Item "production/gerbers.zip" -ErrorAction SilentlyContinue
if ($gerberZip -and $gerberZip.Length -gt 0) {
  Add-Check "gerber zip presence" "PASS" "production/gerbers.zip exists."
} else {
  Add-Check "gerber zip presence" "FAIL" "production/gerbers.zip is missing or empty."
}

$checks | Format-Table -AutoSize

$hasFail = $checks | Where-Object { $_.Status -eq "FAIL" }
$hasWarn = $checks | Where-Object { $_.Status -eq "WARN" }

Write-Host ""
if ($hasFail) {
  Write-Host "Final readiness: NO-GO (failed checks present)."
  exit 1
}

if ($hasWarn) {
  Write-Host "Final readiness: NO-GO for manufacturing; scaffold is present but external tool/manual validation is still required."
  exit 2
}

Write-Host "Final readiness: GO."
