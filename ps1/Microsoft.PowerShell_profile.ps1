# PowerShell 5: $HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
# PowerShell 7: $HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
# PowerShell VS Code Integrated Console: C:\Users\mateuszl\Documents\PowerShell\Microsoft.VSCode_profile.ps1
if (-not (Test-Path env:PSModulePath)) {
    return
}
$global:DefaultUser = [System.Environment]::UserName

# Set l and ls alias to use the new Get-ChildItemColor cmdlets
Set-Alias l Get-ChildItemColorFormatWide -Option AllScope
Set-Alias ll Get-ChildItemColor -Option AllScope
Set-Alias ls Get-ChildItemColorFormatWide -Option AllScope

# Helper function to set location to the User Profile directory
function cuserprofile { Set-Location ~ }
Set-Alias ~ cuserprofile -Option AllScope

# Install-Module -AllowClobber Get-ChildItemColor
Import-Module Get-ChildItemColor

# Load ripgrep completion
$rgPath = Join-Path -Path $env:ChocolateyInstall -ChildPath "lib\ripgrep\tools\ripgrep-13.0.0-x86_64-pc-windows-msvc\complete\_rg.ps1"
if (Test-Path -Path $rgPath -PathType Leaf) {
    . $rgPath
}
else {
    Write-Warning ("Cannot find '{0}'" -f $rgPath)
}

# Load powerline-go prompt
$env:VIRTUAL_ENV_DISABLE_PROMPT=$true
function global:prompt {
    $pwd = $ExecutionContext.SessionState.Path.CurrentLocation
    $startInfo = New-Object System.Diagnostics.ProcessStartInfo
    $startInfo.FileName = "powerline-go"
    $startInfo.Arguments = "-shell bare -newline -modules venv,ssh,cwd,perms,git,hg,jobs,exit,root,docker,wsl -cwd-mode plain -hostname-only-if-ssh -trim-ad-domain -mode compatible"
    $startInfo.Environment["TERM"] = "xterm-256color"
    $startInfo.CreateNoWindow = $true
    $startInfo.StandardOutputEncoding = [System.Text.Encoding]::UTF8
    $startInfo.RedirectStandardOutput = $true
    $startInfo.UseShellExecute = $false
    $startInfo.WorkingDirectory = $pwd
    $process = New-Object System.Diagnostics.Process
    $process.StartInfo = $startInfo
    $process.Start() | Out-Null
    $standardOut = $process.StandardOutput.ReadToEnd()
    $process.WaitForExit()
    $standardOut
}