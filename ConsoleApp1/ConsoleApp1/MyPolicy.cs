using System;
using System.Collections.Generic;
using System.Fabric.Description;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    internal class MyPolicy : UpgradePolicyDescription
    {
        public MyPolicy(UpgradeKind kind):base(kind)
        {

        }
        
        override  
    }
}
