#!/bin/bash
SCRIPT_NAME="${BASH_SOURCE[0]}"
SCRIPT_PATH="$(dirname "$(realpath "${SCRIPT_NAME}")")"
source "${SCRIPT_PATH}/../../err.sh" "${SCRIPT_NAME}"
source "${SCRIPT_PATH}/../../log.sh" "${SCRIPT_NAME}"

echolog "Installing Minikube"

VERSION=$(curl -s "https://api.github.com/repos/kubernetes/minikube/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
echolog "Downloading Minikube ${VERSION}"

curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
mv -f ./minikube-linux-amd64 ~/.local/bin/minikube
chmod +x ~/.local/bin/minikube

installed_cmd="$(command -v minikube)"
installed_ver="$(minikube version --short)"
echolog "Installed ${installed_cmd} ${installed_ver}"
