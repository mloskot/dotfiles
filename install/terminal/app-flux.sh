#!/bin/bash
set -e
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing Flux CLI ${FLUX_VERSION}"

if [[ -z "${FLUX_VERSION}" ]];  then
  echolog "FLUX_VERSION not set, installing latest"
else
  echolog "FLUX_VERSION not set, installing latest"
fi

curl -s https://fluxcd.io/install.sh | FLUX_VERSION="${FLUX_VERSION}" bash -s ~/.local/bin


echolog "Installed $(which flux) $(flux version --client)"

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
