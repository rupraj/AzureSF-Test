Write-Host "Packaging ServiceFabric project"
Invoke-WebRequest 'https://dot.net/v1/dotnet-install.ps1' -OutFile 'dotnet-install.ps1';
./dotnet-install.ps1 -InstallDir '~/.dotnet' -Version '3.1' -Runtime 'dotnetcore';
#msbuild .\MySFWebApp8.sfproj /t:package /p:"Configuration=Release"

Write-Host "---- Finished Packaging project ------"

Write-Host "List directory contents"
ls .\.dotnet
