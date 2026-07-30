# PowerShell 7 profile

function global:prompt {
  'PS ' + $(Split-Path -Path $ExecutionContext.SessionState.Path.CurrentLocation -Leaf) + '> '
}

if (Get-Command -Name starship -CommandType Application -ErrorAction SilentlyContinue) {
  starship init powershell | Out-String | Invoke-Expression
}

if (Get-Command -Name zoxide -CommandType Application -ErrorAction SilentlyContinue) {
  zoxide init powershell | Out-String | Invoke-Expression
}

if (Get-Command -Name atuin -CommandType Application -ErrorAction SilentlyContinue) {
  atuin init powershell --disable-up-arrow | Out-String | Invoke-Expression
}

if (Get-Command -Name mise -CommandType Application -ErrorAction SilentlyContinue) {
  mise activate pwsh | Out-String | Invoke-Expression
}

if (Get-Command -Name git -CommandType Application -ErrorAction SilentlyContinue) {
  function Invoke-GitCommitWIP {
    &git add -A && &git commit -m "WIP: $(Get-Date -Format o)" --no-verify
  }
  New-Alias -Name wip -Value Invoke-GitCommitWIP -Force -Option AllScope

  if (Get-Command -Name lazygit -CommandType Application -ErrorAction SilentlyContinue) {
    New-Alias -Name lg -Value lazygit -Force -Option AllScope
  }
}

if (Get-Command -Name nerdctl -CommandType Application -ErrorAction SilentlyContinue) {
  New-Alias -Name docker -Value nerdctl -Force -Option AllScope
}
