# GitHub Publish Helper

Project: EgePad Six Hackpad

Owner: Ege Özdemir

## One-Click Repo Creation Link

Double-click:

```text
Create-GitHub-Repo.url
```

This opens GitHub's new repository page with the suggested repo name:

```text
egepad-six-hackpad
```

GitHub still requires you to confirm the repository creation in the browser. That part cannot be safely bypassed by a local file.

## Push After Repo Exists

After creating the repo, double-click:

```text
PUSH_AFTER_GITHUB_REPO_CREATED.cmd
```

Paste the new GitHub HTTPS repo URL when prompted. The helper will:

1. Add or update `origin`.
2. Run `git push -u origin main`.

## Shareable Source Package

If GitHub push is blocked, create a clean source zip:

```powershell
powershell -ExecutionPolicy Bypass -File scripts\package-source.ps1
```

Output:

```text
output/egepad-six-hackpad-source.zip
```

The package excludes `.git`, `.env*`, logs, cache folders, and generated junk.

## Current Known State

- Local commit exists.
- Push requires a GitHub repo URL and working GitHub credentials.
- Clean source package can be generated with `scripts/package-source.ps1`.
- Hardware/CAD manufacturing validation is still not complete; see `RELEASE_STATUS.md`.
