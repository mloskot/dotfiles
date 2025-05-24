#!/bin/bash
set -e

# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Enable fractional scaling"
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"

echo "Enable text scaling"
# TODO(mloskot): Detect high DPI screen and scale with 1.2 or similar
gsettings set org.gnome.desktop.interface text-scaling-factor 1.0

echolog "Auto-hide the Dock"
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true

echolog "Center new windows in the middle of the screen"
gsettings set org.gnome.mutter center-new-windows true

echolog "Enable workspaces on all displays"
gsettings set org.gnome.mutter workspaces-only-on-primary false

echolog "Hide Home and Trash icons from desktop"
gsettings set org.gnome.shell.extensions.ding show-home false
gsettings set org.gnome.shell.extensions.ding show-trash false

echolog "Show week numbers in the Gnome calendar"
gsettings set org.gnome.desktop.calendar show-weekdate true

echolog "Show battery percentage"
gsettings set org.gnome.desktop.interface show-battery-percentage true

echolog "Disable <super>+p bindings to switch-monitor"
# Keep XF86Display in case there is some kind of "display" key on keyboard
gsettings set org.gnome.mutter.keybindings switch-monitor "['XF86Display']"
