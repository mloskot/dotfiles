#!/bin/sh
set -x

sudo add-apt-repository ppa:ubuntu-toolchain-r/test               # latest GCC
sudo apt-get update
sudo apt-get install gcc-7 g++-7

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 60 --slave /usr/bin/g++ g++ /usr/bin/g++-7
sudo update-alternatives --config gcc-7
sudo update-alternatives --config gcc
gcc-7 --version
gcc --version
