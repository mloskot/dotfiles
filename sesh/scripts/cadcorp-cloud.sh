#!/bin/bash
cc_env=$1
az_tenant_id=$(az account show --query homeTenantId --output tsv)

# Force Azure CLI with configuration path per single environment
# https://learn.microsoft.com/en-us/cli/azure/azure-cli-configuration#cli-configuration-file
AZURE_CONFIG_DIR="${HOME}/.azure-${cc_env}"
#export AZURE_CONFIG_DIR
tmux set-environment AZURE_CONFIG_DIR "${AZURE_CONFIG_DIR}"

CC_ENV="${cc_env}"
#export CC_ENV
tmux set-environment CC_ENV "${CC_ENV}"

# Force update environment in window 0
tmux send-keys -t 0 "export AZURE_CONFIG_DIR=${AZURE_CONFIG_DIR}" Enter
tmux send-keys -t 0 "export CC_ENV=${CC_ENV}" Enter
# Reconfigure Window 0 created by sesh
tmux rename-window command
tmux send-keys "cd ~/cadcorp-cloud" Enter

tmux new-window
tmux rename-window infra-tf
tmux send-keys "cd ~/cadcorp-cloud/cadcorp-cloud-infrastructure" Enter
tmux send-keys "mage subscription:switchDefault sub-hosting-${cc_env}" Enter

tmux new-window
tmux rename-window infra-git
tmux send-keys "cd ~/cadcorp-cloud/cadcorp-cloud-infrastructure" Enter
tmux send-keys "lazygit" Enter

tmux new-window
tmux rename-window gitops-k8s
tmux send-keys "cd ~/cadcorp-cloud/cadcorp-cloud-gitops/clusters/${az_tenant_id}/${cc_env} && direnv allow" Enter

tmux new-window
tmux rename-window gitops-git
tmux send-keys "cd ~/cadcorp-cloud/cadcorp-cloud-gitops/clusters/${az_tenant_id}/${cc_env} && direnv allow" Enter
tmux send-keys "lazygit" Enter

tmux new-window
tmux rename-window gitops-k9s
tmux send-keys "cd ~/cadcorp-cloud/cadcorp-cloud-gitops/clusters/${az_tenant_id}/${cc_env} && direnv allow" Enter

tmux new-window
tmux rename-window docs
tmux send-keys "cd ~/cadcorp-cloud/cadcorp-cloud-docs" Enter

tmux new-window
tmux rename-window docker-images
tmux send-keys "cd ~/cadcorp-cloud/docker-images-apps" Enter

tmux new-window
tmux rename-window machine-images
tmux send-keys "cd ~/cadcorp-cloud/machine-images" Enter

tmux select-window -t 0
