$packages = @(
    'Amazon.Corretto.18',
    'BurntSushi.ripgrep.MSVC',
    'Git.Git',
    'GitHub.cli',
    'GitHub.GitHubDesktop',
    'GnuPG.GnuPG',
    'GoLang.Go',
    'Hashicorp.Packer',
    'junegunn.fzf',
    'Kitware.CMake',
    'Kubernetes.kubectl',
    'Microsoft.AzureCLI',
    'MikeFarah.yq',
    'Neovim.Neovim',
    'stedolan.jq',
    ''
)

& winget upgrade

foreach ($packageId in $packages) {
    if (-not $packageId) {
        continue
    }
    Write-Host "Upgrading package $packageId" -ForegroundColor DarkGreen
    & winget upgrade --id $packageId
}
