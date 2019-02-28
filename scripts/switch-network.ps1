#!/usr/bin/env powershell
#Requires -RunAsAdministrator
param([Parameter(Mandatory = $true)][string]$adapterName)

$knownAdapters = @("Ethernet", "Wi-Fi")
function WaitSeconds([int]$seconds) {
    $i = 1
    while($i -le $seconds) {
        Write-Host -NoNewline "."
        Start-Sleep 1
        $i += 1
    }
    Write-Host "done"
}

Write-Host -NoNewline "Disabling adapters "
#Get-NetAdapter | ? status -eq up | Disable-NetAdapter -Confirm:$false
$knownAdapters | % { Disable-NetAdapter -Confirm:$false -Name $_ }
WaitSeconds 3

Write-Host -NoNewline "Enabling adapter $adapterName "
Enable-NetAdapter -Name $adapterName -Confirm:$false
WaitSeconds 3

Get-NetAdapter | Select Name, Status
