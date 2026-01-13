#!/usr/bin/env bats

load '../backup.sh'

@test "create backup of existing file" {
    source_file="${BATS_TEST_DIRNAME}/backup_existent_file.txt"
    touch "${source_file}"
    run backup_file "${source_file}"
    [ "$status" -eq 0 ]
    ls "${source_file}.$(date +%Y%m)"* || true || false
}

@test "skip backup of non-existing file" {
    source_file="${BATS_TEST_DIRNAME}/backup_non_existent_file.txt"
    run backup_file "${source_file}"
    [ "$status" -eq 0 ]
    ls "${source_file}.$(date +%Y%m)"* && false || true
}

teardown() {
    for f in "${BATS_TEST_DIRNAME}"/backup_*.txt."$(date +%Y%m)"*; do
        rm -f "$f"
    done
}
