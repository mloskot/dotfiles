#!/bin/sh
#set -x
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo apt-get -y update

for v in 5 6 7 8 9
do
    sudo apt-get -y install gcc-${v} g++-${v}
    gcc-${v} --version
    sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-${v} 60 --slave /usr/bin/g++ g++ /usr/bin/g++-${v}
done

sudo update-alternatives --config gcc-9
sudo update-alternatives --config gcc

gcc --version