$strCategory = "computer"
$objDomain = New-Object System.DirectoryServices.DirectoryEntry
$objSearcher = New-Object System.DirectoryServices.DirectorySearcher
$objSearcher.SearchRoot = $objDomain
$objSearcher.Filter = ("(&(objectCategory=$strCategory)(cn=*C86*))")
#$objSearch.tombstone = $true
$colResults = $objSearcher.FindAll()
Write-Output $colResults