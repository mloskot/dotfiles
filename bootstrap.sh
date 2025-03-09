#\!/bin/bash

source /etc/lsb-release
if [ "$DISTRIB_ID" != "Ubuntu" ]; then
  echo "Distribution $DISTRIB_ID is not supported"
  exit 1
fi

sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

echo "Cloning mloskot/dotfiles..."
rm -rf ~/.dotfiles
git clone https://github.com/mloskot/dotfiles.git ~/.dotfiles >/dev/null
if [[ "${DOTFILES_REF}" != "main" ]]; then
    echo "Switching from main branch to ${DOTFILES_REF}"
	cd ~/.dotfiles
	git fetch origin "${DOTFILES_REF}" && git checkout "${DOTFILES_REF}"
	cd -
fi

echo "Installation starting..."
source ~/.dotfiles/install.sh
