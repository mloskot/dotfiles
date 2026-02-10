#!/bin/bash
DOTFILES_ROOT="${DOTFILES_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)}"
export DOTFILES_ROOT
source "${DOTFILES_ROOT}/backup.sh"
backup_file ~/.config/jj

source "${DOTFILES_ROOT}/err.sh" "${BASH_SOURCE[0]}"
source "${DOTFILES_ROOT}/log.sh" "${BASH_SOURCE[0]}"

echolog "Installing jj"

VERSION=$(curl -s "https://api.github.com/repos/jj-vcs/jj/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
echolog "Downloading jj ${VERSION}"

curl -Lo jj.tar.gz "https://github.com/jj-vcs/jj/releases/download/v${VERSION}/jj-v${VERSION}-x86_64-unknown-linux-musl.tar.gz"
tar -xzf jj.tar.gz --directory ~/.local/bin ./jj
rm -f jj.tar.gz

installed_cmd="$(command -v jj)"
installed_ver="$(jj --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"

echolog "Installing ~/.config/jj"
[[ ! -L ~/.config/jj ]] && ln -s "${DOTFILES_ROOT}/config/jj" ~/.config/jj || true
