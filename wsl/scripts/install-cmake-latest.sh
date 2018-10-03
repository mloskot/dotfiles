#!/bin/sh
set -x

sudo rm -rf /usr/local/bin/cmake*
sudo rm -rf /usr/local/bin/ctest*
sudo rm -rf /usr/local/doc/cmake
sudo rm -rf /usr/local/man/man1/cmake*
sudo rm -rf /usr/local/man/man1/ctest*
sudo rm -rf /usr/local/man/man7/cmake*
sudo rm -rf /usr/local/share/cmake*

wget -O cmake-linux.sh https://cmake.org/files/v3.12/cmake-3.12.3-Linux-x86_64.sh
sudo sh cmake-linux.sh -- --skip-license --prefix=/usr/local
cmake --version
