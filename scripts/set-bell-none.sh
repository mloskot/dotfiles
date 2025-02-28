#!/bin/bash
set -x
sudo sed -i '/^# set bell-style none/s/^#//g' /etc/inputrc
