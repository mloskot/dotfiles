#!/usr/bin/env powershell
#Requires -RunAsAdministrator

$downloadUrl = 'https://conan.io/downloads.html'
$downloadSite = Invoke-WebRequest $downloadUrl

$latestVersion = ($downloadSite.AllElements | `
        Where { $_.class -match 'col text-center pb-2 version' `
            -and $_.innerText -match "Conan (\d+\.\d+\.\d+)" } | `
        Select-Object -ExpandProperty InnerText -Last 1).Split(" ")[1].Trim();

$major, $minor, $patch = $latestVersion.split('.');
try {
    if (where conan) {
        $currentVersion = (conan --version 2>&1);
    } else {
        $conanExe = (Join-Path $env:ProgramFiles 'Conan\conan\conan.exe')
        Write-Host ("Checking version of '{0}'" -f $conanExe)
        $currentVersion = (&"$conanExe" --version 2>&1);
    }
    $currentVersion = $currentVersion.split(' ')[2] # conan version X.Y.Z
} catch {
    $currentVersion = $null;
    Write-Host 'Conan not installed or not found. Downloading.'
}
if ($currentVersion -ne $null) {
    $currentMajor, $currentMinor, $currentPatch = $currentVersion.split('.');
    $currentPatch = $currentPatch.split('-')[0] # 0-rcX to 0
    $patch = $patch.split('-')[0]
    if ([Version]::new($currentMajor, $currentMinor, $currentPatch) -ge `
            [Version]::new($major, $minor, $patch)) {
        Write-Host ('Installed Conan {0} is not newer than {1}' -f $currentVersion.ToString(), $latestVersion);
        exit 0;
    } else {
        Write-Host ('Installed Conan {0} is older than latest {1}' -f $currentVersion.ToString(), $latestVersion);
    }
}

$exe = ('conan-win-64_{0}_{1}_{2}.exe' -f $major, $minor, $patch);
$out = ('{0}\{1}' -f $PSScriptRoot, $exe);
if (-not (Test-Path -Path $out -PathType Leaf)) {
    Write-Host ('Downloading Conan {0}' -f $latestVersion)
    $url = ('https://dl.bintray.com/conan/installers/{0}' -f $exe);
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    (New-Object System.Net.WebClient).DownloadFile($url, $out)
}

$options = @(
    '/sp-',
    '/verysilent',
    '/suppressmsgboxes',
    '/norestart'
);
$options = ($options.GetEnumerator() | % { ('{0}' -f $_) }) -join ' '
try {
    Write-Host ("Installing {0}" -f $out)
    $p = Start-Process -Wait -PassThru -FilePath $out -Args $options
    Write-Host ("Installer exited with code {0}" -f $p.ExitCode)
}
catch {
    Write-Host $_.Exception.Message
    exit 1
}
Remove-Item -Path $out -Force

if (where conan) {
    # check current and latest
    conan --version
}
else {
    Write-Host ("Re-launch console to update PATH")
    $exe = 'C:\Program Files\Conan\conan\conan.exe'
    Write-Host ("Checking version of '{0}'" -f $exe)
    &"$exe" --version
}
