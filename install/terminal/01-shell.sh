#!/bin/bash
DOTFILES_ROOT="${DOTFILES_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)}"
export DOTFILES_ROOT
source "${DOTFILES_ROOT}/backup.sh"
backup_file ~/.inputrc

source "${DOTFILES_ROOT}/err.sh" "${BASH_SOURCE[0]}"
source "${DOTFILES_ROOT}/log.sh" "${BASH_SOURCE[0]}"

echolog "Installing ~/.inputrc"
[[ ! -L ~/.inputrc ]] && ln -s "${DOTFILES_ROOT}/config/dot-inputrc" ~/.inputrc || true
