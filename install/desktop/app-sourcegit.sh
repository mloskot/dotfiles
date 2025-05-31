#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing SourceGit"

VERSION=$(curl -s "https://api.github.com/repos/sourcegit-scm/sourcegit/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
echolog "Downloading SourceGit ${VERSION}"
curl -Lo sourcegit.deb "https://github.com/sourcegit-scm/sourcegit/releases/latest/download/sourcegit_${VERSION}-1_amd64.deb"
sudo dpkg -i sourcegit.deb
rm -f sourcegit.deb
