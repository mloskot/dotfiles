#!/bin/bash
if [[ -z "${DOTFILES_ROOT}" ]]; then
  DOTFILES_ROOT="$(cd "$(dirname "$(realpath "${BASH_SOURCE[0]}" 2>/dev/null || echo "${BASH_SOURCE[0]}")")/.." && pwd)"
  export DOTFILES_ROOT
fi
