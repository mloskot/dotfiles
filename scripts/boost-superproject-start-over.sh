#!/bin/bash
# Boost development utility
# https://github.com/boostorg/gil/blob/develop/CONTRIBUTING.md
# If something goes wrong, you end up with incomplete or accidentally
# modified files in your clone of the Boost super-project repository,
# or you simply wish to start fresh, then you can clean and
# reset the whole repository and its modules:
BRANCH=master
if [ "$1" != "" ]; then
    BRANCH=$1
fi
git show-branch remotes/origin/$BRANCH > /dev/null 2>&1
if [ $? != 0 ]; then
    echo Boost super-project branch $BRANCH not found, aborting.
    exit 0
fi

git clean -xffd
git submodule foreach --recursive 'git clean -xffd'

git reset --hard
git submodule foreach --recursive 'git reset --hard'

git checkout $BRANCH
git pull
git submodule update --init --recursive --jobs 8

git pull
git branch
