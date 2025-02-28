#!/bin/bash
set -x

if type lsb_release >/dev/null 2>&1; then
    if lsb_release -sc | grep bionic; then
        echo "Ubuntu Bionic with native GCC packages"
    else
        sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
    fi
fi

sudo apt-get -y update
sudo apt-get -y install gcc-8 g++-8

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 60 --slave /usr/bin/g++ g++ /usr/bin/g++-8
sudo update-alternatives --config gcc-8
sudo update-alternatives --config gcc
gcc-8 --version
gcc --version
