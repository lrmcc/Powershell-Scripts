#Computer-Info.ps1 - Gather info on computer on local machine.

#OS Description
$ComputerName = $env:computername
$OS = (Get-CimInstance Win32_OperatingSystem).caption
Write-Output "OS is: $OS"

#Disk Freespace on OS Drive
$Drive = Get-CimInstance Win32_logicaldisk | Where-Object DeviceID -eq 'C:'
$Freespace = (($Drive.Freespace)/1gb)
Write-Output "Freespace is: $Freespace"

#Amount of System Memory
$MemoryInGB = ((((Get-CimInstance Win32_PhysicalMemory ).Capacity | Measure-Object -Sum).Sum)/1gb)
Write-Output "Memory is: $MemoryInGB GB"

#Last reboot of system
$LastReboot = (Get-CimInstance Win32_OperatingSystem ).LastBootUpTime
Write-Output "Last reboot occurred: $LastReboot"

#IP Address & DNS Name
$DNS = Resolve-DnsName -name $ComputerName | Where-Object Type -eq "A"
$DNSName = $DNS.Name
$DNSIP = $DNS.IPaddress
Write-Output "DNS name: $DNSName"
Write-Output "DNS IP address: $DNSIP"

#DNS Server of Target


#Write output to screen