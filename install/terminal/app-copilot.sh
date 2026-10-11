#!/bin/bash
DOTFILES_ROOT="${DOTFILES_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)}"
export DOTFILES_ROOT
source "${DOTFILES_ROOT}/err.sh" "${BASH_SOURCE[0]}"
source "${DOTFILES_ROOT}/log.sh" "${BASH_SOURCE[0]}"

echolog "Installing copilot"

VERSION=$(curl -s "https://api.github.com/repos/github/copilot-cli/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
echolog "Downloading copilot ${VERSION}"

curl -fsSL https://gh.io/copilot-install | VERSION="v${VERSION}" PREFIX="$HOME/.local" bash

installed_cmd="$(command -v copilot)"
installed_ver="$(copilot --version | head -n 1)"
echolog "Installed ${installed_cmd} ${installed_ver}"
