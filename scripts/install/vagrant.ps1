#!/usr/bin/env powershell
#Requires -RunAsAdministrator

$downloadUrl = 'https://www.vagrantup.com/downloads.html'
$downloadSite = Invoke-WebRequest $downloadUrl

$latestVersion = ($downloadSite.AllElements | `
    Where-Object {$_.class -match 'description g-type-body' `
    -and $_.innerText -match "latest version of Vagrant\s+\((\d+\.\d+\.\d+)\)" } | `
    Select-Object -ExpandProperty InnerText).Trim();

if ($latestVersion -match 'latest version of Vagrant\s+\((\d+\.\d+\.\d+)\)') {
    $latestVersion = $matches[1]
} else {
    Write-Host ('Failed to extract version of latest release from {0}' -f $downloadUrl);
    exit 1;
}

$major, $minor, $patch = $latestVersion.split('.');

try {
    # check current only
    if (Where-Object vagrant) {
        $currentVersion = (vagrant --version 2>&1);
    } else {
        $exe = 'C:\HashiCorp\Vagrant\bin\vagrant.exe'
        Write-Host ("Checking version of '{0}'" -f $exe)
        $currentVersion = (&"$exe" --version 2>&1);
    }
    $currentVersion = $currentVersion.split(' ')[1] # vagrant X.Y.Z
} catch {
    $currentVersion = $null;
    Write-Host 'Vagrant not installed or not found. Downloading.'
}
if ($null -ne $currentVersion) {
    $currentMajor, $currentMinor, $currentPatch = $currentVersion.split('.');
    $currentPatch = $currentPatch.split('-')[0] # 0-rcX to 0
    $patch = $patch.split('-')[0]
    if ([Version]::new($currentMajor, $currentMinor, $currentPatch) -ge `
        [Version]::new($major, $minor, $patch)) {
        Write-Host ('Installed Vagrant {0} is not newer than {1}' -f $currentVersion.ToString(), $latestVersion);
        exit 0;
    } else {
        Write-Host ('Installed Vagrant {0} is older than latest {1}' -f $currentVersion.ToString(), $latestVersion);
    }
}

$msi = ('vagrant_{0}_x86_64.msi' -f $latestVersion);
$out = ('{0}\{1}'-f $PSScriptRoot, $msi);
if (-not (Test-Path -Path $out -PathType Leaf)) {
    Write-Host ('Downloading Vagrant {0}' -f $latestVersion)
    $url = ('https://releases.hashicorp.com/vagrant/{0}/{1}' -f $latestVersion, $msi);
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    (New-Object System.Net.WebClient).DownloadFile($url, $out)
}

$options = @(
    '/qn',
    '/norestart'
);
$options = ($options.GetEnumerator() | ForEach-Object { ('{0}' -f $_) }) -join ' '
try {
    Write-Host ("Installing {0}" -f $out)
    $p = Start-Process -Wait -PassThru -FilePath $out -Args $options
    Write-Host ("Installer exited with code {0}" -f $p.ExitCode)
} catch {
    Write-Host $_.Exception.Message
    exit 1
}
Remove-Item -Path $out -Force

if (Where-Object vagrant) {
    # check current and latest
    vagrant version
} else {
    Write-Host ("Re-launch console to update PATH")
    $exe = 'C:\HashiCorp\Vagrant\bin\vagrant.exe'
    Write-Host ("Checking version of '{0}'" -f $exe)
    &"$exe" --version
}
