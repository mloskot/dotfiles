#!/bin/bash
tmux rename-window .dotfiles
tmux new-window
tmux rename-window lazygit
tmux send-keys "lazygit" Enter
