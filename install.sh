#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
# Flags installation executed using the root install.sh
DOTFILES_INSTALL_SH="${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

function usage
{
    echo "Usage: $0 [arguments]"
    echo "  -a|--all      Install applications for both, terminal and desktop (default)"
    echo "  -d|--desktop  Install desktop applications only"
    echo "  -t|--terminal Install terminal applications only"
    echo "  -h|--help     Show help for $0"
    exit 1
}
if [[ $# -eq 0 ]]; then
    usage
fi

arg_desktop=0
arg_terminal=0
while [[ $# -gt 0 ]];
do
    case $1 in
      -a|--all) arg_terminal=1;arg_desktop=1;;
      -d|--desktop) arg_desktop=1;;
      -t|--terminal) arg_terminal=1;;
      -h|--help) usage;;
      *) echolog "Unknown argument: $1"; usage;;
    esac;
    shift
done

# Check the distribution name and version and abort if incompatible
source ~/.dotfiles/install/check-os.sh
source ~/.dotfiles/install/check-hw.sh

# Desktop software and tweaks will only be installed if we're running Gnome
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  echolog "Disabling idle and lock settings"
  idle_delay=$(gsettings get org.gnome.desktop.session idle-delay | cut -d ' ' -f 2)
  gsettings set org.gnome.desktop.session idle-delay 0
  gsettings set org.gnome.desktop.screensaver lock-enabled false
fi

if [[ $arg_terminal -gt 0 ]]; then
  source ~/.dotfiles/install/terminal.sh
else
  echolog "Skipping terminal applications..."
fi

if [[ $arg_desktop -gt 0 ]]; then
  source ~/.dotfiles/install/desktop.sh
else
  echolog "Skipping desktop applications..."
fi

if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  echolog "Restoring idle and lock settings"
  gsettings set org.gnome.desktop.session idle-delay "${idle_delay}"
  gsettings set org.gnome.desktop.screensaver lock-enabled true
fi

if [[ -n "${DOTFILES_INSTALL_SH}" ]]; then
  echolog "Successful installers: ${DOTFILES_INSTALL_SUCCESS}"
  echolog "Failed installers: ${DOTFILES_INSTALL_FAILURE}"
fi

echolog "Done"
