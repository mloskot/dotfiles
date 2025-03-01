#
# How to create a list of non upgradable software for winget
# https://github.com/alkampfergit/personal-blog/discussions/11
#
class Software {
    [string]$Name
    [string]$Id
    [string]$Version
    [string]$AvailableVersion
}

$upgradeResult = winget upgrade | Out-String
$lines = $upgradeResult.Split([Environment]::NewLine)

# Find the line that starts with Name, it contains the header
$fl = 0
while (-not $lines[$fl].StartsWith("Name")) {
    $fl++
}

# Line $i has the header, we can find char where we find ID and Version
$idStart = $lines[$fl].IndexOf("Id")
$versionStart = $lines[$fl].IndexOf("Version")
$availableStart = $lines[$fl].IndexOf("Available")
$sourceStart = $lines[$fl].IndexOf("Source")

# Now cycle in real package and split accordingly
$upgradeList = @()
For ($i = $fl + 1; $i -le $lines.Length; $i++) {
    $line = $lines[$i]
    if ($line.Length -gt ($availableStart + 1) -and -not $line.StartsWith('-')) {
        $name = $line.Substring(0, $idStart).TrimEnd()
        $id = $line.Substring($idStart, $versionStart - $idStart).TrimEnd()
        $version = $line.Substring($versionStart, $availableStart - $versionStart).TrimEnd()
        $available = $line.Substring($availableStart, $sourceStart - $availableStart).TrimEnd()
        $software = [Software]::new()
        $software.Name = $name;
        $software.Id = $id;
        $software.Version = $version
        $software.AvailableVersion = $available;
        $upgradeList += $software
    }
}

$upgradeList = ($upgradeList | sort-object -Property Id)
$upgradeList | Format-Table

$toSkip = @(
    'Microsoft.'
    'Microsoft.dotnet',
    'Microsoft.VC++2008Redist-x64',
    'Microsoft.VC++2013Redist-x64',
    'Microsoft.VC++2013Redist-x86',
    'Microsoft.VC++2015-2022Redist-x64',
    'Microsoft.VC++2015-2022Redist-x86',
    "Microsoft.OneDrive",
    "Microsoft.VC++2013Redist-x86",
    "Microsoft.VC++2015-2019Redist-x64",
    "Microsoft.VC++2015-2019Redist-x86",
    'Microsoft.WindowsSDK',
    'Python.Python.3',
    'Wondershare.'
)

foreach ($package in $upgradeList) {
    if ($toSkip | Where-Object { $package.Id.StartsWith($_) }) {
        Write-Host "Skipping package $($package.id)"
    }
    else {
        Write-Host "Upgrading package $($package.id)"
        & winget upgrade --id $package.id
    }
}
