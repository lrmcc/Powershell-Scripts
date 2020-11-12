#running-services.ps1 - Script to display the status of services 

$ComputerName = $env:computername
Write-Output "Infomation collected from Computer: $ComputerName"

# Variable for holding Get-Service Objects
$Services = Get-Service 
# Check and print status of each object by using . to access status & Displayname
foreach ($service in $Services) {
    $ServiceStatus = $service.Status
    $ServiceDisplayName = $service.displayname
    if ($ServiceStatus -eq 'Running') {
        Write-Output "Service ok - Status of $ServiceDisplayName is $ServiceStatus"
    }
    else {
        Write-Output "Check Service - Status of $ServiceDisplayName is $ServiceStatus"
    }

}
