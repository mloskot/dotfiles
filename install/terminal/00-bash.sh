#!/bin/bash
DOTFILES_ROOT="${DOTFILES_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)}"
export DOTFILES_ROOT
source "${DOTFILES_ROOT}/backup.sh"
backup_file ~/.bashrc
backup_file ~/.bash_aliases
backup_file ~/.bash.d

source "${DOTFILES_ROOT}/err.sh" "${BASH_SOURCE[0]}"
source "${DOTFILES_ROOT}/log.sh" "${BASH_SOURCE[0]}"

echolog "Installing ~/.bashrc"
[[ ! -L ~/.bashrc ]] && ln -s "${DOTFILES_ROOT}/config/bash/dot-bashrc" ~/.bashrc || true
echolog "Installing ~/.bash_aliases"
[[ ! -L ~/.bash_aliases ]] && ln -s "${DOTFILES_ROOT}/config/bash/dot-bash_aliases" ~/.bash_aliases || true
echolog "Installing ~/.bash.d"
[[ ! -L ~/.bash.d ]] && ln -s "${DOTFILES_ROOT}/config/bash/dot-bash.d" ~/.bash.d || true
