#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

function backup_file
{
  backup_src=${1}
  if [[ ! -f "${backup_src}" && ! -d "${backup_src}" ]]; then
    echolog "${backup_src} not found. Skipping backup."
    return 0
  fi

  if [[ -L "${backup_src}" ]]; then
    echolog "${backup_src} already symbolic link. Skipping backup."
    return 0
  fi

  backup_dst="${backup_src}.$(date +%Y%m%dT%H%M%S)"
  echolog "Backing up ${backup_src} to ${backup_dst}"
  mv -f "${backup_src}" "${backup_dst}"
}
