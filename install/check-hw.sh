#!/bin/bash
# Poor-man mloskot's specific hardware detection
# - Lenovo ThinkCentre Mxxx
# - Lenovo ThinkPad
# - Dell Precision T7xxx
# - WSL

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/lib.sh"
source "${DOTFILES_ROOT}/log.sh"

DOTFILES_HW_MODEL=$(hostnamectl status --json=short | jq -r '.HardwareModel')
echolog "Detected hardware: ${DOTFILES_HW_MODEL}"

# Assume desktop by default, possibly multi-screen
if [[ $DOTFILES_HW_MODEL =~ "ThinkPad" ]]; then
  DOTFILES_LAPTOP="${DOTFILES_HW_MODEL}"
fi

if [[ -n "${DOTFILES_LAPTOP}" ]]; then
  echolog "Assuming small screen laptop"
fi
