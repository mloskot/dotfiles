#!/bin/bash
set -e
# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing committed"

VERSION=$(curl -s "https://api.github.com/repos/crate-ci/committed/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
echolog "Downloading committed ${VERSION}"

curl -Lo committed.tar.gz "https://github.com/crate-ci/committed/releases/download/v${VERSION}/committed-v${VERSION}-x86_64-unknown-linux-musl.tar.gz"
tar -xzf committed.tar.gz --directory ~/.local/bin ./committed
rm -f committed.tar.gz

echolog "Installed $(which committed) $(committed --version)"

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
