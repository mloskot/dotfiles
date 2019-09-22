#!/bin/sh
set -e

url="https://cmake.org/download/"
version=$(curl --silent $url | grep -oP "<h3>Latest Release\s+\(\K(\d+\.\d+\.\d+)")

is_newer()
{
    test "$(printf '%s\n' "$@" | sort -V | head -n 1)" != "$1";
}

if type cmake > /dev/null 2>&1; then
    current_version=$(cmake --version | grep version | grep -oP ".+\K(\d+\.\d+\.\d+)")
    if ! is_newer $version $current_version; then
        echo "Installed CMake $current_version is not older than available $version"
        exit 0
    else
        echo "Installed CMake $current_version is older than available $version"
    fi
else
    echo "No CMake installed"
fi

version_folder=v$(echo $version | grep -oP "\d+\.\d+")
url="https://cmake.org/files/${version_folder}/cmake-${version}-Linux-x86_64.sh"
echo "Downloading $url"
curl --silent -o cmake-linux.sh $url

if type cmake > /dev/null 2>&1; then
    echo "Uninstalling CMake $current_version"
    sudo rm -rf /usr/local/bin/cmake*
    sudo rm -rf /usr/local/bin/ctest*
    sudo rm -rf /usr/local/doc/cmake
    sudo rm -rf /usr/local/man/man1/cmake*
    sudo rm -rf /usr/local/man/man1/ctest*
    sudo rm -rf /usr/local/man/man7/cmake*
    sudo rm -rf /usr/local/share/cmake*
fi

echo "Installing CMake $version"
sudo sh cmake-linux.sh -- --skip-license --prefix=/usr/local
cmake --version
