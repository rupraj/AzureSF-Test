Write-Host "Packaging ServiceFabric project"
$restofpath = "\Microsoft Visual Studio\2019\Enterprise\MSBuild\Current\Bin\MSBuild.exe"
$msbuildexe = Join-Path -Path "c:\program files (x86)" -childpath $restofpath
&$msbuildexe .\MySFWebApp8.sfproj /t:package /p:"Configuration=Release" /p:Platform=AnyCPU
