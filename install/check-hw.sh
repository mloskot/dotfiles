#!/bin/bash
# Poor-man mloskot's specific hardware detection
# - Lenovo ThinkCentre Mxxx
# - Lenovo ThinkPad
# - Dell Precision T7xxx
# - WSL

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/lib.sh"
source "${DOTFILES_ROOT}/log.sh"

if ! command -v "jq" >/dev/null; then
    sudo apt update -y && sudo install jq -y
fi

DOTFILES_HW_MODEL=$(hostnamectl status --json=short | jq -r '.HardwareModel')
if [[ $DOTFILES_HW_MODEL =~ "null" ]]; then
    DOTFILES_KERNEL_RELEASE=$(hostnamectl status --json=short | jq -r '.KernelRelease')
    if [[ $DOTFILES_KERNEL_RELEASE =~ "WSL2" ]]; then
        DOTFILES_HW_MODEL="WSL"
    fi
fi
echolog "Detected hardware: ${DOTFILES_HW_MODEL}"

# Assume desktop by default, possibly multi-screen
if [[ $DOTFILES_HW_MODEL =~ "ThinkPad" ]]; then
  DOTFILES_LAPTOP="${DOTFILES_HW_MODEL}"
fi

if [[ -n "${DOTFILES_LAPTOP}" ]]; then
  echolog "Assuming small screen laptop"
fi
