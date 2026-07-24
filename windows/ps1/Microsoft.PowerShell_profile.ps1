if (Get-Command -Name starship -CommandType Application) {
  starship init powershell | Out-String | Invoke-Expression
}

if (Get-Command -Name zoxide -CommandType Application) {
  zoxide init powershell | Out-String | Invoke-Expression
}

if (Get-Command -Name atuin -CommandType Application) {
  atuin init powershell --disable-up-arrow | Out-String | Invoke-Expression
}

if (Get-Command -Name mise -CommandType Application) {
  mise activate pwsh | Out-String | Invoke-Expression
}

if (Get-Command -Name lazygit -CommandType Application) {
  New-Alias -Name lg -Value lazygit -Force -Option AllScope
}

function Invoke-GitCommitWIP {
  &git add -A && &git commit -m "WIP: $(Get-Date -Format o)" --no-verify
}
New-Alias -Name wip -Value Invoke-GitCommitWIP -Force -Option AllScope
