$env="dev"
$envObj = Get-Content -Path .\deploy\env.json | ConvertFrom-Json | Select-Object -ExpandProperty "Environment" | Select-Object $env

#create pkg folder
New-Item .\pkg -ItemType Directory
New-Item .\pkg\Publish -ItemType Directory

Copy-Item .\ApplicationPackageRoot\ApplicationManifest.xml -Destination .\pkg

foreach($application in $envObj.$env.applicationNames){
    New-Item .\pkg\$application"pkg" -ItemType Directory
    New-Item .\pkg\$application"pkg"\Code -ItemType Directory
    New-Item .\pkg\$application"pkg"\Config -ItemType Directory

    Copy-Item .\$application\PackageRoot\ServiceManifest.xml -Destination .\pkg\$application"pkg"
    Copy-Item .\$application\PackageRoot\Config\Settings.xml -Destination .\pkg\$application"pkg"\Config

    dotnet publish .\$application\$application.csproj -o .\pkg\$application"pkg"\Code
}

dotnet publish .\\ConsoleApp1\\ConsoleApp1\\ConsoleApp1.csproj -v normal -c Release /p:PublishDir=".\pkg\Publish"

#Copy-Item .\ConsoleApp1 -Destination .\pkg -Recurse

New-Item .\artifacts -ItemType Directory

Compress-Archive -Path .\pkg -DestinationPath .\artifacts\sfartifact.zip

ls .\artifacts
