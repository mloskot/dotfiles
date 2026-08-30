#!/bin/bash
DOTFILES_ROOT="${DOTFILES_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)}"
export DOTFILES_ROOT
source "${DOTFILES_ROOT}/err.sh" "${BASH_SOURCE[0]}"
source "${DOTFILES_ROOT}/log.sh" "${BASH_SOURCE[0]}"

echolog "Installing kind"

VERSION=$(curl -s "https://api.github.com/repos/kubernetes-sigs/kind/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
if [[ -x ~/.local/bin/kind ]]; then
  if ~/.local/bin/kind --version | grep "${VERSION}" ; then
    echolog "kind ${VERSION} already installed"
    ~/.local/bin/kind --version
    VERSION=""
  fi
fi

if [[ -n "${VERSION}" ]]; then
  echolog "Downloading kind ${VERSION}"
  mkdir -p ~/.local/bin
  curl -Lo ~/.local/bin/kind "https://github.com/kubernetes-sigs/kind/releases/download/v${VERSION}/kind-linux-amd64"
  chmod +x ~/.local/bin/kind
fi

installed_cmd="$(command -v kind)"
installed_ver="$(kind --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"
