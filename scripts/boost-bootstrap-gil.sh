#!/bin/sh
set -x

if [ ! -f boost-build.jam ]; then
    echo "Run inside Boost root"
    exit 1
fi

./bootstrap.sh
b2 -j8 headers

b2 toolset=gcc variant=debug,release address-model=64 --layout=versioned --with-test --with-filesystem stage
b2 toolset=clang variant=debug,release address-model=64 --layout=versioned --with-test --with-filesystem stage
