#!/bin/bash
SCRIPT_NAME="${BASH_SOURCE[0]}"
SCRIPT_PATH="$(dirname "$(realpath "${SCRIPT_NAME}")")"
source "${SCRIPT_PATH}/../../err.sh" "${SCRIPT_NAME}"
source "${SCRIPT_PATH}/../../log.sh" "${SCRIPT_NAME}"

echolog "Installing ec"

VERSION=$(curl -s "https://api.github.com/repos/chojs23/ec/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
echolog "Downloading ec ${VERSION}"

curl -LO https://github.com/chojs23/ec/releases/latest/download/ec-linux-amd64
mv -f ./ec-linux-amd64 ~/.local/bin/ec
chmod +x ~/.local/bin/ec

installed_cmd="$(command -v ec)"
installed_ver="$(ec --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"
