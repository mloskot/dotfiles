#!/bin/bash
if ! command -v "az" >/dev/null; then
    return
fi

# Ensure no active Azure profile or subscription by default
AZURE_CONFIG_DIR=""
export AZURE_CONFIG_DIR

alias a='az'
alias ak='az aks'
alias aks='az aks show --query "{Name:name,Status:provisioningState,Power:powerState.code}"'
