#Requires -Version 5
#Requires -RunAsAdministrator
$wslPorts=@(80, 443)
$wslIp = $(bash.exe -c "hostname -I").Trim()

netsh interface portproxy reset

foreach ($port in $wslPorts) {
    netsh interface portproxy add v4tov4 listenport=$port connectport=$port connectaddress=$wslIp
}

netsh interface portproxy show v4tov4
