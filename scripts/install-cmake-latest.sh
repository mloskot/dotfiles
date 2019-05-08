#!/bin/sh
set -e

url="https://cmake.org/download/"
version=$(curl --silent $url | grep -oP "<h3>Latest Release\s+\(\K(\d+\.\d+\.\d+)")
current_version=$(cmake --version | grep version | grep -oP ".+\K(\d+\.\d+\.\d+)")

is_newer()
{
    test "$(printf '%s\n' "$@" | sort -V | head -n 1)" != "$1";
}

if ! is_newer $version $current_version; then
    echo "Installed CMake $current_version is not newer than $version"
    exit 0
fi

echo "Downloading CMake $version"
curl --silent -o cmake-linux.sh https://cmake.org/files/v3.14/cmake-${version}-Linux-x86_64.sh

echo "Uninstalling CMake $current_version"
sudo rm -rf /usr/local/bin/cmake*
sudo rm -rf /usr/local/bin/ctest*
sudo rm -rf /usr/local/doc/cmake
sudo rm -rf /usr/local/man/man1/cmake*
sudo rm -rf /usr/local/man/man1/ctest*
sudo rm -rf /usr/local/man/man7/cmake*
sudo rm -rf /usr/local/share/cmake*

echo "Installing CMake $version"
sudo sh cmake-linux.sh -- --skip-license --prefix=/usr/local
cmake --version
