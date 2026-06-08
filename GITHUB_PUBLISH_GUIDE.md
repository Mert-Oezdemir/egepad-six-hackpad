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

## Current Known State

- Local commit exists.
- Push requires a GitHub repo URL and working GitHub credentials.
- Hardware/CAD manufacturing validation is still not complete; see `RELEASE_STATUS.md`.
