$env="dev"
$envObj = Get-Content -Path .\deploy\env.json | ConvertFrom-Json | Select-Object -ExpandProperty "Environment" | Select-Object $env
Write-Host $envObj.$env.clusterendpoint
#$packagePath = ".\pkg"

#Connect-ServiceFabricCluster -ConnectionEndpoint $envObj.$env.clusterendpoint `
#          -KeepAliveIntervalInSec 10 `
#          -X509Credential -ServerCertThumbprint $envObj.$env.thumbprint `
#          -FindType FindByThumbprint -FindValue $envobj.$env.thumbprint `
#          -StoreLocation CurrentUser -StoreName My

#$sfApplication = Get-ServiceFabricApplication -ApplicationName "fabric:/MySFApi"
#if($sfApplication){

#    [xml]$xmlAppManifest=Get-Content -Path $packagePath"\ApplicationManifest.xml"

#    if($xmlAppManifest.ApplicationManifest.ApplicationTypeVersion -eq $sfApplication.ApplicationTypeVersion){
#        Write-Host "Applications are of the same version"
#    }else{

#        Write-Host "Applications are not of the same version"
#        Copy-ServiceFabricApplicationPackage -ApplicationPackagePath $packagePath -ApplicationPackagePathInImageStore "MySfApp_v2"

#        Register-ServiceFabricApplicationType -ApplicationPathInImageStore "MySfApp_v2"

#        Remove-ServiceFabricApplicationPackage -ApplicationPackagePathInImageStore "MySfApp_v2" -ImageStoreConnectionString fabric:ImageStore

#        Start-ServiceFabricApplicationUpgrade -ApplicationName fabric:/MyWebApp8 -ApplicationTypeVersion 1.0.1 -HealthCheckStableDurationSec 60 -UpgradeDomainTimeoutSec 1200 -UpgradeTimeout 3000   -FailureAction Rollback -Monitored
#    }

    
#} else{
    
#    Write-Host "Application does not exist"
#    Unregister-ServiceFabricApplicationType -ApplicationTypeName "MyFirstSfWebAppType" -ApplicationTypeVersion "1.0.0" -Force
    
#    Copy-ServiceFabricApplicationPackage $packagepath -ImageStoreConnectionString fabric:ImageStore -ApplicationPackagePathInImageStore MyFirstSfWebApp_v4 -ShowProgress -ShowProgressIntervalMilliseconds 500
    
    #Unregister-ServiceFabricApplicationType -ApplicationTypeName "MyFirstSfWebAppType" -ApplicationTypeVersion "1.0.0" -Force

#    Register-ServiceFabricApplicationType -ApplicationPathInImageStore MyFirstSfWebApp_v4

#    Remove-ServiceFabricApplicationPackage -ImageStoreConnectionString fabric:ImageStore -ApplicationPackagePathInImageStore MyFirstSfWebApp_v4

#    New-ServiceFabricApplication -ApplicationName fabric:/MySFApi -ApplicationTypeName "MyFirstSfWebAppType" -ApplicationTypeVersion "1.0.0"

#    New-ServiceFabricService -ApplicationName fabric:/MySFApi -ServiceName fabric:/MySFApi/svc1 -ServiceTypeName "MyFirstSfWebAppType" -Stateless -PartitionSchemeSingleton -InstanceCount -1


#}






