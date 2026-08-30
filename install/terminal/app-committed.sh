#!/bin/bash
DOTFILES_ROOT="${DOTFILES_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)}"
export DOTFILES_ROOT
source "${DOTFILES_ROOT}/err.sh" "${BASH_SOURCE[0]}"
source "${DOTFILES_ROOT}/log.sh" "${BASH_SOURCE[0]}"

echolog "Installing committed"

VERSION=$(curl -s "https://api.github.com/repos/crate-ci/committed/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
echolog "Downloading committed ${VERSION}"

curl -Lo committed.tar.gz "https://github.com/crate-ci/committed/releases/download/v${VERSION}/committed-v${VERSION}-x86_64-unknown-linux-musl.tar.gz"
tar -xzf committed.tar.gz --directory ~/.local/bin ./committed
rm -f committed.tar.gz

installed_cmd="$(command -v committed)"
installed_ver="$(committed --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"
