#!/bin/bash
DOTFILES_PATH="$(realpath "$(dirname "$(realpath "${BASH_SOURCE[0]}")")")"
[ -n "${DOTFILES_DEBUG}" ] && echo "DEBUG ${BASH_SOURCE[0]}: \$1=${1}"
[ -n "${DOTFILES_DEBUG}" ] && echo "DEBUG ${BASH_SOURCE[0]}: DOTFILES_PATH=${DOTFILES_PATH}"

source "${DOTFILES_PATH}/err.sh" "${1}"
source "${DOTFILES_PATH}/log.sh" "${1}"
