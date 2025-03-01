$modules = @( 'PSReadLine', 'posh-git', 'oh-my-posh', 'Get-ChildItemColor' )

foreach ($m in $modules) {
    Write-Output "Checking $m"
    if (-not (Find-Module -Name $m)) {
        Write-Output "Installing $m"
        Install-Module -Name $m -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
    } else {
        Write-Output "Updating $m"
        Update-Module -Name $m -AllowPrerelease -Scope CurrentUser -Force
    }
}
