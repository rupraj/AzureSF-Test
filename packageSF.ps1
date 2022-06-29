Write-Host "Packaging ServiceFabric project"
Invoke-WebRequest 'https://dot.net/v1/dotnet-install.ps1' -OutFile 'dotnet-install.ps1';
./dotnet-install.ps1 -InstallDir '~/.dotnet' -Version '3.1.26' -Runtime 'dotnet';
#msbuild .\MySFWebApp8.sfproj /t:package /p:"Configuration=Release"

Write-Host "---- Finished Packaging project ------"

C:\Windows\Microsoft.NET\Framework64\v4.0.30319\msbuild.exe .\MySFWebApp8.sfproj /t:package /p:"Configuration=Release" /p:Platform=AnyCPU

ls .
