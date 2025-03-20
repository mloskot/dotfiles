#!/bin/bash
set -e

# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Center new windows in the middle of the screen"
gsettings set org.gnome.mutter center-new-windows true

echolog "Reveal week numbers in the Gnome calendar"
gsettings set org.gnome.desktop.calendar show-weekdate true
