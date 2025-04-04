#!/usr/bin/env bash

remove_snaps() {
    while [ "$(snap list | wc -l)" -gt 0 ]; do
        for snap in $(snap list | tail -n +2 | cut -d ' ' -f 1); do
            snap remove --purge "$snap"
        done
    done
}

remove_snapd() {
    systemctl stop snapd
    systemctl disable snapd
    systemctl mask snapd
    apt purge snapd -y

    cat <<-EOF | tee /etc/apt/preferences.d/nosnap.pref
	Package: snapd
	Pin: release a=*
	Pin-Priority: -10
	EOF
}

cleanup() {
    rm -rf /snap /var/lib/snapd
    for userpath in /home/*; do
        rm -rf "$userpath/snap"
    done
}


msg() {
    tput setaf 2
    echo "[*] $1"
    tput sgr0
}

main() {
    msg 'Removing snaps'
    remove_snaps
    msg 'Removing snapd'
    remove_snapd
    msg 'Cleaning up'
    cleanup
}

(return 2> /dev/null) || main
