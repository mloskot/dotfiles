#!/usr/bin/env bats

setup() {
    test_dir="${BATS_TEST_TMPDIR}"
    home="${test_dir}/home"
    bin="${test_dir}/bin"
    calls="${test_dir}/calls"
    mkdir -p "${home}/.dotfiles" "${bin}"
    cp "${BATS_TEST_DIRNAME}/../err.sh" "${home}/.dotfiles/err.sh"
    cp "${BATS_TEST_DIRNAME}/../log.sh" "${home}/.dotfiles/log.sh"

    cat > "${bin}/curl" <<'EOF'
#!/bin/bash
case "$*" in
    *api.github.com*)
        printf '{"tag_name":"v%s"}\n' "${ATUIN_LATEST_VERSION}"
        ;;
    *setup.atuin.sh*)
        printf 'setup\n'
        ;;
esac
EOF
    cat > "${bin}/bash" <<'EOF'
#!/bin/bash
cat >/dev/null
printf 'updated\n' >> "${CALLS}"
mkdir -p "${HOME}/.atuin/bin"
cat > "${HOME}/.atuin/bin/atuin" <<'ATUIN'
#!/bin/bash
printf 'atuin %s\n' "${ATUIN_LATEST_VERSION}"
ATUIN
chmod +x "${HOME}/.atuin/bin/atuin"
EOF
    chmod +x "${bin}/curl" "${bin}/bash"
}

run_atuin_installer() {
    local installed_version="$1"
    local latest_version="$2"
    local -a environment=(
        "HOME=${home}"
        "PATH=${bin}:/usr/bin:/bin"
        "CALLS=${calls}"
        "ATUIN_LATEST_VERSION=${latest_version}"
    )
    if [[ -n "${installed_version}" ]]; then
        environment+=("ATUIN_INSTALLED_VERSION=${installed_version}")
    fi

    run env "${environment[@]}" /bin/bash -c "source \"\$1\"" _ \
        "${BATS_TEST_DIRNAME}/../install/terminal/app-atuin.sh"
}

@test "skip Atuin setup when installed version matches latest" {
    cat > "${bin}/atuin" <<'EOF'
#!/bin/bash
printf 'atuin %s\n' "${ATUIN_INSTALLED_VERSION}"
EOF
    chmod +x "${bin}/atuin"
    run_atuin_installer 18.4.0 18.4.0

    [ "$status" -eq 0 ]
    [ ! -e "${calls}" ]
}

@test "skip Atuin setup when installed version is newer than latest" {
    cat > "${bin}/atuin" <<'EOF'
#!/bin/bash
printf 'atuin %s\n' "${ATUIN_INSTALLED_VERSION}"
EOF
    chmod +x "${bin}/atuin"
    run_atuin_installer 18.5.0 18.4.0

    [ "$status" -eq 0 ]
    [ ! -e "${calls}" ]
}

@test "run Atuin setup when newer version is available" {
    cat > "${bin}/atuin" <<'EOF'
#!/bin/bash
printf 'atuin %s\n' "${ATUIN_INSTALLED_VERSION}"
EOF
    chmod +x "${bin}/atuin"
    run_atuin_installer 18.3.0 18.4.0

    [ "$status" -eq 0 ]
    grep -q '^updated$' "${calls}"
}

@test "run Atuin setup when it is not installed" {
    run_atuin_installer "" 18.4.0

    [ "$status" -eq 0 ]
    grep -q '^updated$' "${calls}"
}
