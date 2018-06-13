# Makes link in "C:\Program Files\Microsoft VS Code Insiders\bin\code.cmd"
# to target \wsl-config\win\vscode\code.cmd
# This provides `code` command missing from the VS Code Insider
# and ensures VS Code runs with --disable-gpu option
# what helps to avoid the annoying well-known freezes on high resolution/DPI screens.
$thisWinDir = (Split-Path -Parent $PSScriptRoot)
$cmdCodePath = (Join-Path -Path (Join-Path -Path $thisWinDir -ChildPath 'vscode') -ChildPath 'code.cmd')
Write-Host "mklink `"C:\Program Files\Microsoft VS Code Insiders\bin\code.cmd`" => `"$cmdCodePath`""
Start-Process -Verb runAs -FilePath "$env:comspec" "/c mklink `"C:\Program Files\Microsoft VS Code Insiders\bin\code.cmd`" `"$cmdCodePath`""
