#!/bin/bash
DOTFILES_ROOT="${DOTFILES_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)}"
export DOTFILES_ROOT
source "${DOTFILES_ROOT}/err.sh" "${BASH_SOURCE[0]}"
source "${DOTFILES_ROOT}/log.sh" "${BASH_SOURCE[0]}"

echolog "Installing kubebuilder"
if ! command -v "go" &>/dev/null; then
  echoerr "Please, install Go first"
  exit 1
fi

curl -L -o ~/.local/bin/kubebuilder "https://go.kubebuilder.io/dl/latest/$(go env GOOS)/$(go env GOARCH)"
chmod +x ~/.local/bin/kubebuilder

installed_cmd="$(command -v kubebuilder)"
installed_ver="$(kubebuilder version)"
echolog "Installed ${installed_cmd} ${installed_ver}"
