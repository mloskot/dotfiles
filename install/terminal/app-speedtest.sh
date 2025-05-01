#!/bin/bash
set -x
echolog "Installing speedtest"

echolog "Adding apt repository"
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash
sudo apt install -y speedtest
