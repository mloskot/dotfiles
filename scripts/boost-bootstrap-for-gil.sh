#!/bin/sh
set -x

if [ ! -f boost-build.jam ]; then
    echo "Run inside Boost root"
    exit 1
fi

./bootstrap.sh
b2 headers

#./b2 --with-test --with-filesystem variant=debug stage
#./b2 --with-test --with-filesystem variant=release stage
b2 variant=debug,release address-model=64 --layout=versioned --with-test --with-filesystem stage
