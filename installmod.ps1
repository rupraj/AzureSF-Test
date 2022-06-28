if(Get-Module -ListAvailable -Name "Az.ServiceFabric"){
  Write-Host "Service Fabric module exists"
}
else
{
    Set-PSRepository PSGallery -InstallationPolicy Trusted
    Install-Module -Name Az.ServiceFabric
    Get-Module Az.ServiceFabric -ListAvailable
}

