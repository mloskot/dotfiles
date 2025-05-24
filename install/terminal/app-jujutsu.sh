#!/bin/bash
set -e
# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing jj"

# shellcheck disable=SC1090
source ~/.dotfiles/backup.sh
backup_file ~/.config/jj

VERSION=$(curl -s "https://api.github.com/repos/jj-vcs/jj/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
echolog "Downloading jj ${VERSION}"

# curl -Lo jj.tar.gz "https://github.com/jj-vcs/jj/releases/download/v${VERSION}/jj-v${VERSION}-x86_64-unknown-linux-musl.tar.gz"
# tar -xzf jj.tar.gz --directory ~/.local/bin ./jj
# rm -f jj.tar.gz

echolog "Installed $(which jj) $(jj --version)"

echolog "Installing ~/.config/jj"
[[ ! -L ~/.config/jj ]] && ln -s ~/.dotfiles/config/jj ~/.config/jj

echolog "Installing jjui"
VERSION=$(curl -s "https://api.github.com/repos/idursun/jjui/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
curl -Lo jjui.zip "https://github.com/idursun/jjui/releases/download/v${VERSION}/jjui-${VERSION}-linux-amd64.zip"
unzip -j jjui.zip "jjui-${VERSION}-linux-amd64"
rm jjui.zip
mv "jjui-${VERSION}-linux-amd64" ~/.local/bin/jjui

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
