#!/bin/bash
az_env=$1
az_tenant_id=$(az account show --query homeTenantId --output tsv)

tmux rename-window command
tmux send-keys "cd ~/azure-hosting" Enter

tmux new-window
tmux rename-window infra-tf
tmux send-keys "cd ~/azure-hosting/azure-hosting-infrastructure" Enter
tmux send-keys "mage subscription:switchDefault sub-hosting-${az_env}" Enter

tmux new-window
tmux rename-window infra-git-${az_env}
tmux send-keys "cd ~/azure-hosting/azure-hosting-infrastructure" Enter
tmux send-keys "lazygit" Enter

tmux new-window
tmux rename-window gitops-k8s-${az_env}
tmux send-keys "cd ~/azure-hosting/azure-hosting-gitops/clusters/${az_tenant_id}/${az_env} && direnv allow" Enter

tmux new-window
tmux rename-window gitops-git-${az_env}
tmux send-keys "cd ~/azure-hosting/azure-hosting-gitops/clusters/${az_tenant_id}/${az_env} && direnv allow" Enter
tmux send-keys "lazygit" Enter

tmux new-window
tmux rename-window inventory
tmux send-keys "cd ~/azure-hosting/azure-hosting-inventory" Enter

tmux new-window
tmux rename-window docs
tmux send-keys "cd ~/azure-hosting/azure-hosting-docs" Enter

tmux new-window
tmux rename-window docker-images
tmux send-keys "cd ~/azure-hosting/docker-images-apps" Enter

tmux new-window
tmux rename-window machine-images
tmux send-keys "cd ~/azure-hosting/machine-images" Enter

tmux select-window -t 0
