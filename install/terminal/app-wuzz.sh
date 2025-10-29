#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing wuzz"

VERSION=$(curl -s "https://api.github.com/repos/asciimoo/wuzz/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
if [[ -x ~/.local/bin/wuzz ]]; then
  if ~/.local/bin/wuzz --version | grep "${VERSION}" ; then
    echolog "wuzz ${VERSION} already installed"
    ~/.local/bin/wuzz --version
    VERSION=""
  fi
fi

if [[ -n "${VERSION}" ]]; then
  echolog "Downloading wuzz ${VERSION}"

  mkdir -p ~/.local/bin
  curl -Lo ~/.local/bin/wuzz "https://github.com/asciimoo/wuzz/releases/download/v${VERSION}/wuzz_linux_amd64"
  chmod +x ~/.local/bin/wuzz
fi

installed_cmd="$(command -v wuzz)"
installed_ver="$(wuzz --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"
