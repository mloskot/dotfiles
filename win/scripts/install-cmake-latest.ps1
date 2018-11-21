#!/usr/bin/env powershell
$version = '3.13.0'

$major, $minor, $patch = $version.split('.');
try {
  $currentVersion = (cmake --version 2>&1);
  $currentVersion = $currentVersion.split(' ')[2] # cmake version X.Y.Z
} catch {
  $currentVersion = $null;
}
if ($currentVersion -ne $null) {
  $currentMajor, $currentMinor, $currentPatch = $currentVersion.split('.');
  $currentPatch = $currentPatch.split('-')[0] # 0-rcX to 0
  $patch = $patch.split('-')[0]
  if ([Version]::new($currentMajor, $currentMinor, $currentPatch) -ge `
      [Version]::new($major, $minor, $patch)) {
        Write-Host ('Installed CMake {0} is not newer than {1}' -f $currentVersion.ToString(), $version);
        exit 0;
  }
}

$msi = ('cmake-{0}-win64-x64.msi' -f $version);
$out = ('{0}\{1}'-f $PSScriptRoot, $msi);
if (-not (Test-Path -Path $out -PathType Leaf)) {
  Write-Host ('Downloading CMake {0}' -f $version)
  $url = ('https://cmake.org/files/v{0}.{1}/{2}' -f $major, $minor, $msi);
  [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
  (New-Object System.Net.WebClient).DownloadFile($url, $out)
}

$options = @(
  '/qn',
  '/norestart',
  'ADD_CMAKE_TO_PATH="System"'
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

cmake --version