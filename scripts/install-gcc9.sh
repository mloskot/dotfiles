#!/bin/sh
set -x

if type lsb_release >/dev/null 2>&1; then
    if lsb_release -sc | grep bionic; then
        sudo add-apt-repository ppa:ubuntu-toolchain-r/test
    else
        echo "WSL with bionic distro expected"
        exit 1
    fi
fi

sudo apt-get -y update
sudo apt-get -y install gcc-9 g++-9

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 60 --slave /usr/bin/g++ g++ /usr/bin/g++-9
sudo update-alternatives --config gcc-9
sudo update-alternatives --config gcc
gcc-9 --version
gcc --version
