$packages = @(
    'Amazon.Corretto.18',
    'BurntSushi.ripgrep.MSVC',
    'dandavison.delta',
    'Git.Git',
    'GitHub.cli',
    'GitHub.GitHubDesktop',
    'GnuPG.GnuPG',
    'GnuPG.Gpg4win',
    'GoLang.Go',
    'Hashicorp.Packer',
    'junegunn.fzf',
    'Kitware.CMake',
    'Kubernetes.kubectl',
    'Microsoft.AzureCLI',
    'Microsoft.WinDbg',
    'MikeFarah.yq',
    'Neovim.Neovim',
    'sharkdp.bat',
    'sharkdp.fd',
    'sharkdp.hyperfine',
    'sharkdp.pastel',
    'stedolan.jq',
    ''
)

& winget upgrade

foreach ($packageId in $packages) {
    if (-not $packageId) {
        continue
    }
    Write-Host "Installing or upgrading package $packageId" -ForegroundColor DarkGreen
    & winget install --id $packageId
}
