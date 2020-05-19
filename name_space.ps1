$code = @"
    using System;
    namespace MyNameSpace
    {
        public class Responder
        {
            public static void StaticRespond()
            {
                Console.WriteLine('Response');
            }
            public void Respond()
            {
                Console.WriteLine('Instance Respond');
            }
        }
    }
"@
# Check the type has not been previously added within the session, otherwise an exception is raised
<#if (-not ([System.Management.Automation.PSTypeName]'MyNameSpace.Responder').Type)
{
    Add-Type -TypeDefinition $code -Language CSharp;
}
[MyNameSpace.Responder]::StaticRespond();
$instance = New-Object MyNameSpace.Responder;
$instance.Respond();#>

Add-Type -TypeDefinition $code -Language CSharp
<#[MyNameSpace.Responder]::StaticRespond()#>


$code = @"
using System;
namespace HelloWorld
{
    public class Program
    {
        public static void Main(){
            Console.WriteLine("Hello world!");
        }
    }
}
"@
 
Add-Type -TypeDefinition $code -Language CSharp 
iex "[HelloWorld.Program]::Main()"




