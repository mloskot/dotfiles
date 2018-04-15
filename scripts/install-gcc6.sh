#!/bin/sh
set -x

sudo add-apt-repository ppa:ubuntu-toolchain-r/test               # latest GCC
sudo apt-get update
sudo apt-get install gcc-6 g++-6

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 60 --slave /usr/bin/g++ g++ /usr/bin/g++-6
sudo update-alternatives --config gcc-6
sudo update-alternatives --config gcc
gcc-6 --version
gcc --version
