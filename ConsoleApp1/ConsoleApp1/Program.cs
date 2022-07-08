// See https://aka.ms/new-console-template for more information
using System.Fabric;
using System.Fabric.Description;

Console.WriteLine("Hello, World!");

var claimsCredentials = new ClaimsCredentials();
claimsCredentials.ServerThumbprints.Add("D1A4F48927730B07C34D74CAF31D0D97C5542AE9");
var creds = new X509Credentials();
creds.StoreLocation = System.Security.Cryptography.X509Certificates.StoreLocation.CurrentUser;
creds.StoreName = "My";
creds.FindType = System.Security.Cryptography.X509Certificates.X509FindType.FindByThumbprint;
creds.FindValue = "D1A4F48927730B07C34D74CAF31D0D97C5542AE9";
creds.RemoteCommonNames.Add("svastha-2022.eastus.cloudapp.azure.com:19000");
creds.RemoteCertThumbprints.Add("D1A4F48927730B07C34D74CAF31D0D97C5542AE9");


FabricClient fabricClient = new FabricClient(creds, "svastha-2022.eastus.cloudapp.azure.com:19000");
fabricClient.ApplicationManager.UnprovisionApplicationAsync("svasthaType", "1.0.1").Wait();
fabricClient.ApplicationManager.CopyApplicationPackage("fabric:ImageStore", @"G:\svastha\svastha\pkg\Debug", "svastha_v2");
fabricClient.ApplicationManager.ProvisionApplicationAsync("svastha_v2").Wait();
var test = fabricClient.QueryManager.GetApplicationListAsync().Result;
fabricClient.ApplicationManager.RemoveApplicationPackage("fabric:ImageStore", "svastha_v2");

//fabricClient.ApplicationManager.UpdateApplicationUpgradeAsync(new ApplicationUpgradeUpdateDescription
//{
//    ApplicationName = new Uri("fabric:/svastha"),
//    FailureAction = UpgradeFailureAction.Rollback,
//    HealthCheckStableDuration = new TimeSpan(60),
//    UpgradeMode = RollingUpgradeMode.Monitored,
//    UpgradeDomainTimeout = new TimeSpan(1200),
//    UpgradeTimeout = new TimeSpan(3000)
//});

//fabricClient.ApplicationManager.UpdateApplicationAsync(new ApplicationUpdateDescription { })


//ApplicationUpgradeDescription descrip=new ApplicationUpgradeDescription();


fabricClient.ApplicationManager.UpgradeApplicationAsync(new ApplicationUpgradeDescription { ApplicationName = new Uri("fabric:/svastha"), TargetApplicationTypeVersion = "1.0.1", UpgradePolicyDescription = new RollingUpgradePolicyDescription { UpgradeMode = RollingUpgradeMode.UnmonitoredAuto, ForceRestart = true } });
//fabricClient.ApplicationManager.CreateApplicationAsync(new System.Fabric.Description.ApplicationDescription { ApplicationName = new Uri("fabric:/svastha"), ApplicationTypeName = "svasthaType", ApplicationTypeVersion = "1.0.0" }).Wait();

//StatelessServiceDescription serviceDescription = new StatelessServiceDescription();
//serviceDescription.ApplicationName = new Uri("fabric:/svastha");
//serviceDescription.InstanceCount = 1;
//serviceDescription.PartitionSchemeDescription = new SingletonPartitionSchemeDescription();
//serviceDescription.ServiceName = new Uri("fabric:/svastha/svc");
//serviceDescription.ServiceTypeName = "PhysicalActivityType";

//fabricClient.ServiceManager.CreateServiceAsync(serviceDescription).Wait();


