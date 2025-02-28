#!/bin/bash
set -x

if type lsb_release >/dev/null 2>&1; then
    if lsb_release -sc | grep bionic; then
        echo "WSL is bionic"
    else
        echo "WSL with bionic distro expected"
        exit 1
    fi
fi

wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add -

#sudo add-apt-repository "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-9 main"
sudo add-apt-repository "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-10 main"
sudo apt-get -y update
sudo apt-get -y install clang-10 clang-tools-10 clang-10-doc libclang-common-10-dev libclang-10-dev libclang1-10 clang-format-10

sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-10 60 --slave /usr/bin/clang++ clang++ /usr/bin/clang++-10
sudo update-alternatives --config clang-10
sudo update-alternatives --config clang
clang-10 --version
clang --version
