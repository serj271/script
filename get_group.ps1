$objDomain = New-Object System.DirectoryServices.DirectoryEntry
$objSearcher = New-Object System.DirectoryServices.DirectorySearcher
$objSearcher.SearchRoot = $objDomain

$objSearcher.Filter =("(&(objectclass=user)(objectcategory=person)(useraccountcontrol:1.2.840.113556.1.4.803:=512)(samaccountname=Noskov-sv))")
$objSearcher.PropertiesToLoad.Add("displayName")
$objSearcher.PropertiesToLoad.Add("sAMAccountName")
$objSearcher.PropertiesToLoad.Add("cn");
$objSearcher.PropertiesToLoad.Add("department");
$objSearcher.PropertiesToLoad.Add("givenName");
$objSearcher.PropertiesToLoad.Add("telephoneNumber");
$objSearcher.PropertiesToLoad.Add("title");
$objSearcher.PropertiesToLoad.Add("streetAddress");
$objSearcher.PropertiesToLoad.Add("sAMAccountType");
$objSearcher.PropertiesToLoad.Add("company");
$objSearcher.PropertiesToLoad.Add("description");
$objSearcher.PropertiesToLoad.Add("employeeID");
$objSearcher.PropertiesToLoad.Add("objectCategory");
$objSearcher.PropertiesToLoad.Add("userPrincipalName");
$objSearcher.PropertiesToLoad.Add("mail");

$colResults = $objSearcher.FindAll()
Write-Output $colResults

ForEach ($item in $colResults)
{
    
    Write-Host $item.Properties['displayname']
  #  Write-Host $item.Properties['title']
    Write-Host $item.Properties['description']
    Write-Host $item.Properties['company']

   # Write-Host $item.Properties['department']
    
    Write-Host $item.Properties['streetAddress']
  #  Write-Host $item.Properties['sAMAccountType']
   
    
  #  Write-Host $item.Properties['employeeID']
  #  Write-Host $item.Properties['objectCategory']
   # Write-Host $item.Properties['userPrincipalName']
    Write-Host $item.Properties['telephoneNumber']
    Write-Host $item.Properties['mail']


}

# Write-Host ($colResults)[0].Properties.PropertyNames
