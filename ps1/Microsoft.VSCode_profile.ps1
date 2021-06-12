# PowerShell 5: $HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
# PowerShell 7: $HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
# PowerShell VS Code Integrated Console: C:\Users\mateuszl\Documents\PowerShell\Microsoft.VSCode_profile.ps1
$global:DefaultUser = [System.Environment]::UserName

# Set l and ls alias to use the new Get-ChildItemColor cmdlets
Set-Alias l Get-ChildItemColorFormatWide -Option AllScope
Set-Alias ll Get-ChildItemColor -Option AllScope
Set-Alias ls Get-ChildItemColorFormatWide -Option AllScope

# Helper function to set location to the User Profile directory
function cuserprofile { Set-Location ~ }
Set-Alias ~ cuserprofile -Option AllScope

# Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck    
# Install-Module posh-git -Scope CurrentUser
Import-Module posh-git
# Install-Module oh-my-posh -Scope CurrentUser
Import-Module oh-my-posh

# Install-Module -AllowClobber Get-ChildItemColor
Import-Module Get-ChildItemColor

# Load ripgrep completion
$rgPath = Join-Path -Path $env:ChocolateyInstall -ChildPath "lib\ripgrep\tools\ripgrep-12.1.1-x86_64-pc-windows-msvc\complete\_rg.ps1"
if (Test-Path -Path $rgPath -PathType Leaf) {
    . $rgPath
}
else {
    Write-Warning ("Cannot find '{0}'" -f $rgPath)
}

Set-PoshPrompt -Theme C:\Users\mateuszl\.theme-marcduiker-mloskot.omp.json
