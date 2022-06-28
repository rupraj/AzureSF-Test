Write-Host "Packaging ServiceFabric project"
msbuild .\MySFWebApp8.sfproj /t:package /p:"Configuration=Release"

Write-Host "---- Finished Packaging project ------"

Write-Host "List directory contents"
ls .\pkg
