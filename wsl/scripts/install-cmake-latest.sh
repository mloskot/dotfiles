#!/bin/sh
set -x

wget -O cmake-linux.sh https://cmake.org/files/v3.12/cmake-3.12.0-rc2-Linux-x86_64.sh
sudo sh cmake-linux.sh -- --skip-license --prefix=/usr/local
cmake --version
