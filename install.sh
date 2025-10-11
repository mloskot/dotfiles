#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
# Flags installation executed using the root install.sh
DOTFILES_INSTALL_SH="${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

# Check the distribution name and version and abort if incompatible
source ~/.dotfiles/install/check-os.sh
source ~/.dotfiles/install/check-hw.sh

# Desktop software and tweaks will only be installed if we're running Gnome
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  # Ensure computer does not go to sleep or lock while installing
  idle_delay=$(gsettings get org.gnome.desktop.session idle-delay | cut -d ' ' -f 2)
  gsettings set org.gnome.desktop.session idle-delay 0
  gsettings set org.gnome.desktop.screensaver lock-enabled false

  echolog "Installing terminal and desktop tools..."

  # Install terminal tools
  source ~/.dotfiles/install/terminal.sh

  # Install desktop tools and tweaks
  source ~/.dotfiles/install/desktop.sh

  # Revert to normal idle and lock settings
  gsettings set org.gnome.desktop.session idle-delay "${idle_delay}"
  gsettings set org.gnome.desktop.screensaver lock-enabled true
else
  echolog "Only installing terminal tools..."
  source ~/.dotfiles/install/terminal.sh
fi

if [[ -n "${DOTFILES_INSTALL_SH}" ]]; then
  echolog "Successful installers: ${DOTFILES_INSTALL_SUCCESS}"
  echolog "Failed installers: ${DOTFILES_INSTALL_FAILURE}"
fi

echolog "Done"
