#!/bin/bash
DOTFILES_ROOT="${DOTFILES_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)}"
export DOTFILES_ROOT
source "${DOTFILES_ROOT}/err.sh" "${BASH_SOURCE[0]}"
source "${DOTFILES_ROOT}/log.sh" "${BASH_SOURCE[0]}"

echolog "Installing kdash"

VERSION=$(curl -s "https://api.github.com/repos/kdash-rs/kdash/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
echolog "Downloading kdash ${VERSION}"

# TODO(mloskot): https://github.com/kdash-rs/kdash/issues/501
curl https://raw.githubusercontent.com/kdash-rs/kdash/main/deployment/getLatest.sh | sudo bash

installed_cmd="$(command -v kdash)"
installed_ver="$(kdash --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"
