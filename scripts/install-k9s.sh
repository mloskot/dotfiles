#!/bin/sh
set -x

if [ ! -x /usr/bin/lsb_release ]; then
    echo "Linux expected"
    exit 1
fi

VERSION=$(curl -s "https://api.github.com/repos/derailed/k9s/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
echo "Downloading K9s ${VERSION}"
curl -Lo k9s.deb "https://github.com/derailed/k9s/releases/latest/download/k9s_linux_amd64.deb"
sudo dpkg -i k9s.deb
sudo rm -f k9s.deb
k9s version

K9S_SKINS="${XDG_CONFIG_HOME:-$HOME/.config}/k9s/skins"
mkdir -p "$K9S_SKINS"
curl -L https://github.com/catppuccin/k9s/archive/main.tar.gz | tar xz -C "$K9S_SKINS" --strip-components=2 k9s-main/dist
