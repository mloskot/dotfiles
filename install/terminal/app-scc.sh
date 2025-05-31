#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing scc (sloc cloc and code)"

VERSION=$(curl -s "https://api.github.com/repos/boyter/scc/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
echolog "Downloading scc ${VERSION}"

curl -Lo scc.tar.gz "https://github.com/boyter/scc/releases/download/v${VERSION}/scc_Linux_x86_64.tar.gz"
sudo tar -xzf scc.tar.gz --directory ~/.local/bin scc
rm -f scc.tar.gz

installed_cmd="$(command -v scc)"
installed_ver="$(scc --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"
