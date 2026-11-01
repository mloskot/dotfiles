#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing Atuin"

VERSION="$(curl -fsSL https://api.github.com/repos/atuinsh/atuin/releases/latest | grep -Po '"tag_name":\s*"v?\K[0-9]+(\.[0-9]+)+')"

installed_ver=""
if command -v atuin &>/dev/null; then
  installed_ver="$(atuin --version | grep -Po '[0-9]+(\.[0-9]+)+' | head -n1)"
fi

if [[ -z "${installed_ver}" ]] || [[ "$(printf '%s\n' "${installed_ver}" "${VERSION}" | sort -V | tail -n1)" != "${installed_ver}" ]]; then
  echolog "Installing atuin ${VERSION}"
  curl --proto '=https' --tlsv1.2 -sSf https://setup.atuin.sh | bash
else
  echolog "Atuin ${installed_ver} is up to date"
fi

PATH=$HOME/.atuin/bin:$PATH
export PATH

installed_cmd="$(command -v atuin)"
installed_ver="$(atuin --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"

echolog "Installing bash-preexec"
curl https://raw.githubusercontent.com/rcaloras/bash-preexec/master/bash-preexec.sh -o ~/.bash-preexec.sh
