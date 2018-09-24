#!/bin/sh
set -x

if type lsb_release >/dev/null 2>&1; then
    if lsb_release -sc | grep bionic; then
        echo "Ubuntu Bionic with native GCC 8 packages"
    else
        sudo add-apt-repository ppa:ubuntu-toolchain-r/test   # latest GCC
    fi
fi

sudo apt-get update
sudo apt-get install gcc-5 g++-5

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 60 --slave /usr/bin/g++ g++ /usr/bin/g++-5
sudo update-alternatives --config gcc-5
sudo update-alternatives --config gcc
gcc-5 --version
gcc --version
