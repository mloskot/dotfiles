#!/bin/bash
set -e

# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Center new windows in the middle of the screen"
gsettings set org.gnome.mutter center-new-windows true

echolog "Hide Home and Trash icons from desktop"
gsettings set org.gnome.shell.extensions.ding show-home false
gsettings set org.gnome.shell.extensions.ding show-trash false

echolog "Show week numbers in the Gnome calendar"
gsettings set org.gnome.desktop.calendar show-weekdate true

echolog "Show battery percentage"
gsettings set org.gnome.desktop.interface show-battery-percentage true
