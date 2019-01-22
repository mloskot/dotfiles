#!/usr/bin/env powershell
#Requires -RunAsAdministrator

$version = '1.11.2'

$major, $minor, $patch = $version.split('.');
try {
  $currentVersion = (conan --version 2>&1);
  $currentVersion = $currentVersion.split(' ')[2] # conna version X.Y.Z
} catch {
  $currentVersion = $null;
}
if ($currentVersion -ne $null) {
  $currentMajor, $currentMinor, $currentPatch = $currentVersion.split('.');
  $currentPatch = $currentPatch.split('-')[0] # 0-rcX to 0
  $patch = $patch.split('-')[0]
  if ([Version]::new($currentMajor, $currentMinor, $currentPatch) -ge `
      [Version]::new($major, $minor, $patch)) {
        Write-Host ('Installed Conan {0} is not newer than {1}' -f $currentVersion.ToString(), $version);
        exit 0;
  }
}

$exe = ('conan-win-64_{0}_{1}_{2}.exe' -f $major, $minor, $patch);
$out = ('{0}\{1}'-f $PSScriptRoot, $exe);
if (-not (Test-Path -Path $out -PathType Leaf)) {
  Write-Host ('Downloading Conan {0}' -f $version)
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
} catch {
  Write-Host $_.Exception.Message
  exit 1
}
Remove-Item -Path $out -Force

conan --version