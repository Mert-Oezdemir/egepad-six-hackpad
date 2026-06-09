$ErrorActionPreference = "Stop"

$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
$outputDir = Join-Path $repoRoot "output"
$stagingDir = Join-Path $outputDir "egepad-six-hackpad-source"
$zipPath = Join-Path $outputDir "egepad-six-hackpad-source.zip"

function Assert-InRepo($path) {
  $resolved = [System.IO.Path]::GetFullPath($path)
  if (-not $resolved.StartsWith($repoRoot, [System.StringComparison]::OrdinalIgnoreCase)) {
    throw "Refusing to operate outside repo: $resolved"
  }
  return $resolved
}

Assert-InRepo $outputDir | Out-Null
Assert-InRepo $stagingDir | Out-Null
Assert-InRepo $zipPath | Out-Null

if (Test-Path $stagingDir) {
  Remove-Item -LiteralPath $stagingDir -Recurse -Force
}

New-Item -ItemType Directory -Path $stagingDir | Out-Null

$excludedPathParts = @(
  "\.git\",
  "\output\",
  "\node_modules\",
  "\dist\",
  "\build\",
  "\__pycache__\",
  "\.netlify\",
  "\.next\"
)

$excludedNames = @(
  ".env",
  ".DS_Store",
  "Thumbs.db"
)

$files = Get-ChildItem -Path $repoRoot -Recurse -File | Where-Object {
  $full = $_.FullName
  $relative = $full.Substring($repoRoot.Length)
  $blockedByPart = $false
  foreach ($part in $excludedPathParts) {
    if ($relative.Contains($part)) {
      $blockedByPart = $true
      break
    }
  }
  if ($blockedByPart) {
    return $false
  }
  if ($excludedNames -contains $_.Name) {
    return $false
  }
  if ($_.Name -like ".env.*" -or $_.Name -like "*.log" -or $_.Name -like "*.tmp" -or $_.Name -like "*.pyc") {
    return $false
  }
  return $true
}

foreach ($file in $files) {
  $relative = $file.FullName.Substring($repoRoot.Length).TrimStart("\", "/")
  $target = Assert-InRepo (Join-Path $stagingDir $relative)
  $targetParent = Split-Path $target -Parent
  if (-not (Test-Path $targetParent)) {
    New-Item -ItemType Directory -Path $targetParent | Out-Null
  }
  Copy-Item -LiteralPath $file.FullName -Destination $target
}

if (Test-Path $zipPath) {
  Remove-Item -LiteralPath $zipPath -Force
}

Compress-Archive -Path (Join-Path $stagingDir "*") -DestinationPath $zipPath -Force

Write-Host "Source package created:"
Write-Host $zipPath
