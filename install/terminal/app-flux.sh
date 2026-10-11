#!/bin/bash
DOTFILES_ROOT="${DOTFILES_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)}"
export DOTFILES_ROOT
source "${DOTFILES_ROOT}/err.sh" "${BASH_SOURCE[0]}"
source "${DOTFILES_ROOT}/log.sh" "${BASH_SOURCE[0]}"

echolog "Installing Flux CLI ${FLUX_VERSION}"

if [[ -z "${FLUX_VERSION}" ]];  then
  echolog "FLUX_VERSION not set, installing latest"
else
  echolog "FLUX_VERSION not set, installing latest"
fi

curl -s https://fluxcd.io/install.sh | FLUX_VERSION="${FLUX_VERSION}" bash -s ~/.local/bin

installed_cmd="$(command -v flux)"
installed_ver="$(flux version --client)"
echolog "Installed ${installed_cmd} ${installed_ver}"
