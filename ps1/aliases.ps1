# Set l and ls alias to use the new Get-ChildItemColor cmdlets
Set-Alias l Get-ChildItemColorFormatWide -Option AllScope
Set-Alias ll Get-ChildItemColor -Option AllScope
Set-Alias ls Get-ChildItemColorFormatWide -Option AllScope

# overrides gu for Get-Unique
Set-Alias -Name gu -Value gitui -Option AllScope -Force

Set-Alias -Name ci -Value 'C:\Program Files\Microsoft VS Code Insiders\bin\code-insiders.cmd' -Option AllScope -Force