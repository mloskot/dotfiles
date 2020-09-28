$global:DefaultUser = [System.Environment]::UserName

# Set l and ls alias to use the new Get-ChildItemColor cmdlets
Set-Alias ll Get-ChildItemColor -Option AllScope
Set-Alias ls Get-ChildItemColorFormatWide -Option AllScope

# Helper function to set location to the User Profile directory
function cuserprofile { Set-Location ~ }
Set-Alias ~ cuserprofile -Option AllScope

Import-Module Get-ChildItemColor
Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Paradox