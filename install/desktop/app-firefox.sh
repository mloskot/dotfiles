#!/bin/bash
set -e
echolog "Installing Firefox"

# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

if command -v "/snap/bin/firefox" &>/dev/null; then
  echolog "Firefox already installed with snap"
else
  echolog "Adding apt repository"
  sudo install -d -m 0755 /etc/apt/keyrings
  sudo rm -r /etc/apt/keyrings/packages.mozilla.org.asc
  wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | \
    sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null

  gpg -n -q --import --import-options import-show /etc/apt/keyrings/packages.mozilla.org.asc | \
    awk '/pub/{getline; gsub(/^ +| +$/,""); if($0 == "35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3") print "\nThe key fingerprint matches ("$0").\n"; else print "\nVerification failed: the fingerprint ("$0") does not match the expected one.\n"}'

  sudo rm -f /etc/apt/sources.list.d/mozilla.list
  echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | \
   sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null

echo '
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000
' | sudo tee /etc/apt/preferences.d/mozilla

  sudo apt update -y
  sudo apt install -y --allow-downgrades firefox
fi

firefox --version

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
