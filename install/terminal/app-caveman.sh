#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

NODE_MAJOR_REQUIRED=18

if ! command -v node >/dev/null 2>&1; then
  echolog "Installing Ubuntu nodejs package for caveman"
  sudo apt update
  sudo apt install -y nodejs npm
fi

if ! command -v node >/dev/null 2>&1 && command -v nodejs >/dev/null 2>&1; then
  sudo ln -sf "$(command -v nodejs)" "${HOME}/.local/bin/node"
fi

if [ "$(node -p "process.versions.node.split('.')[0]" 2>/dev/null || echo 0)" -lt "${NODE_MAJOR_REQUIRED}" ]; then
  echolog "Ubuntu nodejs is too old for caveman; installing NodeSource Node.js ${NODE_MAJOR_REQUIRED}+"
  sudo apt install -y ca-certificates curl gnupg
  curl -fsSL "https://deb.nodesource.com/setup_${NODE_MAJOR_REQUIRED}.x" | sudo -E bash -
  sudo apt install -y nodejs npm
  if ! command -v node >/dev/null 2>&1 && command -v nodejs >/dev/null 2>&1; then
    sudo ln -sf "$(command -v nodejs)" "${HOME}/.local/bin/node"
  fi
fi

echolog "Installing caveman"

VERSION=$(curl -s "https://api.github.com/repos/JuliusBrussee/caveman/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
echolog "Downloading caveman ${VERSION}"

curl -fsSL "https://raw.githubusercontent.com/JuliusBrussee/caveman/v${VERSION}/install.sh" | bash

if command -v caveman >/dev/null 2>&1; then
  installed_cmd="$(command -v caveman)"
  installed_ver="$(caveman --version | head -n 1)"
  echolog "Installed ${installed_cmd} ${installed_ver}"
fi
