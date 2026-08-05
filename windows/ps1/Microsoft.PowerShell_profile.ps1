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

if (Get-Command -Name eza -CommandType Application -ErrorAction SilentlyContinue) {
  # Linux muscle memory helpers, see config/bash/dot-bash_aliases

  function Invoke-Eza {
    param ([Parameter(ValueFromRemainingArguments = $true)][string[]]$Args)
    eza @Args
  }
  New-Alias -Name ls -Value Invoke-Eza -Force -Option AllScope

  function Invoke-EzaL {
    param ([Parameter(ValueFromRemainingArguments = $true)][string[]]$Args)
    eza -lbF --git @Args
  }
  New-Alias -Name l -Value Invoke-EzaL -Force -Option AllScope

  function Invoke-EzaLL {
    param ([Parameter(ValueFromRemainingArguments = $true)][string[]]$Args)
    eza -lbhgUmu --time-style=long-iso --git --color-scale @Args
  }
  New-Alias -Name ll -Value Invoke-EzaLL -Force -Option AllScope

  function Invoke-EzaLA {
    param ([Parameter(ValueFromRemainingArguments = $true)][string[]]$Args)
    eza -lbhgUmu --all --time-style=long-iso --git --color-scale @Args
  }
  New-Alias -Name la -Value Invoke-EzaLA -Force -Option AllScope

  function Invoke-EzaLX {
    param ([Parameter(ValueFromRemainingArguments = $true)][string[]]$Args)
    eza -lbhHigUmuS@ --all --time-style=long-iso --git --color-scale @Args
  }
  New-Alias -Name lx -Value Invoke-EzaLX -Force -Option AllScope

  function Invoke-EzaLT {
    param ([Parameter(ValueFromRemainingArguments = $true)][string[]]$Args)
    eza --tree --git-ignore --all @Args
  }
  New-Alias -Name lt -Value Invoke-EzaLT -Force -Option AllScope

  function Invoke-EzaLTD {
    param ([Parameter(ValueFromRemainingArguments = $true)][string[]]$Args)
    eza --tree --git-ignore --only-dirs @Args
  }
  New-Alias -Name ltd -Value Invoke-EzaLTD -Force -Option AllScope
}

if (Get-Command -Name nerdctl -CommandType Application -ErrorAction SilentlyContinue) {
  New-Alias -Name docker -Value nerdctl -Force -Option AllScope
}

# Aliases for basic commands (Linux muscle memory helpers)
function Invoke-RemoveItemRecurse {
  param([Parameter(ValueFromRemainingArguments=$true)] $Args)
  Remove-Item -Recurse @Args
}
New-Alias -Name rmr -Value Invoke-RemoveItemRecurse -Force -Option AllScope

function Invoke-RemoveItemRecurseForce {
  param([Parameter(ValueFromRemainingArguments=$true)] $Args)
  Remove-Item -Recurse -Force @Args
}
New-Alias -Name rmr -Value Invoke-RemoveItemRecurseForce -Force -Option AllScope
