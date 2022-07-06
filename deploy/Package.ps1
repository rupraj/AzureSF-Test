[CmdletBinding()]
param (
    [Parameter(Mandatory = $true)]
    [string] $env_name
)
$env_running= $env_name

if($env_running -eq "development"){
    Write-Host "I am in development"
}else{
    Write-Host "I am not in development"
}

