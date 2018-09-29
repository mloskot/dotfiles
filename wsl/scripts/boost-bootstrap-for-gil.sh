#!/bin/sh
set -x
./bootstrap.sh
./b2 headers
./b2 --with-test --with-filesystem variant=debug stage
./b2 --with-test --with-filesystem variant=release stage
