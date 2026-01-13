#!/bin/bash
SCRIPT_NAME="${BASH_SOURCE[0]}"
SCRIPT_PATH="$(dirname "$(realpath "${SCRIPT_NAME}")")"
source "${SCRIPT_PATH}/err.sh" "${SCRIPT_NAME}"
source "${SCRIPT_PATH}/log.sh" "${SCRIPT_NAME}"

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
