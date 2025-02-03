#!/bin/sh
set -x

if [ ! -x /usr/bin/lsb_release ]; then
    echo "Linux expected"
    exit 1
fi

VERSION=$(curl -s "https://api.github.com/repos/ko-build/ko/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
echo "Downloading ko ${VERSION}"

curl -Lo ko.tar.gz "https://github.com/ko-build/ko/releases/download/v${VERSION}/ko_Linux_x86_64.tar.gz"
sudo tar xf ko.tar.gz -C /usr/local/bin ko
sudo rm -f ko.tar.gz
ko version
