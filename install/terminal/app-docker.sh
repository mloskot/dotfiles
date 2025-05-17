#!/bin/bash
set -e
# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing Docker Engine"

if ! command -v "docker" &>/dev/null; then
  # https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
  sudo install -m 0755 -d /etc/apt/keyrings
  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  sudo chmod a+r /etc/apt/keyrings/docker.asc

  # shellcheck disable=SC1091
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  sudo apt update -y
  sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
fi

echolog "Installed $(which docker) $(docker --version)"

echolog "Setting up Docker to start on boot with systemd"
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

echolog "Setting up Docker access as non-root user"
if [[ -d "$HOME/.docker" ]]; then
  sudo chown "$USER":"$USER" "$HOME/.docker" -R
  sudo chmod g+rwx "$HOME/.docker" -R
fi
sudo groupadd docker
sudo usermod -aG docker "${USER}"
