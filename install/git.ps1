#!/usr/bin/env powershell
#Requires -RunAsAdministrator

$downloadUrl = 'https://gitforwindows.org/index.html'
$downloadSite = Invoke-WebRequest $downloadUrl

$latestVersion = ($downloadSite.AllElements | `
    Where {$_.class -match 'version' -and $_.innerText -match "Version\s+\d+\.\d+\.\d+" } | `
    Select-Object -ExpandProperty InnerText).Trim();

if ($latestVersion -match 'Version\s+(\d+\.\d+\.\d+(\.\d+)?)') {
    $latestVersion = $matches[1]
} else {
    Write-Host ("Failed to extract version of latest release from '{0}' at {1}" -f $latestVersion, $downloadUrl);
    exit 1;
}

$major, $minor, $patch, $issue = $latestVersion.split('.');
try {
    # check current only
    if (where git) {
        $currentVersion = (git --version 2>&1);
    } else {
        $exe = (Join-Path $env:ProgramFiles 'Git\cmd\git.exe')
        Write-Host ("Checking version of '{0}'" -f $exe)
        $currentVersion = (&"$exe" --version 2>&1);
    }
    # git version X.Y.Z.windows.N
    $currentVersion = $currentVersion.split(' ')[2].replace('.windows.', '.')
} catch {
    $currentVersion = $null;
    Write-Host 'Git not installed or not found. Downloading.'
}

if ($currentVersion -ne $null) {
    $currentMajor, $currentMinor, $currentPatch, $currentIssue = $currentVersion.replace('.windows.', '.').split('.');
    if ([Version]::new($currentMajor, $currentMinor, $currentPatch) -ge `
        [Version]::new($major, $minor, $patch) `
        -and $currentIssue -ge $issue) {
        Write-Host ('Installed Git {0} is not older than latest {1}' -f $currentVersion.ToString(), $latestVersion);
        exit 0;
    } else {
        Write-Host ('Installed Git {0} is older than latest {1}' -f $currentVersion.ToString(), $latestVersion);
    }
}

# https://github.com/git-for-windows/git/releases/download/v2.24.0.windows.1/Git-2.24.0-64-bit.exe
# https://github.com/git-for-windows/git/releases/download/v2.24.0.windows.2/Git-2.24.0.2-64-bit.exe
# https://github.com/git-for-windows/git/releases/download/v2.24.1.windows.2/Git-2.24.1.2-64-bit.exe
if (-not $issue -or $issue -eq 1) {
    $msi = ('Git-{0}.{1}.{2}-64-bit.exe' -f $major, $minor, $patch)
} else {
    $msi = ('Git-{0}.{1}.{2}.{3}-64-bit.exe' -f $major, $minor, $patch, $issue)
}
$out = ('{0}\{1}'-f $PSScriptRoot, $msi);

if (-not (Test-Path -Path $out -PathType Leaf)) {
    if (-not $issue) {
        $issue = 1
    }
    $url = ('https://github.com/git-for-windows/git/releases/download/v{0}.{1}.{2}.windows.{3}/{4}' -f $major, $minor, $patch, $issue, $msi);
    Write-Host ('Downloading Git {0} from {1}' -f $latestVersion, $url)
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    (New-Object System.Net.WebClient).DownloadFile($url, $out)
}

Stop-Process -Force -Name 'git.exe' -ErrorAction SilentlyContinue
Stop-Process -Force -Name 'gpg-agent.exe' -ErrorAction SilentlyContinue

# List of /COMPONENTS see https://github.com/git-for-windows/build-extra/blob/master/installer/install.iss
$options = @(
    '/SILENT',
    '/NORESTART',
    '/NOCANCEL',
    '/SP-',
    '/CLOSEAPPLICATIONS',
    '/RESTARTAPPLICATIONS',
    '/COMPONENTS="icons,gitlfs,consolefont"'
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

if (where git) {
    # check current and latest
    git version
} else {
    Write-Host ("Re-launch console to update PATH")
    $exe = (Join-Path $env:ProgramFiles 'Git\cmd\git.exe')
    Write-Host ("Checking version of '{0}'" -f $exe)
    &"$exe" --version
}
