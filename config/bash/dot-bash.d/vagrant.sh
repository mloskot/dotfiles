#!/bin/bash
if [[ -n "${WSL_DISTRO_NAME}" ]]; then
     if [[ -f "/mnt/c/HashiCorp/Vagrant/bin/vagrant.exe" ]]; then
          export VAGRANT=/mnt/c/HashiCorp/Vagrant/bin/vagrant.exe
     fi
fi
