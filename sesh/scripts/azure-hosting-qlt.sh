#!/bin/bash
az_tenant_id=$(az account show --query homeTenantId --output tsv)

tmux rename-window infra-tf
tmux send-keys "cd ~/azure-hosting/azure-hosting-infrastructure" Enter

tmux new-window
tmux rename-window infra-git-qlt
tmux send-keys "cd ~/azure-hosting/azure-hosting-infrastructure" Enter
tmux send-keys "lazygit" Enter

tmux new-window
tmux rename-window gitops-k8s-qlt
tmux send-keys "cd ~/azure-hosting/azure-hosting-gitops/clusters/${az_tenant_id}qlt && direnv allow" Enter

tmux new-window
tmux rename-window gitops-git-qlt
tmux send-keys "cd ~/azure-hosting/azure-hosting-gitops/clusters/${az_tenant_id}qlt && direnv allow" Enter
tmux send-keys "lazygit" Enter

tmux new-window
tmux rename-window inventory
tmux send-keys "cd ~/azure-hosting/azure-hosting-inventory" Enter

tmux new-window
tmux rename-window docs
tmux send-keys "cd ~/azure-hosting/azure-hosting-docs" Enter

tmux select-window -t 0