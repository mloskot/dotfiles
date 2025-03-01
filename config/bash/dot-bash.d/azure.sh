#!/bin/bash
if ! command -v "az" >/dev/null; then
    return 
fi

alias a='az'
alias ak='az aks'
alias aks='az aks show --query "{Name:name,Status:provisioningState,Power:powerState.code}"'
