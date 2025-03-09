#!/bin/bash
set -e

# Check the distribution name and version and abort if incompatible
source ~/.dotfiles/install/check-os.sh

# Install terminal tools
source ~/.dotfiles/install/terminal.sh
