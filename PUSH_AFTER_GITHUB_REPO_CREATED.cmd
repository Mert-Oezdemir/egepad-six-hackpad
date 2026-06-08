@echo off
setlocal
cd /d "%~dp0"

echo EgePad Six Hackpad - GitHub publish helper
echo.
echo 1. Open Create-GitHub-Repo.url and create the GitHub repository.
echo 2. Copy the repository HTTPS URL.
echo 3. Paste it below.
echo.

git status -sb
echo.

set /p REPO_URL=GitHub repo URL: 
if "%REPO_URL%"=="" (
  echo No repo URL entered. Nothing changed.
  pause
  exit /b 1
)

git remote get-url origin >nul 2>&1
if errorlevel 1 (
  git remote add origin "%REPO_URL%"
) else (
  git remote set-url origin "%REPO_URL%"
)

git push -u origin main
echo.
echo If push failed, check GitHub login/credentials and that the repo is empty or accepts this main branch.
pause
