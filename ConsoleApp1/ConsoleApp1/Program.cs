// See https://aka.ms/new-console-template for more information
using System.Fabric;
using System.Fabric.Description;

Console.WriteLine("Hello, World!");

var creds = new X509Credentials();
creds.StoreLocation = System.Security.Cryptography.X509Certificates.StoreLocation.CurrentUser;
creds.StoreName = "My";
creds.FindType = System.Security.Cryptography.X509Certificates.X509FindType.FindByThumbprint;
creds.FindValue = "19959E089090EF03D92934BE673FC6B3A2B9E529";
creds.RemoteCommonNames.Add("svastha-2023.eastus.cloudapp.azure.com:19000");
creds.RemoteCertThumbprints.Add("19959E089090EF03D92934BE673FC6B3A2B9E529");


FabricClient fabricClient = new FabricClient(creds, "svastha-2023.eastus.cloudapp.azure.com:19000");
//fabricClient.ApplicationManager.UnprovisionApplicationAsync("svasthaType", "1.0.1").Wait();
fabricClient.ApplicationManager.CopyApplicationPackage("fabric:ImageStore", @".\artifacts\pkg", "MySFWebApp8_v1");
fabricClient.ApplicationManager.ProvisionApplicationAsync("MySFWebApp8_v1").Wait();
var test = fabricClient.QueryManager.GetApplicationListAsync().Result;
fabricClient.ApplicationManager.RemoveApplicationPackage("fabric:ImageStore", "MySFWebApp8_v1");


//fabricClient.ApplicationManager.UpgradeApplicationAsync(new ApplicationUpgradeDescription { ApplicationName = new Uri("fabric:/svastha"), TargetApplicationTypeVersion = "1.0.1", UpgradePolicyDescription = new RollingUpgradePolicyDescription { UpgradeMode = RollingUpgradeMode.UnmonitoredAuto, ForceRestart = true } });
fabricClient.ApplicationManager.CreateApplicationAsync(new System.Fabric.Description.ApplicationDescription { ApplicationName = new Uri("fabric:/MySFWebApp8"), ApplicationTypeName = "MySFWebApp8Type", ApplicationTypeVersion = "1.0.0" }).Wait();

StatelessServiceDescription serviceDescription = new StatelessServiceDescription();
serviceDescription.ApplicationName = new Uri("fabric:/MySFWebApp8");
serviceDescription.InstanceCount = -1;
serviceDescription.PartitionSchemeDescription = new SingletonPartitionSchemeDescription();
serviceDescription.ServiceName = new Uri("fabric:/MySFWebApp8/svc");
serviceDescription.ServiceTypeName = "MyWebApp8Type";

fabricClient.ServiceManager.CreateServiceAsync(serviceDescription).Wait();
