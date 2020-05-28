function Get-UserProperty {
    [CmdletBinding()]
    [OutputType([int])]
    Param(
    )

    Begin
    {

    }
    Process
    {

        $objDomain = New-Object System.DirectoryServices.DirectoryEntry
        $objSearcher = New-Object System.DirectoryServices.DirectorySearcher
        $objSearcher.SearchRoot = $objDomain

        $objSearcher.Filter =("(&(objectclass=user)(objectcategory=person)(useraccountcontrol:1.2.840.113556.1.4.803:=512)(samaccountname=$env:username))")
        $objSearcher.PropertiesToLoad.Add("displayName")
        $objSearcher.PropertiesToLoad.Add("sAMAccountName")
        $objSearcher.PropertiesToLoad.Add("telephoneNumber");
        $objSearcher.PropertiesToLoad.Add("streetAddress");
        $objSearcher.PropertiesToLoad.Add("sAMAccountType");
        $objSearcher.PropertiesToLoad.Add("company");
        $objSearcher.PropertiesToLoad.Add("description");
        $objSearcher.PropertiesToLoad.Add("mail");

        $item = $objSearcher.FindOne()
 #       $colResults = $objSearcher.FindAll()
 #       Write-Output $colResults

#        ForEach ($item in $colResults)
 #       {
            <#$newObject = New-Object -TypeName PSObject -Property @{
                displayname = $item.Properties['displayname']
                description = $item.Properties['description']           
                company = $item.Properties['company'] 
                streetAddress = $item.Properties['streetAddress']
                telephoneNumber = $item.Properties['telephoneNumber']
                mail =  $item.Properties['mail']

            }#>

           
            Write-Output $item.Properties['displayname']
               Write-Output $item.Properties['description']           
               Write-Output $item.Properties['company'] 
                Write-Output $item.Properties['streetAddress']
               Write-Output $item.Properties['telephoneNumber']
               Write-Output =  $item.Properties['mail']

   #     }

        
        return  $newObject;
    }
    End
    {
        
    }

}
 
Get-UserProperty

$Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")