#!/bin/sh
set -x
cp ~/.bashrc ~/.bashrc.original
codename=$(lsb_release --codename | sed -E 's/Codename:\s([a-z]+)/\1/g')
echo $codename
sed -i -E 's/\\h/'"$codename"'/g' ~/.bashrc