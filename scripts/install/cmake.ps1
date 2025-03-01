#!/usr/bin/env powershell
#Requires -RunAsAdministrator

$downloadUrl = 'https://cmake.org/download/'
$downloadSite = Invoke-WebRequest $downloadUrl

$latestVersion = ($downloadSite.AllElements | `
    Where-Object {$_.tagName -match 'H3' -and $_.innerText -match "Latest Release" } | `
    Select-Object -ExpandProperty InnerText).Trim();
if ($latestVersion -match 'Latest Release\s+\((\d+\.\d+\.\d+)\)') {
    $latestVersion = $matches[1]
} else {
    Write-Host ('Failed to extract version of latest release from {0}' -f $downloadUrl);
    exit 1;
}

$major, $minor, $patch = $latestVersion.split('.');
try {
    if (Where-Object cmake) {
        $currentVersion = (cmake --version 2>&1);
    } else {
        $cmakeExe = (Join-Path $env:ProgramFiles 'CMake\bin\cmake')
        Write-Host ("Checking version of '{0}'" -f $cmakeExe)
        $currentVersion = (&"$cmakeExe" --version 2>&1);
    }
    $currentVersion = $currentVersion.split(' ')[2] # cmake version X.Y.Z
} catch {
    $currentVersion = $null;
    Write-Host 'CMake not installed or not found. Downloading.'
}

if ($null -ne $currentVersion) {
    $currentMajor, $currentMinor, $currentPatch = $currentVersion.split('.');
    $currentPatch = $currentPatch.split('-')[0] # 0-rcX to 0
    $patch = $patch.split('-')[0]
    if ([Version]::new($currentMajor, $currentMinor, $currentPatch) -ge `
        [Version]::new($major, $minor, $patch)) {
        Write-Host ('Installed CMake {0} not older than latest {1}' -f $currentVersion.ToString(), $latestVersion);
        exit 0;
    } else {
        Write-Host ('Installed CMake {0} is older than latest {1}' -f $currentVersion.ToString(), $latestVersion);
    }
}

$msi = ('cmake-{0}-win64-x64.msi' -f $latestVersion);
$out = ('{0}\{1}'-f $PSScriptRoot, $msi);
if (-not (Test-Path -Path $out -PathType Leaf)) {
    Write-Host ('Downloading CMake {0}' -f $latestVersion)
    $url = ('https://cmake.org/files/v{0}.{1}/{2}' -f $major, $minor, $msi);
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    (New-Object System.Net.WebClient).DownloadFile($url, $out)
}

$options = @(
    '/qn',
    '/norestart',
    'ADD_CMAKE_TO_PATH="System"'
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

if (Where-Object cmake) {
    cmake --version
} else {
    Write-Host ("Re-launch console to update PATH")
    $cmakeExe = (Join-Path $env:ProgramFiles 'CMake\bin\cmake')
    Write-Host ("Checking version of '{0}'" -f $cmakeExe)
    &"$cmakeExe" --version
}
