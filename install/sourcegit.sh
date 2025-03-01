#!/bin/bash
set -x

if [ ! -x /usr/bin/lsb_release ]; then
    echo "Linux expected"
    exit 1
fi

# Source https://lindevs.com/install-lazygit-on-ubuntu/
VERSION=$(curl -s "https://api.github.com/repos/sourcegit-scm/sourcegit/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
curl -Lo sourcegit.deb "https://github.com/sourcegit-scm/sourcegit/releases/latest/download/sourcegit_${VERSION}-1_amd64.deb"
sudo dpkg -i sourcegit.deb
sudo rm -f sourcegit.deb
