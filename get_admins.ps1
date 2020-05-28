$group  = New-Object System.DirectoryServices.DirectoryEntry(
    "LDAP://CN=Domain Admins,CN=Users,DC=rosseti,DC=ural")
$source = New-Object System.DirectoryServices.DirectorySearcher

$source.SearchRoot  = $group
$source.SearchScope = [System.DirectoryServices.SearchScope]::Base
$source.Filter      = "(objectClass=*)"

$source.PropertiesToLoad.Add("member")
$source.PropertiesToLoad.Add("sAMAccountName")

$source.AttributeScopeQuery = "member"

$results = $source.FindAll()

Write-Output $results

