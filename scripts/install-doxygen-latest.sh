#!/bin/sh
set -x
version='1.8.17'

# TODO:
# . /etc/os-release
# if test "${ID}" = "debian" && $(echo "$VERSION" | grep -Fqe "stretch"); then
#     echo "deb http://apt.llvm.org/stretch/ llvm-toolchain-stretch-6.0 main" | \
#         sudo tee /etc/apt/sources.list.d/llvm.list
#     echo "deb-src http://apt.llvm.org/stretch/ llvm-toolchain-stretch-6.0 main" | \
#         sudo tee -a /etc/apt/sources.list.d/llvm.list
# elif test "${ID}" = "ubuntu" && $(echo "$VERSION" | grep -Fqe "18.04"); then
#     echo "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-6.0 main" | \
#         sudo tee /etc/apt/sources.list.d/llvm.list
#     echo "deb-src http://apt.llvm.org/bionic/ llvm-toolchain-bionic-6.0 main" | \
#         sudo tee -a /etc/apt/sources.list.d/llvm.list
# fi
#
# wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
# sudo apt-get -qy update
# sudo apt-get -qy install libclang1-6.0
#
# FIXME:
# stretch:~$ doxygen --version
# doxygen: error while loading shared libraries: libclang.so.6: cannot open shared object file: No such file or directory
# stretch:~$ ldconfig -p|grep clang
#         libclang-6.0.so.1 (libc6,x86-64) => /usr/lib/x86_64-linux-gnu/libclang-6.0.so.1
#         libclang-3.8.so.1 (libc6,x86-64) => /usr/lib/x86_64-linux-gnu/libclang-3.8.so.1
# stretch:~$ sudo ln -s /usr/lib/x86_64-linux-gnu/libclang-6.0.so.1 /usr/lib/x86_64-linux-gnu/libclang.so.6
# stretch:~$ doxygen --version
# doxygen: /home/dimitri/doxygen/dev/llvm-svn/lib/Support/CommandLine.cpp:293: void {anonymous}::CommandLineParser::registerCategory(llvm::cl::OptionCategory*): Assertion `count_if(RegisteredOptionCategories, [cat](const OptionCategory *Category) { return cat->getName() == Category->getName(); }) == 0 && "Duplicate option categories"' failed.
# Aborted (core dumped)

sudo rm -f /usr/local/bin/doxygen

wget -O - http://doxygen.nl/files/doxygen-${version}.linux.bin.tar.gz | \
    tar xz -C ${TMPDIR-/tmp} doxygen-${version}/bin/doxygen
sudo mv  ${TMPDIR-/tmp}/doxygen-${version}/bin/doxygen /usr/local/bin/doxygen

doxygen --version
