#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

if ! command -v "python3" &>/dev/null; then
  echolog "Installing Python 3"
  sudo apt update -y
  sudo apt install -y python3
fi

# https://github.com/catppuccin/gnome-terminal/blob/75e57457f58a34baf2ec7d9e13556ca53d598395/install.py#L38
CATPPUCCIN_MACCHIATO_ID="5083e06b-024e-46be-9cd2-892b814f1fc8"
if ! gsettings get org.gnome.Terminal.ProfilesList list | grep "${CATPPUCCIN_MACCHIATO_ID}"; then
  echolog "Install Catppuccin for Gnome Terminal"
  curl -L https://raw.githubusercontent.com/catppuccin/gnome-terminal/v1.0.0/install.py | python3 -
fi

echolog "Settings Catppuccin Macchiato as default profile for Gnome Terminal"
gsettings set org.gnome.Terminal.ProfilesList default "${CATPPUCCIN_MACCHIATO_ID}"

cols="120"
rows="40"
echolog "Settings default size ${cols}x${rows} for Gnome Terminal"
profile=$(gsettings get org.gnome.Terminal.ProfilesList default)
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${profile:1:-1}/" default-size-columns ${cols}
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${profile:1:-1}/" default-size-rows ${rows}

echolog "Setting custom keyboard shortcuts for Gnome Terminal"
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ next-tab '<Control>Tab'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ prev-tab '<Control><Shift>Tab'
for i in 1 2 3 4 5 6 7 8 9 11 12
do
  gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ "switch-to-tab-${i}" 'disabled'
done
