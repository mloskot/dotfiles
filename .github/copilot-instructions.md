# Copilot instructions

- This repository contains opinionated dotfiles and installers for Ubuntu Linux. Preserve the documented platform support and existing user-facing behavior.
- Before changing an installer, check its caller and the relevant README or configuration. Put terminal and desktop installers in their respective `install/terminal/` and `install/desktop/` directories.
- Installer scripts are sourced by their orchestrators. Preserve that execution model and use the existing `err.sh` and `log.sh` helpers and conventions.
- Treat bootstrap and installer scripts as host-mutating code: they may use `sudo`, install packages, download software, or change system and user settings. Do not run them as validation unless explicitly requested.
- For Bash changes, quote variable expansions, use arrays for lists of arguments, and keep scripts ShellCheck-clean.
- Add or update focused Bats tests for behavior changes. Keep tests from modifying the real home directory or system configuration.
- Validate shell changes with ShellCheck and relevant tests with `bats tests/`. Avoid unrelated changes.
