$env="dev"
$envObj = Get-Content -Path .\deploy\env.json | ConvertFrom-Json | Select-Object -ExpandProperty "Environment" | Select-Object $env

#create pkg folder
New-Item .\pkg -ItemType Directory
New-Item .\Publish -ItemType Directory

Copy-Item .\ApplicationPackageRoot\ApplicationManifest.xml -Destination .\pkg

foreach($application in $envObj.$env.applicationNames){
    New-Item .\pkg\$application"pkg" -ItemType Directory
    New-Item .\pkg\$application"pkg"\Code -ItemType Directory
    New-Item .\pkg\$application"pkg"\Config -ItemType Directory

    Copy-Item .\$application\PackageRoot\ServiceManifest.xml -Destination .\pkg\$application"pkg"
    Copy-Item .\$application\PackageRoot\Config\Settings.xml -Destination .\pkg\$application"pkg"\Config

    dotnet publish .\$application\$application.csproj -o .\pkg\$application"pkg"\Code
}

Write-Host "Display pkg"
ls .\pkg
Write-Host "Display publish"
ls .\Publish
Write-Host "Display MySFApipkg"
ls .\pkg\MySFApipkg

New-Item .\artifacts -ItemType Directory

Copy-Item .\ConsoleApp1\ConsoleApp1 -Destination .\artifacts -Recurse
Copy-Item .\pkg -Destination .\artifacts -Recurse

Compress-Archive -Path .\pkg -DestinationPath .\artifacts\sfartifact.zip



