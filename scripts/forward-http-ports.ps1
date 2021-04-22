#Requires -Version 5
#Requires -RunAsAdministrator
$wslPorts=@(80, 443)
$wslIp = $(bash.exe -c "ip addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'").Trim()

netsh interface portproxy reset

foreach ($port in $wslPorts) {
    netsh interface portproxy add v4tov4 listenport=$port connectport=$port connectaddress=$wslIp
}

netsh interface portproxy show v4tov4
